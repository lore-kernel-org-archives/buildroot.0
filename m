Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E2FCD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B121F61035;
	Sat,  2 May 2026 11:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W7EAkdj2fPGQ; Sat,  2 May 2026 11:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B890960F36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777722368;
	bh=qMVWAnDiQn3BUg1ALo8SFLoTuOjFtpwq7sNnRkiFKQA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GmAvfO9/ml+P3FjB1qn/AmCBAgOZOwdkww64jWSd4YFeUKs1OezKss/a0/OtrzDvO
	 n2i2Ol7znmfSSMMNXzvGI/Uo3tQeYUiL/ft6dey7jH819zninKydjlvQcBQs7PJixx
	 L43+rx/E8ZQQDOe3D/egs4Rhaismt51uhyH9G1MqLX13UGzMtkkb8nRRGxDvN5wdWF
	 Fs30pLByYX4OHuuJw4eKOC9Z82PzZ0O8HMgO9lsUO+1vpZ4lnKIDr8IRHhg8+umpCl
	 MTUPy0choVBcyLf1I8zv7L+RWKuVF1yHHzD+Y8EL36DpfJ9rXkQmFr09vi4KlHaUDX
	 xT7LOKxJAvGvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B890960F36;
	Sat,  2 May 2026 11:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A01ED127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DFF5407FD
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pY-RNdYIrSdF for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:46:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB9DA40137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB9DA40137
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB9DA40137
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:46:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 023B560139;
 Sat,  2 May 2026 13:46:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 02 May 2026 13:46:03 +0200
MIME-Version: 1.0
Date: Sat, 02 May 2026 13:46:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260430145130.1803104-1-giulio.benetti@benettiengineering.com>
References: <20260430145130.1803104-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <acbb02457cee7d48b0be5c4ca5bc3c14@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777722365;
 bh=+pNFRpDyowXfvLwPe2yrcbRREY+17rTLEPQVCqf4h5s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gSFs2Pz5Kj6sz/RRqsY7YA5FSMhEFd/qALLHACDG+9qMu/xUws8uwaPn8o+9LFECQ
 sI8SrgX5VFEfPNI4lfzO5DfM0hU4u4aeppfcFn0k0Pfbw+HaTInxsS0ZAG8X71FTUx
 wBAYmqWvShNHrkzeO99JyKwYkDQM5VNjMqPxYYCEQsEa35rkIvaqf60SVCy6Tatzig
 9B9slMIiTBTHZcrlMExCTeJNYbLitzfm5OMX6yGjM7SDpNBMfYRgod/0KhZopalouU
 CT5nr+M/boNAE5lwJkI3q7D2U6CNW07CDR072sgHPVP1RVTX9YzdX0An2jo8G2f33p
 1KJNJIl1Jxi7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gSFs2Pz5
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.15
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 30/04/2026 16:51, Giulio Benetti wrote:
> For more information on the version bump, see:
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.15.html
> 
> Fixes the following vulnerabilities:
> CVE-2026-5409, CVE-2026-5408, CVE-2026-5406, CVE-2026-5407, 
> CVE-2026-5299,
> CVE-2026-5401, CVE-2026-5404, CVE-2026-5403, CVE-2026-5405, 
> CVE-2026-5654,
> CVE-2026-5657, CVE-2026-5656, CVE-2026-5653, CVE-2026-6538, 
> CVE-2026-6537,
> CVE-2026-6535, CVE-2026-6534, CVE-2026-6533, CVE-2026-6532, 
> CVE-2026-6531,
> CVE-2026-6530, CVE-2026-6529, CVE-2026-6527, CVE-2026-6524, 
> CVE-2026-6523,
> CVE-2026-6521, CVE-2026-6520, CVE-2026-6519, CVE-2026-6522, 
> CVE-2026-6870,
> CVE-2026-6869, CVE-2026-6868.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
