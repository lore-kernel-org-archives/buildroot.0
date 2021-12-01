Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD4FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 07:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39AE7400A4;
	Wed,  1 Dec 2021 07:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id av7ocBdajJnQ; Wed,  1 Dec 2021 07:35:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6560C400BA;
	Wed,  1 Dec 2021 07:35:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 409F41BF32A
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E98D400BA
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 07:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bY0rwvY-Ogdn for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 07:35:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 50547400A4
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 07:35:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t9so33099774wrx.7
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 23:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eChG7AjBog2lfTUd8ryAKlDhmoHZGkx2wwF59VcDbtc=;
 b=P16xMEaaF3gSFnb9jigPR1GMIVUMT4ukz0/WdyY2XKHsA1N2n75HJRc0gbuc1qm6f9
 YQ9bqAwA8syoQ9G9B0auUsA/ZeNY1MhhXXmDvq7OYPle2MOy6TWA4/w5vJQ4kgrpgQE/
 JokSOeAIn9q4uH/J9vgZZi9kViiTDwirBcu8uvw8S+D2HsCLcuxiy35wg7i5++jpcAbz
 tLW+aWMauQQfWdUQjJ56dngDlPSm/dszBipoIOt7LwKUZP5lnjBxozNXRuRy7VgCxAai
 1yx8r+gEFOWui33u7OuFkmN4uCIgcb5QxUYRRfdcdETgzXHRACgEu3rm6OzQh1GO8ZhM
 6/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eChG7AjBog2lfTUd8ryAKlDhmoHZGkx2wwF59VcDbtc=;
 b=wUnToE/L0BH8Rx465PreSuSWLu+2i76n3vSgV5yVL/Z07JkmqtDebPTnVHe2GyvBfI
 tbmJ2E/YWRzo+831qIVSn82TKafE4yYBAHgNzZHCtWy8j1HfrdWqnUK2LYuE7VmLcPoK
 HPsgRID2er6//g9Sq5c5PzU6h1pBRx8Ubi90yKW5YhtlzDZnvS8y2NuhVk4kjZS7f6xv
 cjd7Ciuf3hFCx3nGgsgzkVmT2c4dkSAZLEVa1lcN42564GGtXxKgCmNoz6MqNuGaDipb
 RtR9A8cgperjYcuUvOrWTVVhcuoEZmdT35L1t/ackT4MVHcCDLBzhvI7aVJC2JKyPhxf
 RZrQ==
X-Gm-Message-State: AOAM531qRQ3lspcO9sSKi8S+ISAUcx7LkiWjuZtuxeL0ZBH5xVTqK4zz
 ZCF1RuMBkN/BNfgaNyNtixHD8KCdzu9XGg==
X-Google-Smtp-Source: ABdhPJx/URLkcyqhEoz0AeZ624t3nbyN553AkbQ3bG0epBeSXJKvLOaefr3ML3+iUlNlFEef1RVJXw==
X-Received: by 2002:adf:8091:: with SMTP id 17mr4700425wrl.457.1638344153170; 
 Tue, 30 Nov 2021 23:35:53 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l11sm17894243wrp.61.2021.11.30.23.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 23:35:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 08:36:08 +0100
Message-Id: <20211201073608.566367-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] docs/manual: use single space in
 LIBFOO_{DEVICES, PERMISSIONS}
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use single space in LIBFOO_{DEVICES,PERMISSIONS} to be consistent with
LIBFOO_USERS, package/makedevs/README and most examples/packages

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 2201d4385e..2d8a1a71ce 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -48,11 +48,11 @@ system is based on hand-written Makefiles or shell scripts.
 33: endef
 34:
 35: define LIBFOO_DEVICES
-36:	/dev/foo  c  666  0  0	42  0  -  -  -
+36:	/dev/foo c 666 0 0 42 0 - - -
 37: endef
 38:
 39: define LIBFOO_PERMISSIONS
-40:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
+40:	/bin/foo f 4755 foo libfoo - - - - -
 41: endef
 42:
 43: $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
