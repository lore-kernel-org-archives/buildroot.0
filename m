From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Jan 2013 23:49:23 +0100
Subject: [Buildroot] [PATCH v2 6/6] udisks: new package
In-Reply-To: <CAAfyv35587HVKu5+-3dCS9MDDjSCH8YNqO4hiJn6dOM3=SS5SA@mail.gmail.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-7-git-send-email-marek.belisko@open-nandra.com>
 <20130107224730.0b135a42@skate>
 <CAAfyv34HwgoO7dEW6edbqaczPOh+zuM-sHw5_5ZUs_bmyw6RiQ@mail.gmail.com>
 <20130107231821.428885d0@skate>
 <CAAfyv35587HVKu5+-3dCS9MDDjSCH8YNqO4hiJn6dOM3=SS5SA@mail.gmail.com>
Message-ID: <20130107234923.70e64039@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Belisko Marek,

On Mon, 7 Jan 2013 23:25:30 +0100, Belisko Marek wrote:

> > The select of BR2_PACKAGE_LVM2 is commented.
> No this is comment that BR2_PACKAGE_PARTED select also BR2_PACKAGE_LVM2.
> Maybe this is wrong approach but it works :).

Ah, ok. Then please make the "select BR2_PACKAGE_LVM2" explicit, since
udisks needs it directly.

But then, you can get rid of your "depends on BR2_PACKAGE_LVM2" in
BR2_PACKAGE_UDISKS_LVM2, because the lvm2 package is surely already
enabled, since it gets selected by udisks.

I still don't like those lvm2 configuration options that much, though...

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
