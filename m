Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F352C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:26:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA20461029
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA20461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98798404F7;
	Tue,  3 Aug 2021 22:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9al96kI2Osoh; Tue,  3 Aug 2021 22:26:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E3E140533;
	Tue,  3 Aug 2021 22:26:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBCF1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEC1B60838
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qAWT3_kOVp3M for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34F39608EB
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7FADE86A84; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 09:52:00 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 46273a8eb92171b3c70a6b2750549329a0d4ccba
X-Git-Newrev: 948e71689a0dc900ad2afa026e9e80e78086c157
X-Patchwork-Hint: ignore
Message-Id: <20210803211006.7FADE86A84@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dovecot: ignore
 CVE-2016-4983
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

commit: https://git.buildroot.net/buildroot/commit/?id=948e71689a0dc900ad2afa026e9e80e78086c157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm,
which is part of the Red Hat packaging and not part of upstream dovecot

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dovecot/dovecot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 93d04fc8a1..cb1cc990a1 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -18,6 +18,10 @@ DOVECOT_DEPENDENCIES = \
 # add host-gettext for AM_ICONV macro
 DOVECOT_DEPENDENCIES += host-gettext
 
+# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
+# is part of the Red Hat packaging and not part of upstream dovecot
+DOVECOT_IGNORE_CVES += CVE-2016-4983
+
 DOVECOT_CONF_ENV = \
 	RPCGEN=__disable_RPCGEN_rquota \
 	i_cv_epoll_works=yes \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
