From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 15:58:00 +0200
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with
 -Os
In-Reply-To: <24f81ffc5c8606c74c9d478a29b245d7646b90f6.camel@synopsys.com>
References: <20180917204329.15787-1-abrodkin@synopsys.com>
 <20180918093604.0b421d5c@windsurf>
 <c9ec03f9f05e251fd8e7b99c0ffb06593db32b1c.camel@synopsys.com>
 <20180918111506.0648d78c@windsurf>
 <aae1bc5da723d9dd98ddd4dcc7868e4dacb4b6f8.camel@synopsys.com>
 <20180918112657.7d1b9d28@windsurf>
 <99fcad6be0ba045a8d00274723ac511be2805aac.camel@synopsys.com>
 <098ECE41A0A6114BB2A07F1EC238DE89667FD144@de02wembxa.internal.synopsys.com>
 <24f81ffc5c8606c74c9d478a29b245d7646b90f6.camel@synopsys.com>
Message-ID: <20180918155800.748eae34@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Sep 2018 12:44:26 +0000, Alexey Brodkin wrote:

> Sure that's indeed an option. We'll just finally add "-mno-millicode"
> in TARGET_ABI for ARC and forget about that class of problems. Also
> maybe it worth having "-mno-millicode" set by default for Linux
> toolchains so looking forward there will be no need to mess with
> millicode manually.

Yes, that's indeed one solution, though the problem also exists for
PowerPC, so it would have been nice to understand it.

What I find weird is that why it happens only with libaio ? I mean
there are plenty of libraries built with -fpic, and libaio is the only
one causing this problem. The fact that libaio is using -nostdlib
-nostartfiles was an initial hint to explain why libgcc isn't brought
into the link, but as Alexey said, removing -nostdlib -nostartfiles
doesn't solve the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
