From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:54:20 +0100
Subject: [Buildroot] [PATCH 1/5] arch: improve definition of gcc mtune,
 mcpu, etc.
In-Reply-To: <201211151438.30221.yann.morin.1998@free.fr>
References: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
 <8ef94365af539b190e9525a10c5b642dc7108cb9.1352986210.git.thomas.petazzoni@free-electrons.com>
 <201211151438.30221.yann.morin.1998@free.fr>
Message-ID: <20121115145420.64205ba0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thu, 15 Nov 2012 14:38:30 +0100, Yann E. MORIN wrote:

> I know you are just moving stuff around, but those symbols are typed
> as strings, so the default values should be enclosed in-between double
> quotes:
>     default "arm600"   if BR2_arm600
> 
> Moreover, the code is not coherent with itslef, even in a single file.
> For example, you have (both are string symbols):
> 
>     config BR2_ENDIAN
>         default "LITTLE" if BR2_arm
> 
>     config BR2_GCC_TARGET_TUNE
>         default arm600   if BR2_arm600
> 
> That it currently works is just happenstance, and may well break in
> the future when we upgrade to a newer kconfig version.
> 
> Maybe we can just apply this for now, and fix that in a future patch?

I sent a new pull request, which includes a patch fixing this problem.
Thanks for reminding me about it!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
