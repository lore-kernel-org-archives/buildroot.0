Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE0BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 22:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927FA40141;
	Wed, 16 Feb 2022 22:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8fuGRo8IjRk; Wed, 16 Feb 2022 22:33:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC68A4173C;
	Wed, 16 Feb 2022 22:33:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C13941BF59C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEDBA4173C
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 22:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGxKXH5DzKOh for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 22:33:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7209641721
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 22:33:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v12so5789001wrv.2
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 14:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoMQ4pUlmY+z93lQ2Wm515j1XFhwgRucfsxuL1NfGxg=;
 b=oms2Y7lT+bDolpSGPdkPmoG6F6COJPOq1PVbAQ7FGVG+rVW2F7f/tylN3VzG2YOkUY
 IauMBn5RlsHfmSK2L4iskZYeTYtPorAD7LFDVFJs/fBm3gPYggjharVjfIXeAqcvSnKK
 p2eiMQA/5JVtZPWh3XGNZ7tZO5/fQdmTahg2VVlC1x3Qd0sJ1NZbJjhruTXlku6Lfz/R
 xlB1k/o4NhNqszK+KMfi6nGG6wdOHHrWnp774CLjpip6QS+vaFqVx0yCOPS2t2BnFVws
 fNOvuD3yYsxsP6e+3Z16Dxgh4OWZBGeBQVINwdwMPmvqH3eFiaKVYh3a1w2HNjukpjz1
 HBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YoMQ4pUlmY+z93lQ2Wm515j1XFhwgRucfsxuL1NfGxg=;
 b=RRSaSMS+YGf5Rn6r+yKbL7zYTTHaBxRrqDPEGw3+cCiBp0+HdjxlICoUa6DC70Fs7J
 pmJYlK1nR3EMGoXnHAwshpW78aa9fLXjeTfK3P3sDdfiMguAhC+NviZnTrF0D4OpI5bi
 WAqbrJ2GmsUElflbYfAKLjCZV30SyaPolDt70HAHWvsqZXj2XSRj8NLstlCJNrBCBqYu
 2MtwtJQzHE1bi1kRXnKlv3l0ysaxkqDoAdaqWgg1pj4aP9lHxgFa9ivj2RKDRLRAa5xh
 A3v7wfClqilOedjLodz2JQJ5fCOE18T+QJJdRyr0c4C5PNu2kZTxnSEUn9do1E5R0Lzn
 JJ2w==
X-Gm-Message-State: AOAM5332MO6LEBZrYmQJUst22esvFbiT79k+qHGdkruO9xJf1neNJ30h
 hcnC5zBfQi+Sil5pWb9bKMrY0eZWtIE=
X-Google-Smtp-Source: ABdhPJz1NgzAOnHi6iukvAqmvX0fqCV6rSZVNRQx4MC6ifpw/QejY2bsx1nit3jCxo/4AgP7OsYmBg==
X-Received: by 2002:adf:912e:0:b0:1e3:d88:bb46 with SMTP id
 j43-20020adf912e000000b001e30d88bb46mr103116wrj.27.1645050829343; 
 Wed, 16 Feb 2022 14:33:49 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id r12sm3459528wrz.50.2022.02.16.14.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 14:33:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 23:33:49 +0100
Message-Id: <20220216223349.2531296-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luasyslog: fix build with Lua 5.4
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

Fix the following build failure with Lua 5.4 raised since commit
4f9a5659023c66fc166de28fd39a6c97a9490667:

In file included from lsyslog.c:11:
compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
  402 | #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
      |    ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-compat-5.3.h-add-Lua-5.4-support.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/luasyslog/0002-compat-5.3.h-add-Lua-5.4-support.patch

diff --git a/package/luasyslog/0002-compat-5.3.h-add-Lua-5.4-support.patch b/package/luasyslog/0002-compat-5.3.h-add-Lua-5.4-support.patch
new file mode 100644
index 0000000000..72f337967c
--- /dev/null
+++ b/package/luasyslog/0002-compat-5.3.h-add-Lua-5.4-support.patch
@@ -0,0 +1,43 @@
+From 0ec19dad98a18653ea58fbeae058288cf95d3e4a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 16 Feb 2022 23:31:15 +0100
+Subject: [PATCH] compat-5.3.h: add Lua 5.4 support
+
+Fix the following build failure with Lua 5.4:
+
+In file included from lsyslog.c:11:
+compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
+  402 | #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
+      |    ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/ntd/luasyslog/pull/3]
+---
+ compat-5.3.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/compat-5.3.h b/compat-5.3.h
+index 8e10893..4f8e58e 100644
+--- a/compat-5.3.h
++++ b/compat-5.3.h
+@@ -397,11 +397,11 @@ COMPAT53_API void luaL_requiref (lua_State *L, const char *modname,
+ 
+ 
+ /* other Lua versions */
+-#if !defined(LUA_VERSION_NUM) || LUA_VERSION_NUM < 501 || LUA_VERSION_NUM > 503
++#if !defined(LUA_VERSION_NUM) || LUA_VERSION_NUM < 501 || LUA_VERSION_NUM > 504
+ 
+-#  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
++#  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, 5.3 or 5.4)"
+ 
+-#endif /* other Lua versions except 5.1, 5.2, and 5.3 */
++#endif /* other Lua versions except 5.1, 5.2, 5.3 and 5.4 */
+ 
+ 
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
