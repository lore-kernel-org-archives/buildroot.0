From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 15:18:48 +0100
Subject: [Buildroot] [PATCH] uClibc: ARC: enable generic string
	implementations
In-Reply-To: <1415800450.10304.1.camel@abrodkin-8560l.internal.synopsys.com>
References: <1415616842-7640-1-git-send-email-abrodkin@synopsys.com>
 <20141110135034.2e03b27c@free-electrons.com>
 <1415789721.10608.6.camel@abrodkin-8560l.internal.synopsys.com>
 <20141112133341.00298ed8@free-electrons.com>
 <1415800450.10304.1.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141112151848.50fe3c21@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 12 Nov 2014 13:54:11 +0000, Alexey Brodkin wrote:

> > If nobody cares, then we just enable the option. And people will
> > complain when/if it breaks for them.
> 
> So should I wait for some time or it's time to send a patch that enables
> the option for everybody in uClibc-*.config?

I'd say yes. The uClibc Config.in help text for this option recommends
to enable it, and it defaults to y, so I think it's pretty safe.

Regarding ARC, I see that there are arch-specific optimized string
functions in libc/string/arc/, written in assembly. So by enabling
GENERIC_OPT, what you gained is that you have optimized versions for
those functions that don't have an ARC-specific assembly implementation?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
