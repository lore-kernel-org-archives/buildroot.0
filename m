Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82B606B6E8
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a76TDyRs
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C276074A;
	Tue,  3 Nov 2026 08:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWeBL40PqDNs; Tue,  3 Nov 2026 08:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA4CA6060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793695511;
	b=qx78uUwGb4Vyf0Rnr6fHnI2SSQUr9s7raOTTc+sYmzebaEsYYnZgGhjeEBWGUK79qH84
	 V2p4WfU6wv4YOa+vdXFy5P3vKKE/FtCHJ/oUvpL7jM+ZPiFiZidbglAU5ZlULWu8snGkX
	 ZmT4GXMBoGUDEEwMyt5UwiEGOUBIxBeh6ACjww38/PydMX8r+ndE/Y/oztrHgymPTisKP
	 Hyc2VlI5AKrTOMWLjlk+Ym81MKly40PJBggsviIaRTKJ0T//un6GzAv+KuuPnOfAH/wbj
	 ARSSJDPT/V/l4pEU0db5F6/yiBx86m6uS8r2aMyrLfAJXKaMPl8IvxuIx+c3mBHX6Yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793695511;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VrZ7AC6qK8wY8CNlddNXmdY29ZTwxrbD33qbAjw6aQg=;
	b=lEmz81lV39GPSXCNbRIDgJvexN1hUrUAi+JXKeAAFKRcUOox8MrFvhqPGDYGOzH3SicY
	 NE+Dm7b6siaBfqU+fPJcry/O/R6fd/FQG4VgKTZIzCrcTiMx2zF32Rtp//7Bg8bcFDHwu
	 u4+l7MxTDtVztQj6ytbpHMCMWgs8GyenlACI8lr760QiomffQqRC39Lfhr0XH8VlIxEK8
	 YfdxDab0qzj3qRtceTi5CcPiEN4/ThD0oLp1Tjv/h1iZkKRymAsG1iYsM2ljc9VehtGZO
	 0NBsPLPa5/wKOpgILCotrEofBMK84PtT1eghjMMrtUis69HO/++uGrau10BKqiNVdHg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793695511;
	bh=VrZ7AC6qK8wY8CNlddNXmdY29ZTwxrbD33qbAjw6aQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a76TDyRsKZuWyC9TGTjWTT9u3bwrwWf1ZU6lnbOM2J1iD1Sk9BjlAlLztuGo4mJDl
	 J6z22Ksa3Cr4f1STrxw3LMYex8ZOkd+qaYiYAXWQaQdaT8lSduScZjGEVsJ3r+9PY/
	 4KvU/MoKjKMbvu1aKsQpv6hg3TCderMtL0c9bnme520Ig8rAPvCMd036F2ui/Z5ti3
	 uAaJ8MPMhRXkTb6ouuzSqkrLhuwDsPnVgY4G3VcP+fnloAnltCMAoXZPB4+PqfkuXT
	 WbpHOPz1JOU9PLXpCSw/t+7sQPLMm688JNL5fx0qNi1OHVCxLir3WvUkr57gKX+8jq
	 r+NUhO3HRTQvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4CA6060A;
	Tue,  3 Nov 2026 08:45:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EFE411
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E20AB80DE2
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:45:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7YjRdwEbass for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 08:45:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 987F880DEE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793695509;
 b=X0Twur/Zu4j6sZiYLduD0Wq/oi0BRS9iEwzYaGiS8uqH2A0M5Wf4HOWBRF6jq+PZ+AjD
 xPi8J0Kviim7y0NzcoBqET8aW4WjKsjGJz8xXTflAamrEbaaB7SyKEh3b1C1EHvjHafSs
 pxbQ0viCIYMcWkA84lbou2LobB5a5ESMIoFcNneRdRTAqnbH9Rox0HliSUAp2T1LDftFV
 g6qGDf2apk9TMRgOuctkAEbzZJrGaITOnYJnpCg9B+1ek7FnNYXVxyGVobXDvcD+TVisk
 89M7pUS2ogre9uCMvT+ClEnUJGIfMoePoBp51FgAlkc6l0Jm8urWRcA5KrlysKq5Tfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793695509;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=OZB9NTtiFs9lEomhgwsg+5d/T4ySwBVZrrVFQTAeaqg=;
 b=kuIQTx00MsL4M6EWIkh124gsnvfcuEeReN1WZCwl8OZ7yVIrLA6HM0tu+v3bVVGhF8fx
 1Su6JFZuGsTBZgkEJ4VTsBB9bNG3BVo8QWwGieATQPm8UwMOOgkN3huBIfY5lEWii6VLz
 bIL0ZxVEx8ekEwHOq3+nAwu5iUrvLJEAnl98FlwBfLzVwznxNCCv7Og3hiKTPtus6KGWL
 K31yHu6T9DLhCj9axdJkBXKX2dPAWXawgnzS9w3DfX/1zGpjLWWbSdeXJHX+TBmM2OS+C
 XVFzoWUWewlFDmSIB09ASYtoLG7itK3HfzHyWE3hKYtnH8fqLCyryCArpCZ1DMCVQkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=Ypfek5VM; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 987F880DEE
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 08:45:07 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c4322d310e7so627081766b.0
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 00:45:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793695506; x=1794300306;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=OZB9NTtiFs9lEomhgwsg+5d/T4ySwBVZrrVFQTAeaqg=;
 b=G9G5+0yyZUvqJT5zyZ+mYgJm/5OuFwWkxJRYOviNfziYCYs5QNMhWguGHgb82lm4yU
 i0uw6a6U2WnWr8hYOKCqSgEPzS7OFzU8vut8/H+vzIY4ma3+YB3eFHb/5jrhTEgL/uQe
 HvFUNCoJ4nNHNDyf6xJ3fn/wHFCrtCM77EY+9XQmXiA+NVl04G1bVpbnWgfvigcw2gh+
 S5CpXAlT1i/g3w2TYWK6i9PRJpsepSzxmNwQ8lIf/1KL5eWl+zCzUZF5BwX1fpAPJv4l
 rkKh73vp/soi5FfmpnrfzGU+iLvCCqAdH8PoYE47uOTvVAviI3Rq5m1w7Ad8VbFTMBHX
 +TmQ==
