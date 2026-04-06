Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86D7EF4EC6
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B1B6083B;
	Mon,  6 Apr 2026 08:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRya4n3OtFeI; Mon,  6 Apr 2026 08:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCF1608BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775464575;
	bh=J39/19KjMVS0pDZkks7M/nlrGfcugFO0H0JhmDoUvY4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=owGEjh7E5sLo//9cp4Qp2TBAvpBdJnzjdXrSbg+GqeLcHdCVAMD6QhSt2T9j2kbca
	 vAt/M7uoLr/hQw6iMGSRznathcBMTP+Y7AxsYVgRLWc7bXYPV01BQPwwGNsUYaLQEQ
	 P4BzocTeiRxoNkJMtLbo0WWBZBsrRCbZBBH4mujejIQtx2d4Dr1SKimf0x6k0da6hm
	 NfE0RB6K8wm2rMIY2dsjLTBlwNTO3En0MsLlrpyFW7dw46A/2/72iYE4rFn0Ku9lUd
	 59Xav/WLAro3whQ7TxYe8EvL8WV+j2wGLPIxap33ZVBPnNpknyJalH/d7vF0ddZ0i1
	 dfKPk4DMJ9o9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCF1608BB;
	Mon,  6 Apr 2026 08:36:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0499F1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF80608BB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh3jc2yg69hm for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33E2D6083B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33E2D6083B
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:36:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B628880420; Mon,  6 Apr 2026 08:36:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:35:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03f4edcdf84149437f847fd314e42bdd2d1c39b3
X-Git-Newrev: 6c3a015a5e12f8027c926d81d506f0d63012d104
X-Patchwork-Hint: ignore
Message-Id: <20260406083613.B628880420@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: remove
 redundant pcre dependency
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c3a015a5e12f8027c926d81d506f0d63012d104
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
package with two identical code blocks dealing with the dependency to
pcre:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L161
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L218

Remove one of these code blocks.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeradius-server/freeradius-server.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 946750f1a5..9b5b3d13ea 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -215,13 +215,6 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_pwd
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-pcre
-endif
-
 ifeq ($(BR2_PACKAGE_RUBY),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
 FREERADIUS_SERVER_DEPENDENCIES += ruby
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
