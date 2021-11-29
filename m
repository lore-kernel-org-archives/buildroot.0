Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C918C4332F
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC7860DED;
	Mon, 29 Nov 2021 22:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2P6f_iYjRdCf; Mon, 29 Nov 2021 22:14:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 012EC60D54;
	Mon, 29 Nov 2021 22:14:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63E281BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F2DA40362
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1ceWHF9Hy_X for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64C85400EF
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:14:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id o13so39855688wrs.12
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKDvuqJF96AgHr7lzpnmfJKIIglVkVUCNeNRoLrLQ0E=;
 b=R6ZJP/NFFteNRjdxsx/FjwZwN6nBipJUWSkAwiCsIizu4rTP1ZjLxcWJ5Cw1vQAdma
 N5cyy4R7BKgAS2x19AmGAhBpH8ci96mzWPTAgn7VYROc66T9C9fhE+JGdqi1py4T2FXy
 z8RInmxbXchXpQhhNqr8NSAtM3IarG8KnC6IJ0QTJFUlrh3pmqLdtnYR1f++CzQopvQ8
 HdKU5z2u6lkfIwM5sD3tkWjk3yRNyRlwKDN1jfy7hjTGEZtcTA9aM3B4ZDpMjNexBe1d
 PSKIusDpO1k1TKozXjLTJSzZjMjgEAVLBFShxtEoWjfSBHF7vHg0Ppwmu0AgppfFfQPX
 nqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKDvuqJF96AgHr7lzpnmfJKIIglVkVUCNeNRoLrLQ0E=;
 b=DYCJon0udH9ab04CQxWAaajAycNKzr6nHArmFCdoFFcRpNqlDS+Wcg6D9YKTtPQQ83
 NbiaYqvOuWm3zVl9eIvd5vitB8lciOiVR0bVdZk8mjkO1OWdyAwTC10uxSS0FVOMsnyP
 cvFKSwV1TaLlNe0n3IJ+HQyNWANOgaNOvmoCHG9/vjahOh4rQ8s3XWQ2huLUfuls2E8O
 QLKNe6DnZeNjZ6izf0tVqtET2lOzXKS5va8j2wuC270QDicwQV7UIuT/1dkfb5AB3U0S
 BLjT+sqoYPUFkzVnwQ8FPlB4+kVJUfVHTERi0jB/ap7wehkH9629kW4wREOKTJG3ewj3
 6JLg==
X-Gm-Message-State: AOAM530idK5oeNow/I4Eia3VrKCyBwOm65zEq4p2QhLK05meS6Olnlsc
 Qdcheuz+CWRn9oHqSZ+dFs8k/IeJgko=
X-Google-Smtp-Source: ABdhPJw1uKM6wXVHl64vx16ZCfS6LTVY4NAQvJq0FLz1eHsKza9lfYtAbXBerKf+3GxizNN+SGaDnw==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr35555453wrn.349.1638224046508; 
 Mon, 29 Nov 2021 14:14:06 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id o1sm14974420wrn.63.2021.11.29.14.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:14:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:11:29 +0100
Message-Id: <20211129221129.2183411-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/datatables-responsive: drop
 spurious space
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
08c11e21a7c6ed16a92b9507160f020c9b7e8c54

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/datatables-responsive/datatables-responsive.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/datatables-responsive/datatables-responsive.mk b/package/datatables-responsive/datatables-responsive.mk
index bc9644701f..2809a52280 100644
--- a/package/datatables-responsive/datatables-responsive.mk
+++ b/package/datatables-responsive/datatables-responsive.mk
@@ -6,7 +6,7 @@
 
 DATATABLES_RESPONSIVE_VERSION = 2.2.3
 DATATABLES_RESPONSIVE_SITE = https://datatables.net/releases
-DATATABLES_RESPONSIVE_SOURCE =  Responsive-$(DATATABLES_RESPONSIVE_VERSION).zip
+DATATABLES_RESPONSIVE_SOURCE = Responsive-$(DATATABLES_RESPONSIVE_VERSION).zip
 DATATABLES_RESPONSIVE_LICENSE = MIT
 DATATABLES_RESPONSIVE_LICENSE_FILES = License.txt
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
