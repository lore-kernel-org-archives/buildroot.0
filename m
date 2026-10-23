Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF784606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 18:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jEgFAoNU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i87IBXib
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E9D60809;
	Fri, 23 Oct 2026 18:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX2ZZ0Yum34L; Fri, 23 Oct 2026 18:18:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BACFA60906
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792779513;
	b=QIEnQazCnA/7ezyueIFZsRNdyVzNk9RCvQ8Kroh30cJ0hBy4mLOubT71GALtinOX4VPT
	 J9V1mGgEU+WjTSBA3oI1PhZnB1W/Ko+b2t5XLvBm2zV++oOuCq6z4QfhvvhY+8nUXiows
	 A9PjWEEMbEZMgWqBuFshuuYRt9h3XR2P9/WfAmxWOiimQjZvFPav3+Y2HFieJ9TNucJR9
	 l4DBgHF+G5Qgn6YJprD67AT5SLS3FGO+iok4bcfT/XMrUvjahtPzWI0+nSOv+xHUwq9rb
	 FtJrPV5wIqQ3RFVeb/lQEIHoFDed5cP2Sd0lyjNeEn6+Vpb1Etn+srxvqT6Zlf92hyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792779513;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=WreNt/bRdZEz3fX/7F6AUM5WPamLGzw3r9Ed/ZVqgu0=;
	b=ZbPO+YbHTCui2ehyRqqrW+kzHrhjQx9e77rb3oyAveWGe0jBVHK3XXss0517vHOeVA2j
	 roEJmdAjy5+hX1Xy0h1MeoiwSUG09RuWbiSFN9eg78G/BPbPsyP0VOXOdWedmVKAFyFmz
	 /2VcmNTBu6USvG6U9Et2yJjdPnKUz8qpfGEc7kHMMYb5Oha/0cRyiFRbzU6rL78x1HYN8
	 aKO/gNrV+BfHOHjeXH3oTb/+yOiqKPk+i9LZ66kN4TomVjg/2ah6Q+WMVMHIo1+3TUGEt
	 wBSZ6pR0WgQYh1BmVscTQ8rCL1r01nkIuMY2OOiY/deun25GZDnrbPVRDdw4eDo6GbA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792779513;
	bh=WreNt/bRdZEz3fX/7F6AUM5WPamLGzw3r9Ed/ZVqgu0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jEgFAoNUN+Z4qEwOZykI6zt1gt69aZkiC/G/H68nL7UJyp3S1q1iQyzC33Oe69CsU
	 hCl72yC6eJDw0A0LNwhK4c4RPvS0Gbt2wSZ7anOGgzJKxcKNVoJaS8J+3PFNS+DmUs
	 5tWFb+glwt1cmHUyF/aDLprlMfXwwb/f+JVfnB41sltSDNTZtPH80zYuiF00+YktcK
	 8svPD2pnBaBq2rhucCB/4zvDzBdRHgPp4yyyJotwqGowDep76zjCRje5jADNntcySO
	 3dE6/zI0gSAZqxFRlXRqvU9/jZ4S8ryn/QuOICi0O+gBX8aWB8JvRue1vyWJ2uT4bX
	 jr+ZvApcQzw/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BACFA60906;
	Fri, 23 Oct 2026 18:18:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 30CE512C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 175FE40061
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EUbnjiJkGx-G for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 18:18:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2122F40059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792779508;
 b=XdCF1wVPdfXZDzN/3sZQfCFOOuzTw/Cw6PCH4NZOkCbPuZt61Q99N15xs4swyNTbnkKP
 ew+BcEA2PDpPU8AEAdKWpoki5AcKWLSvUXw1kcMD96/jpBM8psxD1KPgh6nMdmB56oMB5
 Hsu43UJHJmKlLYr/S2PH8mAJBfE6QStxClh5syDGWHesVRNOr1X/5L1u7BgCBg99vIpKC
 HGLKWGUH2DH2LnW1ul+fMrN7GCWDJXqZOWhJNaGCLDg+UvoECEtKkbpYi724tPntmvmw8
 CPEt1KNgapQ4qCs5r/Y4DC31Zi9YyUivF2AaXUx1VIUBJ+h+iiWwVr8IeAILr4g9R7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792779508;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=tWPKo5b7JgnxPt0ExaiWCtxVJ1/E1Z3Xkxd3B9xmN5E=;
 b=DEoaYLWZ785TCVsAiMrDqOKDimEtYzLgjErXRNDfYt9zCR7U9OGUJMGBu+1touuSZ/Gz
 p2+Qcd9dvELacXsuxbmnJGgEaS90MUVxU/aO8YJ/6fu0Qzu0oe5xkyrcEgGvOdeWuPEId
 jmu8QPnQCjEbCIBGh4YgbLiVwSZarpRWj4J9xXJHSpGAUsLXw6lXaMtUpaJi33er9Q9WI
 2UVk6gEeaI6Q4PKJ10C7QcX2VBZv+59j6x6KJyG63z9avaJFYGe0zTrLlTH5dHdTZ+Kdq
 mZ5V/fnvi/Z1UxU55FH4NJHBXznc2Ae7a04esreTn7MPSHK4CSj0qFSuEEIvgfVphTw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=i87IBXib; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=i87IBXib
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2122F40059
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 18:18:27 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-70b81484c32so643300eaf.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792779506; x=1793384306; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=tWPKo5b7JgnxPt0ExaiWCtxVJ1/E1Z3Xkxd3B9xmN5E=;
 b=i87IBXibpyle3NpbPxcVMyG0fJVFNIAsu4tBoGEq+lLbnw3/kA/j3lcqIxEavessjz
 mL4DUK1PpS+rtEs2xS4yATxcBR9rMiuw+lzd15jHGgSgGgsYHi0bHE0+l/aCXK6DvE4n
 m3eakX8lpjaSOHjIL1CZdLVKy0e21TuiJCHGpBgpdZBrPPZMxy0BP78b+9aKv4ZIdGZr
 dbAd/P0UflSLGu4RRLbyUkWODfdFKE3Ppb053CRfV3ZdFIUV7zuMGvQW6QLWiP2qgGnx
 NT2IutbSG4HgjEU3oPyeL4fl5PE7VWBK/GQhedYFwVgx1835V7TsPtwXZPH88jGRglNk
 Mbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792779506; x=1793384306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tWPKo5b7JgnxPt0ExaiWCtxVJ1/E1Z3Xkxd3B9xmN5E=;
 b=yg52S52ShZ17Kn19G4Z/S8cEfXaJhkYvUBIZOix9TaVp17hE1XhOyDtW7muc2QE/fW
 EIJa5nzJJt8LR77NrpN6Qf1hhxhMm7kKpccsEgluEgOIszxne4JVuYGoBz8aeh3kZcVV
 fSQyznqIsojLeqt2NrEypB64wExVfRwnPXXy1Lw3wkmOWTdSi9FSiROn57JuMbDLTh3W
 AO3ipgt4SQKylFhvnVSks5PhnX11EUGNSPWj1KzZrGDpNRHc9je20OFz2kMGRranBJxW
 8ThegslBErBRLnTxNo8o0rDKzha/A/CDNW2+xG54h+OqLBZvre6XXp4CSaaQS5rI7a3q
 qbcw==
