Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE43C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 16:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 186484054A;
	Sun, 13 Sep 2026 16:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gArlIzF1NTNc; Sun, 13 Sep 2026 16:34:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1DB2040531
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789317292;
	b=PIZgawVY/8n9NwolUpbTdjToOUg2kYLIhI5eqtymViojcwhggVID9SdIVcBwBBul7p+6
	 /o7zaqewnwfm/n5i069YZPBKgMicMUVyhMiFu0CYWsxHtRmCD62u7Il+csq0JBZ/Y8rKN
	 1Y+6hIVny2KaXqPzSuq8fPRl5kbdJz9h5/GrkE0JXMWvXTcvsu87RYpQrRqpFDfGul8xN
	 sVPoz23fPCPV/Gc/9ljhc62DFnM8Cwbd4aCWKq3fRZBArvQc/bvxjDlue8tD3dl+sqK0U
	 1zqnjU/hf6TvIzB/3hlWs/7FWA3WqMeR0Ry548alwHSbx+B2JwZCBbRjuBMEhwWXS1A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789317292;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Rd5OWKU4EVQ8OtwguzLkeFvJX1hRL24JkPKxyqyvUdk=;
	b=MygA4pSkmn7uY78NTvLSLL8EZLI1RBxoWNEiP/xdjFvpzs8WO+Upn3lQWZKe6cz6LoL6
	 1I7Igo0yj2uG5S5hDAO1CEQxJyQbNVfBp0BeKMcJe24QspzpoEDYLKZy1c9KdLmvKJPyN
	 G93s7eB70gWkkOFlCjybQ+Jz6gFu4ncz5CBO54sZ0yiDwOXGEulIFvOpufvPwcO9vAKHo
	 vRkJTKMzFgcnZo48HV15dIwcr8vB2O0Ljlh5RJiyv9ZtFOEoD4KvgWYif3vHZxzsMn5GX
	 tq6vakHpXyaCsKVVgqoY2eLvV2NeSdONeuJz2rjUCq5JG3Q8PBRTa9Zivu+cxEG8csg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789317292;
	bh=Rd5OWKU4EVQ8OtwguzLkeFvJX1hRL24JkPKxyqyvUdk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bB6h/1804D/qf7UQ+9yvXcNLOvEiwCrJJ7vHJ/jzA4YTg9gzStM/AO1dK5Lud8kz9
	 xGZYJSyC2Ze38sgg/unxC7ccDRAu0y339T1YYLio4kfmRck4OhsHrrfz4n2MRDHQLx
	 wul0hweISZEgTbkvdGLMPkqaHb5tc0lJePRlQ7CMoe0IBh/RBTxrUi+s/y+ms/gjuo
	 IowBrk96/Dnu56C5e/aCYFOeTgDhQIdWIvHkDSZrFyzpT/HuU7x+aDefoIJR71X7d+
	 Lv7IKmiMnQvCkjR1c++pVokCxYOBZGjwanlFGrke/NB8+1YYtP8pfnEFaWh4xbW38p
	 /Qnmg420rCmBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB2040531;
	Sun, 13 Sep 2026 16:34:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9771E362
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7563740076
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SL4MXxMKwx8L for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 16:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C1B2C40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789317290;
 b=YAZ2CLfUkFC43pUFz209fuFKz3j63/zbtsfsg4DSBtUO3DxWx2HU+bepw2Nb2T0EPFth
 AdP9BSrwQVZEse35wpzgK2WCnVmxyLPO+w0SXi9EG/QY6nX94koRe/hdjw+07TegCXtHg
 h4x9wWaQnzWt63TKKJ87ophl063GngVcW7oLZk63OXlm9pR5L+N3wMzPDWysU8rJtNz5a
 GIGq2dg9TkmMYipAvG0RXmTGr0VUi0gQCAJBcKtLQ95YlfzrF+rkAXz3cV3otSjEL5u1/
 9pOwUPoNrMbhjbjuTxtgO/L8K9gxktmx0hzynv2l3GgkG/jJty7gpiGDRzExOrkKILQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789317290;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=uzXuw/vaWd7ZTHqj1eqRMCa89WnGce0YpZOrODBqcJw=;
 b=k1odYnY6bsWzk27LAoYhXV9zqwUUsaHb3METYtYU1WzU8OBlOj63Mv8OiohUePSyVOIm
 civNxSaCIvd1LyE1yR4fzn0CfpgJ19YvOjQNu9tSa6QARM0q7/jktZZ7ZgKA1c99FdAfx
 GO26zO1I0+u5xAhMrUeGQRk1tZYEraj/HPewgqpTHTamqhD6CmlMycVs+0Lze2T1Y5obj
 K3r/EyEEZMMuajFip0diunfg1FBfTXVJSfAVuJQrP2tXj+ZmrR5DR+s5aae9EWv5dK/nY
 2XogyKx7kdSdK5S5uI4Bc66AY/Pz2bZJRtb1VG8W357z3fhBCX0ebiXla768GO4jxfg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=r3x31CWt; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1B2C40022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 16:34:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3BB0A78035B;
 Sun, 13 Sep 2026 18:34:46 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 18:34:46 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 18:34:46 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
References: <20260907122423.1350497-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <e5fcf88a9faac360292014047af98fab@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/pocketpy: fix build without
 threads
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

On 07/09/2026 14:24, Dario Binacchi wrote:
> pocketpy enables thread support by default (PK_ENABLE_THREADS=ON) and
> then requires Threads from cmake, which fails on toolchains without
> thread support:
> 
>   CMake Error at 
> /usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 
> (message):
>     Could NOT find Threads (missing: Threads_FOUND)
> 
> Thread support is optional, so enable it only when the toolchain
> provides threads.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
