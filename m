From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:39:01 +0200
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: move
 BR2_ROOTFS_POST_FAKEROOT_SCRIPT after pre cmd hooks
In-Reply-To: <20200927071547.GG11621@scaer> (Yann E. MORIN's message of "Sun, 
 27 Sep 2020 09:15:47 +0200")
References: <20200911003002.5895-1-charles.hardin@chargepoint.com>
 <20200927071547.GG11621@scaer>
Message-ID: <875z7t2fa2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Charles, All,
 > On 2020-09-10 17:30 -0700, Charles Hardin spake thusly:
 >> From: Charles Hardin <ckhardin@gmail.com>
 >> 
 >> The fakeroot script does not appear to be used in any of the checked
 >> in defconfig targets, but it seems that most often the post
 >> fakeroot script should be done after all the packages rules have
 >> been applied instead of before.
 >> 
 >> Given that a change in systemd moved the SYSTEMD_PRESET_ALL hook to
 >> a ROOTFS_PRE_CMD_HOOKS, there was no way to use a FAKEROOT script
 >> to disable a service or fixup a systemd configuration. The systemd
 >> move makes sense, and this just tries to preserve the same ability
 >> to fixup a rootfs after all the cmd hooks are processed.
 >> 
 >> Refer to commit 65b63785a642bbc565924edf365b5d7c080f961c for
 >> the change that instigated this reordering.
 >> 
 >> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

 > Applied to master, thanks.

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
