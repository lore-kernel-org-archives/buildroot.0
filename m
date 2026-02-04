Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D771FE9D3F9
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA30060D66;
	Wed,  4 Feb 2026 15:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w43aLJ9J5xfC; Wed,  4 Feb 2026 15:09:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18FBA60D6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217771;
	bh=rTtlwsZLU44X7BQvfHtbMx9fmDO1YffH48yGGanGaM0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CCS04mtn7z4PHnUq/H/+nrXEpfSG/N3icmI5zCUtzdg/V/yj2ajXGcxVC6zEnaAeI
	 wEIfLHOJLuOKkqtOHr5V7S1835EuLqKIrV6my/hEnaw4cWUdFOjN7GFOFvsCYxQ29s
	 hnzy904v7UqBJGk82LcZUJWnVy8a3CaE26p0vUw5bNBdP8+vsl4ep5jlPCh2l0nIc4
	 bSS1pkjfYzLQZJ92NYgMA5a6dy6VCipbwkMFNoCrx6lcAwoxLIxGBh9OnnAqKSESvd
	 /Y/sZaJt2t26/peOVzojfiL9xGXMpf+LGZ0YHHK0CSQ79mdo/w+u5/Ytt2Z7TpiLZS
	 ZDP93q7YsnecA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18FBA60D6D;
	Wed,  4 Feb 2026 15:09:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 71241F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51CCB40504
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Af07ANHvTw9p for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:09:28 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B13E6402B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13E6402B7
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B13E6402B7
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:09:27 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 6E8EDBDE6140;
 Wed, 04 Feb 2026 16:09:23 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 04 Feb 2026 15:09:23 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Cc: buildroot <buildroot@buildroot.org>, Guenther Harrasser
 <Guenther.Harrasser@mobileye.com>, Vladimir Kondratiev
 <vladimir.kondratiev@intel.com>, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <DB9PR09MB4987A693711BB09B0A9C21B9F698A@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <mailman.20273.1770054247.2009750.buildroot@buildroot.org>
 <838e68729209415796298901bc72a55d@umbiko.net>
 <DB9PR09MB4987A693711BB09B0A9C21B9F698A@DB9PR09MB4987.eurprd09.prod.outlook.com>
Message-ID: <88c8fa9045273004c1714475b06491a8@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1770217763; bh=ibxI8te5KUbTo4w710vvNgB85NCqIDnJgKBq9iBimbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bCIWHyOHQYefJHp93ZkwVrfzc3oWN+AgGAcWDOyfb0aPvBGsKv2Bt0TrGDKUvuRgL
 kAJAizVOcLOFIv8Qfm1icc663qrtIhEhhOr35q8bSXCI+VAU3jqpoWQy2hmj774LO8
 c1RGa7nCf3AhWmsYXXDf3ABjuekuZez4L7ibJnl8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=bCIWHyOH
Subject: Re: [Buildroot] [PATCH] package/coremark: port for mips-i6500
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jimmy,

On 2026-02-04 13:22, Jimmy Wesolowski wrote:
> Hi Andreas,
> 
> 
> Thank you very much for the review, and I am sorry for the terrible 
> format, Office does
> not allow proper inline answering.
> 
> We are indeed using a BR2_EXTERNAL, but we are in the process of 
> upstreaming.
> However, you are absolutely right, I did not pay attention to the patch 
> itself, and that
> makes my Acked-By more than a mistake.
> I will adapt according to your comments and resend once fixed.

No sweat, everything is fine.

Upstreaming this particular change might add significant complexity to 
the coremark package. The Buildroot maintainers might veto this 
eventually, because coremark is a rather simple package, with probably 
not much coverage in the community. But go ahead, I'm glad to assist and 
test if possible.

> 
> Thank you again.
> Best regards,
> 

<cut>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
