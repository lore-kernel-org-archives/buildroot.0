Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A28EC4345F
	for <buildroot@archiver.kernel.org>; Sat, 20 Apr 2024 18:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D539E81FC7;
	Sat, 20 Apr 2024 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsabO4_E5kH3; Sat, 20 Apr 2024 18:59:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F6781FDA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F6781FDA;
	Sat, 20 Apr 2024 18:59:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B78B1BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 389A7406B1
 for <buildroot@lists.busybox.net>; Sat, 20 Apr 2024 18:59:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3xpzcbVShZf for <buildroot@lists.busybox.net>;
 Sat, 20 Apr 2024 18:59:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.41;
 helo=mail-wr1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CC3840645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CC3840645
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CC3840645
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 18:59:07 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-347e635b1fcso2359889f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Apr 2024 11:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713639544; x=1714244344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ygl3GQ3pVIOXYniZOF2lRWw5+2Kn1Ysr1xWHlMJhS34=;
 b=gMrIJFVxKl5WXzO9Kl8NrTOuWGKHYoz1rpTj7oQcC6fQjYww6RYYHmNJfH0yh+qy1E
 qA6CIX15RILaBbmSrU/Ep3GhIYCfE9hnSfXZDE/+H7JLdMa+fVFGmw9+C3x2xlixz3cA
 eWjkiHLSnrE6i14Yti4aooVXti3s0hKofoDsTQolGfysDEFf20TOgZLU41zB6MRJ1Q7r
 JjIOUTiXulF4ZjaDN/Bm76o5/Ke2oS7tTAu754diOMwmNTjc5M9r366P3k+UBYILSXcW
 /FJ/0yrg9JBycbV1ShqUWTN9G5AE0VSgEMY9JkJH+mewRpprBAGVePx9dftcyu83CaE3
 Bujg==
X-Gm-Message-State: AOJu0YyuHHjqpnF/d9t9yP2cX36zsSV5oBFYKIbwD6/RSdK8pl9vtmZu
 DLLc8y71ZuHpoaN1rNLItn4MJf0HNdh80wW5BkLhlwWM1WYbCcAC1eqFgwZq
X-Google-Smtp-Source: AGHT+IEWDMY+qLi+U5flgD4wbOuvu4LefTLMznYMJkT9E+g+wVn6KVMji0R0HpZtEO8fJUiVJuVZ7A==
X-Received: by 2002:adf:ef88:0:b0:343:dc46:bb4b with SMTP id
 d8-20020adfef88000000b00343dc46bb4bmr3901776wro.59.1713639544452; 
 Sat, 20 Apr 2024 11:59:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:eb68:2f00:2033:ef69:f14:1bd2])
 by smtp.gmail.com with ESMTPSA id
 cs7-20020a056000088700b00346cdf48262sm7573981wrb.2.2024.04.20.11.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Apr 2024 11:59:03 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 20 Apr 2024 20:58:52 +0200
Message-Id: <20240420185853.4134260-7-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420185853.4134260-1-thomas@devoogdt.com>
References: <20240420185853.4134260-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1 7/8] package/gdk-pixbuf: fix reference to
 atomic
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Aleksander Morgado <aleksander@aleksander.es>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gthread-posix.c:(.text+0x137c): undefined reference to `__atomic_compare_exchange_4'
collect2: error: ld returned 1 exit status

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index e041d2cbde..9d272be382 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -31,6 +31,13 @@ HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Drelocatable=true \
 	-Dman=false
 
+GDK_PIXBUF_LDFLAGS = $(TARGET_LDFLAGS)
+
+# Uses __atomic_compare_exchange_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GDK_PIXBUF_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GDK_PIXBUF_CONF_OPTS += -Dbuiltin_loaders=all
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
