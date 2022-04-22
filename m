Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D802C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 21:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84A661186;
	Fri, 22 Apr 2022 21:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l8PPwQkqGoY3; Fri, 22 Apr 2022 21:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEEBB610B6;
	Fri, 22 Apr 2022 21:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E5311BF336
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C9794091C
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 21:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RC_JuRp92lc3 for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 21:23:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E229F40913
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 21:23:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u3so12763265wrg.3
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 14:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5/0pKNs4f2rURWJEJFRolRpG1eeFHgXYwcvWyINLqdo=;
 b=Aw7fJ0evXUPQY+5prRPu7d6BzMjl2yQSWNcAeUHycNNmrTqVjW/CUBMqDnnM31kxK4
 S9JvMMMPiRVTtcDPeHLVx/bRX3UPiggenQ09ewdMObTcjusEBlLW+Xz5di1fHEN6CD/1
 tzVYAvo/5hhMQSjkHaobY9HY3MKiC6Ml7GXsmp70IBsOJke3+XYr92ddN1k42oOdt2mb
 +P50pAOvGerITkv4Np04nhztN6v66MKyUs3M1SCJFp/jd80Cm2QsLapUhveo0nvjG19O
 4SC0W2MSZutK52h2786Nkkb94A9RWvK/7IWa3vEM3ZieAbWCuO9B1j+GsC47EXLw8Jb3
 UxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5/0pKNs4f2rURWJEJFRolRpG1eeFHgXYwcvWyINLqdo=;
 b=nu4eIDz6QMpu0gW5mGco09DbbxGJkSm16m5jH0KPnst/C4FAfwy+WTZRKgO0DriGDF
 WqFHr93cxlqmoM6sdbE2Y/y4PpAMMzu0CtFt1Q86H18hN3zfoua4Nv6KtiFceq4NfPhQ
 5d3+vC15V0mwGa81HSkpdnuqRLbxU4UkU80WbET5vOwSO2qBKoc3mn4N/BlJzZdnPAEp
 pCZN0TcZvZsAy02VzqkLeazDlxVL2y3bk8NgEjEHqvOe8+vfG5sfqv/kfmcqfnBkh4J7
 ZO8ci79DxGyBJg3V9rULc74zpECu2Zk04FugEEzBxmo7X0G4kPXvhEgS/tMDi8mvcxFg
 tccA==
X-Gm-Message-State: AOAM532fqOafFTUmLpB0v7rchwA+9h0hgqUEz/fwKGJ9dDo8hAx3BTBw
 01zIT8yyILeCqwszCoK/9/SSqpohdl8=
X-Google-Smtp-Source: ABdhPJyiNKpE8rTa57vpBGKdyPSprj+mLFXFOXkwZBzzGVMvEDE8DhECUOh99ytU/yPkINBM0lUuEw==
X-Received: by 2002:adf:e289:0:b0:1e3:14ad:75fe with SMTP id
 v9-20020adfe289000000b001e314ad75femr5237398wri.685.1650662603768; 
 Fri, 22 Apr 2022 14:23:23 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b0038ec7fcb979sm5554139wms.26.2022.04.22.14.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 14:23:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 23:21:17 +0200
Message-Id: <20220422212117.1291718-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
References: <20220422212117.1291718-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,2/2] package/netsurf: fix build with ccache
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

Update second patch to fix the following build failure with ccache:

/home/autobuild/autobuild/instance-11/output-1/build/netsurf-3.10/tmpusr/share/netsurf-buildsystem/makefiles/Makefile.tools:413: *** Unable to detect toolchain.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/b4ba19d7dcff1b0ee2b1546598b5ae6e9257a16d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Update patch instead of using HOST_NOCCACHE)

 package/netsurf/0002-do-not-cross-compile-nsgenbind.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
index 2d4637511e..7caad47a20 100644
--- a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
+++ b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
@@ -8,6 +8,8 @@ the build, so it should not be built with the cross-compiler, but with
 the native compiler.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[Fabrice: add quotes around BUILD_CC to fix build with ccache]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,7 +23,7 @@ index f279f01..5698c87 100644
  # prefixed install macro for each host sub target
  define do_build_prefix_install
 -	$(MAKE) install --directory=$1 HOST=$(BUILD) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
-+	$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
++	$(MAKE) install --directory=$1 HOST=$(BUILD) CC="$(BUILD_CC)" PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
  
  endef
  
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
