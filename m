Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4E3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA53403A7;
	Wed,  9 Feb 2022 20:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z0xHvfKMhcmK; Wed,  9 Feb 2022 20:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35EB4401A1;
	Wed,  9 Feb 2022 20:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1BB31BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACFFD401A1
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqKyIYf3VYCO for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:14:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 922D540150
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:14:19 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso165094wmi.0
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfCveOaoyB1/b9LNiy6vgWgQcrFadQoQgotM17skHjk=;
 b=VirPoOaRuUyYYZJ9Q0KOFTRsul9Alhu3TIxKYIyvDZ5Mq1W897jqEvdB+W16GqgB11
 HyNPvtkHGN280NrfHXcid3FfVtl2zJjren+QwX8HISmfqOykuP+R+Ub+YR5VAjbRpRXo
 ALm1ZyLomxvnHrTq+fkt1xNGAUAhalGmpbk2XiaSBsAU5GKjy73x6ESibC+gfGnvdf5p
 qmK/uLogQMQBokaYe7wbnLCRTmKlDt27wEu/mGx8b0PiJwxk1ppSpEIoXPKKhD2sSkc8
 fdzPxhoTou8SOpVEoQ0VzaS0tPE7aj7yikHlGfIQkLTo1IuCkQDS0DEktB7mozpYk3Lc
 mmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CfCveOaoyB1/b9LNiy6vgWgQcrFadQoQgotM17skHjk=;
 b=DmB/2a5qRC0tA3jXTuyQgdS7r3UiNZzqHoLQYRbNpc0SJpmEJXUxkwCcbuE8IQUhFF
 Iw+93j/ZqjPPLaBFt5CzzpSO356kImfhtkaL3DYTYdAful9MLn84tAsaanWUcRwQh4wP
 /ye1tPTyZh5nttNMZBnUmMCiMylVK2A9yEn92xcZu6FwBfB6AphHLDy+QnWASeRmEF4d
 1J/Op1+KSeYIVQU1FTbgQp4qe+RHNE2EOduJ22kU9Ihss83/CuEeziR+fFrn2vLK8vjU
 0maCEa7qr3GkkYsBxHbBqzCTKAsEvZE2XqtKZXVq9YmEzxISoe2SxRkwjN0lY4F9m7Ui
 CnrQ==
X-Gm-Message-State: AOAM530WtRjlj+p/KZBmZ+N/+0aJ32XNeOEuJBLwWDoq+JY5AogKIM9f
 RV1MVuRKxiEdB05Tds5DoixmIl7GZfQ=
X-Google-Smtp-Source: ABdhPJyvPUs2r5PJ2mU6b/FNd6qj7QEsa7VbzOFVOe8QO4G2ExTYxO+vCSopdMPNcgDpVIkOCHCCog==
X-Received: by 2002:a1c:7712:: with SMTP id t18mr4065059wmi.145.1644437657581; 
 Wed, 09 Feb 2022 12:14:17 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f25sm5554956wml.16.2022.02.09.12.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:14:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 21:14:44 +0100
Message-Id: <20220209201444.352250-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gauche: drop autoreconf
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
Cc: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 11cb72be570409be77d4bb49c17b4a2feef31be7 forgot to drop
autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gauche/gauche.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 2520379369..fe0a613a9d 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -10,8 +10,6 @@ GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
-# We're patching configure.ac
-GAUCHE_AUTORECONF = YES
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
