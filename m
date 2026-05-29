Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA68BCD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B60842E4;
	Fri, 29 May 2026 13:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECsS_iuvx8Dc; Fri, 29 May 2026 13:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F389842EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780062253;
	bh=3gYUe/jBXdQnfOFYZJypojvnroroGnkQr5SpSEq77Kc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=plyilq053FKVWK/O1ymkEFdOfTTZQHfNVVmzutmOlSXcb39zKUmNpaFSnOhvX3TiU
	 QgVIuLhsyKXid6u8SX71R8Qd9Txbx0H195CCRxyrViFA/OZ6zYzW4uJ4IroJgpAjXq
	 Yd32hN69dgs13YscaCEF3XWumXQsOYzgAoF9qwJDVut5bt0fqru+5UL0XScu2XVizd
	 ruOh2O5LSo25NI5veuy7F7tUA17wE+Kfl8swwTuxbQgWrRfEHpQz/eS/28aaDjOYvn
	 sG1OdbKb4Ee0madL56ZogqBAozHv90XBo5dcK5uQ990XPiUt7rY7hEp13U6QP3fqTO
	 QNguLVJXyZ6Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F389842EF;
	Fri, 29 May 2026 13:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 154A0F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8EB98427F
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9ge4sP2v2Ty for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7862184284
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7862184284
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E2E57815A7; Fri, 29 May 2026 13:43:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:37:02 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a85ec5435c79490596e5048afc796b59d906c110
X-Git-Newrev: 5726264e197691951b35dd017c484858126d536b
X-Patchwork-Hint: ignore
Message-Id: <20260529134346.E2E57815A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mesa3d: add optional
 dependency to libudev
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5726264e197691951b35dd017c484858126d536b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/mesa3d/mesa3d.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f46c50e878..d3874766d0 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -277,6 +277,10 @@ else
 MESA3D_CONF_OPTS += -Dvalgrind=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+MESA3D_DEPENDENCIES += libudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 MESA3D_CONF_OPTS += -Dlibunwind=enabled
 MESA3D_DEPENDENCIES += libunwind
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
