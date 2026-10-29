Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2209606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KGDUTOJX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=hWLze23M
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC73380F72;
	Thu, 29 Oct 2026 11:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DijBIQVqUIqi; Thu, 29 Oct 2026 11:01:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1AF3680F90
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793271680;
	b=oTfrdwJORH4qnPNxyWYfB+zx5vPRY6VBLhrzVbFLVSWIKIB4ZbRvCzYKIaH7/AuILhG3
	 clN3GiEQFMJpSsM+8q+aG6ZR5IlVGS8S7oTIOwA9Srp2DSAQBOep7CbGEJCOgXfTv55zb
	 1kilvryGvb1oFMINC4WHW5ZU9rwATdkC1fw7Fjzn9XDvh1ad7MGxwwF9wqUYLOa2QCAue
	 W/IdEZiXtgEu9/q5Qoc/QzspKZgwLW5rAqiZ5utSno95awRxeoIjEqB/URGbgrgH7sZca
	 ycNWNs04UoPBfx99dkIIQAaE/KnuPjh1HvL3DpvpbSVRpEYzyiOoqFR1f2YmMGL7q6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793271680;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tigvJM21YPLhpmqxYC8bu9z3oLl9Lgp3C9AHOKiiHfg=;
	b=pscbHCgzg6J15IA+FFQrcAmClaDiSEQZs05N+0Hd3lGyfffXRkNa3ZOjufsRVjuaLPzL
	 mbbCjZUU15w2HoG2Q5+23sYfiBcrNZ+7qe7hLq+5KRnfcbLI/DudaU9pwKXocXBtRH+ad
	 VUhGRA0hV5KB+P15fpLz2/+qMCVPb0Ij8d7IzQChtQjC7lN7ZlpLpbZZhla3nyMoDeGAw
	 JD6jjI1RPOt/xNy5StQFLQCQv4nDva532WSHC6tH5Lk93bRhJ0FzvoOGtYFMPg5sX3bhX
	 TF5wTFW6RKRhvuscqU+0hhU9iI992nZFLftIuzKJ+T3slqG7uK/ZCgwCLJMOAq3ML4Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793271680;
	bh=tigvJM21YPLhpmqxYC8bu9z3oLl9Lgp3C9AHOKiiHfg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KGDUTOJXKLfxgqblH27ky7Jj3fk+DjbBwg1qcJ5WTIIG3MCocswVk9Yk7pY17TXgW
	 xIsT2YvSxR41aGYKVVA6BuC8ODQ5UHGX/UdUorSrMIZudwKWCNdgU25K072zEkmu2x
	 PW4vNjcvgVSnqFPxu0Ax8CMaxHD2GVYDuhEhNF05cUE0EsKvdq6E4gsZCMi441IYbY
	 ArY7W6S1IvuqCn/8A3eZEkw0j41oLf2ULYoJDSpyNvXtbOWqVcq8cXo8Z+B3azt7Xu
	 8oIeUE/9BSjLFQsEKsT5cVXxSeB/urT110OiIdhUqoc3BoYHvYTc9t5gSDoYv0QoT9
	 Qy6KK+up5YOzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF3680F90;
	Thu, 29 Oct 2026 11:01:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9677D22
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8F0606BD
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOkoOh8x4FXV for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 11:01:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 067016069F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793271677;
 b=iZv+Mds53iA31nH3FQCUOEmeTSFucCP5KCu2/a+b+LP3DgoiERGLbYF1gVDWeXEDDdaH
 5m4Jwj0IyhXq5DtG6eu5/6bgjVxgpg68UO8iLa6blN5LOtYghtx/tQqNf5CSWF5YfNtPK
 r2eLT5zukBIVO7O1ixezdPtDw3OCxAyEEzZwNVPK9Nrbt1Ypv8+nq43Qd1pgwdreD10sC
 qCctrSda7xcFTvheUQtG9usd6dD6nlGo6ZckcUlIIeNTxElUpYL8VspLa/ILfFzLKIxRL
 Pt2iMUWwGIuoIP0aE8zZxcOFvUmzzqhSWtvguK2yzajTT0Gpo8jZA00lTnmLszVGnHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793271677;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ZLLTDRy+X8TENAdY+fTuP+GbuFO6evkJBRXrSkNzH1I=;
 b=F6pRgF4yZa/siIxFsF/Umvhu38lzLkS1P53GCPsZHsUxRY1vC/n0xJx55w/EVR0gEa6x
 S62OFoQOASbA7Efq0swTEbdGTwV5xf5PXR2TopyyVpnZof35wo3BiI1ZTXIfT65ckvP6E
 ydL4d7W0vGWyQtenOzI/fOBnRVWj5L8zpl0ZhLnID8euVtdWWoPCZbdn7BJMi43T/Qr6v
 EqDhLMkzyPpAJq3OHtNpMK9FyHfXH6H7Mv6tpgLakIaqTZ0Ik/xtdL37a86RxlrJjPRoB
 dyO9kRvejlQ2zImWqCY/0q0I7gegMtLemieWSggJyFj9onbvrn97hyfZvHW3IEG4TRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=hWLze23M; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::534"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hWLze23M
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 067016069F
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 11:01:16 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6b4883643ccso2493684a12.1
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793271674; x=1793876474; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZLLTDRy+X8TENAdY+fTuP+GbuFO6evkJBRXrSkNzH1I=;
 b=hWLze23MKXhMfejifN6aCl0+7SyYotAQwLG7jfLjF7qV67iCzsZRNzColSSSv1GGnT
 gCf+b/Uhv35FbQqT7dL13vtbp4U+rlLb/yncyyVIo4a2pxw5IkX1Pzdjy7HpKvoNBuHU
 4mIGvGR4LMTuPs/WApZGCaE7vo2Qt1cfzIDAVVUKAcBvbNlbTpdoqMFYWaJVHbhPzd6M
 fv4gW0IpXanhp0zSkKGyJ+Tsh160n7zGJz+4DsCLwnY8ETcD5/RuvbCBE7NGJT/sf+DL
 4G02LYUdBQwBZ+DSvxrCfWMeG1SjEiI0fKjM4fytoT+gDr4xPnlf2G9gIbPFqQOdFltK
 Gdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793271674; x=1793876474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZLLTDRy+X8TENAdY+fTuP+GbuFO6evkJBRXrSkNzH1I=;
 b=RqNzc7gZz/ViFOjvmLtiFrr6UNhwpzh5VWDOfFP38H09TvS+4z/Rajb289SDji6pCK
 cpVX7ZOYcvrktObdskDsd6b2FyV1mwQhfgV7wOBcKlVm4rkvShKGzHy7B65pznk7afuQ
 tFpTy4qktgVMoJkf8TkYEJooxOObDZDN3IyCHRby0qTDxoYK2VQ/NPwYkhhQivTtvMkk
 sbcidEW8CLvoTLfxDsR40Wg6NuFSWuWh9YhkbBrwbiYk0OXeZ0+ff8zzAmFPOHsUEiPA
 UbE2GIQT07OYXUwVjxeOWOP5qbN11az8MOmO+BPR4NpcfqEPv+oRDWa+VLBzU9LrvBhK
 ZDnA==
