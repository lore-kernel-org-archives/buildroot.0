From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 11:37:59 +0200
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
 libraries
In-Reply-To: <1404113390.3117.5.camel@abrodkin-8560l.internal.synopsys.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
 <20140630092438.14723c95@free-electrons.com>
 <1404113390.3117.5.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20140630113759.1f8ae8a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 30 Jun 2014 07:29:50 +0000, Alexey Brodkin wrote:

> Thanks for this.
> Let me look at this issue on AVR32.
> 
> Frankly I'd prefer to escape conditions withing "uclibc.mk" - this
> condition will remain for many years until somebody tries to do another
> round of clean-up.
> 
> I'll try to find an upstream patch that fixes disclosed issue and put it
> in "package/uclibc/0.9.31.1".
> 
> What do you think of this approach?

I personally think it's OK to use $(MAKE) for uClibc >= 0.9.33 and
$(MAKE1) for older versions. We only have 0.9.31 to support AVR32, and
since it's an obsolete architecture, I believe we might propose to
deprecate it during the 2014.08 cycle, so I don't think it's worth
spending time on issues relevant only to 0.9.31. If that's done, then
we'll be able to get rid of 0.9.31 and 0.9.32. I don't think it makes
sense to support such old uClibc releases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
