From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 May 2013 19:29:09 +0200
Subject: [Buildroot] [PATCH 1/2] Refactoring Freescale's iMX software
 revision levels
In-Reply-To: <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
References: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
Message-ID: <20130503192909.716e75a3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear H.Fijnvandraat at inter.nl.net,

On Fri, 3 May 2013 14:01:04 +0200 (CEST), H.Fijnvandraat at inter.nl.net
wrote:

> But I have to withdraw these patches.
> 
> Due to the sequence in which the .mk files are included
> IMX_VERSION_LEVEL is defined when imx-lib.mk is processed, while it
> is already needed for firmware-imx (and  gpu-viv-bin-mx6q if it would
> be introduced)
> 
> Placing it in firmware-imx would do for now, but then no dependencies
> can be placed alphabetically before it later.
> 
> It appears we need some other mechanism to rule them all.

This shouldn't matter because we're using '=' everywhere, so they are
recursively expanded, which means that the values are expanded only
when the value is actually needed. So the inclusion order shouldn't
matter.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
