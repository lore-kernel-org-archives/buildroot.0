Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369CEB64D8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jun 2023 16:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B4742112;
	Thu, 22 Jun 2023 16:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3B4742112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1KXiZTD6Qag; Thu, 22 Jun 2023 16:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 884E6420F8;
	Thu, 22 Jun 2023 16:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 884E6420F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C02F1BF484
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734C941F81
 for <buildroot@lists.busybox.net>; Thu, 22 Jun 2023 16:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734C941F81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sNDv9m6Yisv for <buildroot@lists.busybox.net>;
 Thu, 22 Jun 2023 16:55:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5FE3420F8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5FE3420F8
 for <buildroot@buildroot.org>; Thu, 22 Jun 2023 16:55:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.160]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUXtS-1qcfrm2Prs-00QRPE; Thu, 22 Jun 2023 18:55:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 22 Jun 2023 18:55:21 +0200
Message-ID: <20230622165522.16397-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:9OwWnnQMJXouOMcbupa2FOYyF0PzPglfvpnn6OB5AFlDl2UOh0Q
 YBEimZkgUZ5AzHSvB4e/3T5FYLQwDfuokfeFNgiMUZkGvSMbnosxw3WZWsJ4RljR8J6vJf7
 V+PiRCLrIuqbiDbYS5xbJe92Dgo+7aeTViYrnkM4N89nLvmEUqcF/fUyon+zK2UlND32ojf
 LPw/z0PccHMBnCzE7Dp4Q==
UI-OutboundReport: notjunk:1;M01:P0:Ou3uhVgkCc4=;d+h8aiTqx0qnUcq8NmzsEdXHzut
 ovTsafe6V9jpulzvL/cNZqWbVPZ5IyvP1AgI4X6pJP+CYCNequKTY81oUPKoRXVOpBYREpxeI
 5TecEN0pbuIRA5wRBxtEsvlUebq1Gh0p64kmNNUHksvga9J38nTjEQnFEHpAr5HbxziSHboAb
 B8QySe3z81q4dbiUv6C9gZF5reT/0MG9wv1uEu/dWFMS3NjW5O+EOxixvmB5XlVYZHcHe7+e9
 QiQ+2bvK81Xr57KJLPp52EREQM8yfQj/7Tk6jNlQ3SyXi4sa9Gcpy1TkdXSBCTB1RZPYVGJE0
 dBCMxZ7HrDwZ3R3zwCTv87pNuvtQ75eJzf1GctVGp1LP3gkkOPU4wMR96sJaJk7dRL+1aOXfS
 oG6m7HcswvsqM+euoggr1Uu2gNPc8qW2NIuQrQOj+qMWV1lzDPKd+ez4/57iZhl/pjUE3s8j1
 22DBCYsoJljocKM8CrZnUM8YIuQUfcVeSgBLAfNp9S4jNbZ/blOK/cUUl6/c6ue501UYoZoWr
 6i3hBfo9YdFoc2myNZu4x5r+UJySnoEeLw4iYOaFIOr+mN8vfX5peglvz2w3LxjMrKsK6Zcxh
 rhR6VcVtL+jyU0CY0b97k9R+uaXRZayTn05Cz1ROGp2FBLZ7H/5LipjmM25nVS9+E7C88+hHU
 7fES43FTOQGX2rzhp69d62gbDU5gg+xKbfvCnv6bQM5v5uDc9m5WDKv3uR0uce5RocANO8d29
 f1BEp9JmnwcRKcoU5CU4WLDji0t5LiAKreJHggCgt3KBV+8zS/agB7yZ/syPkNGRqrO4pvIAo
 VlmKu6NW9gVFU304H/X2ZNpoRTBTLwltCqIPG4KYYt8dEtHbUi1P58/chZJZSrbM2ZWxg/LTe
 9hkmF+hY1teET5+ciaAmEKh00lEw1uGKbSzwYsaNcDCfQBztTOAXuoUP+kEhcxefUK5qH66dp
 MNgicw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1687452922; x=1688057722; i=ps.report@gmx.net;
 bh=bXz62+aPyytgHRt0/1LPqifnLsKrriHpxcZ4bHKY578=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=nxJtyLHD5w2pT0vaIgOvEmez2vjiaE3dt/BTkNv37wcO+8tGYomRPvl+IEjTXnlAFQhYlAb
 CNSD+wEhR8RB4o2Q43Jeduk6kkOzTckK9eed58iMfJAStsF9YEchdKtFrWE3iv/gDAFfxlcWg
 1y4aKL9792tqFY6z/bHbO9bbtX0RBoTRtMzZWu9MRXqLv5PB/G3yaoqfxwwDy66ddhnSobwuv
 I+qYneP9w3jsXMCA9P8cF/ymATYp9pXRTwW13fELQ4W2ykbCSxtOmtXTMDr3o0eUa/0mru9QV
 HImY6pcgGhLgdKNtgOCluxRUOJBZ12EMxFO60Se6oN3p5u6xYILA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=nxJtyLHD
Subject: [Buildroot] [PATCH v1 1/2] package/libubox: bump version to 75a3b87
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - be3dc7223a6d uloop: avoid integer overflow in tv_diff
  - 123e976f3d01 uloop: restore return type of uloop_timeout_remaining
  - 334415738150 uloop: add uloop_timeout_remaining64
  - c87d3e1fb67d lua/uloop: use uloop_timeout_remaining64
  - c86a894ec63d uloop: deprecate uloop_timeout_remaining
  - cce5e351278b vlist: define vlist_for_each_element_safe
  - f2d6752901f2 blob: clear buf->head when freeing a buffer
  - 45210ce14136 list.h: add container_of_safe macro
  - cfa372ff8aed blobmsg: implicitly reserve space for 0-terminator in string buf alloc
  - d2223ef9da71 blobmsg: work around false positive gcc -Warray-bounds warnings
  - ea56013409d5 jshn.sh: add json_add_fields function for adding multiple fields at once
  - b09b316aeaf6 blobmsg: add blobmsg_parse_attr function
  - eac92a4d5d82 blobmsg: add blobmsg_parse_array_attr
  - ef5e8e38bd38 usock: fix poll return code check
  - 6fc29d1c4292 jshn.sh: Add pretty-printing to json_dump
  - 5893cf78da40 blobmsg: Don't do at run-time what can be done at compile-time
  - 362951a2d96e uloop: fix uloop_run_timeout
  - 75a3b870cace uloop: add support for integrating with a different event loop

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 2775427485..48b6432f5d 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  54f65299439dab4be8f203588bcefd9b60052ae87d12c6d012f6278a2a111b4e  libubox-d716ac4bc4236031d4c3cc1ed362b502e20e3787-br1.tar.gz
+sha256  b06311e7d857583303e9256f58787857944572012fbfd4a5d83e92e0e684f654  libubox-75a3b870cace1171faf57bd55e5a9a2f1564f757-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 90ba57a883..d6da078c7b 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = d716ac4bc4236031d4c3cc1ed362b502e20e3787
+LIBUBOX_VERSION = 75a3b870cace1171faf57bd55e5a9a2f1564f757
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
