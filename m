Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8880BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CBE640ADF;
	Wed, 16 Mar 2022 21:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXTkjBQ3xvTf; Wed, 16 Mar 2022 21:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1987340AE6;
	Wed, 16 Mar 2022 21:38:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 333191BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EEE84171C
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_xVP208uwtY for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBEE641722
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647466577;
 bh=JTSB5v+AuohFudMMtu3hRmU84Hv5o8xHxRAath7UU/s=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=k4CzieG4cQhDFDlEF2T/RprDKaffZLRK72hNe4Y3sUwQgpifny+UGlqixn6l59F5G
 Ks3IXQ+Iuzr/35Wj7AeRNUIbbVX8ULuif+L4f1jMc5VDyO+loWZgnbxZkJMVpssDkT
 Ya6jqEDw8KKBBU6QaIMar832sk7+ao/d5a/By6kc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M26rD-1nX4I53YN7-002Vb9 for <buildroot@buildroot.org>; Wed, 16 Mar 2022
 22:36:16 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:36:12 +0100
Message-Id: <20220316213614.16878-11-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316213614.16878-1-ps.report@gmx.net>
References: <20220316213614.16878-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:KCuj6FUGqTypMb6cPAVibLn2rC35LCwwftJmsLGOEIB05fb2e82
 /FuMe3YZYG9P6MvMHeZ7zsbtZ36VDNX/Jpo6IHzGmntggSFOnE5KQPMIYIoMKq4x0TGhIiR
 5FDAsTFonAUclpBc8xBZrm8K+mcLZfdbxI7YHk7p2oWLo9b+QlmF8T9KQQgmkvL5s/wuXTI
 WQpNGrL22XCVE33leiOQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1dexpO/Svgo=:eNoWEkBFmhszxcr5UlafCT
 Gab2vkM5CZrS44aG6nIf4l64i4ycZlrSe07+Ncq1ICDF6hVttt6//DwaUooBqAeCcTIMJ335O
 kpGMFdVhxRZMOcxsy3CmDo2jYWqtIjMc6Y9ouI0c/qpFFKSN/V3YjFAF00D3cTyozvKSi5pKZ
 /W2ze+sNE422HVOuQty3wZIGvryeJkeuUi+xJcC3mFQv0TBIax5jP3j2qfchJuL+IZ+lY5HNy
 0NPTzMo8Zqn4YyFdtPajtJLKW9JXhxgkUazOB9RsIASCW9NRTH3+Jje+Z5XoQAL1qq7Z/M4U8
 lNIV6bIasdtvusr12RN6uBvRkfe2KYQbrSWn7rhCrw5PdReyX22Q6zEwld/tJEuwZIlI6Iq4o
 u0JgCNB5BbuH2jFnOirldtFOjYERfh/NTfoRA5AFheXpiQF55Z6Or8fJDgTw9nPTnZZ/XFYAb
 nG9HtF8285FeqTIcrKhiv6mC10qc3qGmQnz8DWkUjqq+btMa/zn+m6/onMu47jRvaTKQc8YqI
 nFHUYf7HEjfC0FYRDOYfTwv0a6+x9hRo3eXFxtisJ3NdNEQ5uO/vqVNguF9rriQQqdIFbWVR4
 lfN9OMUuWUnrfKld7JNfFCPsT7JJOwSB085fo9EFkbH/1p7VLD+nfy/pQwxlndWbA/5hTd/j2
 hLxzg3/VY2RJGIvhEchMPRi5A7sG95Dh2z2RbhSRtG8cNSCWXnmAk3L2BETkD0gwmV+VNIWTd
 jEGSIec61cymFgE+4YMP/Pa7/CFA6UaURr4qn2dLL1bu+AwkamE3SGTF9/Ruqr7jBwmhFZUWK
 vzCaUTsXP6ThYWG5SaXGxvu0IbOlJTN+N4nUFkfy4JPK3FkjQffwc5IlLumZXdeiEEYzNYwt6
 s14q8hXAkk4QoBKgW82TTEP9vI44J5kQbaH4rF57MDL8IxDUFmUheZbmbFtkd0o8U8j4q+It9
 XCf4mOpvfSZiS2PQHzVaBfXI6E1CrqAROAfLHFYvk7CxBrtN4LYOA9Jvct+w+LIhBn85rCTU/
 HsiwHC+V155rKkbMkowcE8NaYOmn6iCpZVDnpV1lPeNbzUog/2XCQTpOMMt59NKczQI2qQHcY
 7nJ7LVx9M7paJo=
Subject: [Buildroot] [PATCH v1 10/12] package/gstreamer1-editing-services:
 bump version to 1.20.1
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../gstreamer1-editing-services.hash                          | 4 ++--
 .../gstreamer1-editing-services.mk                            | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 9662e6b8fb..5d77a9bb72 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.0.tar.xz.sha256sum
-sha256  f837adcf4073d19a5908984e879cd039f4192ca368e71d39e8ccd8a56b9feedf  gst-editing-services-1.20.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.1.tar.xz.sha256sum
+sha256  6ace1b21b58e0110b7dadd469f79b77e2f47d6207604231492531ae9fd4148df  gst-editing-services-1.20.1.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 5e03c08ae7..dbdf2abca0 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.0
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.1
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
