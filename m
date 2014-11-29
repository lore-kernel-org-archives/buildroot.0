From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Nov 2014 17:56:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/parted: fix static link
In-Reply-To: <4431396aaa3e810c5ef599e341858e8849d530e1.1417276704.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 29 Nov 2014 16:59:58 +0100")
References: <cover.1417276704.git.yann.morin.1998@free.fr>
 <4431396aaa3e810c5ef599e341858e8849d530e1.1417276704.git.yann.morin.1998@free.fr>
Message-ID: <87fvd2j67f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libuuid needs to be linked with -lintl when gettext is needed (with
 > locales).

 > For a static build, this is solved with the DT_NEEDED ELF tags, but for

s/static/shared/

> a static link, it is not pulled in automatically.

 > Use pkg-config to find libuuid, instead of AC_CHECK_LIB().

 > Second part at fixing:
 >     http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  .../parted/parted-003-fix-static-link-uuid.patch    | 21 +++++++++++++++++++++
 >  1 file changed, 21 insertions(+)
 >  create mode 100644 package/parted/parted-003-fix-static-link-uuid.patch

 > diff --git a/package/parted/parted-003-fix-static-link-uuid.patch b/package/parted/parted-003-fix-static-link-uuid.patch
 > new file mode 100644
 > index 0000000..e281b6f
 > --- /dev/null
 > +++ b/package/parted/parted-003-fix-static-link-uuid.patch
 > @@ -0,0 +1,21 @@

You forgot the patch description + signed-off-by.

Otherwise it looks good. Please don't forget to send it upstream.


-- 
Bye, Peter Korsgaard
