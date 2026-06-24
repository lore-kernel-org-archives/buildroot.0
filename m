Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06C5CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 20:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8500782277;
	Wed, 24 Jun 2026 20:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjoGmCjjS0oQ; Wed, 24 Jun 2026 20:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17D8C82265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782331784;
	bh=Y25ftxsYd3pkFEPIag4Yngnpkc04kIN4i8vCo9aZ81c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M/gRqEJCcRzpiIoS1R/drNcj2lmeC4xyYkux49EAKJlantnuCiqQIO66wEXGmSIOL
	 EzmRG7hjDgt5DvAENfLjCTk1NFB+0mw1WEYvCh0ftynnTXM4tHh4bMu7n9kj0D87/n
	 uhr1JwgnuHSerrcrKeajAtNOJ9iyXxcQcOutQd7dMzqddA8N4QfQGa0+CiolWEmC3e
	 dMQk1WvgMnG35Kd94qBNMgdPvWWUmbP4YSw7h3Qi+inDq4X+Kfw80CtmV+eRi4gPnJ
	 P0KemLTkkgUtCarFvazlY/cIwEGSGSAvauaeLsAR0Gz8es19CLmodAhwYP70F2xxle
	 r1tkKOC1k4F3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17D8C82265;
	Wed, 24 Jun 2026 20:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 27E45F4
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F5F082260
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jalnVMT-6nnE for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 20:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E035A82250
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E035A82250
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E035A82250
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 20:09:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQ5vc-1wpjTm3GsK-00Osxw; Wed, 24
 Jun 2026 22:09:38 +0200
Message-ID: <ae6a1744-90ac-4d17-9819-47ff77356ac2@gmx.de>
Date: Wed, 24 Jun 2026 22:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260623182024.2068785-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260623182024.2068785-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:9BEv0KIEefg6REDo+w7ZH773dTpQPF887n4eLlHWlyV7LOPD72l
 TyzKjwcN9JDWb9zW8ZSg9eY3WSTLwHyDGX1InjLBgbIHrfidS+R0lqFcJsL3kYVJXLFeLdO
 SUv9DJDZogqCBN+d1FjXmOCdcYQyGEGvAexV4JqLyhr7JtWmc2EMq7s0iBqJSZS6DTbw2lu
 fDtHvS6iQi1vYgypyGm+A==
UI-OutboundReport: notjunk:1;M01:P0:2fMBsaHNqYk=;9haaAL7YkqorXoW5vwOQxhITOzM
 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
 Tk+nQEX6gYgO0mazASOt80lyHuVaOP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782331779; x=1782936579; i=fiona.klute@gmx.de;
 bh=qw+S5RL0EMeZ7U8oCGRinwfa8I6E9P2of7BQPjSIG3U=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=uNgcwYCX3+fGQ615lY6X3JdwasS7TOgAWh8oVbTowVUBXY/FJWa62OXOKgDZh9hr
 9hCnWVfOUIZRv+ejQRHmIHEUltZTTG3dI2+x4+/H/akBrozDHVRshH3a/+IGbwvwH
 mL2KtOmiRR/dHylTGsAch56z6YHgYrcEEiNjLcLt4/bTcZYHh025fLFMUw7Agwk4y
 YTnQzJRHgc2efw8dAZSkKcqIMjkdOXBBuA+vOXDlc8FIfgKABIFmfD/zxEZLyD9x6
 3AtJs9Rs0RlAZhNgwiKhxD6sAQXeQBUhLZe1pvxo2zLtqzAXTwsp/mMjt5y65uLxA
 NSHdiMTvMs5yC14COQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=uNgcwYCX
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: add upstream security
 patch for CVE-2026-11940
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 23.06.26 um 20:20 schrieb Bernd Kuhls:
> https://seclists.org/oss-sec/2026/q2/1006
> https://www.cve.org/CVERecord?id=CVE-2026-11940
> https://github.com/python/cpython/pull/151559
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thank you!

> ---
> Gitlab pipeline passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/8200789782546a265af81c894a442a2e64091bcc
> 
>   ...ix-symlink-escape-via-tarfile-hardli.patch | 83 +++++++++++++++++++
>   package/python3/python3.mk                    |  3 +
>   2 files changed, 86 insertions(+)
>   create mode 100644 package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> 
> diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> new file mode 100644
> index 0000000000..d3454a7a6b
> --- /dev/null
> +++ b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> @@ -0,0 +1,83 @@
> +From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Tue, 23 Jun 2026 15:58:47 +0200
> +Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
> + hardlink-extraction fallback (GH-151559)
> +
> +(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
> +
> +Co-authored-by: Stan Ulbrych <stan@python.org>
> +
> +Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
> +CVE: CVE-2026-11940
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Lib/tarfile.py                                |  3 +++
> + Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
> + ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
> + 3 files changed, 30 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +
> +diff --git a/Lib/tarfile.py b/Lib/tarfile.py
> +index 39b1cd6514c..399f906efdf 100644
> +--- a/Lib/tarfile.py
> ++++ b/Lib/tarfile.py
> +@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
> +                     "makelink_with_filter: if filter_function is not None, "
> +                     + "extraction_root must also not be None")
> +             try:
> ++                filter_function(
> ++                    unfiltered.replace(name=tarinfo.name, deep=False),
> ++                    extraction_root)
> +                 filtered = filter_function(unfiltered, extraction_root)
> +             except _FILTER_ERRORS as cause:
> +                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
> +diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
> +index 8503024a690..045377d620c 100644
> +--- a/Lib/test/test_tarfile.py
> ++++ b/Lib/test/test_tarfile.py
> +@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
> +                     self.expect_file("boom", symlink_to='../../link_here')
> +                     self.expect_file("c", symlink_to='b')
> +
> ++    @symlink_test
> ++    def test_sneaky_hardlink_fallback_deep(self):
> ++        # (CVE-2026-11940)
> ++        with ArchiveMaker() as arc:
> ++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
> ++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
> ++
> ++        with self.check_context(arc.open(), 'data'):
> ++            e = self.expect_exception(
> ++                tarfile.LinkFallbackError,
> ++                "link 's' would be extracted as a copy of "
> ++                + "'a/b/s', which was rejected")
> ++            self.assertIsInstance(e.__cause__,
> ++                                  tarfile.LinkOutsideDestinationError)
> ++
> ++        for filter in 'tar', 'fully_trusted':
> ++            with self.subTest(filter), self.check_context(arc.open(), filter):
> ++                if not os_helper.can_symlink():
> ++                    self.expect_file("a/")
> ++                    self.expect_file("a/b/")
> ++                else:
> ++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
> ++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
> ++
> +     @symlink_test
> +     def test_exfiltration_via_symlink(self):
> +         # (CVE-2025-4138)
> +diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +new file mode 100644
> +index 00000000000..74459d5680e
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
> +@@ -0,0 +1,3 @@
> ++Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
> ++filters where crafted archives could create a symlink pointing outside the
> ++destination directory. This was a bypass of :cve:`2025-4330`.
> +--
> +2.47.3
> +
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index ff9afbb5a9..fabbdac384 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
>   PYTHON3_CPE_ID_VENDOR = python
>   PYTHON3_CPE_ID_PRODUCT = python
>   
> +# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-11940
> +
>   # This host Python is installed in $(HOST_DIR), as it is needed when
>   # cross-compiling third-party Python modules.
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
