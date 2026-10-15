Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D5BCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DED660ED6;
	Fri, 16 Oct 2026 13:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLueFAPsyEYH; Fri, 16 Oct 2026 13:12:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B994C61247
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156347;
	b=OqVcfJzJI5YbjkemzZwxw1w+qaXulndfIjwcbAOjfbk5iL8CaWN3HFpB/q9k1yI0Fxl4
	 WpjCJ8woiuSIso9iMP3QhBArBZBKt6s+3YRKUaOIhnk2ujHE1Z70Ur6u+8hqGz+whGkbt
	 l5ZTiE96Fh8K6WRcCTq51mFU0Cs25+qGf3A4msI1p0N8Zcpecn+vCI2+93kAGKTLXSxmV
	 7q0mqMFTrFgNAfR93aao3NR1RSkv0+iYcNVJJIGWlbuhoD01RRCGn5KXhlrdxcCVYLeUW
	 rUdp65UwiRhXfc78yRqg72zKl/vIFjI6Czkvi537IYc+KDKXleAjQGLrdkuOulUw6ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156347;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Y3FMYU9x4g+BcoWEWcwrYaY21lc8wtZ2FDHWd2j1wcI=;
	b=IA01S/1WuSC8/Jin24iaONpwjizp/AK3XewJoqt60AEyQxiy00L0/v2GZd7PE+EVjt55
	 1Wx4JUn1cvtpOOe9NcNNwl4/vaZlN04BtgnJmWLZhpED23y4xrzN0GsmQJc7Zqv21DPm+
	 w+Ba1VzwdyDdjLmcibcZ8/SAeBD7MpTue/TKy2t3Cxa5JXgLjCk7tpGzV04y//VKsLe67
	 2Aha3D+7JS16vCv1IQRb4JpGFhP/IsyKXubT+uIlExutkbG5vTGOKiKSANw9++mlfJk8t
	 QHT0h8hSmX0C3HuS2Ghk/FABiDg6oL3aaBS7/bco0isWHSNAdS35DtYThT7vLVY2ScQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156347;
	bh=Y3FMYU9x4g+BcoWEWcwrYaY21lc8wtZ2FDHWd2j1wcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YpIod257COEjDxaadeMsSBl724jQja8ws6wSEh8zeHzZGQoLwOuJ2KGYE8Y1pm6HF
	 48oGV8Iq+R52f0jeSeN6jniETFy4fv6rk0EWCrXb1ywrSQZAdHISZLKTxX0L0TZZdi
	 TQTfdZapXphVkiKXGJKzWtDYPzPo04FmUE7lO1LocAqmmamKzzv9BoxgMyxgn2j/mh
	 cBA+1OtfA2dA44upruZlCZWz8Xir9XmjWA+UD6hM3+oxda/WXFT7tzgDvGsqzaYPHL
	 RfkhsdQj+E1nRBNpgckbUYpnx3qwN0ggkSgx9a4/EUFLP+FfZxs3PiLJmH86QtUS1K
	 ThZvpjBcZjWRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B994C61247;
	Fri, 16 Oct 2026 13:12:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA61B769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD98E60B36
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n07-kAvln_s for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BCD160F23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=b8DO2DCVEX1iPtJPddLQ+4ZttRBVtZ8j39BzBDUrB7SJkHi3W7bzNYgeahAt6DYi+hub
 oVcAyxNqyNBmqtOHEPSXlHn/pirEed9uHRTsHKZhujSPbD+sXH9vwB1vEZRZJ8oxMdfV/
 Wd0sWR1+gJiFYcyhrkei44NxkGlTpLk/9u2uw03oFHOzxyKc6YdWvhdXBiqboUrfQPDKY
 R5bsx9Lm62GWw0zlhrZ7odpXrh3TOhqQj5E+sHQca9mkvdzZlDqmW6LPUWNC5TOtz9+py
 1UWVdkmoXf0ZLWa3PgW2FC5n98P+6GU/bSodthfqsUOyiZ+AT8HTlPwAM/vMK/A9GYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8dVcyIgv53mxtf2uE1aSALklJhgP/5F8sOS1Rl0mRC8=;
 b=jkJzcwYYxE0cuzN0ZT5YrPbOAN6i2DgmFO7KLTv7nOrmCTiVhTKGmu819v/zf5zeWV/V
 sSU674kREJzj77pRDvKiHjVTdOYCHkr/u01uKgKvUsULPSpF4CFBpfNqYgrT4fhDHD25b
 pT4DnVuHrZaH662VtIGij6A/PJ9ewziw8D8f1X0l8bYifylwedidltdxyp3FpuacJD3Mz
 8r3EPv5b3vs0aW2PJh0XqOwtsZf1tU/S9Mge6Axmz/bhqQDmBhclb+82RTja9pYf62iem
 bFTDxPwX+Br/TdnYxrS6lABitMbnSoB4DxjYA4cAw1m27ZESzVHpr8hNfvo9dZV7UGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BCD160F23
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B7CF960D7; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:14 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 9c0c1eaca1b8ddcef32b729f6837501732898e8e
X-Git-Newrev: eca7314d342e0636504e807abb9d489872e35f8f
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.7B7CF960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] DEVELOPERS: add Joachim
 Wiberg for firewalld
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0475687756789378346=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0475687756789378346==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/eca7314d342e0636504e807abb9d489872e35f8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 161391871082c9d363d7a4ff25d68b8f6fda9807)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 377e7f9ea5..c63c855997 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1663,6 +1663,7 @@ F:	configs/qemu_loongarch64_virt_efi_defconfig
 N:	Joachim Wiberg <troglobit@gmail.com>
 F:	configs/globalscale_espressobin_defconfig
 F:	board/globalscale/espressobin/
+F:	package/firewalld/
 F:	package/inadyn/
 F:	package/libconfuse/
 F:	package/libite/

--===============0475687756789378346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0475687756789378346==--
