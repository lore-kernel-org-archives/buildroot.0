Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4DD606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VLwvkFDh
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2F2812D3;
	Fri, 23 Oct 2026 17:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha78p93HAfdK; Fri, 23 Oct 2026 17:45:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9D9538151E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792777541;
	b=ls8jQjYR7PYtw6QqvsiWrOAgvpzGa56bCcQNWXoxKeDQjwkVzR//WpDqg0GKUc2HtOqB
	 V8VP+1MMQF55Jl53r3TcBzRgBqbK3/vppmop4/g0xCtu/+os04QFu9xzhmbddfv6jfhqs
	 xGzb6u2tn9HZm5IU37/14TsGA8ss0rG0qrCyBK08uexjEjtq+6Vf26he/CuSz5hrOJkDj
	 Kz8lno9LkHtM5QDRne4dGgvmqj6hPuKk+Q2BChiDT9jyHdQXSNMKPkTcPNWSh5bDNRiah
	 wq8vEwu7Ctou8xxX60rVCum3QYGFVyIc/iLOqPlKTKomE1Q+y3CPvxSheJ0NXZHEwHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792777541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6Cc3YuW5UckBVAjNKxBQYcOaab3PD852tvuTfyrz0No=;
	b=YVDyw+t8yJ6iHJi8lQBM00SNgr8lYZxsWjD+eKIQ4n/N1vOEgLaf8oKw74/mJqmn49Lk
	 TYJ6mJiamXQxzEr6f3hSoY9X/prhmMN7eMl75ueaSaNkNOINXzgQWrKhyVEIIjMU2TaDl
	 +x2HoT4Uj0X74P1IIG1U/pCiNvhJGQTWq5ydQ5nDsdnPwrNm9eP9su4IwzE3c/6ZyFCmF
	 voqovi6GuPFp73hgexr/2N8jS0bJMeeF9qnRmunPd9ebj1JHE9dJdFFiLHeYVm6SD1bQt
	 5Jwh8MjeEjwUaOUUgSmiA2wpVlB2BktUObto2D0I7uiyMisLyuECQ5SxCOcyTISPJ9Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792777541;
	bh=6Cc3YuW5UckBVAjNKxBQYcOaab3PD852tvuTfyrz0No=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VLwvkFDhbtLK7l7Cp25vBcDIET0QB/y3cMzni/MDmmvR+cii4zUrQ+Mpmou6HpH3q
	 rjfDlWot3K4WESJQPh2378Z8xOb29PnfrqxWW08htgwyO3ihlZ+4a6PpsoIlRYzVEk
	 B7XG2IC2bQqQlKvuC2BCkTpPrtA7sGrl7z3mS83CTryu+3Of2Slh2TwruiIre7UZqT
	 k7ysD3+UO+zdY8O1ldEgLCKf/w61RxJhaNA3hRYLmsm9/8neObl3B/pUeBeSAEhaV0
	 TUQ0F1n0ASAtquJZlPtcL0N7fb7kDoudAHgHQ5In0fQowQ+ZneLU8OCH/v37Nkgf43
	 jMW1Bti+NDmCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9538151E;
	Fri, 23 Oct 2026 17:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 491DC12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AA09409C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OL7UC5FgY_r for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 17:45:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7950409FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792777539;
 b=mk22hj43AdrCGqjKKLjVLDtuEsejhVbUlOvAiDaC914WgXVvpYjKBWTA2YijUN0HhbdQ
 o3EMe8J2tMHbLuiOgnuELfUG7r4zuZqcBcIJfBbpBSbeXdpmbr0DW8AWbpgBccX040+Z+
 Z4vImhJCdULq+EM6A4qviGeTybwDCoo++2E8X/nt1O8BObWkcloo3AI8JWXSfwdWYcOm7
 jvcyYAHdskUl9Ihns+yF7420WkLnuodusRFKYu4hN0sL5sF7W0vrudTSedTA3X4JNmPOO
 hnEx6NU+2eM80vzaK2KPedWJUIZ6sNuprzLUcxer0LFfZ1obubEEX7Y1MPnkh5KnjsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792777539;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ZArEu291rf6U4xlpiDjbxRqipePLpwhLeQfNtL2lA2I=;
 b=iiNyDy3nKFRdtKVZo/F22wwEDCcTor1Vr9h9DtC5xHr8zNOi1CtRRRLBWi4FCoc+MTEq
 LctLVDcig2gH2m6hN+7e4Qdwz4mzDrQBRNf2HSEUAt/xAvgnxweaxIh9BgjyVkaUpP7rD
 WcasrMBNxjEGZ52n/mhcuKx0DtlMkSJ6QKmOWpFOinzFXUUhruRpJkH4Xd0qZ2fj8c3Y6
 geMh1r3ralwAeFsGGMQ9CTQZdQZITOCiZXm2RXLTKQGkTWIDO3TZF5plfp34yHMNMy/tE
 CNu1FIQigG6iogR9vthDT+qK8NXQEbW1/hLlwywdFoPRJAZaTlRAhjrTVoJXKW571lg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WfaDGkbP; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7950409FC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:45:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 246A72003D3;
 Fri, 23 Oct 2026 19:45:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 23 Oct 2026 19:45:34 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 19:45:34 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
In-Reply-To: <20261023091738.1319115-1-yegorslists@googlemail.com>
References: <20261023091738.1319115-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <084c2778b0dc2704baa82a7f9a18bc4c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/avrdude: bump to version 8.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 11:17, Yegor Yefremov via buildroot wrote:
> Release notes:
> https://github.com/avrdudes/avrdude/releases/tag/v8.2
> https://github.com/avrdudes/avrdude/releases/tag/v8.3
> 
> Drop 0001-CMakeLists.txt-allow-disabling-Python-support.patch: the
> upstream pull request [1] was merged, but the option was renamed to
> FORCE_DISABLE_PYTHON_SUPPORT, so use that instead of
> ENABLE_PYTHON_SUPPORT.
> 
> [1] https://github.com/avrdudes/avrdude/pull/2051
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
