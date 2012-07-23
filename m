From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 09:26:43 +0200
Subject: [Buildroot] [PATCH 5/5] gettext: convert to autotools-package
In-Reply-To: <CAHXCMMLsfSjtf2Cfx=kQHqEgKR8h5Yc_QHRUcy9+bdVnKLVwaA@mail.gmail.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
 <66a7689f733357af7bb277467bc2198817fc9b69.1342732829.git.thomas.petazzoni@free-electrons.com>
 <CAHXCMMK6B_qmuTS0z9agEWY05zz+GqgvsJuw0qF0Gf=mFx32XQ@mail.gmail.com>
 <CAHXCMMLsfSjtf2Cfx=kQHqEgKR8h5Yc_QHRUcy9+bdVnKLVwaA@mail.gmail.com>
Message-ID: <20120723092643.2b64e2bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 05:44:28 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> > ifeq ($(BR2_ENABLE_LOCALE)\
> > $(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_CTNG_uClibc)\
> > $(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC),yy)
> Just realize that this statement can be simplify like that:
> ifeq ($(BR2_ENABLE_LOCALE)$(BR2_NEEDS_GETTEXT),yy)

Yes, I will think about this in more details.

> In this case, maybe BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC should
> trigger BR2_NEEDS_GETTEXT too?

No, because BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC already selects
BR2_TOOLCHAIN_EXTERNAL_UCLIBC. Basically BR2_TOOLCHAIN_EXTERNAL_UCLIBC
is an hidden bool which is selected either by the external toolchain
profiles (when they are uClibc based) and by the
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC choice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
