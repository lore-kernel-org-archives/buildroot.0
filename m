From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Apr 2017 13:44:40 +0200
Subject: [Buildroot] [PATCH] core: add rule to dump packages' build order
In-Reply-To: <4fef5a6f-15d2-73f6-c759-2887255c987d@mind.be>
References: <20170402130338.12542-1-yann.morin.1998@free.fr>
 <39bc6b12-1dfd-8ada-f1bc-8597c6872a1c@mind.be>
 <20170404185928.GA3828@scaer>
 <fd9c07fd-2e86-ed73-2fd1-bfcf27522664@mind.be>
 <20170407192458.GA3420@scaer>
 <4fef5a6f-15d2-73f6-c759-2887255c987d@mind.be>
Message-ID: <20170410134440.4713101b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Apr 2017 11:28:57 +0200, Arnout Vandecappelle wrote:

>  In my experience, there are two big reasons why an OE build is much slower:
> 
> 1. A typical configuration is much bigger (more packages selected).
> 
> 2. They do per-package staging in order to enable TLPB.

This point (2) is in fact not correct, at least according to what I
understood. My colleague Alexandre can confirm, but apparently,
per-package staging has only been very recently introduced in OE. And
yes, top-level parallel build was causing some spurious build failures.

Alex, if you have more details, we're interested :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
