Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D022CCF11F9
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 13:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41404101D;
	Thu, 10 Oct 2024 13:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zB3h1hQmKQ_F; Thu, 10 Oct 2024 13:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FBC14101C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FBC14101C;
	Thu, 10 Oct 2024 13:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D523A1BF427
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4CDA810F6
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rtWqyLeG6mt3 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 13:53:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43F59810F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43F59810F0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43F59810F0
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 13:53:53 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oFz-1tsUVW0873-00y95Y; Thu, 10
 Oct 2024 15:53:51 +0200
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 15:53:09 +0200
Message-ID: <20241010135318.3064224-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241010135318.3064224-1-fiona.klute@gmx.de>
References: <20241010135318.3064224-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zhf/SJJ97NLCRmMW0riU8PcO+TZN1lUEZnekfWzEIgArIb1t4fz
 Xv74MSVlt3BoBM+wctmpteGd+DY9EVqjb9Oo2+EjniFdUWnw/3zV31Autbult3T8Wbzq9OD
 3NHODevfcUZRrARrQf541nEvxf59dIJgfz6hWDWGVl9RxEOcAkxXjDICKZoFf3ZGtjgKox9
 m86Ur9GLGg72rb3F2v6Jg==
UI-OutboundReport: notjunk:1;M01:P0:HFZpEV0Fev0=;HyMw4F8e07QemMhcaFx6bdDARvG
 SWzMZ3Wes+v+pdX4KGTlOFHgz0XDGVYGfTtNQ2wy6WJor5rPgmTkVSq+Kv3Lr0qy2LRiDOasp
 33ekJ+tApRLNpCVX5tSHU7gdmiyqv2qor2mqMxCxGZM19LjRdOL3PC4CcZ0Xu/3fyqGxDf+J7
 oj2rESzmyJcvtO9l1WVfEfMKuBgsqbl3xGFnCpfZEsNCYB8b1ym3BPe6wHAkwdOHwATIpFRLQ
 n3SlRCJIZ9rMuTAsCgzr69kwulSPLq1jSn6QYZe15LeJKMH+L1YW/4776kl0fGWLwQw+tSDK2
 Kz7XkSzxShQ7zkY2zhpYucOFnpu/Nkd/zSQKAhJIVPWfRSro99NFwgmG0HPyJCF1gwltDNNtp
 44MfylyXxKS0jLZbvTiR6FI3H7qBYpVEejEWOI5/wTFyPeL/CRAtq7oZ0v/73q7URGaSjSAD8
 G5tZa5WLicUg+phbCsacbITUU3cpNdKtkR/iaFWcfizWS9r59brDu1JChngbSZ16pfcYIG/XV
 mcj/hZ8HgmHZwceSiVZeBFUehOVs9bBCXF8RXUVLh94hwLyBd47etFywuGXMXFPVnhjtFsq4Y
 NsFHkgEkUO8rKvurs/KvVWFwHZl1InUE7hP6qrXnj8KFsTpNnS/5N1iIaym8vk187sPeZdiwl
 UrUqkxZz1WGFxJnWq5rC8wmrGighscE8MrysuW7wyNfLSnjp8tpZeESkdc1RDPykuhUoE2zYW
 ryB5cC2PwAnFMgnPR8WerQ4XIaNJHdU5QCVKaIcwUzyYyc28pGc3NL3H5DgWYga4T649k6tE8
 CfjGhgGlFud2lR4Ov97PgoFBasQDxhhYqhtjCMCJusB8w=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1728568431; x=1729173231; i=fiona.klute@gmx.de;
 bh=4nRq8B/j9EYYS+Pf5rL9B0UH44I62ghg5nhm9qr4Xhs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P5axDKXc7YYAAAURS9916yOm4yYhVAzAQW0IejRUqSOuYlgHa6zYFGsUUpjiR3CB
 7cUqYz2c371OGOUoM3GYS7/h0oKAQObPH4s6nBFCXLttXoZl/tsQg9v2fRGxjjNdY
 QQWf+X3TiYqBGx+aQ0AxZEeXTk5ovz4A72o0uOUPHnQ7xUYYDurNLhKeyMZrAWlCC
 LABt3sKP0JaS3VSskPuOs6mZbg0lB/dZM6vR8zhFLmnh//TSxz7oydQ8lelo8pkRW
 An6yNhBULzu5vkH4TB0UonV3K7/yBNf2hso6j6RongapcXrLtK97VDtD/pBOezJyv
 scN0Mwp1h24w5ugZ+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=P5axDKXc
Subject: [Buildroot] [PATCH v5 2/7] package/gobject-introspection: update
 homepage
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The homepage has moved, the previous one links to the new URL.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[yann.morin.1998@free.fr: split into its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 42250eb776..345118745f 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -36,7 +36,7 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	  language bindings can read this metadata and automatically
 	  provide bindings to call into the C library.
 
-	  https://wiki.gnome.org/action/show/Projects/GObjectIntrospection
+	  https://gi.readthedocs.io/
 
 comment "gobject-introspection needs python3"
 	depends on !BR2_PACKAGE_PYTHON3
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