X-Gm-Message-State: AFq9FYILGsjXCKUCNaD1v+cL251LlWh5C59EK27NlTvg9iu+xijmfKg3
 G0P6alwnP87IfK2E6FO/HAEIaIpexB1NY70ogM/BCH04s/BWc/RHMXBvzMfkew==
X-Gm-Gg: AYBFou3p3rr/bUeH3PPTxHPinBhKRApa5W9QfYXUzOhXlgtM1DdXA3V8F6hPErpwXc0
 ImWLZGb/6CvRVZQqQz/7guHXh0Rx9Jx0PECAYGF4dklYvsurSBK/ybXR1EZCZ9itk4cWKSSsXjI
 dysxVgBYYhJ8yrcgvPm7n0XtkKffZ5BKvOzkmah66V8MNh89xZ5ybZ34ZR9W20xLUkRjSlyudOa
 KGjMAjkd9Cjg8an9mlZJA8O6b5JWR4XOOQy1qQv4hx8AKQh19Zu27M2ISHJ4iPxCmgVzuuBCNDB
 blq9u7xndM0E+vmshIOF9GwzfHjmiCViE0u2mi59Ock1ooGPMnJoMb3ESuCsRcPdXFKeN17sU3x
 0aDTo2KgQ//ManRhygh3cyBGFpktkqXfQSMNsncYX0z3WotDUNv81b80McGrF3XRnGKAioxucy8
 veuLPorSlCs6YLtjO9hzTNrncKY0eRRDT0S1ZCzOCdLV+ru1Cryv1JOD+MoDxhAFcs8ZYOEJREb
 mieciHdTQzw5Au0G9vUh8FkCJ+H9Vi/6Tp0npU2MdtWejPGNHVQ+XPih0QxskJT+t9SMjBzMUYK
 7FQlYAnJdD/m9Mbdave6lu3FR8fd8rf54dQAiZdHz1Ndzd8qyJpGLVlrs6pG0wp6uQ6TPAQY1tT
 6a75iF72I
