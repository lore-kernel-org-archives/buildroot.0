Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9435DC5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49A554071D;
	Sun, 16 Aug 2026 07:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8OX_Hnmy8Yba; Sun, 16 Aug 2026 07:50:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771E740712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866612;
	bh=cY8A+k05Uu45QfI9S0FsHobPbzCePU18SEoeXTMJJ+I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iGrHNDQG1GrlsILZzzQCLWFAM9CUALh+gjZnAWEouT8prjVdiK5MKl8qWpu+LfaM7
	 2mPbiVvNumY9BEhvMTdF9ncxEQZkRLztXxOXo5qw/qxeOfaH+d29/I9lqW9wiD7ppM
	 e242/qlfBabXyyPV/eDPQYYkuL0ogfRDSqnW9CrNg6ZzmlaU0ZOKsLJEDMJuehA553
	 Hn6wkQSQhunKTj/sza1s0F0pVZQfeaQLOZA4mSYHvr8GiW7KmkmMwPPIOLOaxKFAdV
	 1KfMVOCc0SzMzOqvZy7ATnOVc6lb6EqdFUxYMR1P1W2IK0QpFzExe0zle8aj+AT0vs
	 zmnZxG0Ib7M9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771E740712;
	Sun, 16 Aug 2026 07:50:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32621194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 241AC80E66
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhAzJODMttjf for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2017480E65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2017480E65
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2017480E65
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:50:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 720B65FFAA;
 Sun, 16 Aug 2026 09:50:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Aug 2026 09:50:07 +0200
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 09:50:07 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260816041902.74421-1-br025@umbiko.net>
References: <20260816041902.74421-1-br025@umbiko.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <d9d333777e019d914a0ba885698dc310@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.24.14
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

On 16/08/2026 06:19, Andreas Ziegler wrote:
> Version 0.24.14 change log:
> 
> * storage
>   - curl: bound WebDAV PROPFIND responses
> * storage
>   - nfs: work around libnfs memory leak
>   - nfs: fix use-after-free bug after timeout
>   - nfs: fix assertion failures
>   - nfs: stop after 256k directory entries
> * input
>   - qobuz: use HTTPS for API requests
> * decoder
>   - dsdiff: fix tag parser
>   - dsdiff: store audio format in database
>   - dsdiff: reject overflowing chunk offsets
>   - mad: limit ID3 tags to 4 MB
>   - mad: ignore implausible Xing frame counts
>   - modplug, openmpt: fix error handling bug
> * output
>   - alsa: remove logging calls from the real-time thread
>   - alsa: remove option "thesycon_dsd_workaround"
>   - alsa: fix corruption bug with "stop_dsd_silence"
>   - osx: fix format selection bugs
>   - osx: fix volume truncation
>   - pipewire: remove logging calls from the real-time thread
>   - pipewire: fix uninitialized variable
>   - pipewire: fix thread-safety bugs
>   - pipewire: fix deadlock bug
>   - pipewire: fix ring buffer corruption bug
> * Linux
>   - support Zeroconf with systemd socket activation
> * Windows
>   - enable the "mpg123" decoder plugin
>   - fix shutdown in console mode
>   - fix last-modified check during database update
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
