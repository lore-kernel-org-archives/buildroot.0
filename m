From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Jun 2021 12:37:03 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/usbguard: new package
In-Reply-To: <20210608143757.5818a039@xps13>
References: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
 <20210608123210.143113-2-kamel.bouhara@bootlin.com>
 <20210608143757.5818a039@xps13>
Message-ID: <20210611123703.18b71cbb@xps13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 8 Jun 2021
14:37:57 +0200:

> Hi Kamel,
> 
> Kamel Bouhara <kamel.bouhara@bootlin.com> wrote on Tue,  8 Jun 2021
> 14:32:10 +0200:
> 
> > usbguard is a software framework to implement USB
> > device blacklisting and whitelisting based on their
> > attributes.
> > 
> > More info. on: https://usbguard.github.io/
> > 
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > ---  
> 
> Tested-by: Miquel Raynal <miquel.raynal@bootlin.com>

It looks like by default, an empty configuration file will prevent
any USB device to be authorized. I don't know if this behavior is
acceptable or not, I would advice to create a default "allow
everything" policy that the user can overload by adding the following
file to the recipe:

[0600] /etc/usbguard/rules.conf:
allow *:*

Thanks,
Miqu?l
