From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Mon, 14 Jun 2021 09:08:47 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/usbguard: new package
In-Reply-To: <20210611140011.41d00060@windsurf>
References: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
 <20210608123210.143113-2-kamel.bouhara@bootlin.com>
 <20210608143757.5818a039@xps13> <20210611123703.18b71cbb@xps13>
 <YMNIDqVHSAbiNRzp@kb-xps> <20210611140011.41d00060@windsurf>
Message-ID: <YMcAf1f3uN6IdFYs@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 11, 2021 at 02:00:11PM +0200, Thomas Petazzoni wrote:
> On Fri, 11 Jun 2021 13:25:02 +0200
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
>
> > > [0600] /etc/usbguard/rules.conf:
> > > allow *:*
> > >
> >
> > I think that having to default configuration in
> > /etc/usbguard/rules.conf is not expected as the rules are generated
> > using the "usbguard generate-policy" command.
>
> It is not really great to have to run a tool on the target to generate
> the rules. The goal of Buildroot is to build the whole system, and the
> rootfs might be read-only.
>

Indeed.

> > Maybe we shall just warn users that there is no configuration file at
> > boot before starting the daemon ?
>
> Not really Buildroot's design principle. We like to have a default
> basic configuration that does something minimally useful. So either
> accept all USB devices, or reject all USB devices, for example.

OK, let's add it in v3 then.

Thanks,
Kamel
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
