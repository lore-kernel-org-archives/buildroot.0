Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE789C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 20:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 919FB60A99;
	Tue, 22 Apr 2025 20:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pjk23UpFTsW6; Tue, 22 Apr 2025 20:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D931460ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D931460ADA;
	Tue, 22 Apr 2025 20:00:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 168561A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F090060ADA
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXdKdwnnjJ0P for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 20:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A62F60A99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A62F60A99
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A62F60A99
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 20:00:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id ED3FA780333;
 Tue, 22 Apr 2025 22:00:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Apr 2025 22:00:26 +0200
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 22:00:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, Sam Voss <sam.voss@gmail.com>
In-Reply-To: <20250422100011.962097-3-elmehdi.younes@smile.fr>
References: <20250422100011.962097-1-elmehdi.younes@smile.fr>
 <20250422100011.962097-3-elmehdi.younes@smile.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <daa024beb7f5ce1db51376da9b004a17@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745352029;
 bh=a+AxhZTP0aHcgDPEVf4fx+gxwtTLg1+OQlz/8uwNfkc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S2tmXIPvLxBcse601r2WRRi81i7tL7i1LikUPKay31k/gG4UQgPyaD5cahKGKoscD
 0aIyqNFOYbLnPHvqim5e/z6iDeQBQM1SiIQDmtvNbo5moYDC6SOuLXOaw3lUesOqiu
 9Nm0Xsl08BluxLIFFWIFgFkV3XbZIeoHw+vWh5uFNt6v+x45pxm1A5o2eUn5COfFBC
 8NxtXSHm9v8xcJM4dP7jTCoBeQGfl2B2kjpHPZm04ytFJznjF8LFcKNKQ1e+NqzhVs
 fImxMhHqxqLbW3SgQ815aSsv3w5hPVoRw/v12ul63tzepUmEc9NbmbBuLkncwcm9N4
 U8lH0QB/2bewA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S2tmXIPv
Subject: Re: [Buildroot] [PATCH 2/2] package/ripgrep: bump to version 14.1.1
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

Hi El Mehdi,

On 22/04/2025 12:00, El Mehdi YOUNES via buildroot wrote:
> Changelog:
> https://github.com/BurntSushi/ripgrep/blob/master/CHANGELOG.md
> 
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>

I squashed this series in a single commit and applied to master, thanks.
See:
https://gitlab.com/buildroot.org/buildroot/-/commit/259af5589ccdd722295395d120875f4b8cd667cf

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