X-Gm-Message-State: APuU4Z/HqdYzkK8Ha7LeRXvSaDO8lbjEwvGcWiss3L8c8904L8G4UeqC
 /jy/BF5ye9guYTiwwGJUkQhbQvpi8n+KZodQeksrr1JCgGkMJs1hiAt8w0oyJA==
X-Gm-Gg: AYBFou3wRQDlNMAf+7IsU/TVRIa7zIohFxk2ioUX9IAaLq2eLVKZfFm6jkzg+fyvOhP
 LRrV9JqsRL8XmNG8sbmhGQbwIn4JiopsRukg0cO4OL3LD6L5euFPWc7l2rwnsxCZwouM3SUcxK8
 j7lhXPTbknYA0Fdxn5cMUd0nrIeQF+CEoV+HycCnyWh4kD7/g+trifGlPQSKwyD5/ugTBOa4oMR
 poprwK6ms5tjp5CTwRwt3JcwzCEJr76q+Qs9bjt9mLlOW5XXCHHS7qWhFgjXaqQOvpEfPMtD4BS
 It3v6d2PjJfj7eZVyfiVZWpuJ/pW5wVWn/y5nCLOfS7YIUykBiwqgug1bTCNw139ivPDfAHLgkV
 2E55v4cuGaeys+WMXwxcUUS3UEqDwWRvW42EEjbNLzSG+6kubQOAB15DIYpqV4Ivw219koLO8zu
 rg/77A6gMFQXuKhIv7SHfO3QxTuxjhOgiWGM/PE7gPTDJd7l8e+96BKgirG8ZNIDDMe38TQ/8md
 Gk+4uXcL6l7LOoz/qwAqTblkWodTr+gSlMjSyZZdmqubrrAP6gyM2PlX6mgqmYw0AwY0sZxMBEE
 StQtinmqFFc/KzPYatiwELScfZasOjBgiVXlB5sIgVJlnJ4FPh78QjW3+zQsWE2lDJgN+KHAiwk
 j1GTAxE+6
X-Received: by 2002:a17:907:9612:b0:c3f:8c92:3b51 with SMTP id
 a640c23a62f3a-c4ca793c5f9mr1054011866b.4.1793695505865; 
 Tue, 03 Nov 2026 00:45:05 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4cebec61c6sm64935966b.17.2026.11.03.00.45.05
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 00:45:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 09:45:04 +0100
Message-Id: <20261103084504.3957155-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-netifaces: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

