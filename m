Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD49EB64CA
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 17:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D148740118;
	Sat,  7 Sep 2024 17:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNdCBn1FECKV; Sat,  7 Sep 2024 17:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5117C40464
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5117C40464;
	Sat,  7 Sep 2024 17:31:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EB4A1BF3C0
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6865740544
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bC0Uroju3LvE for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 17:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5940040532
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5940040532
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5940040532
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 17:31:27 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso33100255e9.1
 for <buildroot@buildroot.org>; Sat, 07 Sep 2024 10:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725730285; x=1726335085;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=czB/j7nkgrT2qaDmaabfg03oRoBH2jaU1l6vPojo9Sg=;
 b=w+eVDCni1WWTA/9ShmCSX4+N0c0V72NLTY6f3gF+AcqmR0EB7WwMNUuiSTn6e7F21d
 tYqZFdG3xJ1LjBbe8dzqNCcbBecwS4/Sm4WYXmkXuz39WvuURUM4KSC54Ek0bOcHcesY
 WPOV77LVVxMa1AUyMCOBzcVFciaFh73Y8zSOISXLs6chqottqwxU0PyX2+TUALz2uAca
 5sGstNJKTviqhSj/pBdWIjJ7rSFsxedktsx747Dtt2aemKMihbbHqa7Bp9pMew45UNp8
 Pz7O8n9aMeEIp4Z8Q7zrmy8w5LaDpwDGsBNCSHj9Sk/fbAqB5DAPqwa4xM1p3jIwp8S4
 iCgg==
X-Gm-Message-State: AOJu0Yyee2wW7zE2UuIRIvHtkb+EPyZBbgBgCCYcMk+0zNS77PTWzDY8
 K9OHVFAh2zdFXBPbcvxnSS/zuhYoBRXG2ffwITfqJnj4fWiy0AvZ/DLOoQ==
X-Google-Smtp-Source: AGHT+IHg3jhF8AmcJT1KhtGgJbVjYnqOBenaYVF2Fbdq7um00843M4lIQ7A+hExGSrEUt3fB3ITt/A==
X-Received: by 2002:a5d:4486:0:b0:371:8dd3:27c8 with SMTP id
 ffacd0b85a97d-378922a6aecmr2248913f8f.23.1725730284835; 
 Sat, 07 Sep 2024 10:31:24 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956de00fsm1782159f8f.99.2024.09.07.10.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2024 10:31:24 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  7 Sep 2024 19:31:23 +0200
Message-ID: <20240907173123.649023-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725730285; x=1726335085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=czB/j7nkgrT2qaDmaabfg03oRoBH2jaU1l6vPojo9Sg=;
 b=R/FPUSIvM1F/gkzdtihhwv/1Mb044JrmGWbx4zmMY2AWIeIjO5Iu+8YkjwADEWiQwX
 SjN0I4XQFAsG6pGsipZVugpiBbfFlQktTJMrhGiuPMEHKBrzV56ljPL6ZcVx4AW9CoaQ
 7G0xFZprZEKzAJjOJNFMycdLJzsshqhnf0j51z8ijgSm0MtZYdrjONGhmpgsPGjQfVXo
 Dd296AIqLF7Ojmje4iXasb6YpDHdQUvRF554RQVJ/4trb8qmAhIdYbDUw2gEVrqLb7L8
 UDxGHj9ymYPFjdDxu1EmLh5L8JwZR1ID/WZ3h10m6F5x9NvrYefhVMocjZtDbIbMnL98
 5RIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=R/FPUSIv
Subject: [Buildroot] [PATCH] utils/check-package: require exactly 1 TAB and
 2 SP on help text 1st line
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Test that the first line starts exactly with one TAB and exactly two
spaces before the text.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 utils/checkpackagelib/lib_config.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
index f26ca0d898..bf975d7a3b 100644
--- a/utils/checkpackagelib/lib_config.py
+++ b/utils/checkpackagelib/lib_config.py
@@ -154,6 +154,7 @@ class CommentsMenusPackagesOrder(_CheckFunction):
 
 class HelpText(_CheckFunction):
     HELP_TEXT_FORMAT = re.compile(r"^\t  .{,62}$")
+    HELP_TEXT_FORMAT_1 = re.compile(r"^\t  \S.{,61}$")
     URL_ONLY = re.compile(r"^(http|https|git)://\S*$")
 
     def before(self):
@@ -170,12 +171,18 @@ class HelpText(_CheckFunction):
             return
         if text.strip() == "help":
             self.help_text = True
+            self.help_first_line = True
             return
 
         if not self.help_text:
             return
 
-        if self.HELP_TEXT_FORMAT.match(text.rstrip()):
+        if self.help_first_line:
+            help_text_match = self.HELP_TEXT_FORMAT_1
+            self.help_first_line = False
+        else:
+            help_text_match = self.HELP_TEXT_FORMAT
+        if help_text_match.match(text.rstrip()):
             return
         if self.URL_ONLY.match(text.strip()):
             return
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
