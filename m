Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82554C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AC6780EA4;
	Sun, 16 Aug 2026 11:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fqvC-zMX6pHp; Sun, 16 Aug 2026 11:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 664BA80E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786880270;
	bh=/bszs5gLdXq/52aHom+w9AlW2QWn0Z5YqnSmKe1nLMA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WLc+nBJPrB22CO6pTtTRCe3SapVHF6Eab9jCaRoYgx5ZSTDKbGVnVjmADH/+q+jBF
	 /8bDkcmEyPpJtWH1zYcJ5C+lEULmyqMSsglmqgBRIHZwBWD1PwSqbtKqMwyqJCbBHu
	 djHo8FMqEBTttTP97Alv1EvESYInrfXb3ezaFSuxNTuQKAXGwVTNbQ9PdWziXMXRye
	 D2Ja91FfQVyPqiBWGn+uNPnUlotvsWHWQWxXaRDmmj7ir0KXvE0KOeI4SMHOQAZch7
	 +DAxpPiWdTNYZ0GMmcVOMJaFelQ6horljXCFyDzbEjT/TZaXZ64zBk9IecU/2h17IJ
	 TJ1+HFjMNDoaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 664BA80E82;
	Sun, 16 Aug 2026 11:37:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D2388337
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B841680E82
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvXTc2q_S2jV for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 11:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B795880E56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B795880E56
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B795880E56
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CF1F6B00539;
 Sun, 16 Aug 2026 13:37:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 13:37:44 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 13:37:44 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aoGCVOA28ZKnveLq@waldemar-brodkorb.de>
References: <aoGCVOA28ZKnveLq@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <e632c6b95895c3ff1d2687b757ede1dc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/uclibc: automatically enable uchar
 when wchar is enabled
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

On 16/08/2026 11:26, Waldemar Brodkorb wrote:
> When wchar in uClibc is enabled, just enable uchar support, too.
> Adds 5kb to the C library on aarch64. Makes the default uClibc
> config more compatible to musl and glibc.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