X-Received: by 2002:a17:906:9fcf:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c49bdf2b6b9mr452366366b.14.1793271672907; 
 Thu, 29 Oct 2026 04:01:12 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm716028666b.59.2026.10.29.04.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 04:01:11 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 12:01:11 +0100
Message-Id: <20261029110111.560829-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/madplay: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

madplay has not seen a release since 0.15.2b in 2004, and the MAD
project is no longer maintained upstream.

It now fails to build with musl toolchains, as its bundled getopt
implementation uses old-style declarations that are rejected with the
C23 default of recent compilers:

  getopt.c:400:21: error: too many arguments to function 'getenv'; expected 0, have 1
  .../sysroot/usr/include/unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'

Rather than carrying more patches for a dead package, remove it. mpg123
is a maintained alternative to play MPEG audio from the command line.

The libmad and libid3tag libraries are still used by other packages and
are kept.

Fixes:
https://autobuild.buildroot.org/results/89e78429da964c08c91f51d3df5a477746649cc7

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |   4 -
 Config.in.legacy                              |   8 +
 package/Config.in                             |   1 -
 .../madplay/0001-switch-to-new-alsa-api.patch | 173 ------------------
 .../0002-configure-ac-automake-foreign.patch  |  16 --
 ...ure-ac-use-pkg-config-to-find-id3tag.patch |  23 ---
 ...4-configure-ac-call-AM_MKINSTALLDIRS.patch |  23 ---
 package/madplay/Config.in                     |  21 ---
 package/madplay/madplay.hash                  |   4 -
 package/madplay/madplay.mk                    |  34 ----
 10 files changed, 8 insertions(+), 299 deletions(-)
 delete mode 100644 package/madplay/0001-switch-to-new-alsa-api.patch
 delete mode 100644 package/madplay/0002-configure-ac-automake-foreign.patch
 delete mode 100644 package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch
 delete mode 100644 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
 delete mode 100644 package/madplay/Config.in
 delete mode 100644 package/madplay/madplay.hash
 delete mode 100644 package/madplay/madplay.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index a8c1baacbd..0d0c47ee60 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -567,10 +567,6 @@ package/lvm2/0002-log-use-freopen-to-reopen-standard-streams.patch lib_patch.Ups
 package/lzma/0001-Remove-static-from-LDFLAGS.patch lib_patch.Upstream
 package/lzop/0001-allow-overriding-modification-time.patch lib_patch.Upstream
 package/macchanger/0001-Fix-missing-include-for-caddr_t.patch lib_patch.Upstream
-package/madplay/0001-switch-to-new-alsa-api.patch lib_patch.Sob lib_patch.Upstream
-package/madplay/0002-configure-ac-automake-foreign.patch lib_patch.Upstream
-package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch lib_patch.Upstream
-package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch lib_patch.Upstream
 package/makedumpfile/0002-Handle-__mips64.patch lib_patch.Upstream
 package/mariadb/0001-add-extra-check-for-librt.patch lib_patch.Upstream
 package/mariadb/S97mysqld Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..c24aa507c3 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_MADPLAY
+	bool "madplay has been removed"
+	select BR2_LEGACY
+	help
+	  madplay has been removed, as it is no longer maintained
+	  upstream (last release in 2004) and fails to build with
+	  recent compilers. Consider using mpg123 instead.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..71e99cffe2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -29,7 +29,6 @@ menu "Audio and video applications"
 	source "package/jack2/Config.in"
 	source "package/kodi/Config.in"
 	source "package/lame/Config.in"
-	source "package/madplay/Config.in"
 	source "package/minimodem/Config.in"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
