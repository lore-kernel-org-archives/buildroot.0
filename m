Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50008606A323
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PI7efr3P
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26930408FC;
	Fri, 13 Nov 2026 18:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYVNBIBMK1sd; Fri, 13 Nov 2026 18:51:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3B67440813
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794595915;
	b=Nd0fNhBTwqDSkX8m1rFoSB5P0Ri1LS30Y83XLRkwejcQ79dnlkdxfohjHEWLN4w0VRzc
	 4RhtG2nNx7J+Hu35qHs183W20ZcXUVigz4jJ4JnzV5D6isy1L35aQo3apsURgE9dx8Mbj
	 lZdwcdqIv3p67bsp0XIhz3GRjG7GkaSrK+p4dM3iLjp0mw2UPZe375CU7J52ZQ0LoCgZS
	 R1OmW4udRwQ7vmQjdTnZqoT5CoLwXbWkxeUPKQJk+XrCO//zwdAFHAYm+6VjsOZFWwQ61
	 fU08gNHQdK02XPKNlvMaPJUyIxs+0EAnFgQJR4+srC6QWHm0/0IydI1cms4RgY7/GSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794595915;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=owzE17teyDrJ1XMXUPLO+r9RvdP74kUPXfZDYVV7sk0=;
	b=ao65teSSZoUCrIqSwnDKaVqKRVIJiVt+ztKAMgabSdq9YcvC0vRNK0+nil1uBES8YdTe
	 /PSEaxi65aEF/d35s606q+RtDM/kGhwOxlMvFEBU542vdwm//nq14Q/cFQ5GvCBm9mfD5
	 IT8rzRNmm0syFUDFRNxkmZRtGC0ceaptpgg+kHa3MC2o2GPbK1VoZIXihf25AJw3xWhW5
	 37vtYefc6m5ZrP8/Yoz5QxmZ+jN57kD2F20VypWHTmFxXTLwW/6qmbdCHJ3yvTqvN2oR4
	 zmhpnQjzycDn8wz3jlOGDRlckxbpOEpmmtqJo0Ctl4KnRTBr7hs5eiOMuYl1R+c4MfA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794595915;
	bh=owzE17teyDrJ1XMXUPLO+r9RvdP74kUPXfZDYVV7sk0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=PI7efr3PkCeL5bkSMSoOUastp5zqcbgpBMZkPyeetJ6dZr5J9XOlOY52HUCwwoAH2
	 3Jw4pORVa1PivxE1UFzofWpj/WLt0VqiJuqEHap3Z8+vKKdayjkAsq+GOL0XdJL02X
	 ZLI2/63FpQ18DfzrxO7/a46FP/w6vGQoZbxAYrhDdzWrSsHxiYAXn5dU3kgOq5E7N9
	 4oLYM5A+Lohevo1oJ0LsHpyLiMfq0YEAoMt+4uv4l4ZTL5G/mnetKT1P0TT93aXQry
	 hMkJKdgkolc8/LytQH7cTs4JZFXejtZWLWRuff0iktmgpW6zOCFlhr11HxR/x0jxnY
	 kALgjIgEEEYdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B67440813;
	Fri, 13 Nov 2026 18:51:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 110B328C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E943360D91
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AunWS8Uf552L for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 18:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 45E6D60DAA
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45E6D60DAA
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 18:51:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3338E5FFC0;
 Fri, 13 Nov 2026 19:51:46 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Fri, 13 Nov 2026 19:51:40 +0100
Message-ID: <20261113185141.778423-1-ju.o@free.fr>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/unionfs: bump version to 3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For change log, see:
https://github.com/rpodgorny/unionfs-fuse/blob/v3.8/NEWS

This commit also updates the LICENSE hash, after year update in:
https://github.com/rpodgorny/unionfs-fuse/commit/e3e8b289f19047d7c6309eff3dc7a2c505229b73

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/unionfs/unionfs.hash | 4 ++--
 package/unionfs/unionfs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unionfs/unionfs.hash b/package/unionfs/unionfs.hash
index 7ec654591d..4a8005363b 100644
--- a/package/unionfs/unionfs.hash
+++ b/package/unionfs/unionfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  026f5302279110ceb7465e5c9e863cd0319ea0dc32ad253d162cf9db0f5e9a81  unionfs-3.7.tar.gz
-sha256  b03db54bff4b5ff9d1b4c7ef54513e52afaa32830f36a6da6db8c0fcd35a4431  LICENSE
+sha256  88482d27a886fefd251af3d5b7123e82b2b5800219e7d61d4f29bfee718bbaac  unionfs-3.8.tar.gz
+sha256  7d35c5b7328d25c27ad82a84d82e26ccbc25d92dc216f82841cbcc78441d7f5b  LICENSE
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index 4909d80a70..940f17910c 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNIONFS_VERSION = 3.7
+UNIONFS_VERSION = 3.8
 UNIONFS_SITE = $(call github,rpodgorny,unionfs-fuse,v$(UNIONFS_VERSION))
 UNIONFS_DEPENDENCIES = host-pkgconf
 UNIONFS_LICENSE = BSD-3-Clause
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
