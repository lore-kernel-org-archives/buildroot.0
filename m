From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 17:08:22 +0200
Subject: [Buildroot] [PATCH v4 0/4] Improvements to i.MX6 SABRESD boards
 support
In-Reply-To: <5420351D.9050802@lucaceresoli.net>
References: <1411135972-14968-1-git-send-email-luca@lucaceresoli.net>
 <20140921212519.296ade2a@free-electrons.com>
 <542020B1.60500@lucaceresoli.net>
 <5420351D.9050802@lucaceresoli.net>
Message-ID: <20140922170822.0fd86aa7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Luca Ceresoli,

On Mon, 22 Sep 2014 16:41:33 +0200, Luca Ceresoli wrote:

> ...or maybe I'll do the other way around: use the kernel headers from
> Freescale's custom git repo, since the defconfig we currently use
> (imx_v7_defconfig) is not available in mainline, and the closest one
> in mainline (imx_v6_v7_defconfig) has several differences, and I'd like
> to keep things simple and working.
> 
> I wonder if there's a good reason to use a mainline kernel instead.

Well, in general, mainline is nicer to look at. But from a practical
point of view, the Freescale kernel is probably the one they have
tested with all the multimedia features (OpenGL implementation,
hardware accelerated video encoding/decoding) and so on. So I'd say
that a Buildroot defconfig should probably use the Freescale kernel
preferably, so that most things work out of the box for users. (And it
*really* hurts me to say we should use vendor kernels instead of
mainline kernels, as I hate vendor kernels!).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
