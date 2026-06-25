Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBD5CDB479
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FBDA82A53;
	Thu, 25 Jun 2026 15:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dzccQGOQTZh; Thu, 25 Jun 2026 15:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F5182D17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782401886;
	bh=AfGQut58xx05BvFG7FO+mdwILHfU+tlFDAFf30BqHX8=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=GWl5MNMpZgq2lEHtYqp7uQ/pqNdVQkSoqp7JbMChG1uxs2qBMQbI15UnhSZuQWt6w
	 2L3t/Xcxvm3JuI9mHBDuLRs9q5b6I4ksVdFHKVJMXTkauAYDlG11lVzAeDlHXCaymI
	 H7erGgMWulrMwzNfj3wwatuYU8JUZH2MgwLFfDq5aHbhXKt1Y1FHs4NSGtkBDzSWN/
	 hupOWT2VzFjWXK8VFw1CSOmwRfMnsBV9UPy2aBiA3Hz2ItvPyx7IMxAb8sa+HRugeX
	 h6r9w67aCKEb/a2un/iY14aRbjFl9tdiBMAMrYr7DDrQ5kGtsivZs/g9rW2V3O34DY
	 5R6J1B2GZd5tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61F5182D17;
	Thu, 25 Jun 2026 15:38:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17756254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1CC9408BE
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ucsnm5dE5NiB for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:38:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.13;
 helo=smtp-190d.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 693114025E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 693114025E
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [185.125.25.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 693114025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:38:01 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmNHC09cXzNlW;
 Thu, 25 Jun 2026 17:37:59 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4gmNH96cjWzV89; Thu, 25 Jun 2026 17:37:56 +0200 (CEST)
Date: Thu, 25 Jun 2026 17:37:43 +0200
Message-Id: <20260625-tf-cpe-update-v1-0-b315a596d23b@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOwqFMBBG4a3I1A7EgA/cilho8qtjoSGJlwvi3
 o1afsU5JwV4QaA2O8njJ0H2LaHIMzLLsM1gscmkla5UpUuOExsHPpwdIrhWDQyUrm1RUmqcxyT
 /99f1n8MxrjDxmdB13cvsCf1xAAAA
X-Change-ID: 20260625-tf-cpe-update-708ece027d15
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1782401878;
 bh=XRnEe1/RpMHQl/ee0BbhZiAQWWwEpLYs8liYl9+8VvA=;
 h=From:Subject:Date:To:Cc:From;
 b=my/1O8OR6V/uc943iMHuakxxvKAA7TeXyhJ60lQfMJJ/zuxWTFCZuReqVQDK/uaYy
 kqiIeq0VxP2wl24oA4GxvzSPLYx7qHLl6e02ZxB2yyS6S4phNMHQXk2ApbChAAgZsm
 tK2ncFgfmZtUijDnv/xZbS1vDxt7EPpiHiTfSkRZ1gNunqeI1pApNlO+hvCDxs3HWu
 J5x3NBtEnYIkiiD/NTkGktoRMBqWT3aN138IMC4grUhWFmXiqAcQJcUJAEZhrgTK+Z
 q1L7YAFrOb+ZZzT1liVTad96oerUQgxni1YkCBLLlsTg+7jzl5pTIXBEr4Mj0PmQJF
 6KzO7+KVSS/EA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=my/1O8OR
Subject: [Buildroot] [PATCH 0/3] fix CPE for TrustedFirmware projects
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

OP-TEE OS, TF-A/ATF and mbedTLS had many different CPEs each, from
various vendors and with various different names. It seems[1]
TrustedFirmware finally did the right thing and request all CVEs to be
reported to a single CPE for each project, so this updates the CPE of
those projects to match what's in NVD now.

This is also great news for Buildroot since it means a single CPE can
now be used for those pieces of software, meaning users can finally stop
working around the CycloneDX SBOM limitation of a single CPE per
component by doing weird stuff (I'm such a user).

Similar changes were already made in Yocto[2][3] (no change made to
mbedTLS because only the CPE product part is set to mbed_tls unlike in
Buildroot.

I did not test any of this.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/49486/comment/2fd93ed7_df27998e/ before last comment from Sandrine
[2] https://git.yoctoproject.org/meta-arm/commit/?id=e2e63f20b504c31a4600f95764d3561c32b4b2f7
[3] https://git.yoctoproject.org/meta-arm/commit/?id=81f5a92193d37027670f2c9b767ccbcd29d1e78c

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      boot/arm-trusted-firmware: fix CPE
      boot/optee-os: fix CPE
      package/mbedtls: fix CPE

 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 2 +-
 boot/optee-os/optee-os.mk                         | 2 +-
 package/mbedtls/mbedtls.mk                        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 92214c922de4f789dd8f1211e85e2cc77f62e189
change-id: 20260625-tf-cpe-update-708ece027d15

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
