Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24424C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 11:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BB6140C99;
	Sat, 11 Jun 2022 11:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqUmmWFCtsVJ; Sat, 11 Jun 2022 11:43:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E8E94010C;
	Sat, 11 Jun 2022 11:43:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8DC11BF319
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 11:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B73854010C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 11:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iA0bISDMjWHe for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 11:43:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDCC9400EF
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 11:43:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id e5so692889wma.0
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AF5zox8Nb3Yyyslo4S9h4PC0WOv2mxX9fwDe82JJGOg=;
 b=FrLTHg+xSuyF+ShHGoayMCNGrNt5CZz4Jd6R87AAksZgSe0zq03jCFaumyi2vAYt+w
 65vqUgfp8XA7zu9NHhbrQniAVWtWv3qbzpvCHoYulkQDfd8kPo/qfwX19MBr+vVoWgoY
 dzv6D5c2b1z2+wWM73J++LOwz/cqCfkHCwkGocSiE7j+CRyc0vN0HvhIHH2weMbsCqI7
 cvd6+PgOpGuaUwS/nG69hLULPwp18+ubI3dPOmtGQm27LyY+fzL/78cGduJetBzuLCzW
 3fhpmTufksauhI7ODnI0rdhmwT79lyTEzlullkPdBqrGA+BG1L8BDkm+8zdJjs9HmBMA
 v4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AF5zox8Nb3Yyyslo4S9h4PC0WOv2mxX9fwDe82JJGOg=;
 b=6K5P0XFHqniAKD4NeUhwvop9rLO5y2dE2ziz3UfV/MJF3pzG6kqczXq2p6Awr2Q1n9
 KZq/FHSznByVAUUQSvYps2CByYmOCEz/lkhfvqgROOy8X1DWJhriFe2T9tPkpu+THoNS
 vbmIPIkFEyD0+VRau7e47AoM1QXvTK4kv7g6LJMVORDGAagWvNkYvHUsM12xQ6N7Ok7Y
 og+AStgVbvkmwXrgcexOp+BMR68QwmSwN4YEXLkbXtg2t5+3ZTiQZKVFAwjSEHpf3DAc
 /Ep6YjXutEwuhaZaZcGijOX8uHBA9j0QUxoVWJnO2AXB8KwKR8dJQuiovs0y9GG1ZMbo
 HCfA==
X-Gm-Message-State: AOAM530Xzl/Vp2ejV6DHo5r0vOtMjEfsXGKgX7fj7U1DOez0wvI3YHB8
 JqWuH1Foqc6dDgwmHiLA8iNTaLvZGiE=
X-Google-Smtp-Source: ABdhPJxGgloVVSOpqYbHHSHwfhSRLPXsgVtTk4sOvbq9vuuKae4kmr+o2E0aqcOHlrk8RI5HIlN6nw==
X-Received: by 2002:a7b:cc13:0:b0:38e:67e3:db47 with SMTP id
 f19-20020a7bcc13000000b0038e67e3db47mr4440611wmh.133.1654947818488; 
 Sat, 11 Jun 2022 04:43:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b002183cedbf34sm2327722wrs.73.2022.06.11.04.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 04:43:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jun 2022 13:40:53 +0200
Message-Id: <20220611114053.89542-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ruby: fix build with libressl >=
 3.5.0
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

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

ossl_pkey.c: In function 'ossl_pkey_export_traditional':
ossl_pkey.c:681:62: error: invalid use of incomplete typedef 'EVP_PKEY' {aka 'struct evp_pkey_st'}
  681 |  EVP_PKEY_asn1_get0_info(NULL, NULL, NULL, NULL, &aname, pkey->ameth);
      |                                                              ^~

Fixes:
 - http://autobuild.buildroot.org/results/9b2622fbc4c2c2b787578ee83fc6a23795a84415

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-with-LibreSSL-3-5.patch    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch

diff --git a/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
new file mode 100644
index 0000000000..039a6466d6
--- /dev/null
+++ b/package/ruby/0001-Fix-build-with-LibreSSL-3-5.patch
@@ -0,0 +1,25 @@
+From e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d Mon Sep 17 00:00:00 2001
+From: Jeremy Evans <code@jeremyevans.net>
+Date: Fri, 25 Mar 2022 13:11:31 -0700
+Subject: [PATCH] Fix build with LibreSSL 3.5
+
+[Retrieved from:
+https://github.com/ruby/openssl/commit/e25fb0d0d86da5a9398ebdc9216b2ea89f80fa3d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ext/openssl/ossl_pkey.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/openssl/ossl_pkey.c b/ext/openssl/ossl_pkey.c
+index 2a4835a2..24d0da46 100644
+--- a/ext/openssl/ossl_pkey.c
++++ b/ext/openssl/ossl_pkey.c
+@@ -670,7 +670,7 @@ ossl_pkey_export_traditional(int argc, VALUE *argv, VALUE self, int to_der)
+ 	}
+     }
+     else {
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000 && !defined(LIBRESSL_VERSION_NUMBER)
++#if OSSL_OPENSSL_PREREQ(1, 1, 0) || OSSL_LIBRESSL_PREREQ(3, 5, 0)
+ 	if (!PEM_write_bio_PrivateKey_traditional(bio, pkey, enc, NULL, 0,
+ 						  ossl_pem_passwd_cb,
+ 						  (void *)pass)) {
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
