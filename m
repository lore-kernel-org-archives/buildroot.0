Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11544C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 17:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D80D60AE8;
	Sun, 24 Apr 2022 17:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfR6zOrtIVEN; Sun, 24 Apr 2022 17:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B47C860B35;
	Sun, 24 Apr 2022 17:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B19751BF352
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF49414E2
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 17:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YY1RS7armiec for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 17:16:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A29DB41516
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 17:16:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u3so17823232wrg.3
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/kXHHgkPcyrp54Tq1KfXm+v5JGQ4zeLKuNVf9etlLg=;
 b=UvmZ8FZ65aeadQ7AjDC5E/76uDaiFMEWSAwcKPqBIn8kAyO6Un6e7FocxaOb+doXJB
 rZB4zxSn+UWwmaZB4SNHIl9qOS5JK4ANik69utS8+BlhakJh58o+U4wt/rJ5fu/Haa7I
 OIUn1eY8WJr1a8Qc8iUoSX6nCnidLrfrioN7+KfYbRg9P07pR81qhZoqbVh/pJkVMsk5
 XTiqxVWhwY4Jlwie2EXU5t3QJz3XDxTO/bEhlpRx4Hlm4O4pbn/7aSEj7TOv+CCmxwJE
 uxkr/76QM+qqzFs3RQHMIhy6gC4ekZswOnEWLqj3/2xbbLFdHPTqUSP4OdaeLQUHye1M
 ZldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/kXHHgkPcyrp54Tq1KfXm+v5JGQ4zeLKuNVf9etlLg=;
 b=OBv9qGKSD+YQ1KQZbQIYuSHIfdwpu6DY53+NGMIznLqyUEHItXtJ+fDfrj6rRGdybo
 2gpRUeZlWjJGahrv4B4dsbyilpZVKUT/pRz5bE2Ol+l1CcdLqt7T5r6jdCeMMEkxTaGq
 gwv+DecR33P18XkxjH1mHedfg+EwRQmZmfoYiEVCoXeI4wwZh286whnAi86G3GejLQie
 ClKlA8rzspztlcPxYmAVD5pLnhFnVGc9loHBiyDDyzawepOoVe5AnFz4VF7T0tieSYzu
 aKyKXiAtKpgGpvJuvvG72bo5sCJuaeqJMBph8wYIvqK+++LYBIchJW+kCjIaeE/NuOiZ
 zwXg==
X-Gm-Message-State: AOAM532ZnNX+o+DbXIBOrJwiq7Frr8zJKN6m4Nkfe8ZfeLoaGQWNM2ld
 3MzFUnwFyuSS2mYwK4C46dwOHZI87UA=
X-Google-Smtp-Source: ABdhPJwaPqQfr7MtQdxJUCJdZ0dP0D8FF1prdP8rvuEdL+nepx7NHFpzjdDtRv9ESSeDU2ubwAlzQg==
X-Received: by 2002:a5d:53c5:0:b0:20a:cf17:717c with SMTP id
 a5-20020a5d53c5000000b0020acf17717cmr7240204wrw.252.1650820563241; 
 Sun, 24 Apr 2022 10:16:03 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q15-20020adfaa4f000000b0020ac7bd4affsm8345465wrd.0.2022.04.24.10.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 10:16:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 19:13:55 +0200
Message-Id: <20220424171355.3174629-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pamtester: fix build without C++
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

Run autoreconf to avoid the following build failure without C++:

configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Fixes:
 - http://autobuild.buildroot.org/results/c000aff659da024b6eef42bca824bdea7b5541c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pamtester/pamtester.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pamtester/pamtester.mk b/package/pamtester/pamtester.mk
index b09e4d1cc0..2d8f1317ca 100644
--- a/package/pamtester/pamtester.mk
+++ b/package/pamtester/pamtester.mk
@@ -9,5 +9,7 @@ PAMTESTER_SITE = https://download.sourceforge.net/project/pamtester/pamtester/$(
 PAMTESTER_DEPENDENCIES = linux-pam
 PAMTESTER_LICENSE = BSD-3-Clause
 PAMTESTER_LICENSE_FILES = LICENSE
+# Fix build failure without C++
+PAMTESTER_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
