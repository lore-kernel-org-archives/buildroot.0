Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED82DC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 21:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BC040846;
	Mon, 17 Mar 2025 21:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJO89yltSFuP; Mon, 17 Mar 2025 21:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4927D40BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4927D40BA9;
	Mon, 17 Mar 2025 21:06:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2585ED5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07BD281314
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:06:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFQI7L52l5Bn for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 21:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D78E811BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D78E811BA
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D78E811BA
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:06:04 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3d43bb5727fso13943725ab.1
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 14:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742245564; x=1742850364;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/sTHlCCSTnoL09kkuw4czmJsoq7iru/+XD9Ip9O+9+M=;
 b=k8ioCAZoWyk0dB0Ei0G1a2hy6IoLtYCilZYTUwQdbUf99E9wxxms/qtpj6FdVguc4b
 cQyHSARYF9frcGEH1C3X4SKN0TS9Lmdi8KCVulE2HD98VS4V/DHhUEvRuhwamZ651P8/
 JD80+LpX87QOb+PSiikA/pEPAWODd4KjdSfFJ0KmCSpyZtjNvd1LTGweGLyEfZ+jeEv8
 45p2VUBMAbw1Nd1P0PblWFnOM0QsORJMkIvDeHCiyk5lYzdR7UgP5silqhMwDPPHW7rD
 4K8OlBwKX+ohJzXCh3oKFa9T0AkeyYEZq+o7XrdAPvUKxFmMzcmiHK29P1vVkOfgmxKe
 JATw==
X-Gm-Message-State: AOJu0YwCwrOw97E7K4zsz98KeUYpzIAvi4rNNrHZXgXxMQSjLZKZpnBP
 XQcxUhJaz+1QqqODr9zXM+nZ3vwpuyCisf4hdpocA+PSuaRjum0t9qul9Q==
X-Gm-Gg: ASbGncu7PN8BNUxCQyb+XiXc6w1YgOuZdniuCyD2uPM6NuvxttqAB5IGthfqbW2cDAy
 LLElFUnxr0vKB2V5Slq7PrCzGGQdgbFGfz5UbxqY31g4FGoVLKmzPinJQ6iOhY/pa3f7RCPT8h1
 Qgk6162bYy71C/vtKc2dojALckMF4t6nlDcyWKVPFRR7j0bNPoi3wZDZgK0WHGkXFYuSynwnutL
 xuMwuVmJRuOKTN9+Q9CSBBInTpzfm0t1xY+trMnrmOp94A2NqZhIEQnCiaWSPm7jllKJBCqYaxG
 kelRJq6OgoOpzZ5UgHST/TxSvpHdq8Lz6DD1NcFyC3WxXPJy+92KYemr2o5L2wcM2g8K54iqsQO
 +4DShwnPpPxR0Lfj2J0bm
X-Google-Smtp-Source: AGHT+IFfYJlwwVfWccU5yrzYKHf//Z/P09dgfqwcO0lxn8KHURK1/HwtL9uKStCpJGeo3AUqw/YWNw==
X-Received: by 2002:a92:c246:0:b0:3d0:443d:a5c3 with SMTP id
 e9e14a558f8ab-3d57b9b06f4mr15015985ab.3.1742245563685; 
 Mon, 17 Mar 2025 14:06:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a83c72fsm29111755ab.70.2025.03.17.14.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 14:06:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 15:06:00 -0600
Message-Id: <20250317210600.3003465-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742245564; x=1742850364; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/sTHlCCSTnoL09kkuw4czmJsoq7iru/+XD9Ip9O+9+M=;
 b=iZhRNY0R5YOw/Xh4YymLRbE8vVlJfN9Ta8XDsp0kjyOPuq0ATi5kU5awSMsszD4Oi/
 8lnTrRxEfq9TxPEKRqVFHSDPTG1/L5Qh+f6GIJ9n3MG2c3QcOIVJrISp1nQSZvvrEOcb
 FxoYI2GPjL6bhbj8VuFI+mFDBtGJz5QNb0XBeEhPcoKMXN+7yAPNs6Tyv/DDQxXj7wUE
 9remQ8wIvJOhD2BofI2flsXGotGpUtFJeN8Au5Wu5wjc8sFmRvpRW98LQiduvcFqjVKs
 5XLCQR215npo/wG+L55thjwWb6s3QGsgO5nWMQhC/6TUoea9VyYIAO+pqALrjSeOetNC
 KTKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iZhRNY0R
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version 0.8.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index 87df73d3c7..a2503f899e 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  d4062a911161435a3d21736b51340b0e  aerich-0.8.1.tar.gz
-sha256  1e95b1c04dfc0c634dd43b0123933038c820140e17a4b27885a63b7461eb0632  aerich-0.8.1.tar.gz
+md5  11cc31e2513118e66fc37c833cdeaac8  aerich-0.8.2.tar.gz
+sha256  0ed2b15bb017785d17323329e5448b4b12fcfec08a20932626c12aa59a8378d6  aerich-0.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index bb568d642f..8b54de755a 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.8.1
+PYTHON_AERICH_VERSION = 0.8.2
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/4f/41/3c478b7a344abda866f2c644b056ebae638499bbe0eec0010e7361211774
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/dc/d1/701a44d8f7fdccf700400ce16a26c679b3f4e36de9fb86c3d9f55f64b07f
 PYTHON_AERICH_SETUP_TYPE = poetry
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
