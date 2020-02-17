From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Feb 2020 22:57:52 +0100
Subject: [Buildroot] [PATCH v6 09/28] package/quazip: Convert to qmake
 infra
In-Reply-To: <20200217212350.29750-10-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-10-anaumann@ultratronik.de>
Message-ID: <20200217225752.74c34031@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 22:23:31 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> We need to use correct staging path as prefix after switching to qmake infra,
> because the qmake infra no longer overwrites the built in install pathes.
> 
> Otherwise the build breaks when the install steps are trying to copy to /usr.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

A prefix of $(STAGING_DIR)/usr looks wrong, as prefix is normally where
the things will be once installed in the target. Do we really need to
do this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
