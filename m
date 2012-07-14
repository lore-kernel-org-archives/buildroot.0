From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jul 2012 15:03:29 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/mips: kill EABI and fix N32
In-Reply-To: <1342268918-3235-1-git-send-email-gustavo@zacarias.com.ar>
References: <1342268918-3235-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120714150329.65ae632c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 09:28:37 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> MIPS EABI is a bare-metal ABI so remove it.
> Also fix uClibc to really work with N32 ABI, which used the EABI knob
> previously.

There is no support in uClibc for o64. Is this ABI really used? I see
that gcc has support for it
(http://gcc.gnu.org/projects/mipso64-abi.html), but is it used in
practice?

Also, is the BR2_MIPS_ABI_none knob actually useful?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
