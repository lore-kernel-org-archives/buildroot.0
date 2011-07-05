From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 21:46:02 +0200
Subject: [Buildroot] [PATCH 13/28] syslinux: convert to GENTARGETS
In-Reply-To: <201107050012.31481.yann.morin.1998@anciens.enib.fr>
References: <cover.1309815048.git.thomas.petazzoni@free-electrons.com>
 <d09d6de7ba245ee9763b6f23e6df6fa6711194f8.1309815048.git.thomas.petazzoni@free-electrons.com>
 <201107050012.31481.yann.morin.1998@anciens.enib.fr>
Message-ID: <20110705214602.3b2c2dad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 5 Jul 2011 00:12:31 +0200,
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :

> You're doing two unrelated chances here:
>  - adding new options
>  - converting to GENTARGETS

I'm not adding options, but organizing them differently, because it is
needed to be able to do the GENTARGETS conversion.

Before, we add:

 * an option to enable isolinux
 * an option to enable pxelinux

But this isn't compatible with GENTARGETS because with GENTARGETS, we
need a single option that enables/disables the package, and other
options should be suboptions. Which is why we now have :

 * an option to enable syslinux
   * a suboption to enable isolinux
   * a suboption to enable pxelinux

I could have done this option change *before* doing the GENTARGETS
conversion, but honestly, I didn't want to mess up with the existing
makefile code before converting it to GENTARGETS.

I also don't think it's a very major issue of having those two things
squashed together into a single patch, so I'd like to keep it as it is
if possible.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
