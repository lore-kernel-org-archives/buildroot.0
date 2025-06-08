Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073FDC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11D040B35;
	Sun,  8 Jun 2025 13:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfAAyl2OIGAM; Sun,  8 Jun 2025 13:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1946A40B12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1946A40B12;
	Sun,  8 Jun 2025 13:48:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA3E01F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C00CB81215
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1gTWQZnYP44 for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6A9E81205
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6A9E81205
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6A9E81205
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:48:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8785219F5A7;
 Sun,  8 Jun 2025 15:48:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 15:48:36 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 15:48:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250607222849.53009-1-kadambini.nema@gmail.com>
References: <20250607222849.53009-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <235d936567ea754b284789ff955cd41c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749390518;
 bh=ohGXXB1wwBXWbK9DDooqD4cTsvC/mkrsApljWBGREmc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DKhCPP9jEcLxyUxNaj/JLn2EU0PwWUE6nszRmuhHIGZttCE2y8fI/esT/53ZuDcN/
 K/s+GjrGUxq2PQ0hZKXaDGZrk1KcTJBCxQtHWgANNw+69rXep8IKB8i8z8hgRgs1V4
 XXNOC7JHwg5nbSGHsYlg6WiLKYbiEG2UrVFCpvyrnvZcLwmBECJg8sRqSDyKWiOy7C
 vNfI8GjwagTPOK43+BdrdBQ5IkMagqNIR7/PdKfDhdPAMkXXQAUETOQ2I6S1/x2hqf
 LzzOVoTLX1ta6E7+X44SrdI5eLnUMKlyEixjUZHvjaM3N81zlL5uHlB1JVIvQEhVDb
 ENESksawGs5wg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DKhCPP9j
Subject: Re: [Buildroot] [PATCH 1/1] package/whois: bump to version 5.6.2
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

On 08/06/2025 00:28, Kadambini Nema wrote:
> Changelog:
> https://github.com/rfc1036/whois/blob/v5.6.2/debian/changelog
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
