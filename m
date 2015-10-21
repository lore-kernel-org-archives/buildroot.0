From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 17:53:37 +0200
Subject: [Buildroot] [PATCH] openpgm: bump to version release-5-2-122
In-Reply-To: <5627B283.80904@imgtec.com>
References: <1445435791-40706-1-git-send-email-Vincent.Riera@imgtec.com>
 <56279A94.8010809@imgtec.com>
 <20151021171553.52fcee58@free-electrons.com>
 <5627B283.80904@imgtec.com>
Message-ID: <20151021175337.4176b9f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Wed, 21 Oct 2015 16:42:59 +0100, Vicente Olivert Riera wrote:

> 13 OPENPGM_AUTORECONF = YES
> 14
> 15 # we need to run libtoolize before autoreconf, so the missing m4
> 16 # directory is created.
> 17 define OPENPGM_LIBTOOLIZE
> 18         cd $(@D)/$(OPENPGM_SUBDIR) && PATH=$(BR_PATH) libtoolize
> 19 endef
> 20 OPENPGM_PRE_CONFIGURE_HOOKS += OPENPGM_LIBTOOLIZE

Why not just:

define OPENPGM_CREATE_M4_DIR
	mkdir -p $(@D)/$(OPENPGM_SUBDIR)/m4
endef
OPENPGM_POST_PATCH_HOOKS += OPENPGM_CREATE_M4_DIR

which works (tested locally).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
