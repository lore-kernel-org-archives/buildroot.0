Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F70C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 20:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9A08214F;
	Sun,  2 Jun 2024 20:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_sf4c6jhexM; Sun,  2 Jun 2024 20:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F4E083B49
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F4E083B49;
	Sun,  2 Jun 2024 20:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E77F1BF315
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BAD0606EA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 20:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkJd3l3YxAvn for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5EE8D606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EE8D606A9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EE8D606A9
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 20:40:01 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4213485697fso12437015e9.1
 for <buildroot@buildroot.org>; Sun, 02 Jun 2024 13:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717360799; x=1717965599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=enDG+4GCXmhDUoT11eOPCLvbVlOgrgKZhNyDwBnQ0sI=;
 b=NFEuFL8wudcBYrYWbv+/I9xAevAJDgNLWU0BKD4Hy6o+3Xh98Jx4avujH18oW6Mgs9
 t71oFZqXrbexU7KU21KDQYTpksz+xMeRUOuoQgm8fxJP3bV146QMv5FhshVXc5aiGZZC
 nDJGywsab2WK9xFS+V2w/qoZfqMwhhCnFc0P0oTUglHMF8sU2lXfXNJHaAIzLhirt0rU
 nQY5rcm4ucIyW9P7Ht6lWEbWNSa6uOXiTt0thKecHPhAKHwrE4dVY44nBLn821mR1hAp
 Z8xuJ5iOZ+q8CRVKgxz1meJku/y34Ewqnmq7xXlchTMZA7n2Zhs+0SIOj0IuaUgGgi2z
 QtAg==
X-Gm-Message-State: AOJu0YySh0YnHZ+lO1b/OqrkWnWdbDn2CZAxWhqG0oqHZkDaYe7TT5w1
 quX0hAOvglUJ3xCZ++fhPkc5sdF4Mpm6Yjrl9UHyK9wnHfrgiQ/a5HsubA==
X-Google-Smtp-Source: AGHT+IFYV18t0myxNAo0Hrst7eeOFmxc8OqHHWhbLwuWYAty9bHf6wI5/lwFK8XloeqboDahqXIMHQ==
X-Received: by 2002:a05:600c:310d:b0:421:129e:98a0 with SMTP id
 5b1f17b1804b1-4212e05f62cmr62150765e9.19.1717360799274; 
 Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35e0f97ba3csm6460862f8f.73.2024.06.02.13.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 13:39:59 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun,  2 Jun 2024 22:39:51 +0200
Message-ID: <cccd1cd6d7a0e50d498e4dfff28b7fd1b89f4ed8.1717360788.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717360788.git.yann.morin.1998@free.fr>
References: <cover.1717360788.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717360799; x=1717965599; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enDG+4GCXmhDUoT11eOPCLvbVlOgrgKZhNyDwBnQ0sI=;
 b=R+ZjEwY90K5rrRk/X3r8oNkvMe+L4cj2f8mQsYG1hZlVsZJeLJ4+BdiXCUYkiSZyzP
 AHp2Q07chVdfEDsMxXtlOXQye7H/wju8DmfTRtIiXDKyrsSH5mhLwdRzqdm7cixYdqzk
 vR0mvB9WnwCYoj4JBAX6VknhX8xDpYAbD5uezwXkSgAnwftZmH6fjCc8CHBzLmcyiOr/
 y2jsIHnE/ECqzXf5G9lY7n9ylbSsU7YJonVU283dtD/xJDTWZD6depfA5xX/Z+Y2andZ
 NQHl3VJfU3cwTrUP2qfe1bElUMMNLuoP8Hyya+zBTlxXwoDGeOiohM6pSEWi944L/JZ/
 m5YA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=R+ZjEwY9
Subject: [Buildroot] [PATCH 15/16] utils/checkpackagelib: add test for
 default _CARGO_LOCKED
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/lib_mk.py      |  8 ++++++++
 utils/checkpackagelib/test_lib_mk.py | 18 ++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index ce2ab5157c..4e9264ba35 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -322,6 +322,8 @@ class UselessFlag(_CheckFunction):
     DEFAULT_AUTOTOOLS_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_AUTORECONF\s*=\s*NO",
         r"_LIBTOOL_PATCH\s*=\s*YES"])))
+    DEFAULT_CARGO_FLAG = re.compile(r"^.*{}".format("|".join([
+        r"_CARGO_LOCKED\s*=\s*YES"])))
     DEFAULT_GENERIC_FLAG = re.compile(r"^.*{}".format("|".join([
         r"_INSTALL_IMAGES\s*=\s*NO",
         r"_INSTALL_REDISTRIBUTE\s*=\s*YES",
@@ -357,6 +359,12 @@ class UselessFlag(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text]
 
+        if self.DEFAULT_CARGO_FLAG.search(text):
+            return ["{}:{}: useless default value "
+                    "({}#_infrastructure_for_cargo_based_packages)"
+                    .format(self.filename, lineno, self.url_to_manual),
+                    text]
+
 
 class VariableWithBraces(_CheckFunction):
     VARIABLE_WITH_BRACES = re.compile(r"^[^#].*[^$]\${\w+}")
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 2086237ebb..bc26e16f8c 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -599,6 +599,24 @@ UselessFlag = [
      'any.mk',
      'ANY_LIBTOOL_PATCH= \t NO\n',
      []),
+    ('cargo locked no',
+     'any.mk',
+     'ANY_CARGO_LOCKED=NO\n',
+     []),
+    ('host cargo locked no',
+     'any.mk',
+     'HOST_ANY_CARGO_LOCKED=NO\n',
+     []),
+    ('cargo locked yes',
+     'any.mk',
+     'HOST_ANY_CARGO_LOCKED=YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_cargo_based_packages)',
+       'HOST_ANY_CARGO_LOCKED=YES\n']]),
+    ('host cargo locked yes',
+     'any.mk',
+     'ANY_CARGO_LOCKED=YES\n',
+     [['any.mk:1: useless default value (url#_infrastructure_for_cargo_based_packages)',
+       'ANY_CARGO_LOCKED=YES\n']]),
     ('generic',
      'any.mk',
      'ANY_INSTALL_IMAGES = NO\n'
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
