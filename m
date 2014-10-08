From: David du Colombier <0intro@gmail.com>
Date: Wed, 8 Oct 2014 11:47:33 +0200
Subject: [Buildroot] [PATCH v4 1/2] x264: new package
In-Reply-To: <20141008101302.4a55429a@free-electrons.com>
References: <1412526597-31347-1-git-send-email-0intro@gmail.com>
 <20141008101302.4a55429a@free-electrons.com>
Message-ID: <CANUoZoH5MNQu=57RqGV40XSt2nT+NUqjSXQC545LQRDcHRD1Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Well, I still believe this is suboptimal since there is some assembly
> code for ARM that is available, but only for ARMv6+. But oh well, it
> can always be implemented as a followup improvement.

Yes, I finally enabled assembly files on ARMv7 platforms.

It seems the ARMv6 processors (ARM1136JF-S, ARM1176JZ-S
and ARM1176JZF-S) are not supported:

common/arm/pixel-a.S:1281: Error: selected processor does not support
ARM mode `movw ip,#:lower16:235963'
common/arm/pixel-a.S:1281: Error: selected processor does not support
ARM mode `movt ip,#:upper16:235963'

I'll send a patch soon.

-- 
David du Colombier
