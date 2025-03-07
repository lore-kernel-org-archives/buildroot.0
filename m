Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B7FC28B24
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 19:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8A880E44;
	Fri,  7 Mar 2025 19:05:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lm0Vb7_zocbU; Fri,  7 Mar 2025 19:05:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE9D8132F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BE9D8132F;
	Fri,  7 Mar 2025 19:05:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 561A0944
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6E240660
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kr10fMYtm_NQ for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 19:05:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4982C4063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4982C4063B
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4982C4063B
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 19:05:13 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Z8bDg00DGz4SN;
 Fri,  7 Mar 2025 19:59:15 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4Z8bDf3HzwzM7c; Fri,  7 Mar 2025 19:59:14 +0100 (CET)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Fri, 07 Mar 2025 19:58:42 +0100
Message-Id: <20250307-setserial-fix-v1-0-c37c1e7e8234@cherry.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOJBy2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwNz3eLUEpCWxBzdtMwKXcMUSwMLI3NzczPzRCWgnoKiVKAw2Lzo2Np
 aAB0KjsBfAAAA
X-Change-ID: 20250307-setserial-fix-1d908277767a
To: buildroot@buildroot.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Peter Korsgaard <jacmet@sunsite.dk>, 
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH 0/4] package/setserial: patch with _PATCH
 content and fix build on newer toolchains
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patching logic is broken for a while (only 13 years :) ) since
commit 64ac7199525f ("apply-patches.sh: add recursivity when scanning
patchdir") where support for patch files whose file extension is .dpatch
got dropped, therefore the patch were simply and silently not applied
anymore.

This series fixes that but is a bit more complex because we have patches
inside Buildroot tree that conflict with the patches we get from the
package's upstream.

Finally, setserial currently doesn't build on the Aarch64 external
toolchain, so this fixes that by running ./configure (via _AUTORECONF =
YES) to fix a configure-time compiler warning that fails the compiler
check in the configure step, and also update to latest version available
in Debian tree which includes necessary patches to fix other warnings
returned by the compiler.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (4):
      package/setserial: apply patches from setserial_2.17-45.3.diff.gz
      package/setserial: autoreconfigure for compatibility with newer toolchains
      package/setserial: update to 2.17-57 for compatibility with newer toolchains
      package/setserial: simplify patching

 package/setserial/0001-build-system-fix.patch      | 33 +++++++++++++++++++---
 .../setserial/0002-tiocghayesesp-build-fix.patch   |  7 +++--
 package/setserial/setserial.hash                   |  4 +--
 package/setserial/setserial.mk                     | 23 +++++++++++----
 4 files changed, 53 insertions(+), 14 deletions(-)
---
base-commit: 17134726213a2188946a07b73ff2e2d0363ad636
change-id: 20250307-setserial-fix-1d908277767a

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
