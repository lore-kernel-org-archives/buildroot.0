From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 09:26:42 +0200
Subject: [Buildroot] [PATCH] Config.in.legacy: fallback to glibc when
 eglibc	was selected
In-Reply-To: <D52038F0-6ED4-4510-B67C-D71ADB9008A3@free.fr>
References: <1463469451-18931-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <D52038F0-6ED4-4510-B67C-D71ADB9008A3@free.fr>
Message-ID: <20160517092642.05c8c118@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 May 2016 09:23:03 +0200, Yann E. MORIN wrote:

> BR2_TOOLCHAIN_BUILDROOT_GLIBC is part of a choice, so you can't select it.
> 
> That's the limit of our legacy handling: it can't handle choices.

Gah, yes, indeed. I guess the only option is to keep a:

	default BR2_TOOLCHAIN_BUILDROOT_GLIBC if BR2_TOOLCHAIN_BUILDROOT_EGLIBC

but it's rather annoying to keep legacy code forever elsewhere than in
Config.in.legacy. So I'd prefer that we don't do anything in fact: the
number of users using eglibc in their configuration is probably pretty
low.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
