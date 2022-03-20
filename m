Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2638C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97DDF4086E;
	Sun, 20 Mar 2022 17:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JJ-9YHNeUP8k; Sun, 20 Mar 2022 17:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B549405CE;
	Sun, 20 Mar 2022 17:24:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 658891BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13C89400D9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lb__GUPlpbSg for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:24:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1F3940022
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:24:35 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so9221767wmj.0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 10:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0I09OVtEWsIS+KEijNCIQj2xj72c1tBY/Q30XBBD50=;
 b=OWns3SjGYm/bvXnf27WX2SUgm2sU+BPdQ1Ay8ewTaeFuSa3mQVDu48YpyAU/YvAUCf
 0VeWDO0NN6yo8pQzo9vkM3LHDBgWXNJ2zPbl8Qt0LordZ1Ch/QaRIUi2o5p42oRziAUm
 vO0Oy813QLxF3ZdHGj9VW8T2K+kp0nTaVUWGkG2hDj8WkoSNlpVVn7ShOHoYmzSmcI+q
 Vyx4SFv6ARG6tEqS26EnSswFBeDJRns1OLMgLmZ49cfaANz4+nzx4vfbzuXi+zm+T6Ke
 HhHKEhK25wyJpbZ1k6WJytwYGgbHFNQaSyzpQvM2bjEHnVvIIxlU7PsbVX6EgmOu5PTr
 SGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V0I09OVtEWsIS+KEijNCIQj2xj72c1tBY/Q30XBBD50=;
 b=0+CuE0gSDpFhgHar1YU/Ft2c37NzNGLHmC70Mc9HPbeWdUMuOyFuQDmmuBNhxdubS/
 gNIbSiPrwYhp61qlnIGPLyBwM85Huk1KMIAwPMZjluk7LxQ3IJkf71OFgr9BUp4Pcfpx
 yK+yKLud7OAR+ITQl/2ikIYYvg//VFTaY+AZgOXc3t8psGYk3sb39q4VoNXayCTDibB2
 0eBHOY9kXxn93RUl68OjMiluveu87vVkLCseqHD1c4ssBtKB25tj6XEat/tu2GjSXkdR
 shE7bhAG6kBfCgSstdtl5x4zdXpgIDs9oYs4op/GswlHFR/9L6OzaFR0HlOXQ2+pGCSl
 bvZg==
X-Gm-Message-State: AOAM531HrHqXJIPkpxow5uhCua+Y6GSd3wH1mpyw32/ILUNdEe7ShzNW
 WKXJJXa1ZiWMiL181UvsJvnW6gSxS/o=
X-Google-Smtp-Source: ABdhPJwNARQWOM1S4w+dkb/xw80Lo5leKvJbYAWvlUQI9mH91kX18ZnGuKFLGdAh6CuR/ZMlhOPiFg==
X-Received: by 2002:a7b:c925:0:b0:38c:82d7:868d with SMTP id
 h5-20020a7bc925000000b0038c82d7868dmr13140312wml.100.1647797073810; 
 Sun, 20 Mar 2022 10:24:33 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfc74f000000b001e888b871a0sm11477512wrh.87.2022.03.20.10.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:24:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 18:23:26 +0100
Message-Id: <20220320172326.1592463-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/raptor: fix CVE-2020-25713
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A malformed input file can lead to a segfault due to an out of bounds
array access in raptor_xml_writer_start_element_common.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...are-namespace-declarations-correctly.patch | 33 +++++++++++++++++++
 package/raptor/raptor.mk                      |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch

diff --git a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
new file mode 100644
index 0000000000..a48a583cb1
--- /dev/null
+++ b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
@@ -0,0 +1,33 @@
+From 4f5dbbffcc1c6cf0398bd03450453289a0979dea Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Sat, 18 Sep 2021 17:40:00 -0700
+Subject: [PATCH] XML Writer : compare namespace declarations correctly
+
+Apply patch from
+0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
+that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
+which overwrote heap during XML writing in parse type literal
+content.  This was detected with clang asan.
+
+Thanks to Michael Stahl / mst2 for the fix.
+
+[Retrieved from:
+https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/raptor_xml_writer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
+index 56993dc3..4426d38c 100644
+--- a/src/raptor_xml_writer.c
++++ b/src/raptor_xml_writer.c
+@@ -227,7 +227,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+           
+           /* check it wasn't an earlier declaration too */
+           for(j = 0; j < nspace_declarations_count; j++)
+-            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
++            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
+               declare_me = 0;
+               break;
+             }
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 6d21fad58e..69ac121300 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -20,6 +20,9 @@ RAPTOR_AUTORECONF = YES
 # 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
 RAPTOR_IGNORE_CVES += CVE-2017-18926
 
+# 0003-XML-Writer-compare-namespace-declarations-correctly.patch
+RAPTOR_IGNORE_CVES += CVE-2020-25713
+
 RAPTOR_CONF_OPTS =\
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
