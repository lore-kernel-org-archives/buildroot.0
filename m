Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827F9C433FE
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 17:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1EBA60A8B;
	Thu, 27 Jan 2022 17:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TqkRqa6SWHG; Thu, 27 Jan 2022 17:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269F0600C9;
	Thu, 27 Jan 2022 17:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B79151BF275
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36EE40899
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 17:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvOpWPLAwOIa for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 17:55:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B38640341
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 17:55:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso6501677wmj.0
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 09:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBEKgccsuWpDdV36WFZxpJ7/Em7A8UkGJyRvuSB+770=;
 b=pUieFFk21VhEyJH8bVvZJDd6jNn2ZCcO5WOZF1TGQCB4f9s0TVfEguaJtteGqnXgjT
 VYpWkypu7foHgJmaleosm8hvZazvvcjQvIRprlvSUz04U2kXIhkaKxzqYTuvyfBhYUii
 bKmqjShbTzpMX0QUmZjz7i735T5wTpqm6tp01NSCSqdt9s7bBTXnLqWl5PNovkL58xrb
 n3ufKTpwMh5x6U21aoy9z6KFuNlGcJJKzGJ9veJGxv+YqxBKXOpQ+iqypNURnPxhHxF1
 /UpBYAuLb8InDGHUHO8y/UPFSfuAUXwny09u9pZ5TlvhnKp2X98qQ2LvBAoHJXKNndoJ
 uNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBEKgccsuWpDdV36WFZxpJ7/Em7A8UkGJyRvuSB+770=;
 b=dTJFHOnM46Jjm/LGBqpkNz/QionRtS89fT1g86QxGskT+iY16ZQGeToOICycx/X7d/
 zsAdktj9TyFfcM++VlZd9Qw4UePv+ezLs2CgaF5LxFWO9BfPkN2kt3RACiaO3UZP6HDd
 hJY9TA3QvrTbrUIgOjOF/ihtS6NH+vSFJWLk5YLBm86mE8y/Wj72Xs6hS3m+UfGe4A0G
 q8TocJ7+2DGg2FcRvPJ9LhCBh5vi6Y0pNwVSyoaK14757uooaXQrx611gn4LUaVu0GAp
 YjSriYL9QCsW+rfbzfl6DfoLp/jRQYeBvEGK/cqjhtUT4SRfnDnyrnVa8qjKr5rlk0Be
 KEMg==
X-Gm-Message-State: AOAM533g+1cBl/9E+hn+TewkK/lQVb1tInpHE0vCEeGGJg2RRICc8Hkf
 Zn5VJ1jJd5LHwN7jZPXDGEjs+O6hZFQ=
X-Google-Smtp-Source: ABdhPJy5P9o81fDYS3+9Nt4vBgQdj9jBePv62ir/g5/qzPNyQOpXaGpndG8c9gcVm33SATF69Ly3mw==
X-Received: by 2002:a05:600c:4e0d:: with SMTP id
 b13mr12708915wmq.99.1643306148114; 
 Thu, 27 Jan 2022 09:55:48 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 6sm3461952wry.69.2022.01.27.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:55:47 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 18:53:59 +0100
Message-Id: <20220127175359.2330776-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/htpdate: fix install
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 1.3.3 in
commit 163509a8e0d558e6339c5489f072dfe805e0cc34:

>>> htpdate 1.3.3 Installing to target
PATH="/home/buildroot/autobuild/instance-0/output-1/host/bin:/home/buildroot/autobuild/instance-0/output-1/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin" /usr/bin/make -j4 -C /home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3 DESTDIR=/home/buildroot/autobuild/instance-0/output-1/target install
make[1]: Entering directory '/home/buildroot/autobuild/instance-0/output-1/build/htpdate-1.3.3'
strip -s htpdate
strip: Unable to recognise the format of the input file `htpdate'

Fixes:
 - http://autobuild.buildroot.org/results/f1034de5ebc2fc2c49711820077d0b6e5e13aea5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/htpdate/htpdate.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index 200c3207a2..54b3ec2569 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -19,7 +19,8 @@ define HTPDATE_BUILD_CMDS
 endef
 
 define HTPDATE_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) install
 endef
 
 define HTPDATE_INSTALL_INIT_SYSV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
