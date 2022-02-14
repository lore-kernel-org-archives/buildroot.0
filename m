Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393B4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 15:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933A760B2B;
	Mon, 14 Feb 2022 15:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KAXEd3LEmT8R; Mon, 14 Feb 2022 15:25:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6815A60B3B;
	Mon, 14 Feb 2022 15:25:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AE9B1BF385
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 15:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7516640177
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 15:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aol.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RFxCyW7nBPJ9 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 15:25:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sonic307-2.consmr.mail.bf2.yahoo.com
 (sonic307-2.consmr.mail.bf2.yahoo.com [74.6.134.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1178400A4
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1644852318; bh=9xuPHzNFIHc+N5xSo1wjeWdBfwjQWb6oDN0TXgmEeI0=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=XMWhpRCsKSo15/bWJhKN65wA/74wz/8YGixChGvUdxwB030zmCSQGqLDs/KGsyRigKQcXTicqTlgyhkdMZR7mK3Fs4Jr91DwObIT8kicUIv86HYhqBa9pLq3KTL9/jV8o8HuYoMwelc/3CbAa4aC2RWeWiV3wJ7K7g6kcFKGd1Oh/dOxE5300fT2MLvqVXAXaN6FyDIKQebvVHW+TFOfr3ayOOyZbqY/FZ0LtcIjcEGcYGsHA3+03+jlUkNeL5Ngv5KN6BPdZtsQrdAxFys6XnwTXwDy7WyBzp1qqijakzEmEZmg/TCl4xs9Fg9WRNnWNubNmZgrelC/dNBBxZ4g3A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1644852318; bh=otKb/qBneCGLJ8nnH1m+Q7/bb+2199mFfDKX7ZDGM1C=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=trBcCRyU8H1xBKKJoOGa5OfnQytgFvbO0yU6aAICDdlpml2SVjWU7XqYX7YrcxD3FH0Rw4VL942cDiiGZUPibJhIL430vDpoYNQOor3V6GRXL+UX4BMM5HYSi46p8xsyUQLXdZ/bJSzl5BhpR+Za2H6pMSEC1ZozEE75Xi2C5mAePViU0Ms/yAnsYJc7BUls3BTKsnJ/5C0U+68j9l8K9yTfntbTAgAke9/ZOM4+2RpeFMcGjoFNLE7t78LNLov/gSBD5dDjPGDkUpAJb6B599RWhvY/+q3M1Eu39aQS18UISS/GQm62exg8cbRK7tdYumm/jVg7JtdTbpTiCHVc5Q==
X-YMail-OSG: 1GVGQNMVM1mrKCXB6ML5VuDlPx0TkWzn4o81KCH_DhS5IQTmY1p_KQw82ZOjXNQ
 jlafUOwclNR9pyhJzj_bGTl0Jr8OZRwulAxhi8J1f6QgWb9zdurwjDy24v.1mY2sK72oiNOvv2A5
 .6vBfK4jA7NhQ0Y8QtYoTQO1KvIZDyohJydGe.n.r0XNf_BZXbiL8he2i2_O2t7vGe0rM5HW86Fd
 MCkHKhdXJd9_XpfK3Fe_ZRSxtyaByVQzucor_l0xi0FVqTRupTpy05yEKNhQTfp1_AxVFmlmubqh
 wugfyD133.85tc0DdzNXH0Phk_RewVm7Eki3R46aslb.TKlTyiHBSnIkIOhjUsA4BjpTCsjsyrIP
 L.3lSq9oGPwxAj4gF8vcO2c9IKllP7rks_7_OI69sPo7eC3IrpKjFImwslXiHe2EtpjmGuFgZbEU
 jP80umcvu02tuyu0EBSBuSjTKUDVhvHUIlUG5902mMXVBLl4D9PpQm3PW5eUGfxfQVyV4jnWiOOL
 7YaTT3OapvzlAWIWteMC80sbngX2ulf2CLyVcvsgfJnR9qJZgtXdseOa95CBT1tYcdN_vUzi2EYf
 DG4y6RiCEZw3K43qB.8FXMBPVe2n_Y2E9dqHx.8l8wrseiTTaprcxWaH.2QwHMKh28xIgULaGiHg
 uhmyH5MbpwPImG_15PmrHxMNq2_3WQNqhunpn1Z56WncZbwCShvNhRJDl6GUgz5YxjQ9xawXsZeG
 k0jg8UATkbpUV678B5vlRQHq8XDWwLsfi2ZCxTXIG7Uo39zRMi18cNVg_w7WHLQgwGGsdQmlTr8T
 C3br1CgS16XWv5JGUKH.mqD6ZTbKLLxyCrmqsC31YhVcCBdajLiLD.ckX1.ekXUBDiNb3mul5A1J
 nN4QgKfip7aAeGZotFWIh2ioOmuq3iHk9yTZD3b9SBIitQ6GLY_1wxZzuCVeV2Od6qw2zV7TcuNR
 4CpYtLysChOFz7r0QRqFShQmVjppkaNTUTxs1XtwhkKnIBw6.1n8Q3R71M9exzId0_zJJ55qyi4U
 TYRk8j1qhEYfXnlteRJQkvumt5J1MUBfpuR3jXMydDyi1an3ijS.i66i794VRQ4aDx2n0A4UhDbW
 yA1xekpe7MMmjyahZq70mf.BeRt91ICSUilgXTVLlfDJyG4Vj8WeRCCq5HSaFaQ826eqoCqFdpj9
 1Mn9bXrpPN07893aYyX02vR2d_LlAaVus7WcvOpmY6TvEtYcGst29cvzCNDrKyFQ1xPLbQk9AvUK
 aw5k7ZLx7rdJjYiVZAVdpVaP58NESm2LF6uGvltLuf5j4sY25vcbu9zfZdbhLD_8R0A3cmlW4Tgq
 ZYZlg6ku_5T6qsvVx7t9JEDERaz_6mBpuLQqN56YYE73IFB4qtETMOOPsBjWTh_ENE4EbpQhNMhw
 nx3wJRgiYBWcSR_CzHUeAhJGdnyHrvVPjrrItOW1fr4dA2TRiTNjJ1cTs3Pu6apiUFYophRtj9Ue
 tfCevkuVYbKC_WIwFIJ.2vHPL3HgiwLX8iyeMCt4qLGKS4pCRjZZ8BuUzyOq8MD_lFLDmkOhEbqI
 FjWgrycQEz5.T4XF0bzwKmm11Q0WO5UKebxfPbsetkoDS1KOI3ELUJdQie0a1Ey0E9GghDDNNIpg
 7csbYGnqDs1g1p2i5dD7NOHmm5lM1kOPv6U340FGJYbfe0wPbhaPwxFkHTN961px28bIrcNRYkh7
 kLakPnBDauA6fejAWjUN4yBiJKCfLAi46FYhDTbya9jNWERLet6RC_t2TspYWXpHmO0gAmBJHwQX
 wszS8eMqdMeIxvzM65KzUDkSm5Umod9.3p9edjRX3174DbtRMVakC0S.aUvoVGqu9wv9TI3b_7M.
 fqeio2XXlHlOvWZq4ZV3N0Ry6ZfDRtulte2Nj_h7sbYasIfS8htA5zBcTv_qjQhIGpRJ_LU4qzUZ
 d_xmNli5N7HoLG3S6c8vIkxokfAfGC3SxM5Unp3BM5PKK7.Uy14Ekc0pyxUVM0mWW33CpZCRg7xy
 fikP1gQknthEacv.RA.ZdjXEcJTw.xkDCwmn5uZX6hgoZOnAKclOAUqPhBmYBghKOobB_rNdZvqx
 lUjPeHwBq5x.ml3qAP.5_rXrD42ddik.EGMzi9PuoGE3Xy2LclQvefYZJ99jia9GQJnNgHSuk3TC
 Op1BPUmjvLUHEgYra_8XiwBpuAcP1lvs1uIN2kSsHu6NeDNBUL5tQtfQPzn7jSVV12qSCYXEYdp_
 90N2JHJmZmIjlyArgIRqOXWcsayDVgdr7xZziIKhTLrP1GMp3O0mzq.s_hKqkqOOtrHETj_G4d6n
 FvsVFEduGo5fa6jfkFJis_rVGhRZvntW_F3s-
X-Sonic-MF: <hsiangkao@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.bf2.yahoo.com with HTTP; Mon, 14 Feb 2022 15:25:18 +0000
Received: by kubenode512.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 10ccc97cc07a415973821fe8957dfb4b; 
 Mon, 14 Feb 2022 15:25:12 +0000 (UTC)
To: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Feb 2022 23:24:50 +0800
Message-Id: <20220214152450.319583-1-hsiangkao@aol.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
References: <20220214152450.319583-1-hsiangkao.ref@aol.com>
Subject: [Buildroot] [PATCH] package/erofs-utils: bump version to 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Gao Xiang via buildroot <buildroot@buildroot.org>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: Gao Xiang <hsiangkao@aol.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- new upstream version;
- add 0001-erofs-utils-dump-fix-de-nid-issues.patch [1];
- add 0002-fsck-main.c-add-missing-include.patch [2];
- add 0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch [3];
- add 0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch [4].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=17eb5c417bd56be4b2f7627c2d6879fbad6a86d6
[2] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=1ca453ee89894b1669ac78d7f216bda172783e8d
[3] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=eb255afa101b52096bd3e5e48f990576190f03bd
[4] https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48

Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
 ...1-erofs-utils-dump-fix-de-nid-issues.patch | 134 ++++++++++++++++++
 ...age-only-install-erofsfuse.1-with-th.patch |  32 -----
 ...0002-fsck-main.c-add-missing-include.patch |  31 ++++
 ...fix-blobdev-without-Eforce-chunk-ind.patch |  40 ++++++
 ...-fix-Makefile-for-fsck.erofs-manpage.patch |  29 ++++
 package/erofs-utils/erofs-utils.hash          |   2 +-
 package/erofs-utils/erofs-utils.mk            |   2 +-
 7 files changed, 236 insertions(+), 34 deletions(-)
 create mode 100644 package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
 delete mode 100644 package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
 create mode 100644 package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
 create mode 100644 package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
 create mode 100644 package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch

diff --git a/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch b/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
new file mode 100644
index 000000000000..493ce5917722
--- /dev/null
+++ b/package/erofs-utils/0001-erofs-utils-dump-fix-de-nid-issues.patch
@@ -0,0 +1,134 @@
+From 17eb5c417bd56be4b2f7627c2d6879fbad6a86d6 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <xiang@kernel.org>
+Date: Mon, 22 Nov 2021 07:48:48 +0800
+Subject: [PATCH] erofs-utils: dump: fix de->nid issues
+
+As David Michael reported, "
+    In file included from main.c:11:
+    main.c: In function 'erofs_checkdirent':
+    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
+       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
+          |                         ^~~~~~
+    main.c:264:17: note: in expansion of macro 'erofs_err'
+      264 |                 erofs_err("invalid file type %llu", de->nid);
+          |                 ^~~~~~~~~
+    main.c: In function 'erofs_read_dirent':
+    ../include/erofs/print.h:68:25: error: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__le64' {aka 'long unsigned int'} [-Werror=format=]
+       68 |                         "<E> " PR_FMT_FUNC_LINE(fmt),   \
+          |                         ^~~~~~
+    main.c:303:25: note: in expansion of macro 'erofs_err'
+      303 |                         erofs_err("parse dir nid %llu error occurred\n",
+          |                         ^~~~~~~~~
+    cc1: all warnings being treated as errors
+"
+
+Also there are many de->nid lacking of endianness handling.
+Should fix them together.
+
+Link: https://lore.kernel.org/r/20211121234848.12663-1-xiang@kernel.org
+Fixes: cf8be8a4352a ("erofs-utils: dump: add feature for collecting filesystem statistics")
+Cc: Wang Qi <mpiglet@outlook.com>
+Cc: Guo Xuenan <guoxuenan@huawei.com>
+Reported-by: David Michael <fedora.dm0@gmail.com>
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ dump/main.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/dump/main.c b/dump/main.c
+index b7560eca1080..f85903b059d2 100644
+--- a/dump/main.c
++++ b/dump/main.c
+@@ -242,11 +242,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
+ {
+ 	int dname_len;
+ 	unsigned int nameoff = le16_to_cpu(de->nameoff);
++	erofs_nid_t nid = le64_to_cpu(de->nid);
+ 
+ 	if (nameoff < sizeof(struct erofs_dirent) ||
+ 			nameoff >= PAGE_SIZE) {
+ 		erofs_err("invalid de[0].nameoff %u @ nid %llu",
+-				nameoff, de->nid | 0ULL);
++				nameoff, nid | 0ULL);
+ 		return -EFSCORRUPTED;
+ 	}
+ 
+@@ -255,13 +256,12 @@ static inline int erofs_checkdirent(struct erofs_dirent *de,
+ 	/* a corrupted entry is found */
+ 	if (nameoff + dname_len > maxsize ||
+ 			dname_len > EROFS_NAME_LEN) {
+-		erofs_err("bogus dirent @ nid %llu",
+-				le64_to_cpu(de->nid) | 0ULL);
++		erofs_err("bogus dirent @ nid %llu", nid | 0ULL);
+ 		DBG_BUGON(1);
+ 		return -EFSCORRUPTED;
+ 	}
+ 	if (de->file_type >= EROFS_FT_MAX) {
+-		erofs_err("invalid file type %llu", de->nid);
++		erofs_err("invalid file type %llu", nid | 0ULL);
+ 		return -EFSCORRUPTED;
+ 	}
+ 	return dname_len;
+@@ -273,7 +273,7 @@ static int erofs_read_dirent(struct erofs_dirent *de,
+ {
+ 	int err;
+ 	erofs_off_t occupied_size = 0;
+-	struct erofs_inode inode = { .nid = de->nid };
++	struct erofs_inode inode = { .nid = le64_to_cpu(de->nid) };
+ 
+ 	stats.files++;
+ 	stats.file_category_stat[de->file_type]++;
+@@ -296,12 +296,12 @@ static int erofs_read_dirent(struct erofs_dirent *de,
+ 		update_file_size_statatics(occupied_size, inode.i_size);
+ 	}
+ 
+-	if ((de->file_type == EROFS_FT_DIR)
+-			&& de->nid != nid && de->nid != parent_nid) {
+-		err = erofs_read_dir(de->nid, nid);
++	if (de->file_type == EROFS_FT_DIR && inode.nid != nid &&
++	    inode.nid != parent_nid) {
++		err = erofs_read_dir(inode.nid, nid);
+ 		if (err) {
+ 			erofs_err("parse dir nid %llu error occurred\n",
+-					de->nid);
++				  inode.nid | 0ULL);
+ 			return err;
+ 		}
+ 	}
+@@ -338,7 +338,8 @@ static int erofs_read_dir(erofs_nid_t nid, erofs_nid_t parent_nid)
+ 			int ret;
+ 
+ 			/* skip "." and ".." dentry */
+-			if (de->nid == nid || de->nid == parent_nid) {
++			if (le64_to_cpu(de->nid) == nid ||
++			    le64_to_cpu(de->nid) == parent_nid) {
+ 				de++;
+ 				continue;
+ 			}
+@@ -399,18 +400,18 @@ static int erofs_get_pathname(erofs_nid_t nid, erofs_nid_t parent_nid,
+ 			if (len < 0)
+ 				return len;
+ 
+-			if (de->nid == target) {
++			if (le64_to_cpu(de->nid) == target) {
+ 				memcpy(path + pos, dname, len);
+ 				path[pos + len] = '\0';
+ 				return 0;
+ 			}
+ 
+ 			if (de->file_type == EROFS_FT_DIR &&
+-					de->nid != parent_nid &&
+-					de->nid != nid) {
++			    le64_to_cpu(de->nid) != parent_nid &&
++			    le64_to_cpu(de->nid) != nid) {
+ 				memcpy(path + pos, dname, len);
+-				err = erofs_get_pathname(de->nid, nid,
+-						target, path, pos + len);
++				err = erofs_get_pathname(le64_to_cpu(de->nid),
++						nid, target, path, pos + len);
+ 				if (!err)
+ 					return 0;
+ 				memset(path + pos, 0, len);
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch b/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
deleted file mode 100644
index 0aa99d5324d0..000000000000
--- a/package/erofs-utils/0001-erofs-utils-manpage-only-install-erofsfuse.1-with-th.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ab34000c672adca90388a8fcb1f70a7d391d35c Mon Sep 17 00:00:00 2001
-From: David Michael <fedora.dm0@gmail.com>
-Date: Thu, 3 Jun 2021 16:18:57 -0400
-Subject: [PATCH] erofs-utils: manpage: only install erofsfuse.1 with the
- command
-
-Link: https://lore.kernel.org/r/87lf7q3dn2.fsf@gmail.com
-Reviewed-by: Gao Xiang <xiang@kernel.org>
-Signed-off-by: David Michael <fedora.dm0@gmail.com>
-Signed-off-by: Gao Xiang <xiang@kernel.org>
----
- man/Makefile.am | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/man/Makefile.am b/man/Makefile.am
-index ffcf6f81c255..0df947b6fbf7 100644
---- a/man/Makefile.am
-+++ b/man/Makefile.am
-@@ -1,5 +1,9 @@
- # SPDX-License-Identifier: GPL-2.0+
- # Makefile.am
- 
--dist_man_MANS = mkfs.erofs.1 erofsfuse.1
-+dist_man_MANS = mkfs.erofs.1
- 
-+EXTRA_DIST = erofsfuse.1
-+if ENABLE_FUSE
-+man_MANS = erofsfuse.1
-+endif
--- 
-2.20.1
-
diff --git a/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch b/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
new file mode 100644
index 000000000000..c4fe71c9e6cd
--- /dev/null
+++ b/package/erofs-utils/0002-fsck-main.c-add-missing-include.patch
@@ -0,0 +1,31 @@
+From 1ca453ee89894b1669ac78d7f216bda172783e8d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 6 Dec 2021 20:14:03 +0100
+Subject: [PATCH] fsck/main.c: add missing include
+
+Otherwise musl C library builds fail with missing S_IFMT/S_IFDIR
+definitions.
+
+Link: https://lore.kernel.org/r/20211206191403.1435229-1-alex@linutronix.de
+Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+---
+ fsck/main.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fsck/main.c b/fsck/main.c
+index aefa881f740a..ad48e35f587b 100644
+--- a/fsck/main.c
++++ b/fsck/main.c
+@@ -6,6 +6,7 @@
+ #include <stdlib.h>
+ #include <getopt.h>
+ #include <time.h>
++#include <sys/stat.h>
+ #include "erofs/print.h"
+ #include "erofs/io.h"
+ #include "erofs/decompress.h"
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch b/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
new file mode 100644
index 000000000000..88979eb28fe3
--- /dev/null
+++ b/package/erofs-utils/0003-erofs-utils-lib-fix-blobdev-without-Eforce-chunk-ind.patch
@@ -0,0 +1,40 @@
+From eb255afa101b52096bd3e5e48f990576190f03bd Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@linux.alibaba.com>
+Date: Thu, 23 Dec 2021 16:49:07 +0800
+Subject: [PATCH] erofs-utils: lib: fix --blobdev without -Eforce-chunk-indexes
+
+blockmap is used by default, chunk indexes should be switched
+instead if --blobdev is specified.
+
+Link: https://lore.kernel.org/r/20211223084907.93020-1-hsiangkao@linux.alibaba.com
+Fixes: 016bd812be1e ("erofs-utils: mkfs: enable block map chunk format")
+Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
+---
+ lib/blobchunk.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/blobchunk.c b/lib/blobchunk.c
+index 5e9a88a30af3..a145be917b4a 100644
+--- a/lib/blobchunk.c
++++ b/lib/blobchunk.c
+@@ -113,7 +113,7 @@ int erofs_blob_write_chunk_indexes(struct erofs_inode *inode,
+ 
+ 	if (multidev) {
+ 		idx.device_id = 1;
+-		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
++		DBG_BUGON(!(inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES));
+ 	} else {
+ 		base_blkaddr = remapped_base;
+ 	}
+@@ -171,6 +171,8 @@ int erofs_blob_write_chunked_file(struct erofs_inode *inode)
+ 	int fd, ret;
+ 
+ 	inode->u.chunkformat |= inode->u.chunkbits - LOG_BLOCK_SIZE;
++	if (multidev)
++		inode->u.chunkformat |= EROFS_CHUNK_FORMAT_INDEXES;
+ 
+ 	if (inode->u.chunkformat & EROFS_CHUNK_FORMAT_INDEXES)
+ 		unit = sizeof(struct erofs_inode_chunk_index);
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch b/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
new file mode 100644
index 000000000000..27832d1e32b9
--- /dev/null
+++ b/package/erofs-utils/0004-erofs-utils-fix-Makefile-for-fsck.erofs-manpage.patch
@@ -0,0 +1,29 @@
+From 534eda7f8678e5b8fc8ca0f5cf0d9d7a932e0d48 Mon Sep 17 00:00:00 2001
+From: Gao Xiang <xiang@kernel.org>
+Date: Mon, 22 Nov 2021 07:58:40 +0800
+Subject: [PATCH] erofs-utils: fix Makefile for fsck.erofs manpage
+
+Add the missing dependency for fsck.erofs manpage.
+
+Link: https://lore.kernel.org/r/20211121235840.17600-1-xiang@kernel.org
+Fixes: f44043561491 ("erofs-utils: introduce fsck.erofs")
+Signed-off-by: Gao Xiang <xiang@kernel.org>
+---
+ man/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 769b5578a175..4628b85df2ef 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -1,6 +1,6 @@
+ # SPDX-License-Identifier: GPL-2.0+
+ 
+-dist_man_MANS = mkfs.erofs.1 dump.erofs.1
++dist_man_MANS = mkfs.erofs.1 dump.erofs.1 fsck.erofs.1
+ 
+ EXTRA_DIST = erofsfuse.1
+ if ENABLE_FUSE
+-- 
+2.30.2
+
diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 8bbb0885689b..aca5677d17e4 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  132635740039bbe76d743aea72378bfae30dbf034e123929f5d794198d4c0b12  erofs-utils-1.3.tar.gz
+sha256  67702b1fc5da05719d95ddb7c107e334b04365f5161a9717479d2831fca85a98  erofs-utils-1.4.tar.gz
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  COPYING
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index e35470b02edc..03df2be3668a 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.3
+EROFS_UTILS_VERSION = 1.4
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+
 EROFS_UTILS_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
