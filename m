Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C33DC77B72
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1222D4148F;
	Mon, 17 Apr 2023 19:23:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1222D4148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTFDY3a2rp_a; Mon, 17 Apr 2023 19:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E10CF4141D;
	Mon, 17 Apr 2023 19:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E10CF4141D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2C51C4223
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 478558191E
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 478558191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0RxIKuQ26s6 for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:23:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C81218190B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C81218190B
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:23:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.192]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgNct-1qG6AC3m87-00hsGB; Mon, 17 Apr 2023 21:23:28 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 21:20:47 +0200
Message-Id: <20230417192046.601662-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AuAplwfVrM3qCN4z77I6sS1sGU8wCtDEgM8EAB/WKH0Xu7LIsDW
 FlRLel67oUdYrIHrsEWKa2Utfor7QBLZ72t1WMA8F8C4PalbzbYr0O+eS0queihhgvTK9/F
 LEgbi91djzi0bTh7XWNads7PQA+cmHKOv+jIKdqMJe7uH+q2kSXB8KDvKMJwyzB9BgnElzX
 pV0AmpS8zm2zKrFj72I1g==
UI-OutboundReport: notjunk:1;M01:P0:qyZNh1l4c2E=;gdV5rp6SQFX72pGb9ELa8PitjNc
 KCeDZxtaRDz/2auq3Eyn0HInsaUdRTYvXys2cDBCLecJplmxwzS3efodKCUJJf7P8hucflbfS
 jaKBkY7GNokSG+ueuR34sv2F0fEl9BER+I90P45FmaNUF45TlXwqpa4Buy13pkoDy/gj0cq5B
 uEW+ewEv9miF2Y5FwAr3AIDNCcry4Ys9Xqo4XTls8EwLU0JovUnDHr4D16uKGJfeIv//S+Dvo
 IttSSeOD3ouXuzaBmPy79I80GKtOqEPDiP5daAe0Ca/gXp7Q4onZL1+A9YLJXXbzE4C79CgfR
 6bD8kkXg7EK1544q32yD9GfMA/cRPaO385WcS286uV+4WtEolU+Wgzkoe0HSKnEvpiEFgNJq9
 XXFSI948BfbeJRAhi9mOEXn4OaGXlm9UvhL4MPYS5Fbd/UHHszrnc0aXnXqyRbdO6whFIUthI
 TBNdJHE1+9xzIZi1YWgvkIt0jtFwHos4Y71TMTfEytF9QjU9ErIoCp/m4HkLW4rxpWINdqiMT
 Xqt5v2jnHMxBtJ4HWDd3ecQm2cI+/85+yN1XGwqvcFBRLE6OXG4Q0T358Ps67gLmt00GrNAQk
 QPpYA8RdWaUhHbwuylnYbCjUCehRQSOeytVCRNSja/Qmb6qA/co8lJE39gxTN8DYkKuaF80en
 H7E1eWHouV1xdzBVHr1iaRVRBf+f+xTsN9NZRuv/bmEDYVOjAFQQUAdchjFiRcktbpLyfzrJe
 lZ4CJMIUODOboOFyb4Px9qdsxygJ5uhg6z/SllckSdlhkVPpUeMPumYcvdTP77OFE/SAtV3na
 HzMh5tKpDh7tSI1XQP4yOw7BByPi3GYQjGrAizd077BFIkDrYbQ3mTf+iZpPvVoQLN5WB/URI
 cVz+VdHAcmsrpn+62F3BZkIx0LFJTNCOGYdT0O15xslboG/bCGb3KsBSfV7aRNhXQsmFG8ohy
 rOt2wwanStIlhjmUkGxi3iNmXgM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1681759408; i=dalang@gmx.at;
 bh=RG7pL4368dQuBR6QgjFO3WgXlYtyL2r/594u3Wn0g3o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=emQHDhrjCNVVh7APsXDym3d5NpLfie7gsKFMRMJqj/u09++TkhhB1DbxrL4ZWFBcw
 u6C2+JzL+3NYlijzdhNPe3RBG49qBTcHFAM/din+Oj3zxWXvfLo8q73pRbFfnQnY0P
 W2mHicEtAuApOyZ5/j4YMc/LO5TZUXD8xH0kZSlk9ehk8LxVgqNSwCqVxWg7hCjYlx
 yyvg9cEy1sj0RVXseLuQYct+G7OHHzt7gL8jIwlcXvLeYWq3QW6Ko4bVFoVi0lYdio
 /mNpIcafjNtxlYdKjU1ATQ3EQ7bypKjUUUWfzCIPBWKf/05LVe+brvvJXyOElEhWg0
 2qW0jMVv047vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=emQHDhrj
Subject: [Buildroot] [PATCH] package/tcpdump: security bump to version 4.99.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2023-1801

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/tcpdump/tcpdump.hash | 2 +-
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index e548e32626..1a22889851 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
 # https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3  tcpdump-4.99.3.tar.gz
+sha256  0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea  tcpdump-4.99.4.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index 7a679ce4bf..91643e7bea 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.3
+TCPDUMP_VERSION = 4.99.4
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
