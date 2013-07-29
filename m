From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jul 2013 09:15:08 +0200
Subject: [Buildroot] [PATCH] uclibc/arm: don't install ldd.host and
 ldconfig.host if !HAVE_SHARED
In-Reply-To: <CAFRkauBsnARbkfB8hYj=dBYD2mXTmYoSZyTgx11yHaJUrAgeuQ@mail.gmail.com>
References: <1375030117.13990.1.camel@phoenix> <20130728185932.5142e4b2@skate>
 <CAFRkauAQFyQCn1S=yUuzhCmCNdjMn1jTU-zzgG=eLAL-P7Hy3A@mail.gmail.com>
 <20130728192227.708e6c2c@skate>
 <CAFRkauBsnARbkfB8hYj=dBYD2mXTmYoSZyTgx11yHaJUrAgeuQ@mail.gmail.com>
Message-ID: <20130729091508.16128793@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Mon, 29 Jul 2013 01:30:16 +0800, Axel Lin wrote:

> > BR2_BINFMT_FLAT should be set when ARM noMMU is used, because I don't
> > think ELF binaries are supported on ARM noMMU.
> May I ask why config BR2_BINFMT_FLAT depends on BR2_bfin || BR2_m68k
> I ask this becuase I'm going to build for arm7tdmi which is noMMU.
> And config BR2_BINFMT_FLAT is invisible now due to the dependency.

That's because nobody ever worked on ARM noMMU support in Buildroot, so
things need to be fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
