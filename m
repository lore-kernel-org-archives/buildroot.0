Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC6F606A31C
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RN0EFDCX;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MQj2koHd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE3D607A6;
	Sat, 31 Oct 2026 17:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u69jf4VA9Jdk; Sat, 31 Oct 2026 17:21:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9428160748
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793467280;
	b=MtUJfH+0qJi290EiSBKvr7Tw7YnRSKIMyLlT0LON46s+/0wpzqfERFbeRY96OVQIiAs7
	 xWjfBJPKcczU6T8AtKnb0HpcyhSOxjYT9pCQQwNTHlR5fVK0j27BOe3mukaQE5lNAxBuS
	 9Z65qm9Q3uusp4YLkrphlbYToECXQ+NIQxylEpQSwMjiAXkYtGKrDp5EjV3BbIAOux8P1
	 gYO0VFQcsVxbgZ1Tucld1FGI5y1czVpB0+FTjmGb3P7n+p+XihFR7s9LObw43jDK6OJV6
	 PPQUxi8U5gkwv5HPRaHhewVQv3CmZYp1mkK/A/ls46iT1SGabYoIVwPhxI7t8sL4x+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793467280;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eGXrMY0ky1/bfXMhCVraKq2K1+xFLZfrUaDxy+909Fk=;
	b=ldwnc1SiNwK8vZWwBtpoNoKHc3xL0Lr82wKl9AcXxMu+uh4RX04VRObnPctsgB5+uvlE
	 oZ6+HYC7jTYX+MF/rrVFsRQQ8mzuITDzGqQMviWLfh4XmbmRBhMwL3CjEenn9/W0OtOO8
	 ZzjIpDXeuwTuzLPN27LBQ+H+bocqYqIYNZu4FN/v7jKzCsXNXUJkNAXE+Fg3ChKtuxCfY
	 +HVy7rSQo78K2l/sc5q1rgQw2nBJkoFsR/ZxjBhTvzHn8becdH20nvpRL0iWLn5+YW4D9
	 HIiJeo0wzvGrwvnviH+eeSY6MqxVMooTAbe/kgba/bobytW8w0zJUIGY5sYZigtwAKQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793467280;
	bh=eGXrMY0ky1/bfXMhCVraKq2K1+xFLZfrUaDxy+909Fk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RN0EFDCXVmsqwSPky3CGsmQHdnCpPrpKaYpBeqAsTe58eyWXMJCVBcvFSCFyY7Qir
	 QneP78ua18cNxUc0BPHUiE4+WSP8ru7U8/P1hQAFc5Fogihu612Ae+hznxBXb6/TAY
	 FTvMK18yTVJvsTeF1HcwZ3as/XZuqbzrWnwoZB8R271r1RRXjkaEQHIM59QA1GC1m7
	 /3FUBA6/zeoKasB9NuYGn0ddDH0E9P8pEytgMWGTb+YoYllpGZdDPClUzZosXBhxwU
	 +tmfsRogXOSTRACzmkCcZlUOl6xvHJZPQAVSK4MN/MHgiHTyHPFTyR2skf+iW8H3Jz
	 FMIUNivn2vj2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9428160748;
	Sat, 31 Oct 2026 17:21:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80740411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ACAC4035C
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgzCGhaAcnCW for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 17:21:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8BF3D40355
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793467262;
 b=Dr7yIKlGY7Z91s8XAhRxOFqmzIqcpbOdm1hGdRp7CRjzWyiw0e/rsmnjcsyNIvkW21lR
 CS9BzjX2cdoVqUlt0k4cqZIePMgIpUorAsty3R3aC3ALlifRhYRKLAwfYMp0snmnUA7xs
 4YG2F85nAtsGbd+YBGVlVEFut3xYNzP7Fdsgxy8V5bmI5RQ/CE8eaglDtCAiIuSh6z9mT
 z2C1KLvsv7Qm1MAFfJmtEMBUSUo+S86eOsjpnHhWdDpRxAcV6QmrMlybTKNCkpP/jN0rh
 8vo9yocdFsp/vGzoNCV97rnXN1mQJ8W3alCaDv8tI0qCnb37wskbQI5IKIvUx2DddLg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793467262;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=UtVj5JRU59sYi+8Ku71BaTdYhW7DfNLR7kGnkCyZCNM=;
 b=ItN+3rNo2XF9Gq8QR3K0IC39RT1Uk+hudw9TCuo2Iu44Vvj0ol5fnePh4u8kbGN6ZOeG
 Qimbzk9RUMgqjUWs23SbPgALymog+ySkKLwi3U9SzsQsIZo8M2wkrGzFLYPgQjftVVIdv
 kZv6GAAFBQRe8gbXJs11pcU/IVMfkJ5wEqR18k5FvPxQHgpChWAmrkdfySSVY4FPGggmg
 wNk6p+gT8gZlSeQhpE1hJa7yCdVERG/vh4acR5WtRIJjeQWZwd55tUSmNrU62Nl3FHWPi
 OxiSrVwJzVVK5LiHOh0GZxy1vPgJpFyVm+53kh6s8dISEnzVe3oyhyGyJJndR9+QRmg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=MQj2koHd; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=MQj2koHd
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BF3D40355
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 17:21:02 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-84621d8c7aaso787170a34.2
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 10:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793467261; x=1794072061; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UtVj5JRU59sYi+8Ku71BaTdYhW7DfNLR7kGnkCyZCNM=;
 b=MQj2koHdNPkgIY6wTzyJxZWoUd117DGD9fka1W39HTKpO6Lpf82kGcVFNE6ylGT7Uw
 9boSZBJthZQWPo1FnnwXu/Ted8N0LjxOnufRfsQnljP2DFp1645kBW0vJEG5p/tYIoT3
 MYL5XzdEo4sDpEBEHW1Vd8oxrABfyl8by6Zovi+yP68O+Jwy2KWjIFEVydfQyzn7c3wv
 ulVRWfleAcmD9QqO/BkoKpOM3aGKT+n0LM6DFln/RMVy/2YVQ0XgL5fNL5n6u1MikvYG
 JTkfQAEz+8YVYWR4Jlf8FHKeMsiICdiL+fB026f2NefjvP1zee2gBtznkQwJkN62H6x6
 m9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793467261; x=1794072061;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UtVj5JRU59sYi+8Ku71BaTdYhW7DfNLR7kGnkCyZCNM=;
 b=kOsgWr8mIf39YvFW8b0S9sMaS7MhMHjZ5Ib5xlDoBHhga7pSYVnXCy85BeZbpv8+sa
 W8izMkC3Ey2ousnoxHGKW80MyXzOSqcB6pyz+GmS5/svUNMiMr441rvz1R/hueLaSn8J
 ydA4aKvQKsGRpdQqdmS4Uwx+6HXGXoL4icUtaiAytoT52bCetDUF70Xe0Oj2TKnWI1EF
 KpwT7arENxZSC8MuslTrRgxR/5lR07SqfZaPx7O1BPxolbLbOqBQ9uILqQ9rVDAgiwbj
 FXQMNMG6Fys7kUol40XYtky9HS4L9AUvPRX5oUDCddYlv2E8oTbXmwzXVeHqbSi7/EuP
 7/Tw==
