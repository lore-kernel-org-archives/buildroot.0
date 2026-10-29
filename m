Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE56606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=s32i4CkA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98AA440B21;
	Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkUynY0N6dUF; Fri, 30 Oct 2026 14:18:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD27C40536
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369909;
	b=Giis6IgCc91eu/lyIKnn2vDePqIDcYoYcrQyEY2D4W5piNl2IxsuwM5w9zPIrSqUFcTK
	 jeOUdJ+D0U04FUM6nQmtJUbUV/LftpDsxCaLhG8qKjaNAe9mUMCaG8XvF71EauMDpzffb
	 AlMRr0k39yvzB8N/83i65wN9Vfxf4fa+GfNh/4ZP5PsHEEhlEM0t34U98ubzBUej8cxud
	 +VPWdDE1yjLJY8z1cV5/ymKaP6XXVRUzaAUq1qzA8Lmob4yknmDf3xgNzPk1eTqgzg3Cr
	 GhBhSnvrrkI7oXkXaMRrb73W7RSQkN/F9FELB6L5SBpE8T+NTAdXcDcLaa4rJThWhiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369909;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=9IIjqL4ROfaQJ3c3nGKbQhwv4i567zspKZZEJxm0dlE=;
	b=tf4PSehOOVGbXtIT34Rhq/iRszH3Pfh17/ZMV+Lv1VVXGndjiykVEL1iVJ8CBqvxjRr9
	 wTSCUsitlWRJqLAObyZ+52pXCdBvpm5EItT0it7eQcxN/U+peE1PYNvok7GttIFwsJ/f2
	 BT009q7gSYzAVrFfH31D2v1dA3zwHmwO+TSUKfOzv+0UqN2ip8QGtbIQzQPwHTAE3Q6vZ
	 E3bT8OOyouT/PTWH/rxmxgFBdAbX2memMvXsTe2WzZ3tLKm4DCOBo/LR8fJI3so3QH5wP
	 t+DJUbPPBrVUEC7lf1cxB5/w1W3e+yy2A8+ImR6PprDSpS5j5p0vgwc0onf6wFuJmIQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369909;
	bh=9IIjqL4ROfaQJ3c3nGKbQhwv4i567zspKZZEJxm0dlE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s32i4CkA/pNVEGFV+KN3Vageysuw3KH5s9w1pEM5dE+O8KitYzSW14giYjmPa7Eyb
	 2+BLyoaMFcjExaWjWDvUpTaf0NtgB4qvnMZ/nNtcGj0xK0JjJDgbs8aW3z+mCDcdIy
	 /kgKtVoDX6fMto/CYRCRKq60nKRo5icK9+PsrLeZdiPy0T8xLVUlQzQ5z2HeSUGTB9
	 kgnRGOJOc8IFX3uLrW/0qs9XlHvrSqaPOulzLMBPPCR9r+eRqe71W4J4rNWBnK0hUg
	 hZ10CVD0/kxQx6pcVuVbuIM8J5wsdxSoK1DMnhx9hFc4mavYXxUKYOs2JVtKSFsu7j
	 oH1o3XXo93lWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD27C40536;
	Fri, 30 Oct 2026 14:18:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4212CD47
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 323B7812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id asye1b1d1RMb for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0F1B1812BE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=rN81MgJEepfWuyndwtsoLpXOp85/OUzB5zbJFD77R8Kv8KV3Xt6O/mYXGOxV9Zi5AcXv
 IA5dbD+oLnyg8YQWIVrTQUw0PZJycMRv08FIv/AgsQBKInYexi9rM93mT1zVs9T03SceO
 yoNmZfj7+O8A1K8xO1TsTbn0eH23y7WM/JRAJo+dQtxtgQ+o3x9ZNJIf4gU7tlKIWtvEp
 /Zvo4xB06WO22d5Pn5pz7GmpIhqNINaVc/m1uA84DNIyUW2RCp1RyZsE36vyXBpkLKUqt
 OYtl6ZyuXt0Kjjbr54mt9QszK7GVc3mtM37xj3ShFtdJIxPAxib6PjAOtmv8yFGHTTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/y+vtN357I562ls4oLgDbbhRKX7VGiNkmLXo4g0lv/4=;
 b=BXwq/TX7xT9KHk720tgqAO0hCZMW31fobv2/2+mhb4Tx/a6uU7YfWUOugmce8+h2DdbB
 KG6eZHWhxCk2tnUV4aMTiN2MU2Oi33S61WwS8ML5bam4TcGkb5iW6o5NjW3AY5JxQ3F7k
 eOfIpOVvrqw+hzuE1EDIROPfrrIwo8YNguvwTj1plxN/1nCqqpgTlnwvchHuiwWCoQvt7
 6re9e/g2eGecvmlbLOhpThCoVX3ohHzEm5pr2d0apScuLD9todTnOdL+wO+ru/5lMGnmu
 k3A67uHBoxZpeE1QHERqb4C9R57QhjWcz+NvZl7tMiW2oeRD+x0S4TQONO1XJMP4PEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F1B1812BE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E1039D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5d30c58b588b52934631638013004a8bf0612da4
X-Git-Newrev: 972cc1bf6f34da5a6aaa3d957c1a6eb0e89365d4
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.2E1039D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_image:
 disable vendoring, use direct dynamic linking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0373130569421369161=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0373130569421369161==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/972cc1bf6f34da5a6aaa3d957c1a6eb0e89365d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Be explicit about the fact that we don't want to use vendored
dependencies, and that we want to use normal dynamic linking instead
of dlopen()ing dependencies.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-5-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bc8a47c1ef07eabd14789bf11a41eee97d887466)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_image/sdl3_image.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/sdl3_image/sdl3_image.mk b/package/sdl3_image/sdl3_image.mk
index 43127c463c..8f0718abbf 100644
--- a/package/sdl3_image/sdl3_image.mk
+++ b/package/sdl3_image/sdl3_image.mk
@@ -12,6 +12,12 @@ SDL3_IMAGE_LICENSE_FILES = LICENSE.txt
 SDL3_IMAGE_INSTALL_STAGING = YES
 SDL3_IMAGE_DEPENDENCIES = sdl3
 
+# Do not use vendored dependencies
+# Request dynamic linking to dependencies instead of dlopen()
+SDL3_IMAGE_CONF_OPTS = \
+	-DSDLIMAGE_VENDORED=OFF \
+	-DSDLIMAGE_DEPS_SHARED=OFF
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 SDL3_IMAGE_DEPENDENCIES += libpng
 SDL3_IMAGE_CONF_OPTS += -DSDLIMAGE_PNG=ON

--===============0373130569421369161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0373130569421369161==--
