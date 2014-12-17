From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 16:14:06 +0100
Subject: [Buildroot] [PATCH] system: add "askfirst shell" as an option
 for busybox init
In-Reply-To: <1418828592.4132.7.camel@synopsys.com>
References: <1418633784-7709-1-git-send-email-abrodkin@synopsys.com>
 <20141216081450.6438bdb6@free-electrons.com>
 <1418828592.4132.7.camel@synopsys.com>
Message-ID: <20141217161406.1f418842@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 17 Dec 2014 15:03:12 +0000, Alexey Brodkin wrote:

> Well, actually putting "console" in BR2_TARGET_GENERIC_GETTY_PORT
> resolves only part of issues - need to specify particular tty.
> 
> But still we have serial port settings like baudrate.
> BR2_TARGET_GENERIC_GETTY_BAUDRATE_x must match your serial port
> settings.
> 
> So we're loosing flexibility of my approach here, but what is even more
> important imagine if there're 2 serial ports in the system and they have
> different baudrates but both properly described in kernel bootargs. With
> BR2_TARGET_GENERIC_GETTY only 1 console could be used then but not
> either of them.

Ah, yes I haven't looked at the baudrate issue. Isn't there a way to
not pass any baudrate to getty, and let it use whatever baudrate is
already configured on the device?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