diff --git a/package/madplay/0001-switch-to-new-alsa-api.patch b/package/madplay/0001-switch-to-new-alsa-api.patch
deleted file mode 100644
index 60d7bd3799..0000000000
--- a/package/madplay/0001-switch-to-new-alsa-api.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-Switch madplay to the new API. This is done thanks to a patch written
-by Micha Nelissen <micha@neli.hopto.org> and available at
-http://article.gmane.org/gmane.comp.audio.mad.devel/729.
-
---- madplay-0.15.2b/audio_alsa.c	2008-10-18 15:10:16.000000000 +0200
-+++ madplay-0.15.2b/audio_alsa.c.new	2008-10-18 15:03:27.000000000 +0200
-@@ -28,31 +28,30 @@
-
- #include <errno.h>
-
--#define ALSA_PCM_OLD_HW_PARAMS_API
--#define ALSA_PCM_OLD_SW_PARAMS_API
- #include <alsa/asoundlib.h>
-
- #include <mad.h>
-
- #include "audio.h"
-
--char *buf	= NULL;
--int paused	= 0;
-+#define BUFFER_TIME_MAX     500000
-
--int rate	= -1;
--int channels	= -1;
--int bitdepth	= -1;
--int sample_size	= -1;
--
--int buffer_time		= 500000;
--int period_time		= 100000;
--char *defaultdev	= "plughw:0,0";
-+unsigned char *buf  = NULL;
-+int paused	    = 0;
-+
-+unsigned int rate           = 0;
-+unsigned int channels	    = -1;
-+unsigned int bitdepth	    = -1;
-+unsigned int sample_size    = -1;
-+
-+unsigned int buffer_time;
-+unsigned int period_time;
-+char *defaultdev	    = "plughw:0,0";
-
- snd_pcm_hw_params_t *alsa_hwparams;
- snd_pcm_sw_params_t *alsa_swparams;
-
--snd_pcm_sframes_t buffer_size;
--snd_pcm_sframes_t period_size;
-+snd_pcm_uframes_t buffer_size;
-
- snd_pcm_format_t  alsa_format = -1;
- snd_pcm_access_t  alsa_access = SND_PCM_ACCESS_MMAP_INTERLEAVED;
-@@ -66,14 +65,20 @@
- 		 snd_pcm_hw_params_t *params,
- 		 snd_pcm_access_t access)
- {
--	int err, dir;
--	
-+	int err;
-+
- 	/* choose all parameters */
- 	err = snd_pcm_hw_params_any(handle,params);
- 	if (err < 0) {
- 		printf("Access type not available for playback: %s\n", snd_strerror(err));
- 		return err;
- 	}
-+	/* set the access type */
-+	err = snd_pcm_hw_params_set_access(handle, params, alsa_access);
-+	if (err < 0) {
-+		printf("Sample format not available for playback: %s\n", snd_strerror(err));
-+		return err;
-+	}
- 	/* set the sample format */
- 	err = snd_pcm_hw_params_set_format(handle, params, alsa_format);
- 	if (err < 0) {
-@@ -87,29 +92,38 @@
- 		return err;
- 	}
- 	/* set the stream rate */
--	err = snd_pcm_hw_params_set_rate_near(handle, params, rate, 0);
-+	err = snd_pcm_hw_params_set_rate(handle, params, rate, 0);
- 	if (err < 0) {
- 		printf("Rate %iHz not available for playback: %s\n", rate, snd_strerror(err));
- 		return err;
- 	}
--	if (err != rate) {
--		printf("Rate doesn't match (requested %iHz, get %iHz)\n", rate, err);
--		return -EINVAL;
--	}
-+	err = snd_pcm_hw_params_get_buffer_time_max(params, &buffer_time, NULL);
-+        if (err < 0) {
-+                printf("Unable to retrieve buffer time: %s\n", snd_strerror(err));
-+                return err;
-+        }
-+        if (buffer_time > BUFFER_TIME_MAX)
-+                buffer_time = BUFFER_TIME_MAX;
- 	/* set buffer time */
--	err = snd_pcm_hw_params_set_buffer_time_near(handle, params, buffer_time, &dir);
-+	err = snd_pcm_hw_params_set_buffer_time_near(handle, params, &buffer_time, 0);
- 	if (err < 0) {
- 		printf("Unable to set buffer time %i for playback: %s\n", buffer_time, snd_strerror(err));
- 		return err;
- 	}
--	buffer_size = snd_pcm_hw_params_get_buffer_size(params);
-+        if (period_time * 4 > buffer_time)
-+                period_time = buffer_time / 4;
- 	/* set period time */
--	err = snd_pcm_hw_params_set_period_time_near(handle, params, period_time, &dir);
-+	err = snd_pcm_hw_params_set_period_time_near(handle, params, &period_time, NULL);
- 	if (err < 0) {
- 		printf("Unable to set period time %i for playback: %s\n", period_time, snd_strerror(err));
- 		return err;
- 	}
--	period_size = snd_pcm_hw_params_get_period_size(params, &dir);
-+        /* retrieve buffer size */
-+	err = snd_pcm_hw_params_get_buffer_size(params, &buffer_size);
-+        if (err < 0) {
-+                printf("Unable to retrieve buffer size: %s\n", snd_strerror(err));
-+                return err;
-+        }
- 	/* write the parameters to device */
- 	err = snd_pcm_hw_params(handle, params);
- 	if (err < 0) {
-@@ -123,6 +137,7 @@
- int set_swparams(snd_pcm_t *handle,
- 		 snd_pcm_sw_params_t *params)
- {
-+        unsigned int start_threshold;
- 	int err;
-
-         /* get current swparams */
-@@ -136,13 +151,7 @@
-         if (err < 0) {
-                 printf("Unable to set start threshold mode for playback: %s\n", snd_strerror(err));
-                 return err;
--										        }
--        /* allow transfer when at least period_size samples can be processed */
--        err = snd_pcm_sw_params_set_avail_min(handle, params, period_size);
--        if (err < 0) {
--                printf("Unable to set avail min for playback: %s\n", snd_strerror(err));
--                return err;
--												        }
-+	}
-         /* align all transfers to 1 samples */
-         err = snd_pcm_sw_params_set_xfer_align(handle, params, 1);
-         if (err < 0) {
-@@ -190,7 +199,7 @@
- 	rate		= config->speed;
-
- 	if ( bitdepth == 0 )
--		config->precision = bitdepth = 32;
-+		config->precision = bitdepth = 16;
-
- 	switch (bitdepth)
- 	{
-@@ -241,7 +250,7 @@
- 		return -1;
- 	}
-
--	buf = malloc(buffer_size);
-+	buf = malloc(buffer_size * sample_size);
- 	if (buf == NULL) {
- 		audio_error="unable to allocate output buffer table";
- 		return -1;
-@@ -279,7 +288,7 @@
- int play(struct audio_play *play)
- {
- 	int err, len;
--	char *ptr;
-+	unsigned char *ptr;
-
- 	ptr = buf;
- 	len = play->nsamples;
-
diff --git a/package/madplay/0002-configure-ac-automake-foreign.patch b/package/madplay/0002-configure-ac-automake-foreign.patch
deleted file mode 100644
index 38d1630987..0000000000
--- a/package/madplay/0002-configure-ac-automake-foreign.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-configure.ac: don't require GNU-specific files when running automake
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -durN madplay-0.15.2b-orig/configure.ac madplay-0.15.2b/configure.ac
---- madplay-0.15.2b-orig/configure.ac	2019-02-14 21:34:01.507212449 +0100
-+++ madplay-0.15.2b/configure.ac	2019-02-14 21:34:23.439336353 +0100
-@@ -26,7 +26,7 @@
- 
- AC_CONFIG_SRCDIR([madplay.c])
- 
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- 
- AM_CONFIG_HEADER([config.h])
- 
diff --git a/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch b/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch
deleted file mode 100644
index 47645edd4c..0000000000
--- a/package/madplay/0003-configure-ac-use-pkg-config-to-find-id3tag.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-configure.ac: use pkg-config to find id3tag
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -durN madplay-0.15.2b-orig/configure.ac madplay-0.15.2b/configure.ac
---- madplay-0.15.2b-orig/configure.ac	2019-02-14 21:34:01.507212449 +0100
-+++ madplay-0.15.2b/configure.ac	2019-02-15 23:24:00.079876087 +0100
-@@ -182,12 +182,13 @@
- *** environment variable to specify its installed location, e.g. -L<dir>.])
- ])
- 
--AC_CHECK_LIB(id3tag, id3_tag_parse, :, [
-+PKG_CHECK_MODULES(ID3TAG, id3tag, [
-+	CFLAGS="$CFLAGS $ID3TAG_CFLAGS" LIBS="$LIBS $ID3TAG_LIBS"], [
- 	AC_MSG_ERROR([libid3tag was not found
- *** You must first install libid3tag before you can build this package.
- *** If libid3tag is already installed, you may need to use the LDFLAGS
- *** environment variable to specify its installed location, e.g. -L<dir>.])
--], [-lz])
-+])
- 
- AC_FUNC_VPRINTF
- AC_CHECK_FUNCS(madvise localeconv)
diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
deleted file mode 100644
index 448139e0ba..0000000000
--- a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-configure.ac: call AM_MKINSTALLDIRS to substitute @MKINSTALLDIRS@
-
-MKINSTALLDIRS is obsolete and doesn't get automatically called.
-
-Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
-occurrence in *.in files.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
-
-diff -urpN madplay-0.15.2b.orig/configure.ac madplay-0.15.2b/configure.ac
---- madplay-0.15.2b.orig/configure.ac	2019-04-16 12:06:03.781018755 +0200
-+++ madplay-0.15.2b/configure.ac	2019-04-16 12:07:48.399162610 +0200
-@@ -146,6 +146,10 @@ ALL_LINGUAS="en es fr hr no"
- AM_GNU_GETTEXT([use-libtool])
- AM_GNU_GETTEXT_VERSION(0.14.1)
- 
-+dnl Substitute MKINSTALLDIRS
-+
-+AM_MKINSTALLDIRS()
-+
- dnl Checks for header files.
- 
- AC_HEADER_STDC
diff --git a/package/madplay/Config.in b/package/madplay/Config.in
deleted file mode 100644
index a3373057a1..0000000000
--- a/package/madplay/Config.in
+++ /dev/null
@@ -1,21 +0,0 @@
-config BR2_PACKAGE_MADPLAY
-	bool "madplay"
-	select BR2_PACKAGE_LIBMAD
-	select BR2_PACKAGE_LIBID3TAG
-	help
-	  Command-line front-end to libmad, a high-quality MPEG audio
-	  decoder.  It currently supports MPEG-1 and the MPEG-2
-	  extension to lower sampling frequencies, as well as the de
-	  facto MPEG 2.5 format. All three audio layers - Layer I,
-	  Layer II, and Layer III (i.e. MP3) - are fully implemented.
-
-	  http://www.underbit.com/products/mad/
-
-if BR2_PACKAGE_MADPLAY
-
-config BR2_PACKAGE_MADPLAY_ALSA
-	bool
-	default y
-	depends on BR2_PACKAGE_ALSA_LIB
-
-endif
diff --git a/package/madplay/madplay.hash b/package/madplay/madplay.hash
deleted file mode 100644
index 227702976b..0000000000
--- a/package/madplay/madplay.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally computed:
-sha256  5a79c7516ff7560dffc6a14399a389432bc619c905b13d3b73da22fa65acede0  madplay-0.15.2b.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-sha256  915bfd70548f31d11f9b4ffb21f343d1196af96c79d6aaac5663ea46c39dd3a3  COPYRIGHT
diff --git a/package/madplay/madplay.mk b/package/madplay/madplay.mk
deleted file mode 100644
index b9162dd2fd..0000000000
--- a/package/madplay/madplay.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# madplay
-#
-################################################################################
-
-MADPLAY_VERSION = 0.15.2b
-MADPLAY_SITE = http://downloads.sourceforge.net/project/mad/madplay/$(MADPLAY_VERSION)
-MADPLAY_LICENSE = GPL-2.0+
-MADPLAY_LICENSE_FILES = COPYING COPYRIGHT
-MADPLAY_DEPENDENCIES = host-pkgconf libmad libid3tag $(TARGET_NLS_DEPENDENCIES)
-
-# Force autoreconf to be able to use a more recent libtool script, that
-# is able to properly behave in the face of a missing C++ compiler.
-# Also 0003-configure-ac-use-pkg-config-to-find-id3tag.patch
-MADPLAY_AUTORECONF = YES
-
-# madplay uses libmad which has some assembly function that is not present in
-# Thumb mode:
-# Error: selected processor does not support `smull r8,r9,r2,r4' in Thumb mode
-# so, we deactivate Thumb mode
-ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
-MADPLAY_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
-endif
-
-# Check if ALSA is built, then we should configure after alsa-lib so
-# ./configure can find alsa-lib.
-ifeq ($(BR2_PACKAGE_MADPLAY_ALSA),y)
-MADPLAY_CONF_OPTS += --with-alsa
-MADPLAY_DEPENDENCIES += alsa-lib
-MADPLAY_CONF_ENV += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs alsa`"
-endif
-
-$(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
