Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CC1606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aJtbyOnK
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86EF1403F0;
	Wed,  4 Nov 2026 17:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KK-I-dh0qMAt; Wed,  4 Nov 2026 17:17:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B0DA3403E8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793812630;
	b=CLbGK4jtoefX9W6JaMqCUPZbllwtRb1rFJ3N71f/xa5pvBJrtCGM48/Cu/nzgVu9xtp/
	 N2K8OqjjWwVIyHM6FOQ4LsvrBoA7RHhJiDn45TtXkZjId+sGhwhFh4D2tI8fErWBG6DZu
	 l0IOBAqCdR5Y30+toUHVStWt1E+nioPuPv+5GxOZySWXvdUuvE5GC3299/RkjsBbFB0w7
	 vwzs01LZEhGn3SstkH1k4nMub6Tj5obAgtUK+TY/dg21RWfyXHrli8Ga/rKDPdpQiMj5i
	 QNY4r8sEbnh0XeFUhmI12bL1ASIB/W/PCkFRwvgzvvupFLulHOt56ca7qE8rKpSY1FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793812630;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Zb5snxg5ZpTZzYJAeSxOmOxsuUgISxgXFL4t7wsVKQQ=;
	b=JwUSxVlxzZpgLXCZ52M6YukqRohkaF880K92axx4rktH8lZTLA6J1jTA8DS9nFGpzdpg
	 wjgFG9peR43czlcSObvI46FI/lUd3J+1dTmjBt46wtE8GnTPJrX7MmVWwqG4JlmSBAVA+
	 92okuLE1cjrstX2QRPY5Exn7ADKvANYSGAjn8iomKsjAu3iJGsYtjdcvL4mbC2nRrEl5H
	 Z9YBOU5c4qPc1LjerjPmPpKooUT+uOG7jWeEXrY8DXre4bOhrTu3hsylo3eS2yZeQYmDg
	 x9KQzOKVrFu8HOxJnwsuzmC9P+3sHWf7jaDqBw58Rwk3byTmTY0BCMdZemx8XvwQ71A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793812630;
	bh=Zb5snxg5ZpTZzYJAeSxOmOxsuUgISxgXFL4t7wsVKQQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aJtbyOnK7cCCUmUt1aKMzPvcrpeyZg7a5nZN6FEbGWmUOtnVzR95Hay/52aqJW94U
	 rLRsadMFdNfGMVpYQYMdDwqYV2RLJXxTRwx7toNmVANbvvYGbFVuHD33ipDTQF1lbs
	 3/2K4OplC+EaUAtSFTkGLEXEd9w7Zs6Oi3Pu6zBtSsYE+gVNAwx0F6eYIVSUxpBM9g
	 7Zs5OXH0t6Ikkc9StlpcNRqLzsxYKXGgjUGljN5gm34JmU9YIb2juLwq2CUpgwcULH
	 75+pq4Y/YdCd3dAA5r2tBtJ9cdJ7o1DwscnLRnn/gHZWposFaoQind4IDWorQ2N3kM
	 PtU/Q4dpkKO4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0DA3403E8;
	Wed,  4 Nov 2026 17:17:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21BEDA10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07914403E8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNbKAQsHY949 for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:17:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B6AE7403AE
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6AE7403AE
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:17:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E429F9DCF7; Wed,  4 Nov 2026 17:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:16:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ddce4821102aba53c6cd214f38a8afbd131cff2
X-Git-Newrev: 597f9cf444625739e3add76a06cf347744358ebf
X-Patchwork-Hint: ignore
Message-Id: <20261104171536.E429F9DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Angelo Compagnucci for qt6
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
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/597f9cf444625739e3add76a06cf347744358ebf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

I already maintain the qt5coap, qt5knx and qt5mqtt modules, and I'm
going to follow their Qt6 counterparts and the qt6 package as well.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9dd41f01..d6ed6b2b1a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/qpdf/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
+F:	package/qt6/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
