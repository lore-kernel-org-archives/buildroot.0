Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A61D35163
	for <buildroot@archiver.kernel.org>; Wed,  1 Apr 2026 09:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F05F81339;
	Wed,  1 Apr 2026 09:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zNXmY0dgIKqA; Wed,  1 Apr 2026 09:27:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5898125F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775035678;
	bh=eKaOguR/CRi0Imrs6+FL+9by6c3B5WBY64LWermJmwI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NaakpcaEZTomrN4F/EZ8LTaJoAJUjcyGfenlmFnwrqSjool0bZBD6XH/ngtFQ6uZ8
	 o/4oVDI17d+CDmdT5F7EV+7yVmMz4vDVkCX3oTD8G1IGEMv1QtlDwxEGvc+OscUhZs
	 5GLJairTjgAu9xxJF754KL6btzpNfqeHSkkwJq2nXT8qK0TKNws1u+w+8yTryohfJ5
	 qxgXuPy1FvPLvZy/sy9kG+yqEq0APFAN5ML8LrawQBrdSMWbnCox7ODMMHLQaGJN5J
	 ICRhIB8H39+wEsETht16vxbNm3sTjEV93nhqpYTGyUhVlDeR/5Qspc9xeCnYZqZp99
	 53rkiNy8QUCKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F5898125F;
	Wed,  1 Apr 2026 09:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 75994E4
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A10661037
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JD5782TjwWic for <buildroot@buildroot.org>;
 Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A776102C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A776102C
 for <buildroot@buildroot.org>; Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3424B7FEC3; Wed,  1 Apr 2026 09:27:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Apr 2026 11:24:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20080af519f9712687d2ccfe81c7e3c4929d800f
X-Git-Newrev: 5f51f58eed2bfc01ddd78d9ce95a91b3e3a404ff
X-Patchwork-Hint: ignore
Message-Id: <20260401092755.3424B7FEC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: disable building the
 crtl-shell for host variant
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8304585555081608236=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8304585555081608236==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5f51f58eed2bfc01ddd78d9ce95a91b3e3a404ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ctrl-shell, in mosquitto_ctrl, optionally uses a line-editing
library, either libedit or readline. There is a single option (in
mosquitto) that drives whether to build all the apps or none, but
for the host variant, we're only interested in mosquitto_passwd,
not mosquitto_ctrl (nor the others either).

Explicitly disable the ctrl-shell, to avoid build failures when the
host has a mixed installation of readline or libedit that is not
compatible with ours.

Fixes:
    https://autobuild.buildroot.org/results/856/856352ddd690dc8b2314d46a6a837d74c237d69f

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mosquitto/mosquitto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 06de7fc2af..6d68fa4773 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -158,6 +158,7 @@ HOST_MOSQUITTO_CONF_OPTS = \
 	-DWITH_PLUGINS=OFF \
 	-DWITH_TESTS=OFF \
 	-DWITH_APPS=ON \
+	-DWITH_CTRL_SHELL=OFF \
 	-DWITH_TLS=ON
 
 # Manually install just the one tool we need

--===============8304585555081608236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8304585555081608236==--
