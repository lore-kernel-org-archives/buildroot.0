Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBA7CF8860
	for <buildroot@archiver.kernel.org>; Fri,  4 Oct 2024 22:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679E8610A6;
	Fri,  4 Oct 2024 22:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOV06c4bZvhM; Fri,  4 Oct 2024 22:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B07661198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B07661198;
	Fri,  4 Oct 2024 22:05:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB2BD1BF35F
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6CA240374
 for <buildroot@lists.busybox.net>; Fri,  4 Oct 2024 22:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoJmgIvHuVA9 for <buildroot@lists.busybox.net>;
 Fri,  4 Oct 2024 22:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 619D740176
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 619D740176
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 619D740176
 for <buildroot@buildroot.org>; Fri,  4 Oct 2024 22:05:45 +0000 (UTC)
Received: from 91-153-34-109.elisa-laajakaista.fi ([91.153.34.109] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1swqQg-0051Zh-6G; Sat, 05 Oct 2024 00:05:42 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 09491944;
 Fri, 4 Oct 2024 22:05:41 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Sat,  5 Oct 2024 01:05:37 +0300
Message-ID: <20241004220541.2290809-1-aperez@igalia.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tUHFTwzNXitfhHY+4Ev5393xwxoHPMIK+8q6dgKqPFA=; b=svQgVu/4sAhtlOgWQS11XpLGHc
 IpNxjMqTQP3AzWtzFMlK7ZGUABKS93M1A6EVhtoxcwp++yI8A/O09xNOCuQqhSzG4hTHZVR8U4H3x
 RgPNF1r2gR/lA3L+Uu6UPcQH7lVloty5rYcH1p+cseWvXcluHu+XOyuUCnbsjjNFwAHgi1dO8SnSN
 pqAG0+sjYz2BzdY8uC3a3zYxKnFg+K/8BVrB4k+7tjLgOZPmzFc7sUhrBcEwGS4iJ3X+p1aMO+i3L
 JyqA7bNfBMQ9gwzzpyxlMEkWLFs1XqNxJ+CzZkUePKrwNfpz8BZLB0kZVTrzI3hf5pl9D4L2ztB7R
 fiIKwehg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=svQgVu/4
Subject: [Buildroot] [PATCH 0/2] Update Sysprof and libdex to 47.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This small patch set updates Sysprof to 47.0, and its libdex dependency.
In libdex we can drop one patch, and for Sysprof I added a small one that
avoids needing to update the GLib version packaged in Buildroot.


Adrian Perez de Castro (2):
  package/libdex: bump to version 0.8.0
  package/sysprof: bump to version 47.0

 .../0001-add-stack-protector-option.patch     | 45 -------------------
 package/libdex/libdex.hash                    |  4 +-
 package/libdex/libdex.mk                      |  5 ++-
 .../0001-build-reduce-GLib-requirement.patch  | 30 +++++++++++++
 package/sysprof/sysprof.hash                  |  4 +-
 package/sysprof/sysprof.mk                    |  2 +-
 6 files changed, 38 insertions(+), 52 deletions(-)
 delete mode 100644 package/libdex/0001-add-stack-protector-option.patch
 create mode 100644 package/sysprof/0001-build-reduce-GLib-requirement.patch

-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
