Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C350C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B948585163;
	Thu,  2 Nov 2023 16:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B948585163
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YguL9-WDRGcJ; Thu,  2 Nov 2023 16:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F371685166;
	Thu,  2 Nov 2023 16:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F371685166
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F92A1BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9DDC705B0
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9DDC705B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8f6MW7Kz1ki for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:31 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF1117064D
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF1117064D
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:31 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:30 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:29 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:27 +0100
X-IronPort-AV: E=Sophos;i="6.03,271,1694728800"; d="scan'208";a="60837520"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:20 +0100
Message-ID: <8647e9778bb35b421a4a989e0b69b6a4d18968cd.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941371; x=1730477371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0fxyZfSNye+k7aU1XHhzXFn6L6aw3Ev+4ZjKHK2VTHk=;
 b=QgBMsa1EMDQRVh+3j/2c8SfguU1N8GEm0G9Or8+wvRIpoxuBnLEnyqUa
 0/LALBP6yYgYGjfyUMb62A5x/hoqTiwoczlowUy13JWk6NpYkm1Z8SIM7
 X6p6kxOvRHYbZAkbyAfuBxNRzOYSIri5kxxtynXhCcBcsa/IOvmtRjJZO
 A9Vvas5o738G0OKVevL1/UimMW+bt3CiZYfRL/d/nLj1kwHozNAUHcyZA
 7HiL+hCuPjq2ZB3XMGm5u+GPgGECC0/nWsFcCW2bggUsuGwTJqM7znhLO
 C0zLtV6wOoTsk2v5hEyDZI5PenUAcWsaVBkjMo2GM5r0sCT/lwlGC7zHE
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=QgBMsa1E
Subject: [Buildroot] [PATCH 1/8] package/pkg-cargo: don't expand license
 info when empty
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
Cc: yann.morin@orange.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The cargo infrastructure automatically expands the list of licenses with
a little blurb that the licenses for vendored dependencies might be
missing in the list.

However, when a package does not define a license, the resulting text is
sub-optimal, resulting in a manifest that contains (with a leading
comma, yes):

    , vendored dependencies licenses probably not listed

In that case, pointing out some unkown licensing terms may be part of
unkonwn licensing terms is superfluous.

Instead, just let the legal infra do its job, and report an "unkown"
license altogether.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/pkg-cargo.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 264bf5a1ae..7802c3a883 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -96,8 +96,12 @@ $(2)_DL_ENV += BR_CARGO_MANIFEST_PATH=$$($(2)_SUBDIR)/Cargo.toml
 endif
 
 # Due to vendoring, it is pretty likely that not all licenses are
-# listed in <pkg>_LICENSE.
+# listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
+# so adding unknowns to some unknown is still some other unkown,
+# so don't append the blurb in that case.
+ifneq ($$($(2)_LICENSE),)
 $(2)_LICENSE += , vendored dependencies licenses probably not listed
+endif
 
 # Note: in all the steps below, we "cd" into the build directory to
 # execute the "cargo" tool instead of passing $(@D)/Cargo.toml as the
-- 
2.34.1

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