python-netifaces is no longer maintained: its last release, 0.11.0, is
from 2021, and the upstream repository was archived on GitHub the
same year.

It now fails to build with musl and GCC 14, as it initializes struct
msghdr positionally, which does not match musl's layout with padding
fields, and int-conversion warnings are errors since GCC 14:

  netifaces.c:1808:9: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
   1808 |         NULL,
  netifaces.c:1808:9: note: (near initialization for 'msghdr.__pad1')

No other package depends on it, so rather than carrying patches for a
dead package, remove it. python-ifaddr and python-psutil provide
similar functionality.

Fixes:
https://autobuild.buildroot.org/results/dc4a82870828e575eb3bce1b6ea1b281e6e68e8e

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 Config.in.legacy                               |  9 +++++++++
 package/Config.in                              |  1 -
 package/python-netifaces/Config.in             |  6 ------
 package/python-netifaces/python-netifaces.hash |  5 -----
 package/python-netifaces/python-netifaces.mk   | 14 --------------
 5 files changed, 9 insertions(+), 26 deletions(-)
 delete mode 100644 package/python-netifaces/Config.in
 delete mode 100644 package/python-netifaces/python-netifaces.hash
 delete mode 100644 package/python-netifaces/python-netifaces.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 29c9b7f9e7..8e48488d76 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_PYTHON_NETIFACES
+	bool "python-netifaces has been removed"
+	select BR2_LEGACY
+	help
+	  python-netifaces has been removed, as it is no longer
+	  maintained upstream (repository archived in 2021) and fails
+	  to build with recent compilers. Consider using python-ifaddr
+	  or python-psutil instead.
+
 config BR2_PACKAGE_MESA3D_OPENCL
 	bool "Mesa3D OpenCL support is now provided by RustiCL"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 32fc1496c9..66d38630ab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1278,7 +1278,6 @@ menu "External python modules"
 	source "package/python-nats-py/Config.in"
 	source "package/python-nested-dict/Config.in"
 	source "package/python-netaddr/Config.in"
-	source "package/python-netifaces/Config.in"
 	source "package/python-networkmanager/Config.in"
 	source "package/python-networkx/Config.in"
 	source "package/python-numpy/Config.in"
diff --git a/package/python-netifaces/Config.in b/package/python-netifaces/Config.in
deleted file mode 100644
index 1f54f4bd18..0000000000
--- a/package/python-netifaces/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_PYTHON_NETIFACES
-	bool "python-netifaces"
-	help
-	  Portable access to network interfaces from Python.
-
-	  http://alastairs-place.net/projects/netifaces
diff --git a/package/python-netifaces/python-netifaces.hash b/package/python-netifaces/python-netifaces.hash
deleted file mode 100644
index ec8ccf623e..0000000000
--- a/package/python-netifaces/python-netifaces.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/netifaces/json
-md5  3146dcb3297dd018ae5eb9a52b440419  netifaces-0.11.0.tar.gz
-sha256  043a79146eb2907edf439899f262b3dfe41717d34124298ed281139a8b93ca32  netifaces-0.11.0.tar.gz
-# Locally computed sha256 checksums
-sha256  b20b895164b72b9cc0170e6c0d60b14f9aaacc6862c0556eed41eaa348883705  LICENSE
diff --git a/package/python-netifaces/python-netifaces.mk b/package/python-netifaces/python-netifaces.mk
deleted file mode 100644
index 1b1aa99568..0000000000
--- a/package/python-netifaces/python-netifaces.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-netifaces
-#
-################################################################################
-
-PYTHON_NETIFACES_VERSION = 0.11.0
-PYTHON_NETIFACES_SOURCE = netifaces-$(PYTHON_NETIFACES_VERSION).tar.gz
-PYTHON_NETIFACES_SITE = https://files.pythonhosted.org/packages/a6/91/86a6eac449ddfae239e93ffc1918cf33fd9bab35c04d1e963b311e347a73
-PYTHON_NETIFACES_LICENSE = MIT
-PYTHON_NETIFACES_LICENSE_FILES = LICENSE
-PYTHON_NETIFACES_SETUP_TYPE = setuptools
-
-$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
