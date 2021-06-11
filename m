From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Fri, 11 Jun 2021 13:25:02 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/usbguard: new package
In-Reply-To: <20210611123703.18b71cbb@xps13>
References: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
 <20210608123210.143113-2-kamel.bouhara@bootlin.com>
 <20210608143757.5818a039@xps13> <20210611123703.18b71cbb@xps13>
Message-ID: <YMNIDqVHSAbiNRzp@kb-xps>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 11, 2021 at 12:37:03PM +0200, Miquel Raynal wrote:
> Hello,
>

Hello Miquel,

> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 8 Jun 2021
> 14:37:57 +0200:
>
> > Hi Kamel,
> >
> > Kamel Bouhara <kamel.bouhara@bootlin.com> wrote on Tue,  8 Jun 2021
> > 14:32:10 +0200:
> >
> > > usbguard is a software framework to implement USB
> > > device blacklisting and whitelisting based on their
> > > attributes.
> > >
> > > More info. on: https://usbguard.github.io/
> > >
> > > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > > ---
> >
> > Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> It looks like by default, an empty configuration file will prevent
> any USB device to be authorized. I don't know if this behavior is
> acceptable or not, I would advice to create a default "allow
> everything" policy that the user can overload by adding the following
> file to the recipe:
>
> [0600] /etc/usbguard/rules.conf:
> allow *:*
>

I think that having to default configuration in
/etc/usbguard/rules.conf is not expected as the rules are generated
using the "usbguard generate-policy" command.

Maybe we shall just warn users that there is no configuration file at
boot before starting the daemon ?

Regards,
Kamel

> Thanks,
> Miqu?l

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
