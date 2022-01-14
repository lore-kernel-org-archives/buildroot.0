Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB50C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 22:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FB69401E1;
	Fri, 14 Jan 2022 22:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwm6WKUjLVB4; Fri, 14 Jan 2022 22:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7785C40118;
	Fri, 14 Jan 2022 22:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3CBE1BF59C
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE40240118
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 22:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xNmHdFpDLJk for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 22:12:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F7FB40103
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 22:12:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id l4so8626449wmq.3
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnCuqBXfKGn3yif6B9dwuvyYyqXFDMH03bgHJ9O/xH8=;
 b=QRp9vD8pVNW6x/vMk+S0ps019cZxl88IG0ID54ZE7pGTeAjm/N5RqZHggFAOvG+N+K
 vCCUX4h7Rgf+/6iJDhB8w82ZAqHa1PF4B6IWpbbK+Ez9TlzxegFSP+s/AXKri7m3V5ef
 uOyUqS9+RtY5fuZdmTPfIOtmrgF2Fc4bGn1fq/TZ6NBrCASIn3OhZkoY3q83NIlUpooF
 4/lJi8FTMw1FFliEphVk8JuO9bkLLYOEZz8Xv2OFC5e4HbjrQcnuM5EwceUJu6NDn0aO
 TflrVDkMVh1QSxHeyOqHYrJEKmx6ismxViGbiJhy9ARhmwo4vsJdpSkkf58/8RIbF+54
 6YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nnCuqBXfKGn3yif6B9dwuvyYyqXFDMH03bgHJ9O/xH8=;
 b=H8jTlLzFcvJkkK0/wV0fFOyDDDCYMRs/xT9zkJkHJPTiV3nki7Y9oDmKK26FchA9EC
 0dHlPwcDZoGtZ58V/A1nMqsltFACfNc4A6FTlH6YsYKv6bXd1MJcvey0KvAq471cjvqw
 J6wTDy52aJ8Xp1CBDNUkknAtSQv/YG/L7Zt3sGqsQagqfjfj3LSRQoHAWAurqFFkIAxx
 yCCGtB05mNGYS553sQAOHpoUN8QBhzEYsxOpFp15asvOdSlRTlB4QTlPIAoiTcvsWyEF
 JlSyIHStfdN4mhqtHtDKneGOv87x420+15CE830H5XKZ5Fqk8PQZbE0q2wSOqN+Yd71/
 V2pg==
X-Gm-Message-State: AOAM531gfolWygJKLKbmp4jw6U6PR0CjAMVqg38iT/uMYifkk9DH7Dum
 fSo9WD+Pw0r1UF+LrWC0Wv7ZbyNlnS8=
X-Google-Smtp-Source: ABdhPJxexW9s0lYBBP8FVL9QeQ9uJjw55JaqSINHrGgDJcX2uuuxw/6c/8WGceVDG3lLvG4zHuhpYg==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr7672961wmj.76.1642198334521; 
 Fri, 14 Jan 2022 14:12:14 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id q206sm6947240wme.8.2022.01.14.14.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 14:12:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 23:09:54 +0100
Message-Id: <20220114220954.1179812-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/open62541: add
 OPEN62541_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:open62541:open62541 is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopen62541%3Aopen62541

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/open62541/open62541.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 66777ce501..fb28a614e2 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -11,6 +11,7 @@ OPEN62541_GIT_SUBMODULES = YES
 OPEN62541_INSTALL_STAGING = YES
 OPEN62541_LICENSE = MPL-2.0
 OPEN62541_LICENSE_FILES = LICENSE
+OPEN62541_CPE_ID_VENDOR = open62541
 
 # Force Release build to remove -Werror.
 # Don't use git describe to get the version number.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
