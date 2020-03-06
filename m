From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Fri, 6 Mar 2020 22:10:44 +0100
Subject: [Buildroot] [PATCH] package/mini-snmpd: bump to version 1.6
In-Reply-To: <20200303232243.77a2e0fc@windsurf.home>
References: <20200302185054.1815056-1-alexander.sverdlin@gmail.com>
 <20200303232243.77a2e0fc@windsurf.home>
Message-ID: <20200306221044.b07a18634cf281a94f42eb02@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, 3 Mar 2020 23:22:43 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Thanks, I have applied to next, after doing some changes.

[...]

> The configure script now uses pkg-config, so I had to add
> host-pkgconfig to MINI_SNMPD_DEPENDENCIES.

[...]

> I've moved the installation of this file to a post install target hook,
> as it's not really completely systemd related.

thank you for fixing the above issues!
 
> > +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +	ln -sf ../../../../usr/lib/systemd/system/mini-snmpd.service \
> > +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/mini-snmpd.service
> 
> This is no longer needed nowadays: these symlinks are created by
> host-systemd, so I dropped this.
> 
> Could you try what's in the next branch, and make sure it works for you?

Yes, your version works for me, thank you!

-- 
Alexander Sverdlin.
