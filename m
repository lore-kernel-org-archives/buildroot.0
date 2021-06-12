Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4F5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:31:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D970D604AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D970D604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5CAE4046D;
	Tue,  3 Aug 2021 21:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ilI_smqaWe1D; Tue,  3 Aug 2021 21:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9DD40282;
	Tue,  3 Aug 2021 21:31:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2394E1BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C012C83993
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Q3moSzf-Aj7 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1883E835C9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6338F85F62; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 14:12:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 35aded3c8bd0bd9af148b68d6ee230beb62da32e
X-Git-Newrev: ca86f8f35100fefbb1fbcb461f9dcab7d44764df
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.6338F85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netatalk: requires
 CAST and DES support in openssl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ca86f8f35100fefbb1fbcb461f9dcab7d44764df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable CAST and DES in openssl to fix build failures raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/b7347e3e4b828901dcb954f7cc37b712b80ac49b
 - http://autobuild.buildroot.org/results/453c10ff24ef48f1340ec91412e504fe604033cf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - move the 'select' of the options closer to the 'select' on openssl
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netatalk/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
index 1560a18747..225d5891c7 100644
--- a/package/netatalk/Config.in
+++ b/package/netatalk/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_NETATALK
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_BERKELEYDB
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGPG_ERROR
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
