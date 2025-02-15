Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733F7C021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 20:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42E916068A;
	Sat, 15 Feb 2025 20:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqWQD2OhoqvJ; Sat, 15 Feb 2025 20:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76E62606BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E62606BA;
	Sat, 15 Feb 2025 20:58:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F99FDF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FD2282026
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NbIJ96qSNmTi for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 20:58:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3C6682002
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3C6682002
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3C6682002
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 20:58:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2157F2003A4;
 Sat, 15 Feb 2025 21:58:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 21:58:38 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 21:58:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250215103000.66380-1-peter@korsgaard.com>
References: <20250215103000.66380-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <79ecfcdc62c662191e02b42e83e4b903@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739653120;
 bh=UURIKbONK1bVKY4Gh1ln9oN/49VUiMCWPE5r8cYf9KU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VJrOmjKxryrHWt9azgfiywRUP/TprHJzMDdf3vhc7rR/xHTwYX9YbCq1YeGj7dz5B
 ZFWEccbUHCiV6eWGv8a/DPOv+2Et1mUbhDyJIXAlVL1Pv8hUOW+oJtN3Eqcr22Ug7B
 ncNYr3M28EEZVCgmJyy+C5Gbj3mNJ5qTKJlrBmcLjAfN1clHgIKRyAE0NS2BeQtKAR
 MC+q9R6GVquOK0nPSWBXSF4mjc47Alt7pr37X6upWqbbl40G2j8374NXZY8entBvm/
 +5bBogmSGJhp0FtRXHrYaFSJ9rABtUvPHFx4LrNK2gqtovboj3SWIFAdn7gYVwObsR
 sWIwRvgW/ClkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VJrOmjKx
Subject: Re: [Buildroot] [PATCH] package/musl: add upstream security fixes
 for CVE-2025-26519
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

On 15/02/2025 11:29, Peter Korsgaard wrote:
> Fixes CVE-2025-26519: Musl libc: input-controlled out-of-bounds write
> primitive in iconv()
> 
> https://www.openwall.com/lists/musl/2025/02/13/1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
