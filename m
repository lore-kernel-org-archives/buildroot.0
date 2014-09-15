From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 23:39:16 +0200
Subject: [Buildroot] [PATCH 3/4] arch: do not distinguish revisions of
	ARM1136JF-S
In-Reply-To: <20140915213339.GC3878@free.fr>
References: <1410814919-11523-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1410814919-11523-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140915213339.GC3878@free.fr>
Message-ID: <20140915233916.55c17894@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 15 Sep 2014 23:33:39 +0200, Yann E. MORIN wrote:

> > Note that the removal of the two options should not break existing
> > full .config, since the hidden option BR2_arm1136jf_s becomes again a
> > visible option to select the CPU.
> 
> But it would break a defconfig.

Right. But I believe that when we change the default value of an
option, we also break a defconfig, and we don't include that as part of
the Config.in.legacy handling (but also because it's obviously more
complicated).

> As suggested on IRC, move the BR2_arm1136jf_s_r1 to Config.legacy, and
> have it select BR2_arm1136jf_s, so the user can re-use a defconfig.

Hum, why just BR2_arm1136jf_s_r1 and not BR2_arm1136jf_s_r0 ?

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
