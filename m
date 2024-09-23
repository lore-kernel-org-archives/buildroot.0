Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7D3CF9C6F
	for <buildroot@archiver.kernel.org>; Mon, 23 Sep 2024 17:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8012040A3B;
	Mon, 23 Sep 2024 17:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjNezK-OVobZ; Mon, 23 Sep 2024 17:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D0A5401EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D0A5401EB;
	Mon, 23 Sep 2024 17:20:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9FAD1BF3CA
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 17:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CB64047E
 for <buildroot@lists.busybox.net>; Mon, 23 Sep 2024 17:20:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2NXWPIKYPKY for <buildroot@lists.busybox.net>;
 Mon, 23 Sep 2024 17:20:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 45E574043A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45E574043A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45E574043A
 for <buildroot@buildroot.org>; Mon, 23 Sep 2024 17:20:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [64.88.226.29])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 122F360143;
 Mon, 23 Sep 2024 19:20:17 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Sep 2024 19:20:04 +0200
Message-ID: <20240923172005.39928-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <ZudgGuhHgwI1VLio@landeda>
References: <ZudgGuhHgwI1VLio@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1727112028;
 bh=ObOXQYGUvOLDF+ULrXIyGt62eWhS/hnz2mE2qvhbpnk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=diJOwr1YkWTyhZDOJc53USTyJZiJWJcBZYPcsYPIsE6yzEDKbREwpkllSMuzNHPY9
 9HIIZOFicUWseFR9y3v9RyJdlv/FGHtoQ6e3QvFg8+3Lk8CEST2kNWJ7Zm2Ck0CXJV
 hFoMANGzaIgA6SU6yyM9cz5Cw2G5HfbVTikTMsxerla6a4b7jryPZ1gq523NfYIIeH
 LpygkxbRN39PtH22Qbbe0lsd7DNSHbT24ktECG0T+5XV2RpqkGRaWTzQ3XW5eJKFha
 w+mGEEQnXdR75IvB+UWFFwJYhWUKrQJifnIegrWKZGy9GEd6ZkDPBLz0tZ0NWx5t00
 VH+slCoNF0Wvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=diJOwr1Y
Subject: [Buildroot] [PATCH v7 0/1] add DPDK libraries
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
Cc: Vincent Jardin <vjardin@free.fr>, Julien Olivain <ju.o@free.fr>,
 Yann Morin <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v6 -> v7 changes:
  - shorter commit log, include comments from Yann Morin
  - update mk's LICENSE

v5 -> v6 changes:
  - update comments on DPDK patch to compile aarch64 with Buildroot

v4 -> v5 changes:
  - fix test-pkg dpdk
  - fix make legal-info
  - add builds for DPDK tests and examples
  - support only aarch64/ARM64 and x86_64
  - notes: logs of checks at https://github.com/vjardin/br_dpdk/actions/runs/10767364662/job/29854551507
  - thans to Julien Olivain for many reviews and contributions

v3 -> v4 changes:
  - proof readings (dpdk/DPDK, git.dpdk.org instead of github)
  - gcc 4.9 needed

v2 -> v3 changes:
  - include the comments from Julien Olivain
  - refine the licenses
  - support little endian targets only
  - many build dependencies if the packages are selected

v1 -> v2 changes:
  - include the comments from Thomas
  - add a meson patch for the DPDK that I forgot to include
    This patch has been aligned with Yocto so we can share the same
    feedbacks. I'll upstream it on DPDK too.

Vincent Jardin (1):
  package/dpdk: add 24.07

 DEVELOPERS                                    |  3 +
 package/Config.in                             |  1 +
 ...-cpu_instruction_set-from-meson-opti.patch | 35 +++++++
 package/dpdk/0010-Fix-aarch64-build.patch     | 43 ++++++++
 package/dpdk/Config.in                        | 55 +++++++++++
 package/dpdk/dpdk.hash                        | 10 ++
 package/dpdk/dpdk.mk                          | 99 +++++++++++++++++++
 7 files changed, 246 insertions(+)
 create mode 100644 package/dpdk/0001-config-meson-get-cpu_instruction_set-from-meson-opti.patch
 create mode 100644 package/dpdk/0010-Fix-aarch64-build.patch
 create mode 100644 package/dpdk/Config.in
 create mode 100644 package/dpdk/dpdk.hash
 create mode 100644 package/dpdk/dpdk.mk

-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
