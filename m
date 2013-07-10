From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 10 Jul 2013 14:41:34 -0500
Subject: [Buildroot] [PATCH v4 2/2] qt: add powervr and opengl
In-Reply-To: <51DDAF1A.5040602@carallon.com>
References: <1373479838-8288-1-git-send-email-spenser@gillilanding.com>
 <51DDAF1A.5040602@carallon.com>
Message-ID: <CAEBucnAPg=UxaS+rHVFZTROBkuAjt7m0-U24S+sDyWF3RS3kcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will,

> I don't like that this depends on the TI_GFX package. When I added powervr
> support to Qt I added a powervr virtual package the same as opengl_es or
> opengl_egl. This allows Qt to not contain anything specific to the hardware
> graphics package.

Sounds reasonable.  I'll implement it this way as I will need to do a
second package which implements the powervr functionality for the
SGX540 on Pandaboard and your Freescale patch would be great to add as
well.


> Is this really necessary. When I got this working I instead used the
> variables provided by Qt to point it to the hardware specific headers. The
> code looks like:
>
> +ifeq ($(BR2_PACKAGE_QT_GFX_POWERVR),y)
> +define QT_CONFIGURE_POWERVR
> +       $(call
> QT_QMAKE_SET,QMAKE_INCDIR_OPENGL_ES2,$(STAGING_DIR)/usr/include/OGLES2,$(@D))
> +       $(call
> QT_QMAKE_SET,QMAKE_INCDIR_EGL,$(STAGING_DIR)/usr/include/OGLES2,$(@D))
> +       $(call
> QT_QMAKE_SET,QMAKE_INCDIR_POWERVR,$(STAGING_DIR)/usr/include/pvr2d
> $(STAGING_DIR)/usr/include/wsegl,$(@D))
> +endef
> +endif

I install the headers into /usr/include by default from the TI_GFX
package. As this is a default include path, they get picked up as long
as no other header files are found.  Thus, removing these files
ensures they don't get picked up.

> I have this working with both TI and freescale hardware.
>
> I'll check what state my patches are in and if they need rebasing against
> master and then I can post them if people would be interested.

Yea, please send them. If you feel they need additional cleanup but
you don't have time, feel free to send them to me privately and I can
get them integrated.

Thanks,
Spenser



--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
