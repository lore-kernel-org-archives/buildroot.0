Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C493CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D0C61175;
	Fri, 29 May 2026 08:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBZ4n4chv3jG; Fri, 29 May 2026 08:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4638360B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780045085;
	bh=HLwedCzahIV71+4W99rL6kTJ6c/S83zyqxjqa/kHecA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hmZT9zRvoFrVmj/fI+F2fuRnTDqB4x8Wj+GfQJEunBFOTKT01D8W9z0h3ZTCM90T+
	 r41sVktwVw+sG3if3inqZHzeyFWRXhgORwui+pnZ1D8pJhI6rF0z3hGM2ucROifIvl
	 PcbvASopYGPS4IZTvJjMoRCyW/dpuus6cZznr/58QVDgxzWyhm+Ia8w1MQWMp9smoI
	 h7bq6rfw1kozvJlnaiqyJZDN2aeKyBzhmiWCQY6LBOgbkVLZJmuj8JQlE7T/KwB+f7
	 RSRG3uW+o+lyu840C5EswkrWE0uKtieSXrhPsZ8GaujhvfMON/e/i2NdFubLnYOsp6
	 jRaT10IisHLiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4638360B25;
	Fri, 29 May 2026 08:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BD9B28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B8BA60B21
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI7Mrodpy6nX for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:58:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD4E605FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD4E605FA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:58:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA784873AE; Fri, 29 May 2026 08:57:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:44:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6add6e3cd87f2ac5c24a558427b8f4aaac6d34a5
X-Git-Newrev: f773bb8bc0048d877b637eecbc31a2a891c5b996
X-Patchwork-Hint: ignore
Message-Id: <20260529085750.CA784873AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opendoas: add SUID bit to
 installed binary
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f773bb8bc0048d877b637eecbc31a2a891c5b996
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
[Marcus: slightly reword commit title to mention SUID bit]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/opendoas/opendoas.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/opendoas/opendoas.mk b/package/opendoas/opendoas.mk
index 06626508f4..4f36d20ca9 100644
--- a/package/opendoas/opendoas.mk
+++ b/package/opendoas/opendoas.mk
@@ -50,10 +50,14 @@ define OPENDOAS_BUILD_CMDS
 endef
 
 define OPENDOAS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
+	$(INSTALL) -D $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 	$(OPENDOAS_INSTALL_PAM_CONF)
 endef
 
+define OPENDOAS_PERMISSIONS
+	/usr/bin/doas f 4755 0 0 - - - - -
+endef
+
 # NOTE: Even though this package has a "configure" script, it is not
 # generated using autotools, so we have to use the generic package
 # infrastructure.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