X-Gm-Message-State: AFq9FYK1Tuii6MvHAB+4txXsBAFlL6HZy9MBScNXqppf+I+Ip3FjVBPS
 ACKljeXHKJMhWA9cxZTHyHu8HGSOTg17Vxp3rMkGneUESEOajQRAwdrJyYwi6g==
X-Gm-Gg: AYBFou36mktsJdRTOv1JruGqUd9gQNosvRVrSlyu0MQf+jJriHu4c2EG2A63TCh2+O7
 bJ0aMSYqq3u3WD3otPdkSBu6KINHTJ9cGtos0ZgpU4ZTHVL1wTIFgV0roL77Ge6BPz41eYCtTns
 rAwlPlRuvdATJXUI70s640tupj18gHiupd/AguwxSc63EqOyq0tWMG9G/I1nD6mZmKLxkeK3i+k
 sfmCsEwvAgxL6giBGQmAyFAy72uPa4fbVflWOAQZeqUnK+UeVd7Zcfg99Zly7dgZYqVO4EUFPmS
 PxBJShOer9TxnWCIGnT9SRYaqAPRG8eT6YtrVM7eKsjn30Mmp48xVcx0D9CWRYMeRb8Ugxm9uXp
 S4T5bwQ5gdmJDav4gGFARVh97VkdX0v8Bx7uoPQrqtJ0Yt6/txc3dcRejh+5wFat61okjmy/ICF
 K6V4mpB+8J6oXucNmB1zDLIVf525grnLrzmlz293RhlquGJObaHR6PCDyqQTo79Sh+CK4wEau+p
 zoFTHlB9/rlN5fR/Q5U2LAo6COPmnXanb+Gqz4MtQBzGFqA2/9vSRqQsXYounih6uVURMjySfIx
 L62fbAd7dFqAhQXZNYx43NYy4iNvVAnDSPaOFon5s8B1HsxxEnonG2BAAeVZ+sMveZZxft9YAIz
 e/e63nx6A/84Z3p28O7FL/Fw7792EKBLLFjmvYyHTXDgHKWjI8g60AECb1GTICC+V4WLAFNQ65k
 AorV357w0QmCQ6mIcW3gbfCyO5ve3jZV1QgsahUDsqL00R
X-Received: by 2002:a05:6820:5616:b0:6de:ba4f:af00 with SMTP id
 006d021491bc7-70b88aa7686mr1373062eaf.63.1792779506423; 
 Fri, 23 Oct 2026 11:18:26 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9af01512sm725956eaf.13.2026.10.23.11.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 11:18:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:17:22 -0600
Message-ID: <20261023181818.920329-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-brotli: bump to version 1.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-brotli/python-brotli.hash | 4 ++--
 package/python-brotli/python-brotli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-brotli/python-brotli.hash b/package/python-brotli/python-brotli.hash
index ed8eea72eb..da2d58aa44 100644
--- a/package/python-brotli/python-brotli.hash
+++ b/package/python-brotli/python-brotli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/brotli/json
-md5  af164f216cba527bf6f24d09c9d3576b  brotli-1.2.0.tar.gz
-sha256  e310f77e41941c13340a95976fe66a8a95b01e783d430eeaf7a2f87e0a57dd0a  brotli-1.2.0.tar.gz
+md5  ac1e85a7466ee46d0ca594e041d7ca78  brotli-1.2.1.tar.gz
+sha256  02b2f7b5a83485efe448a44ddf7983def05c3bb1dcf917d4f7154070260e13de  brotli-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d180008e36922a4e8daec11c34c7af264fed5962d07924aea928c38e8663c94  LICENSE
diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index e2343a24b2..6f5e966a05 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BROTLI_VERSION = 1.2.0
+PYTHON_BROTLI_VERSION = 1.2.1
 PYTHON_BROTLI_SOURCE = brotli-$(PYTHON_BROTLI_VERSION).tar.gz
-PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/f7/16/c92ca344d646e71a43b8bb353f0a6490d7f6e06210f8554c8f874e454285
+PYTHON_BROTLI_SITE = https://files.pythonhosted.org/packages/cf/81/1546c983678a9b4e77cb4718eaedd1b2caf24a6cdbf1eb8775938d22aff7
 PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
