Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42BEC4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 21:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73F58416B4;
	Sat,  4 May 2024 21:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SK-WuPciKzAp; Sat,  4 May 2024 21:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4342841762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4342841762;
	Sat,  4 May 2024 21:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4861BF3C9
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CEA14148A
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNoAwnbp_Q40 for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 21:40:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BCC9840AB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC9840AB9
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCC9840AB9
 for <buildroot@buildroot.org>; Sat,  4 May 2024 21:40:31 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2db101c11beso9651741fa.0
 for <buildroot@buildroot.org>; Sat, 04 May 2024 14:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714858829; x=1715463629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HeaJnYUqSPT/iv/22dp8TLxhzHXdDPs3VsVaYdmux3w=;
 b=C2HXzw+Ioep5t/TUB/N7iAWCVN4ZmZ61bu7qzWQXkKUQ9DXpA9vbDH9Rv+nGChh4hU
 VxVeOdctxNy78aNXAfG/vj168udnwqGpD1E8TTvvdOd9yMY3EA4On/3HacfL/3orrXwX
 dnnWVUaYSIs9JcsUQ5BRIwH3N/oaPSoyYxDn4RqyGjfuoPxtEnRWBQDksU+7royEZ0ML
 34RaV2KknNky2JE3TDs1YN8yDwcEAjklT/ZISXsThhVGbuEdVLp1VcNwfcZOzAuaWYKF
 epOSIglrO7n42jrZPvoD5O8jq+jGnnj02yep7UXJ6TCbdSias+mVZTIpo1cU6kPajh8y
 bJtg==
X-Gm-Message-State: AOJu0Yyz2o0yoFtU+p2su2sTEYMTQ7IepxAELXD6Uj5jKLP4cAijW8h7
 3pb8ArZVhdyegnIXpwvLX5GIGTp/GUIPob09Nnh3kKAd+PLlRzmdIt6Xhg==
X-Google-Smtp-Source: AGHT+IHRGEJDyk0UQMSuDs2b55PFi1OldvsCYYJwCBLcSuYhaJFnUS1/fqrmf6Je7ERk0ti9/zVLAQ==
X-Received: by 2002:a2e:3e01:0:b0:2da:b59c:a94b with SMTP id
 l1-20020a2e3e01000000b002dab59ca94bmr3249408lja.25.1714858828453; 
 Sat, 04 May 2024 14:40:28 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b0041b43d2d745sm10464230wmq.7.2024.05.04.14.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 14:40:27 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 23:40:07 +0200
Message-ID: <69d5c1a9851dcec5cdc8e0fdb973eebc54a25fc5.1714858818.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1714858818.git.yann.morin.1998@free.fr>
References: <cover.1714858818.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714858829; x=1715463629; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HeaJnYUqSPT/iv/22dp8TLxhzHXdDPs3VsVaYdmux3w=;
 b=bP3p2mHxaysyysnGSB5u16fpfqlH+n0e0KkL/vY2WKxGoYsJEaHF/TiHRQvrwuYBlh
 nVjdx1srZ1/L0O0NSdU+tEaDE/ewqrmg6xIUtifLeBqE12lioumqLmc8t9H7r07sy5he
 Q4e7r+YnpThevX3vusmkhx1R9nuhF4h810A47AAwZe6q8ci6oO9uZ520/iBSM2yIxA7y
 ihNLnCuNQdt+8U3xVSAi4kVLPXHPTEnW7F6Fk9jr7TeIboNYutjBwJNl1EkIaSbMjSR2
 j+PpM7Ec9Urpfl8woOf7jeB7jGbBS1eLSHDxDGMiPFbiqPe+kXt8XokguYiVt7j244N9
 FifA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bP3p2mHx
Subject: [Buildroot] [PATCH 06/22 v3] support/testing: add test for
 export-subst support in git-download
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../package/export-subst/export-subst.hash        |   1 +
 .../git-hash/package/export-subst/export-subst.mk |  10 ++++++++++
 .../05/482df734b3715b849ef4a3147a9b1b1f8cca38     | Bin 0 -> 35 bytes
 .../0f/db95cf4f3c5ed4003287649cabb33c5f843e26     | Bin 0 -> 197 bytes
 .../68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8     | Bin 0 -> 28 bytes
 .../6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0     | Bin 0 -> 112 bytes
 .../git-remote/repo.git/refs/heads/master         |   2 +-
 support/testing/tests/download/test_git.py        |   4 ++++
 8 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
 create mode 100644 support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0

diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
new file mode 100644
index 0000000000..1926236993
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -0,0 +1 @@
+sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-br2.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
new file mode 100644
index 0000000000..8d7d3ff970
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.mk
@@ -0,0 +1,10 @@
+################################################################################
+#
+# export-subst
+#
+################################################################################
+
+EXPORT_SUBST_VERSION = 0fdb95cf4f3c5ed4003287649cabb33c5f843e26
+EXPORT_SUBST_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38 b/support/testing/tests/download/git-remote/repo.git/objects/05/482df734b3715b849ef4a3147a9b1b1f8cca38
new file mode 100644
index 0000000000000000000000000000000000000000..404bb1397cf8ec58f5e21a86e311e3b3884a55d5
GIT binary patch
literal 35
rcmb<m^geacKgeK9ipS|Qo~A(_Yc)>jYhBdU^VQOO$iz_nm{Sb^1FsEl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26 b/support/testing/tests/download/git-remote/repo.git/objects/0f/db95cf4f3c5ed4003287649cabb33c5f843e26
new file mode 100644
index 0000000000000000000000000000000000000000..3a4cc4ead6ce5a7e90a38e025896bc66da85a242
GIT binary patch
literal 197
zcmV;$06PD80j18pN(3<!Kw;}V#qDK=<mP`7v9YjFK`YBl?#(*jBugd>?%TWg1cK#h
z4qtBDwhqwJ-;B--j*`L!t!LwllOZ~Vg`-cw8%Ibno17#|aY~)*fP^|Mib|${mW-#M
zO)5HDL~WGM!6-#hl1S(A**birTH$eq=hwHV7r47zbKY8C>#Sl759Ml@OTP!@qOn#-
z6W~^&lp_B^2mfOs%KF84fWi9!{yw!nrv1F^Lx}hFSed3)%CuY#e^rVfqgY-S2z_Jg

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8 b/support/testing/tests/download/git-remote/repo.git/objects/68/28f88dcb0e88b8cd738ad6044ce74d7a9a13c8
new file mode 100644
index 0000000000000000000000000000000000000000..fdc4a37651a4ad195f8f106f3496d5df0b3bb6a5
GIT binary patch
literal 28
kcmb<m^geacKghr&DWLGQ{wZIbjX_@n9x^f5#jv&l0Hs3<3;+NC

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0 b/support/testing/tests/download/git-remote/repo.git/objects/6d/a12b257e47f6089612fe97a8746d2d9c4ca0e0
new file mode 100644
index 0000000000000000000000000000000000000000..932f73602f5927ae985829cdd301b1ed40350137
GIT binary patch
literal 112
zcmV-$0FVE80V^p=O;s>7FlR6{FfcPQQP4}zEJ-XWDauSLElDkAVD-@bZnC*Bx@F#%
z#UfR+rR950SwK~$W#*(ZJf9QSKh0&bCYQsEj;oGV#dUqLSCQn67&0_|^q%JH*m1VF
S>l%yCbKk02!Y2Svbu0l+hckcx

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/master b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
index b6bccc1c17..b6e37260fb 100644
--- a/support/testing/tests/download/git-remote/repo.git/refs/heads/master
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/master
@@ -1 +1 @@
-a238b1dfcd825d47d834af3c5223417c8411d90d
+0fdb95cf4f3c5ed4003287649cabb33c5f843e26
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index ec5b8f3fdd..ba52e03ef5 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -56,6 +56,10 @@ class TestGitHash(GitTestBase):
             self.check_hash("bad")
         self.check_hash("good")
         self.check_hash("nohash")
+        self.check_hash("export-subst")
+        with open(os.path.join(self.builddir, "dl", "export-subst", "git", "file2"), "r") as f:
+            blob = f.read()
+        self.assertEqual(blob, "0fdb95cf4f3c5ed4003287649cabb33c5f843e26\n")
 
 
 class TestGitRefs(GitTestBase):
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
