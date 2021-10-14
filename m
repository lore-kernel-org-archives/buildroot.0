Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B766C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D93BC6109F
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D93BC6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E7FA60831;
	Thu, 14 Oct 2021 22:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IR5vWJE3j2WE; Thu, 14 Oct 2021 22:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 161356082D;
	Thu, 14 Oct 2021 22:00:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA2E31BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA02983837
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2cjfUcyFnaA for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F11A837B9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634248812;
 bh=lm6GrymSA/jAhryjHBC6/Qo9FzqLaQ5I+C/m1ZnmWb8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=i5qQYcYGU54drPYEJuoCdPVr8hUIB71QLHcTTFaKZkCxdsGqpbTReTOGScWDxAMy4
 VHwbVSn8Zf8nyPLAKA8UOUJFK2hr6r4xAsCI4CDHHEprJiooYpDzBNBnUcHKTRW2iz
 53+YxnwK3gnk2wilMFCugt9ixKl436U36PqWhexg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.156]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MxlzI-1mwXH340re-00zCUi; Fri, 15 Oct 2021 00:00:12 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 00:00:09 +0200
Message-Id: <20211014220011.17230-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:zsLMj7xjEQRy1+EoyD5QwAXah9lH9gW1vgr9/VlQOYAsIcw5h/D
 IsckUXSQDAiLQMab43OJkyuz2WiYNCHpN9bXHCjsqdcHpVjVAybmLSA94J+31JeZlQbuctQ
 VyGbd0wIgg/Fw8DI0vFwxL6fDMNLl/5Nev0WQJdn4gQHF5ka7D/pfbM3piLna5k+Qgh/a1r
 2nlO1jFYPd4KLkVm2wYAA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A5src4a5WKI=:WAyp4BRu52MFQ+2/aG3hmR
 NmgRMmrPy07CiVl3ZkRgoDADH+2QefX4Qp0RZmkJLVOLCHMJAhiEIdhZcOrXI8H5k77oR65uc
 HotaK/i+/u9PJI9WAE0zDTVFpAW8vWPKj3vm+8AypBU6Wsq7lM5KbN6cIv/le9aaJ1k7ZImRE
 pmW2W91BXlumXpKVTkL9VsFhponcdjeJ4lAD5fQF1xQEa9J9pO2yA5Egr2mScoO2tpRGiPsy7
 LFizXXhrQJzcmzFYMR5ThKvit7GTK7PfqV0r1PiZQL6n7y1T03ujqiGF4k5qjPSCztYsg41iT
 eHCZNw2xH11FCpx1yHIc2s0vnGFYhmHznKYq9H7Y6l4SbsIxQJVHePzCH5SYI6KTRV17lLbwu
 isPisRaZDGQFeIz/djMJFGp8NMeIwp21A8ugTZO+9ro6dCBkjhtSrKRIF/g/orfHb6APQNIec
 1mqKL1siO6kGs8DPRKpxwgGOmu8MAOS8q7Sb/F9KlC7Ll7jNY3+qRBIGhm6s5ByArwI2qJFMg
 5mqNbk6RhUQryUUP4a/1MI3O96YsFDU+5+qAB2k/Z58D9rPYMX36uz3gR9haI2g4Qfh/TKW7W
 fU14OALF8USRwnyYCw861MtJbDBaYEAI/rfohFHlLg1lUvb7+JLYD0bAUrZE2ZeaLI0Ufk4fT
 6OLWK2Lvx+2e75JWUQOtLVF/lZMct+Z1X5nh8mV5ZCCKH0kmFIfTBuwD6nniXWr875qdjaHfw
 9pT8ckPBfse/Rxvydv6e7ur3v3y2tmyzdXGZ2bULYZG/IQ+9xD1okyOHd2tFKnlToKKfC5hFD
 cUTxHDnDGQdRUYjbOHSh95NTuPPsrjcMtVsVyQ1QnonDDW4sMpGAxFtJ0TQRAPuD4MfsqcNSt
 +QlIvUz4w5v3vM/eQNUhw2HEoGrgZwXrY3mgJgxpm31h8MivlOw01RcdcQG+phd9U1FMQ8pn1
 YlfytT2BPSh3JpvY7g1rXPCIOHb7FsiSbab6SISiYa46fYmLrPpE3FQDvxfujEWnrX0gCouWs
 AH4KmDPbRACITtjIUKxVFtyO4UWAfvbbqVsDaDeppS6d3hcaObwN70Vz0q3F3PfIuXjNNgGOH
 /RizY+8m6ejWMk=
Subject: [Buildroot] [PATCH v1 1/3] package/libnftnl: bump version to 1.2.0
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

For changes (since 1.1.7) see [1], [2] and [3].

[1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000246.html
[2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000248.html
[3] https://netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.0.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index f22b02af09..9737da1878 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  20dbc13f11004aea2c9e479cfb90359cb11fe3446c3140811c18e4ec1648ed8f  libnftnl-1.1.7.tar.bz2
+sha256  90b01fddfe9be8c3245c3ba5ff5a4424a8df708828f92b2b361976b658c074f5  libnftnl-1.2.0.tar.bz2
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index f4487bdebe..eff93b895f 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.7
+LIBNFTNL_VERSION = 1.2.0
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
