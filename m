Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD74606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 18:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GkuhBFzo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rb9u/Z1o
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EE740853;
	Sat, 24 Oct 2026 18:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SfxU9ILsV0tt; Sat, 24 Oct 2026 18:29:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BEEA240891
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792866569;
	b=hFg00MBQFiJtSfz6QxMJfpZdAPQKVlG4ReB5ztG4qRI7YeuUMueQqwki/cQkovVPIpdE
	 BfcWF2y6vg9ggfttWr9JiVNUnLg/zBGJnqIzM4Ff51NWa3d97geOTAB25QTOHlmGVcLgI
	 ENy0pFynYLqg7h86j4C31GhWFwckBUvMTVB5Y2CSsVVGINj7fbbgilhYwYcswZfOufvnQ
	 xA5fL2pIX7ZwSqpp5dQ8IUGewyyr7z/MX0r4y5w+nZ8izgVmES4VueezTb167/1ZED37b
	 Bon38sCEuDMLUrXk36bdr0iww9W6MzJVNepkGFx9V5bjZObyrfhtk1zqSdPbjDRRb8A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792866569;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ud7DVK3YLgWbMZgd++mU0cOaioo/gWqfbPVyG2TTTEQ=;
	b=siiK0sWuz4MlnRKM9Z0zH+oTuv93F7UKYmRD7IJi8T1VNW1BZ+A6VFkEPrwRbd5K+Qdo
	 dCKEjNRBdXsyasSoXlg8pbstFYDVZ5L2nZILS/6pFBxD1qk81GO/vNoo5o7WFkufkTQFm
	 nt228XKG2x/fUwTnOpJVuLNC+HubHwGLmwv7bPEPoKusqmqT2rjpZPvqsbda6sYR66rUb
	 FDzE5h+O9yVayWfCN57vBhz6V51Fy/d0a6e61bx75rVV9iRnsG6/KL2HFwoNV+a0TV/ST
	 viS/LF9Q8DvjGE8HPvi3R8BtU7HBPEPAeDYqYqXxuhil+DeTWrkoD73WrhRxNlaubJw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792866569;
	bh=Ud7DVK3YLgWbMZgd++mU0cOaioo/gWqfbPVyG2TTTEQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GkuhBFzooJlUOUuVoxnzWDSJE8VX6D8ZM4s71TXUvh48CdQwP8QGGvIyEwC2ODpD0
	 tThrfDeDJBD9GXqopThMd027EoaQoCkWSRd2AHRJ5qd2Kdv4xBbA9b6hCzkPWgBXZm
	 /rl3p6OU7Ph8a2zxzsULsK4En5HppRGubemv0yU2YmZPOWmt8AV8uiSXylLM8y0wfg
	 feC4SWYWUPjRGmMWSa3tDLHJMRrUZJV01O/hYQFw7khhouRX93jjIKbkwWxe2qxd4C
	 93M4jqOv0rhg5EKkxin4WyfI1uaYNZrrqu8KQF4l8lgGMHaba1jAgBKo2tkktovqHl
	 XQ3bwdWV+GMtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEA240891;
	Sat, 24 Oct 2026 18:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38B354D1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F19B60638
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT3_Qy-gzDzI for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 18:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1BF7B6062D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792866564;
 b=j50ol1dYrhCrSofLykrbDPkHqhjYC/2UwrurZMvQ9jukDaoCbCIC9T2RsfpBT2o4NTAV
 IXgCO/vQQHnKoVvJ3zeJ7M1MZjVGQCn2I9bxONV2vdKyVyDw8V+iqvgE/CGTmyG8+FtKV
 8h02k0sTnoNtZKA0RoRHoVwLx8srmkHobB0urApAZeO0Y9lxa1/vL5EcZc+3ZocYiDXnI
 STZy5+6uPzRnwfc3vcrgP6znQIly4LmZfIvTJRQuvMJa43aXzjTuhGcm6SjKQ9j1jedln
 u+K2hByqxezyhWiV8Nu5ynhWlqH1IYTqafsh+pzeJU0WCGvbg3t5AXOZFcUD4/Ay3vA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792866564;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=4A4RsqlILbckD82OIdigLEqMsueQnrLiKdD21s23uzw=;
 b=L7escxDh8TK3uCSfp9A4HPrQIXnwikT9usX/xauC7VWC/989bImGxixVzd+Zr4FLwRFY
 JxDlffLZRDkdrYt+FV4vC6JuYdtGIHki+O+87+3blyXufRC5643dMlRfK1S4j1f0SCN4Z
 6luPhd41ZRqMji4usYtdUYIefGWCEsR57FPL5lU4tAALwzM/QiPWDt31TTYGzl7SgF0bm
 EecT3LxsyPMepqPeZvnS3ndmx7RCrakqkEObyor++Fbj5g5o7+IrxFYoSvpLSeEyVgjb7
 zPEf38Ngjb4gzEECePYyNdt7DKGXksVRbccTmrPT5Yxsv+tY8v90eoSdSrsz7nw88VA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Rb9u/Z1o"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Rb9u/Z1o
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BF7B6062D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 18:29:23 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-843b6f8e2c7so1587991a34.1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792866562; x=1793471362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4A4RsqlILbckD82OIdigLEqMsueQnrLiKdD21s23uzw=;
 b=Rb9u/Z1olPxXmmefD6fQ/BJYC2OcxUYaJBEga3gBQRMtmOiIM8yEN5M4at8LtTBeNE
 SNAKkuZJjZ6eBp6IWV2xEAOTQ7oQk6bEYBGL769XvdhTd5/xXjRAACipOtnV/74UdtvU
 U0hi7GZigNUwukebSCZnOAQGEXoh3NNCCINe/+QY38HkfqxTkAQmeRjpP7lxdTCA+4fk
 Zho7WmxyzDEx5zwp6pFVDKg33JK6PY4qfsWSL2uexfPNNf4Yij7C5LxXMYMFsaDuIpzr
 v3kzOW4dv4WFc/D852T2rP7eNVx/oaif/ANudDnc9tmOoTf/K1YCCO2BI+7FEQKGzs/a
 fsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792866562; x=1793471362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4A4RsqlILbckD82OIdigLEqMsueQnrLiKdD21s23uzw=;
 b=21W3+5HZzw0x9+ZJspwk7nkjSslewDBrUCsT+YnIz8FvvODTaG1SOPgJS6sqY6rlHs
 RiISaPmVivHNighvI+SI5dcxnmUDRrfIaCYta82zX8mzesVUorLID9rlQkP3uEVzwh+B
 TDcKyn7NzwGm0xqK0WJ5DkBUo1l+jvFI2rKjCCdZIffwAFziElPPtvpYr6chsRDy7gyM
 kgxfYL1WW7jmuO6YVZFgNGQNys/2MWDni9ullDk1VZY6SfCFOYiAIl2j9u1H8ZsAzbT2
 xsKSJ6mk6yHURHtv0aY92NzvRC9qGPtarzEyuZCh9I5GUKNQyCKJVJ7q+Sb9LmWbXhx7
 p9Lg==
