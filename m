From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 21 Feb 2011 18:02:12 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: improve $(TARGET_DIR)
	(re)creation
In-Reply-To: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTinSvBJ79mKnsGND7BL+FVfPQN-cp1jRuEmCZpy1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/18 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> This patch fixes the following use case:
>
> ?1. Build, hack, ...
> ?2. Oh no, $(TARGET_DIR) is no longer in sync with $(TARGET_SKELETON)
> ? ?and/or the packages selected in menuconfig. If only there was a way
> ? ?to *easily* rebuild $(TARGET_DIR) so it is in sync...
>
> With this patch, just remove $(TARGET_DIR) and Buildroot will recreate
> it.
>
> Main changes:
> ?* Always copy $(TARGET_SKELETON) to $(TARGET_DIR).
> ?* If $(TARGET_DIR) needs to be created (i.e. if the directory is
> ? missing), remove stamp files so all currently selected packages will
> ? be reinstalled.
> ?* If $(TARGET_DIR)/lib/modules/ is missing, try to install kernel
> ? modules.
>
> Also:
> ?* remove code touching .fakeroot.00000 file (not needed)
> ?* remove code trying to remove CVS and .svn stuff from target skeleton
> ? (not needed)
>
> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
> ---
> Changes in v2:
> ?* remove gcc stamp file so libgcc_s.so.1 will be copied to TARGET_DIR
> ?* make sure kernel modules get reinstalled
>
> ?Makefile ? ? ? | ? 26 +++++++++++---------------
> ?linux/linux.mk | ? ?6 ++++--
> ?2 files changed, 15 insertions(+), 17 deletions(-)

Ping?
