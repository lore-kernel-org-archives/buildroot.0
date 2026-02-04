Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6A2E95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F9DE6070D;
	Wed,  4 Feb 2026 13:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbbQeNLElpKB; Wed,  4 Feb 2026 13:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7157D6087F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211114;
	bh=5JW0VWL3uQjCxSZQn59I18poaTbNO+66Y9i8k0u4YO0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=V40U2CKS+RNFgKBa0BGzlCk47jLaHdThMuh0ZBDAItTpy47lU3H9RrRKJyeaDP4nW
	 zr6V0NbCMZhvzYWfON+4gnV2W9mOx4Vd1RFNtQ1YtLmIOp7l2484+ELl6xf2f5VJnv
	 KbRHgnjw9YAR/usVhpl4SJvuxRJu+/Is57g4UeqJWJor8Yvpr8wBJKhqUaWizdbnxS
	 TUl18MGQxjCWaS9L/awJsj/TQhFC6vV3BdvYjA722z/xxwaE4Wafd36p5m/Tmtu4uA
	 LeFMLECGrK0F8LE7keR7Pur0KBB0abaerzXyvih1mFlr8895PjbXwfJ/XLR2A6nFyE
	 xe8bn8aCKgfvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7157D6087F;
	Wed,  4 Feb 2026 13:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 643A0F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4538F6087F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0ySTTK2gMjd for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:18:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2087E6070D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2087E6070D
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2087E6070D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:32 +0000 (UTC)
Received: from [100.72.251.121] (unknown [185.109.152.95])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 10B502C82D39;
 Wed, 04 Feb 2026 14:18:30 +0100 (CET)
Message-ID: <0f4949da-8d9e-4e8f-8474-f4bbb2c7c164@bubu1.eu>
Date: Wed, 4 Feb 2026 14:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aXOEn7q16Jh2oEax@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aXOEn7q16Jh2oEax@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770211110; bh=Pb5Meu/gjViX6YffCo4hICSzJd7ysFlrvGK2Xb62GlQ=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=b/POQsgzeGQxg8G2pXKuyKUFCP195HhujbQ31z6U/BPXXhrNYvX/b9YrudQ0Dtsw7
 mSKTLOC4mkPK8eADutoogUz72yUvcSdaSxXnX7ZVyEFtJzZaNZ8H8lepRCzyMomkuu
 M8dfVvvfKRLZ8IR64daU+VnMqRlW5+X9bOuTbBSMDy3iwEXXET8sxZ/UFS1w/YbR+o
 zRdMMQ+uWbkBC+hmUXTBQn68eQdLQmhgjNdud5EVCPyzBcsifMPFDMS0V1vDQ7+Hzy
 fc4aWRcpD8JUVcGcTVInQmm3PoKDYN2nZ2IXRl2sxLcFY4ZcaVdlKS4l8WvZJdF22P
 S5k+2Ro9OsR6A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=b/POQsgz
Subject: Re: [Buildroot] [PATCH 2/2 v3] package/strongswan: update to 6.0.4
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Waldemar,

On 1/23/26 15:24, Waldemar Brodkorb wrote:
> See here for Changes:
> https://github.com/strongswan/strongswan/releases/tag/6.0.4
> 
> Enable minimal required kernel config options.

Is this actually related to the version bump? If not it should probably 
go into a separate commit.

Also do you have a reference you can link to that documents the required 
kernel options? Adding a comment to that would make updating the package 
and re-checking the required kernel options easier.

[...]

Marcsu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
