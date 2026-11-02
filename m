Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0D606A324
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bqcZCHGw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j6TIXDju
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70A82405A6;
	Mon,  2 Nov 2026 18:13:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cOLvJpPYUoF; Mon,  2 Nov 2026 18:13:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F5B84074E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793643235;
	b=Vv+Is+MDpz0u6JRe1lK8Ukt/Wsix+F+Iu9G8OfGNqhwJfiGDeDtAxZ4YzwYnx+UG9P9D
	 Y00Bxf1UUly2WXINP9sOPFEHUyHtk6sZplNj0Fv+Y1czGvILHnQlaVFKjY6WkpHHocO94
	 IEi0FV0AzRyhd3HuVoq4xtJW+G6fV0I8BzqzyJnR7+iOd93qnH8T23dn/yPagi8lLejJw
	 KeEPt89ANF96yuGIzsqLfppf03fmUNQV+JFAfLhMXyxpZbAkbbN/f38mmmZxK/ieD5ANB
	 y7i3mPkV7TEWMJzXJLw/hs8iQ+wf+7TsD+yDScHujDvpsBYiLbzU4X/raP9wdu3t21Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793643235;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Opaj4xO9gMiK38ZvCMe9hHVWg0Ercpzmxp2IjCBF1Jk=;
	b=d6q8TTLOSlZwk9OTrgHzsrpJB+rZlHGseAkMWMoidG5ErFzDxmnnG1Pee/Zff7eIHnDx
	 vhgImoZjycFrHdRUoTNpC21OjclKdBGDuFYqV5+3vDkmXjmrWVCVcpOjX+JLLcJ9TdPP/
	 U5i5AdGL7qHGv/MiA151hbJudj/Naje85QukoxeJM2WmqveckZEjV6+eYzbxkqkzB6qn5
	 kjvdbtaa/2g2eZMiSJHxuS2oZUN8VTHWIHsSpvScOWDrENmx4Gh0dtqo46zT/PEJ2Hv+x
	 beRiLNwz8wIGsUPrcMkVy+YokvjCTVktIiUiDwBSNi54sFlGmv0TFyj5SN85PDshrpg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793643235;
	bh=Opaj4xO9gMiK38ZvCMe9hHVWg0Ercpzmxp2IjCBF1Jk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bqcZCHGw3ayBWw+sey3iTR+xzXqUOjWEqZdX2kxWsED85IFfgvA5m2iiexI7Y6fwM
	 wvdTsO5lheVHPfNR74DlwhTSqaE2gkHdgd+2QeiUX1nUhtpAHv33oso1Q8AVGhQexM
	 Z9JVgOpcRNMvSnoJFLenuL0udcAkwHkA5qbnyOTGtNqL3VFWqCcqP9yXmy9hT8sle4
	 oVieGDyCkILfb9mmKnZc5yfb9KPmSrUxj9hZw0KDe73mn4Apyc3m3fUpuFvHKclGSB
	 zLVGNl97NaC7dcTSg8K3WUF0a9omr7frsILyb70aOl5dyWoR9UKyvE3mXguZNRD3ct
	 Yo5e52eoby7pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5B84074E;
	Mon,  2 Nov 2026 18:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACE364BC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ECCD6063F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xvZaCY_vdVgy for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 18:13:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C01A660601
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793643231;
 b=Ztj41X09BZsTfC3jc09sp8UMDUkGF9w2gnm8g16It3peX55kWvfUThK4gGanj1Qg2dT8
 ewJVtV46OtRZ73ViSYoyEdiqSKXduFgFs3EL8/qow4LxHE5j34II8QIODJlvoPU2BNISX
 cT6G5jeNPOV6lHZ3jAEjjusduP9bt99p3JrOG03yv9P9w2WJy3AejMVxqsNVswRKF+3Bt
 XExeXyBWTI7E1hShpsI6CNcmUtUk4LMiq/ueI4xhylAc/R4aBp0PY34Vugbuvr89cN6VM
 sIe1/oVzCEsvk0C9BqvTvnvpSfjpvrupaqyGvIuxvWtxdGU4tIeeoqyAt3V7gmNXEQA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793643231;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=aR/CxFQ0RQYDWb4G9aoWLgPVnEmMOtyrmsNwLv+86ec=;
 b=pJPYZRqH3FN8YstBgULTN59ao4NFaSMoFRFfm4RnUpdqBDk7orLDrYyY+9rDYtFh8bBC
 CZG9unL0T0qnX2po9qjyYgTLxIVoTmeaKjzOemLm0xp0r2llMivUBm6JdhzcBCy6VllHL
 4WFqFMTTWt+WMea3IIke3NsXwakPXSnMpQ8R20dOcmbATPFX0GT2HI1lQv77U5LsscWva
 G/vXWs5BuMxwfjCxXnnK50PQOraxnVJC4kaz/RE22JfsJydlyBsD7vPyPJ0r38GUxxoYM
 9PuFbRM8ilk0M8E1aG9bDep951oisnIK4893p5r15SHxfCdAj4lhkrpQP8VNnIbHEyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=j6TIXDju; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=j6TIXDju
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C01A660601
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 18:13:51 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-4a451915d8aso2568405b6e.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 10:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793643230; x=1794248030; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aR/CxFQ0RQYDWb4G9aoWLgPVnEmMOtyrmsNwLv+86ec=;
 b=j6TIXDjuyAHDWf9WtebfcVj7kktZjC7cc3akunKVmfkBA0irWzvKIGh3uZwshtibUU
 6fxy3RyO+SvItv8X/icPFYB6taj68lU+UP5xlV133gr9vTmAatLY3dycjhuQI3JhekWA
 fyQ2mgTzZZakSK3rmhwieFES0lRWhjvgYnAZLj2OsAKZF7hJMNtMvmuqeYtkxyyE0tI1
 tv7q7C6w2esG1XUpm9bmVYva07WJgDZbj3TxLqtWm/HANxNHpmaaRX7XdubfOS2qWUMw
 aIp13mMgljFvSy2ZQXXpV5V+BZZvfEXmxuaX7HP+02kgAXTTNAZBxBkAlcsHDfyPp37f
 CcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793643230; x=1794248030;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aR/CxFQ0RQYDWb4G9aoWLgPVnEmMOtyrmsNwLv+86ec=;
 b=JSDjJrwuy/jYWhfg0KP977ql52KsnPTUYX/WIZtuQ1KQJM4+CMJ34mYzZfFcbtwhi2
 GgLqLWHwrIQko+fRlCkoUt7ERczP5dEKmt3jgznF2+6tpLHb3Zxc0jgReRSt8MV3Rv/W
 sBgYexTeLDQgMzaHCM05AGYdorZ4Tio160v2ACTOfcvcEK7O2y0xUPTv8rN2LgwOzXNx
 +dNk1hDSTaq5F7jhLp8Yd6pMABzxuCaaB1TsJc2f3xqQ6L6/75B4tgAXLtJi3SWYfXN4
 KMIE9Hivta0lkb8/YP3RbpeiwS8O67LkESjDd//5FjSol15U2srjrbwuI2iVibHTXz7+
 m+zQ==