X-Gm-Message-State: AFq9FYKova4lVT0uXsDF2YydN+cyBYwbd8L0L2X01dZIaZoo9VjWHQ9d
 pq3FSQtEr8jiGTSY6CfG6l+5YewQSsZlUtPtqHra44tjNP0wLL0n5xAx9EPUcfrG
X-Gm-Gg: AYBFou3VrU2ojavVnN4ca/VHwzVa8sCc4rCb0WXV2z57NmmV8nyad33TJTnRvJfWK+l
 Wqp0C1U25Qf1ONGUvg3r/rMjzq3Kp68Hh3kdtC+D2gC3yhApVUfCH4pOv2qvJn7U19y2kSeY/1x
 HFCHOvppuDY1yWKro3NFXrjkzI4PXFjLRQr+JiDINYmCzfAN5PpJLaCogF68LC/826xI4CvbfxA
 NZBOOh86o1kPruQDgmXzXzHWvV+G5x/CCwY6lbRjFl8ZyAkUT7kfWsR+3uHlbwb9OZWuXcobJ3H
 jK/0MVtc4S0hwp0Ny9E2U5wLJI5G+ip5lBuTuHhRCXtzFxw7z+IOy6kfstb9y67kbexqsAhkpPb
 fqYxotf9LpPZuMKK4A3qz4DGcC1zZtdB6hsi3SsXUqhbrUOOyXdmx/9stx/3XGTwkuyrS1qiPQn
 /2grK2eop6RVLhddxcwWIWjpSdMWAYBehWYBqfIjx0+tJn/hVu0ChvgMgbemtp6P4VA5itjLN7H
 EQs2AU6ay4eDcZP+Q1pXwOs/a1OxsuPynSpJWGVqBrQItdpayMfgWTrTbNlVSDrHfJxGcqJ/VJ6
 nMorXfQP2sNkgUDa7uHPsxcFe2tI9yCXp5oo/LAeh3sD4DqIJ63ALsU7vfADFcJvJNWnlSJxln3
 Fo9F+Sun1kWXO/OCh0myICQ70cZAQcw0+VYOaP2XeTJxfKiBj1v7xD3HLfRP6Td8BAJXXMLTS5F
 H3Spb7Xc1pIMNmucES49S8Z3CJ
X-Received: by 2002:a05:6820:8593:10b0:6e1:f7f7:532c with SMTP id
 006d021491bc7-70ba0e4fd97mr845484eaf.40.1792866562328; 
 Sat, 24 Oct 2026 11:29:22 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-70b9dd3c9b5sm2634336eaf.2.2026.10.24.11.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 11:29:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 12:29:00 -0600
Message-ID: <20261024182913.1957467-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-starlette: bump to version 1.10.0
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 1794b6b28b..39f138ab0b 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b5dd1c0ce8c69609544f47cdc76417c3  starlette-1.9.0.tar.gz
-sha256  3d931de246ed870e35ce605974440816ef895e592f255d1396cfdf191d4c4318  starlette-1.9.0.tar.gz
+md5  7dae95a2bcf8d66d76b383129ff2f2ed  starlette-1.10.0.tar.gz
+sha256  b8399098d4c1e3522734f7235dc79b1fc967f96cf139c81e0fa30479e0685f9b  starlette-1.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index d9fc4a221c..4a79dcd095 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.9.0
+PYTHON_STARLETTE_VERSION = 1.10.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/ad/eb/4e197bf26b023abafc5e9043ec8710d7de0fcb032d0969045236d72aa0b1
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/48/bb/3d8757f21e9a53d9035c9eb039a777047139a16bfdbedfc7a58241c3d914
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
