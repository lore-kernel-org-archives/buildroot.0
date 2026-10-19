Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD29606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FLio6aXE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C516760760;
	Mon, 19 Oct 2026 19:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5VcUemJpjScc; Mon, 19 Oct 2026 19:42:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DDED460714
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438973;
	b=bTF5KcUk8kLpgIK0AGyaW/ibc03mJQ01CY+c2tRnYTCGyAlyB3Nxh6BUSD5/TyDxoR5h
	 l2HgvkMM7xNnSgUQIjdt1sgIAiKISFykv0pdFpAmLjl86MIc5b+QvhS+YU41FUdF5LNRh
	 l5WigEuMnQhKQOcg9xLgMNwVHrI2D7wJSRZru/ErN43sQvnXTZm6Dp1pXatfVG1panRn7
	 zC30to3uwcmcwTX0LQtMW2jecdIqQ4VpPQd1i6u+OahQXQo1tn550Zzc29Rcey1GM0TuD
	 g7uAus9DbdD/wWIITZGmSEMkNLmkh0sf+CiIkpm8BBM9/Qj+NfbNRBz5+37z7LoUApw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PHIgH4wj8lNOp809Xern2026fAkMgO17Z7/eJwt9Wdo=;
	b=ST5cl5Suxlt7ORtjgmMipXOQ4NZs3V5gKYy8SfzEvtzy2WFB+DS+PuPkX0OznsykuZI9
	 PBnLJpY3mKVjLZ6LeegbTY//8wKtIx14jcBM0A+pN1fQH6LM0kIl62ZdSgx81m5eUQNaa
	 +jdCf0sk2DaqHjlKHcedkuL0nVWcz6f8Lqjq55R6OIor9VVgj6xQ42q1sUQIqmRiwEEOx
	 teMOCFw+5OihEL9TaJffBapyi3IfLd0qCytzSDQ/2K4S/4FHFqGDNS300pMM2O6JYTUHa
	 TTuQvD4SpnZKEClUwTm+SsCr2peCV3ASdymyM27ksh77an8F6v32IFbZWGs265Mvqtw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438973;
	bh=PHIgH4wj8lNOp809Xern2026fAkMgO17Z7/eJwt9Wdo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FLio6aXEm0/rTD8Q9LFE9pMnHUaldDPCCzxkVQyy7PRtcBPjhd/UoCcHmBAvISO8V
	 tG/NEGfO8eFLtYlRnlgUBua+SN5CzHFieMJE1G3WXApyvno+594wnQMFKy3ZLQVvuZ
	 fZFaJlPWp1xX7C4P6HgqWMm1EHg9IIUY+KpOfHfQBE5+iBNTtpqLLLiP+s9IYFnSBa
	 bbIFdKsuu5tU7KgcegzRfjat2804sobbO4MXXipCrWdYtLhtG4UBsqLwV4JOFDCwkL
	 kmyFmuIFv4B5Pilkomep449n+QIZITYLqveM4H4MFl6aQQe8AxdEiAfZxZcHAViLZb
	 Uah3ukhoopGNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDED460714;
	Mon, 19 Oct 2026 19:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD3A41DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A341B400B0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9AIlDKvEfE0 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 06A4A4008C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438971;
 b=pMyRwiG0NPY5JAntKX3sDI8JjMFPJPci1by5ghKBlDyTGWkpfyLh9W3Kryn80aXguiqI
 VBZ4R2soKMyG18q5ZVhaWwwnn2M80P20S+RJFLKKkX12zMxchStoubt1+btGhJ7RPBfRi
 BywAApuzQbG/YfR5Tu03kmEaR6UaCxsuBrz2AS3EhwnJdeEG7+GjvxWHp8aBYNS62iptd
 zHtJ5MHp2fBBSsYcPCQ79yH/th32gKMDfMf1bikOS0ocOyoyyPKk1nQy1TUZSkpRZpnb0
 u+H/RrRVWrBXXpwkQ1eGbY4KRqYec6IvYsJ3a798qH6eLrt0TTXtRIKp3mABjEBY4dw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438971;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WIXbTIN5ZYUUKZAJ8NEujJGxB0G9HYxBSeXjc757J8s=;
 b=ZRN7Ah0FknUDFTwyQR5g8YYBFgVQ5qjPdwRfrmMf4m7O1SW9XXWi8+rZqfkQ0M7B61Vr
 5eGYo+ZFwneIre3by97TJFO6Q1IUNnvKXEmns5qRNUoMtYipKqKYXuBWf3JFdqUmI1l5T
 ghzaYaTlnkm5gTc/Nyd+YSyAtTYQPEYzhJv65kYR5UEJ4mHNkn7iZuw+NTRmxcBFy3gyH
 bNU58jR3vzd1v/GTnLuMgXZZ28F3RrWIk3PHz+OfKazHbCOs+nc4Xbi2NbIYPuRHCehLR
 pYQHLhDR94rsXWPDDQvPtqtH8vO5SH4tY0PN4YqwEYnLRgTFuc4VV9T+qgSoKZNiDVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06A4A4008C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53EAD995C3; Mon, 19 Oct 2026 19:41:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:38:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f09b4c5bf7becfc1bf22a1880ec4c029b768647d
X-Git-Newrev: 731121fc1b0f968fc94e8b168014c35d970ac7e8
X-Patchwork-Hint: ignore
Message-Id: <20261019194128.53EAD995C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: add missing newline
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/731121fc1b0f968fc94e8b168014c35d970ac7e8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
