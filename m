Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9494C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 09:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6966383103;
	Sat,  4 Dec 2021 09:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 35_YkvQ16qJ6; Sat,  4 Dec 2021 09:04:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C21F283065;
	Sat,  4 Dec 2021 09:04:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 906101BF5DC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8CA0940683
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 09:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w7I0UdTkmuGe for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 09:04:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EB8740647
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 09:04:37 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u17so3598531wrt.3
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RvMydenkx/LXqfQCCFKwuz9jeOE0rszfEo286ZubPGQ=;
 b=EQnoD99VqJSmql7yFeSBEzptEhPsdnYfvohzljHVWqz4r1QnrEEeDDPVq5/rTL9FpL
 2M7H9z0h8pE2cXBxcsfQKd9UQD4ntm1c7aTfxbLC9qclEEkAAtR/N70TZaNocVmqFC9Q
 fAHlaNZ4FmFH7WDAPMRhlvNPT/JVrCa8WSFzOhJO+5odKuo4w/cAPfrlUS516grPIsd8
 dIKbyCxYdHbB23kBOonXxSzm9EMFOy+p7oqdJt0wznrQ/rXdmf0nERWxnxi2WPyOIRyU
 e21duOgNpk3qbPKWWIr+TYtHwkCZ6Yl227x4BXHQQKxqU1jx2tm2MdbjER1RdIm2oL2f
 4NOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RvMydenkx/LXqfQCCFKwuz9jeOE0rszfEo286ZubPGQ=;
 b=zYV9KaKWws2HicAOHZze6VuKLECXxeyqbxSTDH1jOKHeLKfY4aqVg5vysRigrttyQj
 AcRekXqZ/Nsm+JPnbHYgFcH+1MAbeSF7gOHy4E2X0TQwE64YEpPtp8BeM7TLuk6mQ+gV
 SaIrmEGp2yW05EHu44yIPcObaIzGtFnI8U4qBdUwY0TUthT1pBV1dVK1Ev4q9fKzhfnM
 xQ6fwqhww6O44b1jZ7EyMPUgDLBr95IgkMI7hlGL7SaFRPJnTtT//37yG2IBETeZbe19
 rrW7VgL9RR8HGoLkqBKwR3lBHOnzrwDYtTIzCJYHDPi7TRVGxPGltNXthnl25v/8Q39m
 nQ2A==
X-Gm-Message-State: AOAM531mmrqkI3pvRoOGt+onxf0QINsdpq6sgkebxg/MivR4/oqJStzC
 CpKMV6LuE1NOOwAzjcAlhLixhbN4jyIGlw==
X-Google-Smtp-Source: ABdhPJwl6RPrrAdxXS+zCLrUgVb5Wp8XNGH9Jbk38icu+2Io3EIco5MyUwWDB3HNqk693+nWTFOTAQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr28381746wrw.138.1638608675509; 
 Sat, 04 Dec 2021 01:04:35 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id bd18sm5074768wmb.43.2021.12.04.01.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 01:04:35 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 10:04:35 +0100
Message-Id: <20211204090435.2015771-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnspr: add CPE variables
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:mozilla:netscape_portable_runtime is a valid CPE identifier
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Amozilla%3Anetscape_portable_runtime

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnspr/libnspr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 58a3338c60..8f16a8076f 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -12,6 +12,8 @@ LIBNSPR_INSTALL_STAGING = YES
 LIBNSPR_CONFIG_SCRIPTS = nspr-config
 LIBNSPR_LICENSE = MPL-2.0
 LIBNSPR_LICENSE_FILES = nspr/LICENSE
+LIBNSPR_CPE_ID_VENDOR = mozilla
+LIBNSPR_CPE_ID_PRODUCT = netscape_portable_runtime
 
 # Set the host CFLAGS and LDFLAGS so NSPR does not guess wrongly
 LIBNSPR_CONF_ENV = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
