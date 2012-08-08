From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Aug 2012 21:07:42 +0200
Subject: [Buildroot] ext-toolchain-wrapper issues
In-Reply-To: <CAE9DZUQp8QONoyfsieHt=vfdk4xreqqY=yekTTHk5yPopSFGeQ@mail.gmail.com>
References: <CAE9DZUSdA9fgHZjgNu3bY8Ue4d6V+4o0USbR6_dcOPsCAfxgiQ@mail.gmail.com>
 <20120804111932.6e0f0481@skate>
 <CAE9DZUROhjmKaqYqPoYPa0gy2RhxnX0dvQ4+XJ+2Z2nwjQed+w@mail.gmail.com>
 <20120804185814.3c51db5c@skate>
 <CAE9DZUQp8QONoyfsieHt=vfdk4xreqqY=yekTTHk5yPopSFGeQ@mail.gmail.com>
Message-ID: <20120808210742.42e5fca6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 8 Aug 2012 11:12:59 -0500,
Dallas Clement <dallas.a.clement@gmail.com> a ?crit :

> Just wanted to get back with you on this and let you know that I
> narrowed this down further.  There is no fault with the
> ext-toolchain-wrapper code.  It does the right thing.  The problem
> with my Linux kernel not booting was caused by the use of an incorrect
> gcc tune parameter.  This came from a buildroot config file I got from
> Marvell.  I simply changed it as follows, and everything is fine now.
> 
> #BR2_GCC_TARGET_TUNE="marvell-fv7"
> BR2_GCC_TARGET_TUNE="cortex-a9"

Ok, thanks for the investigation. I guess -mtune=marvell-fv7 argument
is specific to the Marvell gcc compiler, I haven't heard of it before.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
