Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5ADCAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 16:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C8C60F9D;
	Tue, 23 Sep 2025 16:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ag5GAHn2O1UU; Tue, 23 Sep 2025 16:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC8860EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC8860EB4;
	Tue, 23 Sep 2025 16:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 344DD129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1B0B281985
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:36:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELmPtsublctB for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 16:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F8CC818CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F8CC818CA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F8CC818CA
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 16:36:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 63A0619F740;
 Tue, 23 Sep 2025 18:36:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 18:36:00 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 18:36:00 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20250923131134.156372-1-titouan.christophe@mind.be>
References: <20250923131134.156372-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <5407a49d139179f3a33d178f56f8274c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758645363;
 bh=FFbLw7n/C7REd90laqS+JYVA06t9C5uS6JQQ6+BWBHQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=enOs1WJ+7qR47ys+QGoq3XK0BnqiHoLebgjw8OTb2KrJnza93l/Q270jAGGMs6cIJ
 eABPMOzBz7kor2Qpjbq0FWDj7qKO4hIXhEdwUnZgg9Rm7YdGkRExCetaUUHcIDuPRu
 JaE7QgFezmyNIyFHVopPMEkSD2Mtba5lz/kFPwKSAuz/p/XwOzgnG7MHm9q8v7z85n
 zN1Y6J7+oLMu3GCq9ID1ZMJZx/fjNft5a+VjbbdZCXcLJKNXqz+QIoNu28jbG/T2XM
 o5wMdI89XRIjPXMnyf/4GIVuGJkU1hwWKurfZDFZ1oDrvfaQYYCt/bHkfzMMuCINQt
 L2BANDO9URPTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=enOs1WJ+
Subject: Re: [Buildroot] [PATCH] package/cups: security bump to v2.4.14
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

On 23/09/2025 15:11, Titouan Christophe via buildroot wrote:
> See the release notes:
> 
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.13
> - https://github.com/OpenPrinting/cups/releases/tag/v2.4.14
> 
> This fixes the following vulnerabilities:
> - CVE-2025-58060:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. In versions 2.4.12 and earlier,
>     when the `AuthType` is set to anything but `Basic`, if the request
>     contains an `Authorization: Basic ...` header, the password is not
>     checked. This results in authentication bypass. Any configuration 
> that
>     allows an `AuthType` that is not `Basic` is affected. Version 
> 2.4.13
>     fixes the issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-58060
> 
> - CVE-2025-58364:
>     OpenPrinting CUPS is an open source printing system for Linux and
>     other Unix-like operating systems. In versions 2.4.12 and earlier, 
> an
>     unsafe deserialization and validation of printer attributes causes
>     null dereference in the libcups library. This is a remote DoS
>     vulnerability available in local subnet in default configurations. 
> It
>     can cause the cups & cups-browsed to crash, on all the machines in
>     local network who are listening for printers (so by default for all
>     regular linux machines). On systems where the vulnerability
>     CVE-2024-47176 (cups-filters 1.x/cups-browsed 2.x vulnerability) 
> was
>     not fixed, and the firewall on the machine does not reject incoming
>     communication to IPP port, and the machine is set to be available 
> to
>     public internet, attack vector "Network" is possible. The current
>     versions of CUPS and cups-browsed projects have the attack vector
>     "Adjacent" in their default configurations. Version 2.4.13 contains 
> a
>     patch for CVE-2025-58364.
>     https://www.cve.org/CVERecord?id=CVE-2025-58364
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
