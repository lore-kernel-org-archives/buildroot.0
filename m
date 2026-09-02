Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A66C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10A4340BF8;
	Wed,  2 Sep 2026 19:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_9HCfinjf3r; Wed,  2 Sep 2026 19:34:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 679ED40BDC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788377676;
	b=O1EQv0M6mCZsPvB3D3qcBlPH1kScOhdO/QyHDIeAwI5Fn+0eGaOzil13J64geQpHse50
	 361ArTVxidqr859NwVInyWoqwmNWTxryTZV8jNmvsr5xGePTr1i3bYl8+PeVBME87KuLK
	 hNQKsflGKAyjrq6uqPhq7jFS1Hx8mdTvebj/TErDZYawhhZa9twa22J03zjJRUQXRzRnL
	 ATNl4702P+ifH5XuWJeT5Gjppj3ke7Xj1ZVPuA/dI1yPO1ZlUaYlBRtMZgKjtuixlCPlv
	 TTRYVE6iXxkDWmc44qz2BCW80PL53bCl7AONvj4Nxh0zjEtGdGKVeAUtiSB8KJhPwyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788377676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=p1irytIcRsZ2h0rk1wXAYbixy92EBVIJPryRBsL2AiY=;
	b=UO2FZj/R8j4IpHAd8yk5PTDWF8uQ03JO+HsJDbittcY9y8rdYqPwy1Fh727rAA6bDQJa
	 I0DXBHpLMkO/sJGFIP8BdrofhcvvE/sN6v9oU4QjDTB+hLnZC4VgfomIZPqx3iPwtc565
	 a6v69vTGB3w4MO943N9K7EVLv7Ml6J3hPr/w4u/x230+5IxJPmMlYrhOWDdBDeGHejiGn
	 r00MBCPqFkFi70ZwkoM80jrHTN2RO7S8f8v8gn4lcfHbZIou2Z2r+matNDJDU/KwIJtS9
	 P5kV0Zvie19BFGimknI+q2DYREKnluOXVGh8tUvRxTOpeJ5cIa+pvp2QPhrUEm7aifw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788377676;
	bh=p1irytIcRsZ2h0rk1wXAYbixy92EBVIJPryRBsL2AiY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cjpZKlh90GNuTypga/2hN2K5q8gV/uwxKVF0d7n2ffNWtQdmooi0UGxA1v/ux+bho
	 B+yfh5RTjPrcMJZcWqiWOQiyPV9dncWg/AOVqxR7dwlQZnFSWwKlWWmDsY9UnIWd1o
	 Ay79Pp2B4sH8rgX27iAfZxvYMscF2AaLo6N+bPUeCeE1rupokxvpbN2nDZ4xOqqDXC
	 D6eD/V2jPwmzJE7W8fA4R+VQRV0TB2Othugma2MXwWNyUMjyxEq+VQfK4a82oE1r1Q
	 bzKv/+Ge1LjCFcEZg/I5A8xxW3sRtj1MamHPJaThz7U5cwVPLl85vbWboh95tUORw2
	 1Ar9jy7tBWpKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679ED40BDC;
	Wed,  2 Sep 2026 19:34:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C1A51D9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421BA40BDC
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJvNgHwAmea4 for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 87BD240BDB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788377673;
 b=pgx5M0pKT8zKzvnuse4d/EKLZZtQzl3irfpo84HHX+bWx/JD2RdXuc1az0OEUzSHL0IO
 cM/IYwMNk3TEY3wdAuFenFzwVIlCwgOhRprJC4n6+1SKPXmjGWPfyiZWtI77lek5CnAj0
 xzM1eOY3JOLL0+rF61dRw5dT2NXi6NAC7zXRvXp/G4kIj9ymG0NqCIalAH9jTq6+kFmYD
 0baCTDkedYCn4rS1rbRwa96fnLhvdbZ1bpn/Ih+dJZ+2Lz14wm/UbkOI1/eHJD4ieSLzX
 oUw1Fgf/t7pgNQFhJlKv7llH4Pmy+vDQhEEsir7Rt38stwrRmmudS7tJ+Av4bMyUxPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788377673;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=bI5vyHJBhe9oDh/N87aJ20/bwmTxT/eZNyW4Ufz9ITI=;
 b=QwEsJ1rFdXsL36NELF0/ZfrTCB5UI/DV+QpWCQHSA8noRQ8463yuq1V9wV833TGCxn7p
 Ar3EdbTbheGcKo8BKeM9mML9oyqZj0Jw6s3rU4VPPFySy03VYplanYjHa6llGn2PnSP+5
 T6fmSNSzH3HVwA6GLGSa1pLCc4HiayBD513c3IuP8rcVRthTRWuvyhJWeGPI5ZKxH4/nM
 Lf8L/cZKOePa34W1UKtkH5w6x7hzamFOHVNV9wd0MxJc+26gh80/N5k+bts9hr+zv3wKK
 U0VCaT5FpDbiEeHqBi3Rq8ZItbe9u/eBTpAxuqJnSUdteE8Yw1h0m6HcuGVm49Oz1LQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dtja8rKu; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87BD240BDB
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:34:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 92BE5780371;
 Wed,  2 Sep 2026 21:34:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Sep 2026 21:34:29 +0200
MIME-Version: 1.0
Date: Wed, 02 Sep 2026 21:34:29 +0200
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260830075108.767345-1-br025@umbiko.net>
References: <20260830075108.767345-1-br025@umbiko.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <1e5c69cbf5bf0a53608b422ab289c7d9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.15
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

On 30/08/2026 09:51, Andreas Ziegler wrote:
> Version 0.24.15 change log:
> 
> * protocol
> 	fix crash on "sticker delete" and "sticker find"
> * database
> 	upnp: fix crash bug
> * input
> 	alsa, curl, nfs: fix stalled transfers
> * playlist
> 	asx, pls, rss, xspf: limit to 16 MB
> 	cue: fix problem playing CUE tracks in music directory root
> * player
> 	fix noise with replay gain and cross-fade
> 
> Signed-off-by: Andreas Ziegler <br025@umbiko.net>

Since it's a bugfix only release, I applied this patch to master, 
thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
