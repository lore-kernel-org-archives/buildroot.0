Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5416606A322
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hnrP6zfs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84C7A406BC;
	Mon, 19 Oct 2026 19:31:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhehG8KYNlqR; Mon, 19 Oct 2026 19:31:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD9D840541
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438260;
	b=GPFQUiarRDdJSoJ3VSpVWjxzBJ/rZ5ocKnNpKbaYGB0V+cSNj2yR9qDVDL3+Ijxpe7yz
	 92tTOoi5ZfI1XW4rS+UuTKyZt8KpOxZ7Spp1ePfvKHV0Xs6Otl5XIQ1BRXkV4Y6g0BPUy
	 n3DpSmpYq3ADmPebHOdOohBdHXCHicSAbcJKDgHqz8aCPg4k1srdwoELtBaP+o95NhHYo
	 /nReLLVUfszJ7J/wlGU+a5RM15zQKg9SOMAn1sMdiiXOK0cvbri0b+dzQsCCfIf6+J85+
	 yXl62wpINjTjzkyqYchvI2fB1wuRlXiv79IYlwxNPXTj2ivs7fscDNFZEvP1UvgNkhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438260;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=s/k3ntlm4w14Tgp/BtK6z2MRx+Boqpr0MQp9lnnNKE4=;
	b=bDC4rros+gfAx5y/OYXZewk1zsMw+bOrqO6k3qsz/j6b2N2OAjim0GyYqhvtYIF6yEXd
	 gZ1n6PdgTCQytT3KivAjQTOlWKIGvVKEF4OAkDkysMjx0d9b9xVU5G2CrYwH40q/tK6vd
	 F054Rbpw2hLkXwm1Tqai3PMsq02E18OPyU9CUPoWbnCmK0lB/ahiYmaF1VCR4caonHn/0
	 +6GLC3ra817Li29nFTDxdf4OKO3w5DWusXVgYedbgoSrB+coeNjVfT3HKCkj1mH7XnwWH
	 v5b+Xg+KQiTJ+LYmXO+a74G4cF3Gm4cFcHjyS1s7Ld27fNWdiCPE9HhbghPQ9JjUE3Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438259;
	bh=s/k3ntlm4w14Tgp/BtK6z2MRx+Boqpr0MQp9lnnNKE4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=hnrP6zfs1Yte7xqr+FsINU2KYm/jLJr+pJq+PHzfyRWQIlHh7AyT/B+42kD8dMuLC
	 IDuzbn/mr+I7TxJCI/g/b4hPyMQcCMnIMwuhC4eYHqzlSh5XQNVblIodcYnj17A6Tj
	 6qT7Zcl1saSLwyP1Jl7VA47+BIeZWlbwZ0k/tWz4XLK6EcHeuq2upF+ZgKTSicdNbw
	 ZKCVw1rnpXvXoNQsMKLYYh2jIoircO8hyH/2ha5QdR92ksur8ruzUpz5pcTPuEijCA
	 03hwayQcZ4ix8IEne/3OVcsTbYjI83HUD15/ASJkKj4xhJREehTi2g7HtQ0WRs1LPH
	 9vX7D4LTpxXMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD9D840541;
	Mon, 19 Oct 2026 19:30:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D7C7E1E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D536080D2D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Sn4gm3L2Tq9 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:30:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 34F0580D01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438257;
 b=ries0wER9xAY5mDilpndxkf7XQ31l7jb8qCe7CWVWliEZm7SrnKg5/fPQcR5nTjQjxud
 FRYUJdWySzKJLq6dumwBL9Q9kxsjbNtknWj50/yKlMuw3NqPxN2O9PLL5o2OGGF6iB+KJ
 Uuo7H/O0v5iarmor4ZFLxUOrx4itjJLbUqiMKJEUxa0SZxN4fOJ5Oep1Dioe7Gba5sZlf
 0g7oUBJfah0tKV7tSwaTlSfLE3dz2NxzGqK2XO6dYSqKeU82CmH5nhsYqSXpPqVf08Ge5
 oYd1tTImIGSDSoz1ah6IKzBrf1kDibX0TyF7746gCuZd0FpbJKrrMekBUm3h1+gYHpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438257;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=bzWrVrEOyFP8k9vx3h0ixLvk2DHkaHMKFl9kUYsLdYc=;
 b=ZWRjrfD6dtukB4fBfacKnDJEj47BMDnMVhBdPvMfZj6GGg1IVjM/j24uscLCAdKWAY/k
 CT1YZ48hpCmrU+sAJDKfolYNTPpXfoBixuTVHnzPKUjhC/uam0wQdH/ZVWgm0d39i5wal
 1uRYB9P9b9j/9K5HR5Lhku4yjCvtaLA3VbLTHrbCGnSuqykHHKXD7sf01MYBhV39LMyp9
 PQnshnkaQCWPXvy/xfuDfbjLG1dHVcr17yR7T0b7LJlG7i1OzWCcAqOFduwD0v0jyzWKD
 s3H2o9e6SkD5Wzm6LETCfO0g9T7eRIjPH/hMHA8P3gFinwv0hKhNjPD6kjkhb45kD0w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RJlnaN2+; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F0580D01
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:56 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C09B71A124D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8E18260582
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9DF810328D1B; 
 Mon, 19 Oct 2026 21:30:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Oct 2026 21:30:41 +0200
Message-ID: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/3] utils/genrandconfig: add missing newline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The line:

  configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')

would fail with:

Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 650, in <module>
    ret = asyncio.run(gen_config(args))
  File "/usr/lib64/python3.14/asyncio/runners.py", line 205, in run
    return runner.run(main)
           ~~~~~~~~~~^^^^^^
  File "/usr/lib64/python3.14/asyncio/runners.py", line 128, in run
    return self._loop.run_until_complete(task)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^
  File "/usr/lib64/python3.14/asyncio/base_events.py", line 720, in run_until_complete
    return future.result()
           ~~~~~~~~~~~~~^^
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 556, in gen_config
    if await fixup_config(sysinfo, configfile):
       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/projets/buildroot/./utils/genrandconfig", line 255, in fixup_config
    configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ValueError: list.remove(x): x not in list

because all configlines end with a newline, so this needs to be fixed
to:

  configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')

Fixes: b07d21ab984d10cbabeb186fbd47d446e027c03b ("utils/genrandconfig: handle BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 8437d6342d..597602f257 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -252,7 +252,7 @@ async def fixup_config(sysinfo, configfile):
 
     if 'BR2_LINUX_KERNEL=y\n' in configlines and \
        'BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n' in configlines:
-        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y')
+        configlines.remove('BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y\n')
 
     if 'BR2_PACKAGE_LINUX_BACKPORTS=y\n' in configlines and \
        'BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG=y\n' in configlines and \
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
