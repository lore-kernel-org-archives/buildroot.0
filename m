From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:31:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/lld: fix build with gcc < 5.1
In-Reply-To: <20191024231818.988900-1-joseph.kogut@gmail.com> (Joseph Kogut's
 message of "Thu, 24 Oct 2019 16:18:18 -0700")
References: <20191024231818.988900-1-joseph.kogut@gmail.com>
Message-ID: <874kzx4466.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph Kogut <joseph.kogut@gmail.com> writes:

 > This fix is based on commit 2a17fb6 used for llvm.
 > Fixes:
 > http://autobuild.buildroot.net/results/76310241a335a99a4ff2726edb517b067367fd41
 > http://autobuild.buildroot.net/results/88cbfae219fd4475be376c9558b5760cebd2148f
 > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
 > ---
 >  package/lld/lld.mk | 6 ++++++
 >  1 file changed, 6 insertions(+)

 > diff --git a/package/lld/lld.mk b/package/lld/lld.mk
 > index cd76c724ce..c284d6df7f 100644
 > --- a/package/lld/lld.mk
 > +++ b/package/lld/lld.mk
 > @@ -13,6 +13,12 @@ LLD_LICENSE_FILES = LICENSE.TXT
 >  LLD_SUPPORTS_IN_SOURCE_BUILD = NO
 >  HOST_LLD_DEPENDENCIES = host-llvm
 
 > +# LLVM >= 9.0 will soon require C++14 support, building llvm 8.x using a
 > +# toolchain using gcc < 5.1 gives an error but actually still works. Setting
 > +# this option makes it still build with gcc >= 4.8.
 > +# https://reviews.llvm.org/D57264
 > +HOST_LLD_CONF_OPTS += -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON
 > +

Committed after adjusting the comment as suggested by Romain, thanks.

-- 
Bye, Peter Korsgaard
