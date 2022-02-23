Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E4AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6213A403E9;
	Wed, 23 Feb 2022 20:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HJi349L1aeY; Wed, 23 Feb 2022 20:36:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 699A5403B3;
	Wed, 23 Feb 2022 20:36:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F09161BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDE78415E4
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kp93IZsS2-0V for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:36:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C27D415D7
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:36:40 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso59738wme.1
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PFNzN26Ck6RlqpBjULm+ELHfzd0nYTxev7cB38On+Y4=;
 b=QCh0KyAcKUnUsPpvoBMjdQH0rY4fRSHvzI8x25Dh/4kkQ9jHhI2egssiakJRYmEeY2
 6olU2xOPJ3sPQZqw0iRQrzsr4UsrIeBJ1iiJprLHUsiUJ79wgVBzSzWGTwLsuANubPsE
 silciNYPP6Sc2sLl88taLAiY07SRgFiaqBnywVT3IOFYAQULR4QGI4+OLDXy6M2jUwiG
 ccwwktVYpNVp/V55LeCIspfMjcIYXnRK29zIdybw80I6VhCypenrp6pGJr2ovTJlS6rU
 Bd+tn2npqcJIg1T5UeviBffjHEC1YGKd2Avhb337RNYYe7Ua6mhpEtbcqifzfRiq/vuU
 v81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PFNzN26Ck6RlqpBjULm+ELHfzd0nYTxev7cB38On+Y4=;
 b=3O0jBBgG4xYh5mVVF3lKnSXd0DvmwzmaOYjpG1DtLbUsy/yG0+NvjdKtYwl64y+jBR
 Qe6JvmeTuOg+a0u84C6xOj48DLr/tnNX7l+8YaCMzl6GEFrIOO1t9+SKiSdMGksm7fxV
 7TkDOByqYXEATqAeoLGnplRscNeFaDjX2bv/w/sSbtOCUFr7TAJaSfzNIVK9HGJm9v0G
 pDUL5kGXHQdlSZCJtSg7pDigKYlTNsPA7Ev4HhXn8J8ElsiuUEL5+PaihhtO6/y8ngDe
 Mhgq6RqUzt5HbOhd9Co74AQ5yVjRx6ncyTWJ/X57uT5U7Q857BilONitCaoRW5kx+e+u
 gUuw==
X-Gm-Message-State: AOAM530l91Vl/0m1+3X53leEWh8oCEmLSnzBOwuXjxSrVVIDbE/w1O/f
 fN406YABXtG6cQSUQ5EErT4qgtRk+GE=
X-Google-Smtp-Source: ABdhPJzzUBgCIB1rMtcMh1H7z7uBrNqiKZ7WfwstAtmPqvPmJbcZapHdHa03xrdoP/j7dZSBduHwfg==
X-Received: by 2002:a1c:a4c6:0:b0:380:d32b:b429 with SMTP id
 n189-20020a1ca4c6000000b00380d32bb429mr8123309wme.9.1645648598277; 
 Wed, 23 Feb 2022 12:36:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id z3sm648932wmp.42.2022.02.23.12.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 12:36:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 21:36:31 +0100
Message-Id: <20220223203631.3398950-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/checkpackagelib/lib_mk.py: check
 CONF_OPTS
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
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As already done for {FOO}_DEPENDENCIES in commit
4910a175b3f1f4b55ff257a75945d8ffb14a4ceb, check that {FOO}_CONF_OPTS are
never overridden in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/checkpackagelib/lib_mk.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 153754b6f1..b50a19ac62 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -90,6 +90,7 @@ class OverriddenVariable(_CheckFunction):
         r"_SOURCE\s*=\s*",
         r"_VERSION\s*=\s*"])))
     FORBIDDEN_OVERRIDDEN = re.compile(r"^[A-Z0-9_]+({})".format("|".join([
+        r"_CONF_OPTS\s*=\s*",
         r"_DEPENDENCIES\s*=\s*"])))
 
     def before(self):
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