X-Gm-Message-State: AFq9FYICIHZpGSaBr2xbka4tg4hsj4NjjE9edt/dKxTp/f7W1ruHS5+L
 QzjJ1voZJO/P+SRyC55bNr+KrTjwmSwQlB0DP1+OqUXhm8EeJUALaQtofXw99w==
X-Gm-Gg: AYBFou0d+WdnfO7PesJHqrxDiwDzJr7NEynDe45Q/Glqx8/Rzl4BnM6J93HzYsJl4wZ
 26lHyB3XLG8co72zfJx/zhBmXgCwlpb4rMEVuj5o7cc3VdDQRaaBqU2DFU2Zg0Pc3hfk5TXbNAh
 aNm/fx+UU+YT8l6qwuMhxsQ12450BASljIkEN5C8S499r7RKGuJw/FUQMle/5uKg+88hLiwGegs
 8GtKSDD6g2+XrJPM7eWHwcnTbzJceUmtqDUKETEwHn3NrMgvrzMznuumfKFu0hZ5q48SUHB+mSe
 JpDS5M4/e+hYOMp+b2VHwcNEmmhCf1MwlCa7IKYa+rq6ICVSbWkmnwSyTO59nhhLqLODYAl6wl9
 3Dj+vg1kvAD3HhZYEcKoiV/xOtM0dS12fRA20WkaGlWVf/Djbvinn8ODUO/aLHZA9oBdpZzd6ZN
 Eyesr14lZX4RvdW16SRJmZ3N1ukDQA5ZzaAzPjmc2H0kDjgqZtZjtdiL1kX4cXD93qSCPYlatnJ
 KQpTA1aCrduNZKNcXDNyLrGuQ38W7+eWV7MMxfxUaQlaVx5jCCYZ3PJPZjS6euFQPHLTSkLB/Et
 fKZ2Wole76syQwIhPwnSSOPybKCeDghZm13deGsCR+asOoZvVHuWm+fldASgBw1MD5gp5rSCgEJ
 a4pZUD3RcZP1Lf3NdtyzoZ9QW4f32PR2G+gbfc5PIptuuJk/r4uFORi0BgI31L/TewVTQGJEMQS
 gLaCY7tgee0IHTP3vWCX9KGBhwiD8InHq/leJ+TH3Jb808mwew1cKgTKgGzg/vFcyHnPTvSlKUy
 9oJQj/e5QsKMa//5O4eIpKb
X-Received: by 2002:a05:6808:148e:b0:551:a229:c8a2 with SMTP id
 5614622812f47-5640decc467mr6816740b6e.64.1793643230130; 
 Mon, 02 Nov 2026 10:13:50 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5640fd95562sm8445016b6e.4.2026.11.02.10.13.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 10:13:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Nov 2026 11:13:34 -0700
Message-ID: <20261102181345.3238554-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-platformdirs: bump to version
 4.14.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
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
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 073f9b002d..dba740657b 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
-sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
+md5  7c9ce7098f9d717b4a0614fa8656f871  platformdirs-4.14.3.tar.gz
+sha256  021add1ab113483edbcd4694f5fbb2d688b893ea30d35e1155bb371cf4be0be8  platformdirs-4.14.3.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index f6da1e5498..fe8d990be4 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.14.2
+PYTHON_PLATFORMDIRS_VERSION = 4.14.3
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/9a/6e/886dc7c9d21e2d95aceb696f1e31271742033aeef3661f6e9c8921493592
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