X-Gm-Message-State: AFq9FYI/k9sXFlWb1sIiLiIkx8zME9BDZq2R+P4u23+kQ2NNq8hotEkv
 CeLVx7ZhHFGdtsjesSTicJkgrg0DU6ZG02LuQZz8HY998xJH7Z+0eWojDGTL1w==
X-Gm-Gg: AYBFou0j60DI/h6pLrw2xXmSEs0c3gJD/DpFfbzj6+oTs1jNLaIUwFzmURyF4n7pgwU
 SFBVrjHoUS8ztdx08wn9nharJeSBf11bANtIbXIhVZgvQdT3ZHPC1SUglJDqEgJbfL0PBLYpW6s
 vu0z9gFQbRTfNe097X3nf8LpFYEsCdh0OwB8/w1+ElwGpilezKMvll3thQ2pynTr91YFlJVQ1Qe
 fwxysXKNtND0A4HARZJMYGvnLlL8TR5i9khWehOsp9lp337kOrlhNn4BZdSAvllqbqRiP6CKnrz
 DIas9LDWpXw7yI8h74wTTDBt1QF9k4ZE8QgWGgI5qteH0R3JYB0N3TfN8tlJ3UFKReQAJjZrF24
 bn2CUKkebp9TqVgjygpRUVnKP/FeXS1kYJihEeMVhn9NySUAHnzPdofJpTeikyQzisgnbM+Y9lJ
 2qR7jK3N+kFZj1WwrPR8U2V8J3MLWTleXzTTU/Tt1JD+dSjFOa3MfjSXM555QSDPuStCfW9kRBP
 ATquPttlEaxqouNGItkKv4l13kOa5LZ3+LfGsavIstRlVhE2+b3QfplKtAqE2djcUOYUYs9l81y
 Wclqdn8Ru0yaZo3d3lg4t9tQN609JbRbE+JCaXP9msJUXLCytij0LbcE4NHY0UFnJRzkPcaHG23
 BTWK8XnpsZJHnwup2GVnCOTDch2thtox691Psd95QHKmR62J5l4nPp3rk/WwFlh03OCid1W9RjG
 gGax3YtCahYh51dhL+/63gn3UbM8ZApV1DkTRVZpyQBRa6ViQyeWyuJtD/uqkR5+hyYQB/nIb95
 A==
X-Received: by 2002:a05:6830:43a9:b0:85a:e0c5:dc91 with SMTP id
 46e09a7af769-85d363c506amr4552917a34.16.1793467261210; 
 Sat, 31 Oct 2026 10:21:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85d3549a245sm4969799a34.12.2026.10.31.10.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 10:21:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 11:19:52 -0600
Message-ID: <20261031172019.2683287-23-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-python-dateutil: bump to
 version 2.9.0.20261029
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-types-python-dateutil.hash                         | 4 ++--
 .../python-types-python-dateutil.mk                           | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index dfe2101fab..3f070237df 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  4f25106ead8ee6917e5015036cfd170a  types_python_dateutil-2.9.0.20261021.tar.gz
-sha256  62d66fcdd293e38745eae644e5da4cb399b98799c0ae61f03a54896fb51b3140  types_python_dateutil-2.9.0.20261021.tar.gz
+md5  244541b7e8735556c5994511bedad8af  types_python_dateutil-2.9.0.20261029.tar.gz
+sha256  3258b491686c441d8074cfc8712308741900c9ff128a06421baec3767c503511  types_python_dateutil-2.9.0.20261029.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index dfa8661a5b..352ec00472 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261021
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261029
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/65/66/4783d826afabb22f29f47b22514298efaedee4718eac0a76c37bea381a07
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3f/1c/1ffbe325ab57b36f134f6c9b1074bfa36ed2a169e530ff7a70fafd5c3bb4
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
