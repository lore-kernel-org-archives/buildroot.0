Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0E2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 08:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C01340493;
	Sun,  1 May 2022 08:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RVIRI6utZhVh; Sun,  1 May 2022 08:42:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31D6D404D5;
	Sun,  1 May 2022 08:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 975DA1BF396
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 08:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FCD381453
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 08:42:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0po-AVdSIcTb for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 08:42:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB1988141E
 for <buildroot@buildroot.org>; Sun,  1 May 2022 08:42:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id gh6so22905513ejb.0
 for <buildroot@buildroot.org>; Sun, 01 May 2022 01:42:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6jR5QLmIPcofZpc5ft9a60+7N2NeWdxCD6f9IiFu0E=;
 b=PBHon0cGHos8pVeyl0V0wquBX/Wl88+hK10/OAtL7d+GTHJC6vE1tZKCuU7o1bul12
 p+DjqjqorT6fxbHM1ZMttp8vELa0NQ78VNP7WJbl/DeAiZCbUy+OQ3fpzO9VynfRscY3
 F2v8rLhIg1NnllCFQudtIXzLPQV1FkUHxzsrD0vui1rOzojmyGo8Qf09uEhiC1+ds2Bg
 CNbawJeOxdCSOjz2UpkcNPtR4QVaI+gIe83qDiEwzAMSNSonGurimLQNZevxamMSMBZv
 sp+jG733Byd9PUd5aInUyMvZNaf3AiY4paWfOgpGcUHWwdfuZzJnjWJj78/PyCTkNPbO
 aBkA==
X-Gm-Message-State: AOAM532nJk7ZIydjlcQ9GVJq7UdLJqAdIHP0LE8oU7F2yLf2JE5dGTv9
 6zX3nKsoV2vSfI0Q7ZQ251GXOJ63cVE=
X-Google-Smtp-Source: ABdhPJxQHCQQ+XtLuEbfxhjOskXM1yiKtjO+oYXktmeWq6As9Mlh3LXZgBWfpgxrK/Vrqejg5sWLPQ==
X-Received: by 2002:a17:906:794f:b0:6f3:b079:7e54 with SMTP id
 l15-20020a170906794f00b006f3b0797e54mr6776519ejo.519.1651394544806; 
 Sun, 01 May 2022 01:42:24 -0700 (PDT)
Received: from localhost.localdomain (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 d2-20020a170907272200b006f3ef214e1esm2391478ejl.132.2022.05.01.01.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 01:42:24 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 10:42:13 +0200
Message-Id: <20220501084213.547024-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: Fix license information
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
Cc: Cyril Bur <cyrilbur@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kvm-unit-tests are licensed under the GPL v2 nowadays, see:

 https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/commit/b29b222beb424a00

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index e56436f802..0bdbca70ac 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -7,7 +7,7 @@
 KVM_UNIT_TESTS_VERSION = 2022-03-08
 KVM_UNIT_TESTS_SOURCE = kvm-unit-tests-v$(KVM_UNIT_TESTS_VERSION).tar.bz2
 KVM_UNIT_TESTS_SITE = https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/archive/v$(KVM_UNIT_TESTS_VERSION)
-KVM_UNIT_TESTS_LICENSE = LGPL-2.0
+KVM_UNIT_TESTS_LICENSE = GPL-2.0
 KVM_UNIT_TESTS_LICENSE_FILES = COPYRIGHT
 
 ifeq ($(BR2_aarch64),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
