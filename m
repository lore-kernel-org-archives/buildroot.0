Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B26C369B0
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 09:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C635D61122;
	Wed, 25 Sep 2024 09:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5Tvmq69klXQ; Wed, 25 Sep 2024 09:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE2F56113B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE2F56113B;
	Wed, 25 Sep 2024 09:05:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B60991BF865
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20DA40443
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 09:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TpGQNQ-n-tz for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 09:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B3CE4010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B3CE4010F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B3CE4010F
 for <buildroot@buildroot.org>; Wed, 25 Sep 2024 09:05:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.185]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1sIfm643yf-00niSl; Wed, 25
 Sep 2024 11:05:44 +0200
To: buildroot@buildroot.org
Date: Wed, 25 Sep 2024 11:05:20 +0200
Message-ID: <20240925090526.3462217-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090526.3462217-1-fiona.klute@gmx.de>
References: <20240925090526.3462217-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VFt5Dbyh5qNwTO6lrjmbgIp7RQsd382vO361eQXH7Dsv6nJaM4g
 /UwbIkuzmOFy0yPYl5W2prh82mGTPhc4pl8YKPBmSvtN0dxVBGcFLz9pkETAptcaYrFekHM
 uV/VFKEUilmXvbq9Es27ggaB6mS1rIJ2l6snQDdt0rgrUaXFXueSt/qVefHiv3CtrKSVe3J
 XuuLH4Q8mD4S1qepXfGwA==
UI-OutboundReport: notjunk:1;M01:P0:RQaE8bLHtqw=;3wTcbqSRSmuAHo7KKYCd1d/VbZU
 DTzUCG7tSQfvOU8exwwGxcnhEKrmsfIuS55Zt5Lgbiu7t/mkDZiVcPJmlh4P4n/VNpDzvVss6
 31rS32MKIO37puRsDDgVuf5xHpW1EdqpEviweAl7QlPHXUBB/QZGNoFmkQYfoE0facxtdInmd
 /SKVSZTA+HT/odKBzmrOZQ2gb5TBfY61aM9IXG2gUw7y4nTg+ANu36vUBqIBMLnHGAFmZfsuz
 +r5mOz8/CHjOKeOxW2VjudTJOpsmRrc18UrhFRDJeK9toeDYr9eXbfJbJYYkDe2KFCedYK6oP
 6/NFq15nNX4bCd7+bkSOkTlNU5CkJIufNMmV/KQBGsdX+A31eSgmmxsmhpW/sFhBye8+SAPBD
 5HpKkZl7068X2cKEx1CSzdGBdvSBmPJAJQpS176BU+yZ/6ehuqSQCBLGhT72gLve7wsAShRqc
 qAKJIetjcMaxJDspUrMjCLLlPyz9tDHdLAXc40OjYEsw0PWoCy+ssNul7CP5uUcGeBabYp8la
 m5E+R5vA+2WZg9UkZlHEGHo5UAcqFWpEOBLN6DAnbnWckBkrxZLVbIkL2f9e6TLwRWjAHMyXQ
 0vFm49yMfQHs54dzxJyXqC1fiSlgS3oXBGGN1HcTlVul4V0ySWliHA6V+j/LDo1UJNxIGEefy
 6H028OVJecSr6oiU/n8IdDt6vrq0Njn3HgAESTSJFN/IjfjAb1Su3dxqds9SYquZVx1poIv2t
 pU51H/l8kzOP7GQJ5RqUcQEBuY8lWvbymg8G0NKh9dZ9JrVr/WZkptGEQ3Jxm9v/yW7BE2ggi
 xJyzAqcKinavRJ/0+qEbcKVg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727255144; x=1727859944; i=fiona.klute@gmx.de;
 bh=4nRq8B/j9EYYS+Pf5rL9B0UH44I62ghg5nhm9qr4Xhs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lrwUyByLAiWkQ1j4iSWZfm9wDIIw2CgkkOHld2XWFoVWa5C7ahUB5qxySOPAM9UH
 C4IMjtWyV5DAF/j1i6Mvu18osCyz2JWb8v/quwpe1bQdWOvsnlWwdhnqemWHRSW8h
 dp1Y/CHG1UWwnZAzDzk/U8vjtqIWQ6/8dyHIeTFDtWyXB6rvdDo2ms0p7jVMmJgPN
 tGtYQj5aa+9RWELZJKl27VAxYmGd+CrNyRkrBXcnhmK8GHqRYhA3kh/x4RCV3+TmF
 X+Ls8oGLhof2MXj+Wd3MOT5MRdqxlLRjg/NvgjSL++1r/obb6ylUan5t1C9TbDkD9
 gvfe7c3RTN3tND0LDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lrwUyByL
Subject: [Buildroot] [PATCH v4 2/7] package/gobject-introspection: update
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
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
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
