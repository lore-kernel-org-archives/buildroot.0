From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Jun 2021 14:00:11 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/usbguard: new package
In-Reply-To: <YMNIDqVHSAbiNRzp@kb-xps>
References: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
 <20210608123210.143113-2-kamel.bouhara@bootlin.com>
 <20210608143757.5818a039@xps13> <20210611123703.18b71cbb@xps13>
 <YMNIDqVHSAbiNRzp@kb-xps>
Message-ID: <20210611140011.41d00060@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Jun 2021 13:25:02 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> > [0600] /etc/usbguard/rules.conf:
> > allow *:*
> >  
> 
> I think that having to default configuration in
> /etc/usbguard/rules.conf is not expected as the rules are generated
> using the "usbguard generate-policy" command.

It is not really great to have to run a tool on the target to generate
the rules. The goal of Buildroot is to build the whole system, and the
rootfs might be read-only.

> Maybe we shall just warn users that there is no configuration file at
> boot before starting the daemon ?

Not really Buildroot's design principle. We like to have a default
basic configuration that does something minimally useful. So either
accept all USB devices, or reject all USB devices, for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
