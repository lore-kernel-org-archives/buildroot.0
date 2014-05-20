From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 May 2014 23:10:23 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
In-Reply-To: <20140520164924.GA3506@free.fr> (Yann E. MORIN's message of "Tue, 
 20 May 2014 18:49:24 +0200")
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
 <le5n4bxjvb.ln2@ID-313208.user.individual.net>
 <20140518172928.GD3631@free.fr> <537B83C6.6080403@mind.be>
 <20140520164924.GA3506@free.fr>
Message-ID: <87bnusgnr4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> I think there's something more fundamentally inappropriate about the approach
 >> taken here. I think the way out could be to add auxiliary symbols to identify
 >> which provider is used. Something like:
 >> 
 >> config BR2_PACKAGE_XBMC_EGL_GLES
 >> bool
 >> default y
 >> depends on BR2_PACKAGE_HAS_LIBEGL
 >> depends on BR2_PACKAGE_HAS_LIBGLES
 >> depends on !BR2_PACKAGE_XBMC_GL # prefer GL if available
 >> 

I like these.

 >> config BR2_PACKAGE_XBMC_GL
 >> bool

 > Missing 'default y' here too, I guess. ;-)

 >> depends on BR2_PACKAGE_XORG7
 >> depends on BR2_PACKAGE_HAS_LIBGL

 > And as Bernd said, full openGL support in XBMC is not possible on ARM,
 > so it is missing a dependency on !BR2_arm. But the basis are here,
 > granted.

But _HAS_LIBGL only gets selected by the (currently x86 only) mesa dri
drivers, so you don't need to specify it here (and update it if there's
ever a non-x86 mesa dri driver).


 >> comment "xbmc requires an OpenGL-capable backend"

 > I think we want to differentiate the full-openGL vs. openGL EGL/GLES
 > cases, here, since ARM can only work with EGL/GLES, while x86 can use
 > either. So we'd need a comment for ARM (or any arch that requires
 > GL/GLES), and another comment for x86 (or any arch that supports both.)

How about just saying:

"xbmc requires an OpenGL(-ES) capable backend"

-- 
Bye, Peter Korsgaard
