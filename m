From: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sun, 17 Jun 2018 16:05:51 -0400
Subject: [Buildroot] [PATCH 0/9] qt5: install missing examples
In-Reply-To: <20180617144442.3fc03f6e@windsurf>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
 <20180617144442.3fc03f6e@windsurf>
Message-ID: <20180617200551.l2kb6yky7w3mfacg@archlinux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, Jun 17, 2018 at 02:44:42PM +0200, Thomas Petazzoni wrote:
> Hello Ga?l,
> 
> On Tue, 12 Jun 2018 08:31:57 -0400, Ga?l PORTAY wrote:
> 
> > Regards,
> > Ga?l PORTAY (9):
> >   qt5canvas3d: install examples to target
> >   qt5location: install examples to target
> >   qt5quickcontrols: install examples to target
> >   qt5script: install examples to target
> >   qt5wayland: install examples to target
> >   qt5svg: install examples to target
> >   qt5serialbus: install examples to target
> >   qt5serialport: install examples to target
> >   qt5sensors: install examples to target
> 
> Thanks, I've applied all your patches.
> 

Thanks!

> However, I am not super happy with how we install Qt5 packages right
> now. What we do is:
>

I am not happy too; and I was already thinking about improving that.

>  - Staging installation: "make install", with no DESTDIR or anything
>    similar
> 
>  - Target installation: manual copy.
> 
> Ideally, I'd prefer if we could do:
> 
>  - Staging installation: make DESTDIR=$(STAGING_DIR) install
>  - Target installation: make DESTDIR=$(TARGET_DIR) install
> 
> Unfortunately, this doesn't work as-is, because the $(STAGING_DIR)
> location is hardcoded at Qt configure time, so it doesn't work
> immediately to do separate installation for staging and target. I know
> Arnout briefly looked into this during the last Buildroot hackathon.
>

There is INSTALL_ROOT variable which looks to be equivalent to DESTDIR.

Also, I was thinking about a qmake-package or a qt5module-package.

> However, it would be nice if someone could have a deeper look into
> this. It would greatly help to simplify our Qt5 packages.
>

I have free time and I will have a look to this in the next days.

> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Ga?l
