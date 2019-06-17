From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 19:31:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/iputils: move binaries to the
 location also used by Busybox
In-Reply-To: <20190616202018.GC2216@scaer>
References: <20190616200919.4378-1-thomas.petazzoni@bootlin.com>
 <20190616202018.GC2216@scaer>
Message-ID: <20190617193152.4c2c50a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Jun 2019 22:20:18 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > +	mv $(TARGET_DIR)/usr/bin/arping $(TARGET_DIR)/usr/sbin/arping
> > +	mv $(TARGET_DIR)/usr/bin/ping $(TARGET_DIR)/bin/ping  
> 
> This one will fail with a merged /usr, I guess...

Indeed, thanks for spotting. I sent a v2 that deals with this. I didn't
find a better than just do the move conditionally, i.e when merged /usr
is disabled.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
