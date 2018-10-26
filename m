From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 14:20:18 +0200
Subject: [Buildroot] [PATCH] configs/{at91sam9*,
 atmel*}: drop OpenSSH as it duplicates Dropbear
In-Reply-To: <9b5b2780-92cf-682a-7ada-f6af691652ad@microchip.com>
References: <20181026094024.31108-1-thomas.petazzoni@bootlin.com>
 <9b5b2780-92cf-682a-7ada-f6af691652ad@microchip.com>
Message-ID: <20181026142018.62c47e7b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Oct 2018 09:48:44 +0000, Nicolas.Ferre at microchip.com wrote:
> On 26/10/2018 at 11:40, Thomas Petazzoni wrote:
> > The "development" defconfigs for Atmel platforms enable both OpenSSH
> > and Dropbear, which doesn't make a lot of sense, as only one SSH
> > server can start on port 22.
> > 
> > This commit therefore drops BR2_PACKAGE_OPENSSH=y from those
> > defconfigs, keeping Dropbear as an SSH server/client.  
> 
> A gut feeling is telling me that I would have preferred the other way 
> around: Keeping OpenSSH.

I don't really care either way. Those defconfigs already have plenty of
packages enabled anyway (which is the whole point of those defconfigs).

Should I resend a v2 that keeps BR2_PACKAGE_OPENSSH=y and drops
BR2_PACKAGE_DROPBEAR=y ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
