Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC63C87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B4141039;
	Sun,  3 Aug 2025 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB8K33qc2u1m; Sun,  3 Aug 2025 14:50:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC51140EF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC51140EF6;
	Sun,  3 Aug 2025 14:50:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 346E61A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DAA040EF6
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqetf4xmGQ_Q for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 14:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24D0A40EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D0A40EEB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24D0A40EEB
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 14:50:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 02F3478050B;
 Sun,  3 Aug 2025 16:50:19 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 16:50:19 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 16:50:19 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250731191226.1599504-1-thomas.perale@mind.be>
References: <20250731191226.1599504-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <778332455d1a5db4f8a7d8e67d425ce5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754232624;
 bh=f/838ptQgyh/AHJ+2EDd/3nxJJnHxMvpUe6RdTuMBbU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rjISr1TdRSFfY5EjQsD2wmjcCXYPQFWfIUBTlFPzzO+2Fotf9UJsB/7FTSeBbHLOY
 gW08Rap2QChF2dgLDF0PQi+lR8lw8M3Bq9ofVavaZphxcOY2vtngRUvrDPwaykCHtK
 ai1x1aqVouTdsOEPXpWCNe79HOMH8PXFnAwUqfFPSWPeyV0dXVMI0t93BQ4UYYmz4Z
 kt2S8bONMcg5QrEPC4kq/HISQdRw+xU3hm/LVz1qhN9DhczndU0heF17E1At4hoxNd
 fiB3H02U4mcUbwOfx4xkkr7xGKFAsU4ydELnkRtsMBRsgT79o7dvA9G9KA6E1Lb5nf
 vizJ5BRhPna4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rjISr1Td
Subject: Re: [Buildroot] [PATCH] package/libxml2: add patch for CVE-2025-6170
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

On 31/07/2025 21:12, Thomas Perale via buildroot wrote:
> This fixes the following vulnerability:
> 
> - CVE-2025-6170
> 
>     A flaw was found in the interactive shell of the xmllint 
> command-line
>     tool, used for parsing XML files. When a user inputs an overly long
>     command, the program does not check the input size properly, which 
> can
>     cause it to crash. This issue might allow attackers to run harmful
>     code in rare configurations without modern protections.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-6170
>   - 
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/c340e419505cf4bf1d9ed7019a87cc00ec200434
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
