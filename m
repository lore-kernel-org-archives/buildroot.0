Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35AFCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 09:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3564B40962;
	Sun, 18 Oct 2026 09:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OmofQdiBuvaU; Sun, 18 Oct 2026 09:51:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 55D9A40937
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792317065;
	b=gM9NrI3FdamoKjRcGok5IYqvIoi6rF92RFCXC0tNeMKVq9QKZVeOLEiYoFqXkBf9XRAh
	 kMOS/mD4iT0bGETZE7NxeX5gbr4kqV5qr757nYr/5v3+djjZZjy2gqTbKmU2+wo27tfXS
	 5ZXMV2ObY764xva1oJD6mmbthyfMjx+RNZEWmBZDgwYXl8oGjMA3xezeRwJs2rXWyjzoX
	 MBmqMHyTBQFXZAzO6MJsiG5A8mV/Nvxn7kFkKN4UjQwSlD7MnUZzNUOSBN8NGAE1mIC34
	 GkI88ZwCu6V2qdUmN0Lno1WJ/Jp/GUVF5ncR7h8zqSXRQdxwfW+/1OIQb01jB9CEiNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792317065;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NnkiVXnLau1Oh4xWFv+bjd+YLnXjAX2bMEQI7WnxDpM=;
	b=fZZgOKMVS5B2PoeA0QD+BxgYDH8JrINC5M1EDBPpIKEG1uoZFWEbzTXhJYuFNpxamOM7
	 dfE+BWCeOunOTKU7fzDnaN9qfW5I17+YTr1gIJhtIddrzNtYjxWFnxyaVXhUNa88pvJ23
	 HiFSOA8KQC+xZsKsF4P+KGpQxrn4baMhR4zJqEMU0BXRrqS6aIhgPsiGD3XR+iiNnLVHy
	 CgtfzNVwM/iJiSEErePAQSNXn/VGIlkRWwrB0uo8T2Rzh+eMtqT0dYFr3iS6W3fR/mc6n
	 RcaQRp9hFFW/AbT8IwYzP6x37HCcQ5Vm+syCMRbIk/lM/YD4rZYYOPggI9DtrgQiyig==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792317065;
	bh=NnkiVXnLau1Oh4xWFv+bjd+YLnXjAX2bMEQI7WnxDpM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EgDCvA9bDJ1rZq9ADxxP3cfAIwCRTD4aydan/RgHjzVtrsqn5KZwBF6NebZ9Sn1pz
	 CXdPe6ZctYWw9wl3hnEQUhd5wpIm1XAeuXJL0QNZwNjyRq2SC0PXOW6jFEfCfglAlJ
	 AvH73/+KMlrSFe5JhsIszUFx5PyAUxINpFe5V/dhEQksFvyf322a+o7pZ9md3nNXu3
	 1Pw/mrN0xtS7aGEtRwHyddkNhrw7XmT1f+qiVqUbIVPoyQujPgS8+R2zcni7zD3xgJ
	 UwOGxrH5IAaHFY63Xqh/g94llwKxrjZid7nQqwYyI+gT7Bs724YZ0Yfuj0sEUtl6YZ
	 m3JjikBXpOVRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D9A40937;
	Sun, 18 Oct 2026 09:51:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE6F723F
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFEFA40952
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYwOqcXrr2sE for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 09:51:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E823A40937
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792317062;
 b=XslcSPYWHveAeHHMhtcJLqw1cBMF3S69oAOeYYlH5xhIVRpba8AXQsIKwTdGasWqZPgp
 wbjlOal5Bza4fqiw1ZHK52qtwJGmfI8q6wExT/OTDf80ws/uVm4bex/kiyfSzLxnwZiVM
 CmHtffJNpRvLjnqt1ZTUgLvnE6SeBOw7IW/rIoMMRn/3EKnD3+NhdYwT0H3jD4Gjy7PI4
 uxMcm55S5JgGkN1PyfmLb5UMDxI5MARbjzOTeVbnUh0JWBl43KJ8T3yg0S3awT/bv8Bmp
 OT9Lz4jnlXrwxuvwuE6uCvDz4pZwJbgC2Hf8zU71SRlv1V5KcSUYK8UB3YRSG5Z6fzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792317062;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=nVhUWHZLOudXX/Sggmv1nZLlWOJR3rJMfrNm0edYKgw=;
 b=j2EpJO6MwmpmLWrbb81JfbgZQCaFxf2rlA+0t3tutoMVCPXhJfgDvqnji1ExH9dVgvKR
 kbrxGSeGlPhGWjdwXBx5nqmwtU2cYRjK+PZ8+vLx/XgQg4mSVURyoP7J7otIQUJE+cend
 vNN1ZHswixmUjLJ6dRiisnibSIrXyZnWJPvs7agptoNofYllKj/2VI9vXzYuBsYC4S7bH
 BxGy7Zn/opcR6px57wgMckY8x7P/TlomrBY7GxaI6N4N5nOfTabyM3AsfyoQHAQCJKOJc
 vMU4lqRPPEhQ0x4dxAB+z+35OjjdAugdezX/C+6GtrHb/o8qFCmT7j4611IWeUgciiw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E823A40937
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:51:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E113496ADC; Sun, 18 Oct 2026 09:49:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 11:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d666b46f2d35adf6462300dbc959ecccbd4a5b0
X-Git-Newrev: 5b61def5b3b15b85f93a4d9c17474e003c4f64f7
X-Patchwork-Hint: ignore
Message-Id: <20261018094940.E113496ADC@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_uboot_tools.py: fix typos
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b61def5b3b15b85f93a4d9c17474e003c4f64f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_uboot_tools.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_uboot_tools.py b/support/testing/tests/package/test_uboot_tools.py
index 8cff6fda21..13f77c3379 100644
--- a/support/testing/tests/package/test_uboot_tools.py
+++ b/support/testing/tests/package/test_uboot_tools.py
@@ -96,7 +96,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         keydir = Path(self.builddir) / "keys"
         keydir.mkdir(exist_ok=True)
 
-        # We generate a prublic/private key pair to sign the image.
+        # We generate a public/private key pair to sign the image.
         cmd = [
             "host/bin/openssl", "req", "-batch", "-new", "-x509", "-nodes",
             "-newkey", "rsa:2048", "-keyout", str(keydir / "dev.key"),
@@ -150,7 +150,7 @@ class TestHostUbootTools(infra.basetest.BRHostPkgTest):
         ]
         infra.run_cmd_on_host(self.builddir, cmd)
 
-        # We check again the siganute, and expect a failure.
+        # We check again the signature, and expect a failure.
         cmd = [
             "host/bin/fit_check_sign", "-f", "signed.fit",
             "-k", "test-key.dtb",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
