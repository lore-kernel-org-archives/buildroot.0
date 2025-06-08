Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4401EC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3C681393;
	Sun,  8 Jun 2025 13:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_lrtgzIMYr9; Sun,  8 Jun 2025 13:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F68881215
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F68881215;
	Sun,  8 Jun 2025 13:49:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CAF21F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E1B760DDF
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo8OX4GRabBl for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:49:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7C7AC60D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C7AC60D66
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C7AC60D66
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:49:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6AC225FF88;
 Sun,  8 Jun 2025 15:49:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 15:49:06 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 15:49:06 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250607222538.50866-1-kadambini.nema@gmail.com>
References: <20250607222538.50866-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <5768215650019945de7000664b1768b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749390547;
 bh=LPD0YrLFFy6zicpSo0aFZfQxlURxh1a8R1OWqjEQ/Nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NZS/3Awpu/jNVOoOegYgJ9yPCHHbnT0/JHgqrAF0xT+qAYrSv179MwsFNXlR3Y4aj
 tmKmwnjuJ6eRwh61uFw7PxKwdtkM/XRw8+JNffroV8fSeQEYcaxxu5jsLABmCchdRD
 DA7YAF1MrWAppHMgov9DK43d/FAtd7+iS+1Jb1ZyIWmpE+JGuslEOJEKvJxHH5Fays
 R2RJJAc1DifRDJDJa5p9FCRm+43nkZPNPICWRuNa6VcDJ0pHkzEbcdhm0HQBSuKVsa
 njxkG5wyNsBH5NZa72q1pihm+5XPcldyXwzOsg6SbZR27y1oEdY7WMNLQdOFJ2+GSU
 nY/irJl5x00FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NZS/3Awp
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.1
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

On 08/06/2025 00:25, Kadambini Nema wrote:
> Release notes:
> https://github.com/libgit2/libgit2/releases/tag/v1.9.1
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
