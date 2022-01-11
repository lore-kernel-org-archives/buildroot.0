Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D6AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 20:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1894E60EF9;
	Tue, 11 Jan 2022 20:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQXpBlCnz2aA; Tue, 11 Jan 2022 20:03:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83C5160ECE;
	Tue, 11 Jan 2022 20:03:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A73541BF57C
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93C1760ECE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 20:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edGiFZjjGQrZ for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 20:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E6F660EB7
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 20:03:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d19so368684wrb.0
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35MMV15Hxrw/kkZayWrmioKvLFQfY3ydX6/KgLxhMWU=;
 b=YsZ+QyzFJ8L3T5zVcIDjxUi+MrDdeKPZBSSbNueBfYdy6puHe3M6orB/cE01cvGWEb
 CxreQUtOMAd2f6Lt4xPz5KZGddA9SfF6/ZIzHbyP06/DiHKg0RMW++AJhrkJG8DmTrZm
 SWg0KacbBhxg1yxHsOToPv8No/NeNlKkBnqNW7CMscZJ55qMKX4z/aukW+J/Dx3WQgvz
 XNYfNazZ75g4Gs6/Q92CaTisU94A/5cRrRtMDV1UdWOz/SDYH3GB2fLHaSqE/P9UGRzo
 jwiKMfTkxqeCzDr7qH4QhuBRN/uOAkqFGlznL6bQx3ZpYXjJDgdO9qsUfE024a1+Jt67
 x74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=35MMV15Hxrw/kkZayWrmioKvLFQfY3ydX6/KgLxhMWU=;
 b=KldGZCKX20O9qgNbO0PeRXoiyN3cXsbR+i+cXQjoVncxgC5oMFu5/Pei7QeeFnNcJp
 QElmtInhC7vjdndd1PNK0j6EiqB9rYlK8dgYl2vC0ABsgHHEVa2aD5/nq+QDA54qGKJu
 +iyOAtW5g22DH0dqt6rffgpKziMrVdXO9BNmmwgOnq4mBAl7FNi7uesXYoC/uux9eZDe
 DIxtV0GorzYYnpIiFVm98EsRAOGJybxwQmykBt9XtrWtdxR1PhMEKLZfBXt9EiVXrXbg
 6eR/rais5wb61UZvyTO/cCmVedZdr9iP91f0Ta4TDDUJyLH2/buJw2a216ysc3DGhbJH
 FUvA==
X-Gm-Message-State: AOAM5332J8k7Nak2L3xBWWRRR3mg8w/xRsDtKQguoPOmBh6KYByGdH4N
 v/AXgIYTeewqYVQH5eYSIKYF3+ZtuwE=
X-Google-Smtp-Source: ABdhPJz+nEVRy3+lpocrhKY6LG6DA8SJpN6owVlFp9w5ta5AAQcB0slv4VXoSDKvsXf693pBoazoug==
X-Received: by 2002:a5d:50ca:: with SMTP id f10mr5305891wrt.696.1641931383269; 
 Tue, 11 Jan 2022 12:03:03 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m39sm2906189wms.33.2022.01.11.12.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 12:03:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 20:59:48 +0100
Message-Id: <20220111195948.2565030-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinifier: fix license hash
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

license hash is wrong since the addition of the package in commit
43c580ac9f848449333ecbe4336c2c9f2ba12158:

>>> tinifier 3.4.0 Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6
ERROR: got     : 18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c

Fixes:
 - http://autobuild.buildroot.org/results/5fce7f16daca17216d786391ea0fffff856c5404

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinifier/tinifier.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinifier/tinifier.hash b/package/tinifier/tinifier.hash
index 5681ed6a55..0c35508ebc 100644
--- a/package/tinifier/tinifier.hash
+++ b/package/tinifier/tinifier.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  927e966f9d23ea7cc1942967a8fc16ef4c55c51bd096d44f54b418844a51aa12  tinifier-3.4.0.tar.gz
-sha256  791d8fd993ace44d4d83e2f4820a64d5ad3e37412f029afad46d17a9259de2b6  LICENSE
+sha256  18f524914c0df04e21289c3d9ca3e27c10abe5869cc4e4d4790a1b2c56df282c  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
