From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:44:42 +0200
Subject: [Buildroot] [PATCH 0/9] qt5: install missing examples
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180617144442.3fc03f6e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Tue, 12 Jun 2018 08:31:57 -0400, Ga?l PORTAY wrote:

> Regards,
> Ga?l PORTAY (9):
>   qt5canvas3d: install examples to target
>   qt5location: install examples to target
>   qt5quickcontrols: install examples to target
>   qt5script: install examples to target
>   qt5wayland: install examples to target
>   qt5svg: install examples to target
>   qt5serialbus: install examples to target
>   qt5serialport: install examples to target
>   qt5sensors: install examples to target

Thanks, I've applied all your patches.

However, I am not super happy with how we install Qt5 packages right
now. What we do is:

 - Staging installation: "make install", with no DESTDIR or anything
   similar

 - Target installation: manual copy.

Ideally, I'd prefer if we could do:

 - Staging installation: make DESTDIR=$(STAGING_DIR) install
 - Target installation: make DESTDIR=$(TARGET_DIR) install

Unfortunately, this doesn't work as-is, because the $(STAGING_DIR)
location is hardcoded at Qt configure time, so it doesn't work
immediately to do separate installation for staging and target. I know
Arnout briefly looked into this during the last Buildroot hackathon.

However, it would be nice if someone could have a deeper look into
this. It would greatly help to simplify our Qt5 packages.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
