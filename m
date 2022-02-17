Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82600C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 17:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12C224047D;
	Thu, 17 Feb 2022 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EMadsheGdpD; Thu, 17 Feb 2022 17:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A8494042B;
	Thu, 17 Feb 2022 17:33:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1E761BF322
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5D3441751
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 17:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zm8TeWCtIAwV for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 17:33:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BDF141742
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 17:33:30 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i14so10271303wrc.10
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXFx3fkZcPgYiWKfl6BAvuAprGjG374oTcKpvleHZqM=;
 b=qXOZeNJ5ueQuyzP27LUT2D5+Si7SuCzqnxNsrCwhhE1vNL29o5Th16AE66Kw+mAeDk
 VfwudL55TbJWsr+FIbqQ2w5I2RtxkQriBKn0IrtJZFkxnpXUFtyhjEhHtWJjto1g7Yem
 DhaJLmw9o/1yVfyqLNoQLmHM0s5IRr0PaCZnaFUkUUOasiXnH8QihgWb1AkJfejwhybU
 0a/nDyY6SxYfKL83DTyyoGCxeaxegtrooLUP6d4iI27zBjO3Uak1KDQWccj2wTHMiZzx
 uSPtxUtQwoX6TbhdgvMoBs3GBY1SuNZUXTyZyEEHwKlgcei0Bj97ddR8chj1FCrno8A+
 xi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vXFx3fkZcPgYiWKfl6BAvuAprGjG374oTcKpvleHZqM=;
 b=yRMYqwVs298IxUQ+liuJVysEc4LZ/xbzNyFUBr30VD8YigPO4gjh4jng4pmxeUllz6
 aPdFaIR8zwoPISTHZ3yt8F0XjAXfJDYbymFn+LccbWSw5byWnLhMbnXUTE7HerSuRypv
 fVRBts1sL2xzT44n3M2kQpVMwCx/o2NsQBHB6DCZOzNgFnzTJLA36jsIw3+82d8vyqjM
 G/ovMdY4FxSqaU4FBlfavyqczxH07JH/C49Uh1TSACaGcVMhcUc4VFkaW4eDMcDzf1Cy
 iBF/rHWtH12QZMh26r53/n73HbAnmHh246fow4DX4SFcam22T0VCDWBpgSf0tSPtJMK6
 6rcA==
X-Gm-Message-State: AOAM532CJQ89sjgzrvHgscMESKQ+P56s4sbYvRGFA3yuoiHa944ZHs3W
 KPdazIRKfZlTqubCLHM0CY4XIpBzaA8=
X-Google-Smtp-Source: ABdhPJwQZ03GXxDMjzdNhFKbUxCD1BnLOgsAbG2VGGCgHDpoSEF3rWKzsxsfHMxpGMLR/2kPyzAEkQ==
X-Received: by 2002:a5d:6689:0:b0:1e3:3e06:2ed5 with SMTP id
 l9-20020a5d6689000000b001e33e062ed5mr2971256wru.376.1645119208258; 
 Thu, 17 Feb 2022 09:33:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t2sm21127790wrr.55.2022.02.17.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 09:33:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 18:33:37 +0100
Message-Id: <20220217173337.553661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xz: don't override XZ_CONF_OPTS
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

XZ_CONF_OPTS is wrongly overridden in a conditional since commit
0dbc17abcb5c254d60a8d59e1ae0d715c2db4324

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xz/xz.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index ffbae4c873..af611975a0 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -14,9 +14,9 @@ XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-XZ_CONF_OPTS = --enable-threads
+XZ_CONF_OPTS += --enable-threads
 else
-XZ_CONF_OPTS = --disable-threads
+XZ_CONF_OPTS += --disable-threads
 endif
 
 # we are built before ccache
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
