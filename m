From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sun, 18 May 2014 18:52:32 +0200
Subject: [Buildroot] [PATCH v8 21/28] xbmc: Add X.org/OpenGL support
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-22-git-send-email-bernd.kuhls@t-online.de>
 <20140517205500.GL3459@free.fr>
 <0sjm4bxrs4.ln2@ID-313208.user.individual.net>
 <20140518162900.GA3631@free.fr>
Message-ID: <g35n4bxjvb.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140518162900.GA3631 at free.fr: 

>     comment "xbmc needs an OpenGL backend"
>         depends on BR2_i386 || BR2_x86_64
>         depends on !BR2_PACKAGE_HAS_LIBGL

Hi,

BR2_i386 || BR2_x86_64 both support libgl and egl/gles, so I typed this:

comment "xbmc needs an OpenGL backend"
       depends on BR2_i386 || BR2_x86_64
       depends on !BR2_PACKAGE_HAS_LIBGL && !(BR2_PACKAGE_HAS_LIBEGL && BR2
_PACKAGE_HAS_LIBGLES)

which seems to do the trick.

Regards, Bernd
