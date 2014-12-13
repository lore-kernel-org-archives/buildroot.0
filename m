From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Dec 2014 00:13:12 +0100
Subject: [Buildroot] [PATCH] package/mono: fixing shared/static handling
In-Reply-To: <1418508052-25062-1-git-send-email-angelo.compagnucci@gmail.com>
 (Angelo Compagnucci's message of "Sat, 13 Dec 2014 23:00:52 +0100")
References: <1418508052-25062-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <87sigjp2if.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Mono should always be compiled with --enable-static, this patch forces
 > --enable-static also in case of shared only libraries.

Why? If it is really required, then mono should depend on
!BR2_SHARED_LIBS and show a comment to inform the user that it needs
static library support.

 > Fixes:
 > http://autobuild.buildroot.net/results/e739d64011fb6a24ccbef136d75944f3bd2eba03/
 > http://autobuild.buildroot.net/results/7ebe6909da859507639f57da2d4fee46efc062d4/
 > http://autobuild.buildroot.net/results/03c2243080b026b0c6f4bb64e7dc8dc359f0c8c2/
 > http://autobuild.buildroot.net/results/406bf830ae84cf9ce4afd5a4ddc265197df42b44/
 > http://autobuild.buildroot.net/results/894a3e0627244b5e1980c3840629b4627999d252/
 > http://autobuild.buildroot.net/results/2dad2609834564060dc090919c128b45e289102e/
 > http://autobuild.buildroot.net/results/46de32cbe68b614763a72303490515f80cfe5bfd/
 > http://autobuild.buildroot.net/results/b167d2660ca37b896ceb8f1372d88eda6d6397d7/
 > http://autobuild.buildroot.net/results/17b6aee3d0aaf425412f9f5d89de665de9efedb8/
 > http://autobuild.buildroot.net/results/af9e5203299819085441fb6ee27e027d58f220b3/
 > http://autobuild.buildroot.net/results/138e5bd9bd0e2ad6de13278b446d1a48a9b64b17/
 > http://autobuild.buildroot.net/results/b77d52aaa5face5d5b8afe39f9a32a51b1df500f/

 > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > ---
 >  package/mono/mono.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/mono/mono.mk b/package/mono/mono.mk
 > index baf205a..3d50ac1 100644
 > --- a/package/mono/mono.mk
 > +++ b/package/mono/mono.mk
 > @@ -24,7 +24,8 @@ MONO_CONF_OPTS = --disable-gtk-doc \
 >  	--disable-libraries \
 >  	--with-ikvm-native=no \
 >  	--enable-minimal=aot,profiler,debug \
 > -	--disable-mcs-build
 > +	--disable-mcs-build \
 > +	--enable-static
 
 >  # The libraries have been built by the host-mono build. Since they are
 >  # architecture-independent, we simply copy them to the target.
 > -- 
 > 1.9.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
