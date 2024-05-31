Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E08AC25B75
	for <buildroot@archiver.kernel.org>; Fri, 31 May 2024 11:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C89EB416C1;
	Fri, 31 May 2024 11:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 75923AKWN7Qr; Fri, 31 May 2024 11:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C31416DD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C31416DD;
	Fri, 31 May 2024 11:49:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A392E1D2D06
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA9781911
 for <buildroot@lists.busybox.net>; Fri, 31 May 2024 11:49:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-nw8whHWBVY for <buildroot@lists.busybox.net>;
 Fri, 31 May 2024 11:49:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 745E38132F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 745E38132F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 745E38132F
 for <buildroot@buildroot.org>; Fri, 31 May 2024 11:49:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 25AF213F8B9;
 Fri, 31 May 2024 13:49:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 31 May 2024 13:49:12 +0200
Date: Fri, 31 May 2024 13:49:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stephan Lukits <stephan.lukits@gmail.com>
Message-ID: <Zlm5OCJLEpDnRMki@landeda>
References: <A5CEAE69-CA07-4771-951C-05D3B4889D05@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A5CEAE69-CA07-4771-951C-05D3B4889D05@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717156155;
 bh=We/xcD9Z171+G1lab9Dh6PeD6qAfM2pvHSGuE/Pmu4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vTxH+0kQ3wliTGFwucV3gkLBMQwutY+Y7zvN81DRW/GRTLsaO2XmI/wfRA5OSU9qC
 I+vGcKbe2U1TGceGBwj3NZRZHIlYL4yuIxbclFhZ4R/HQRdJ/hV6+xHsXNDHAXNoIH
 FsSLkZiy4Lejz7fQIFtUR4ee7nEDfSjvtZ23DRMa0Vt0SoWKTxAYG/C/YKmv4J3jm5
 X0TMx9lKYzE5Uy6GgiKjsSyFIjaMwV3BqW42m8t0EuWvScpJeB5bN6cB9+Xv2hoa6a
 HHYDd7n6iqWI3YLiQyzZFNMagDoARAWgEuF260TokAxUCGvmC/ex5ifq4h5Xh6wmYm
 jH0K80XRuPsZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vTxH+0kQ
Subject: Re: [Buildroot] [2024.02] make menuconfig fails
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stephan, All,

On 2024-05-31 13:37 +0200, Stephan Lukits spake thusly:
> Good afternoon, on fedora 40 `make menuconfig` fails even though ncurses and its devel package is installed.
> 
> To fix it I changed support/kconfig/lxdialog/check-lxdialog.sh:51
> 
> int main() {}
> ^^^

Thanks for the report. That's already been fixed:

  - on master:    a6210d28 kconfig/lxdialog: fix check() with GCC14
  - on 2024.02.x: f5a347c1 kconfig/lxdialog: fix check() with GCC14

The next rlease of either will contain that fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
