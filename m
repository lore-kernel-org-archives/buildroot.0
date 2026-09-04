Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88F6C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B100080F9F;
	Fri,  4 Sep 2026 16:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J_Cw6WzJjoVf; Fri,  4 Sep 2026 16:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEE92811C7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538963;
	b=hXoRO7mtPx6KGD0Pcp06Tm4U+GWaODtZSEKtnOkrkcJqeiiwqRwJCAiyfXrFpO/l2/5a
	 YdZRKKxNnIJsJIBpGb6YMeLqm49LpI7lmmkiyor8X7XNiGDAyXV290ZBxP/MAQaUltMhP
	 ean/48Go7rojA0PY3E3lDw2Z0l/c6HwLCW6M5caAPD9nfRjBzEKoyxOOx8XhftzXa3odD
	 HU/9/CfeI9RFeq+LsE0JoPKiec0oDGqH7rPO6eKsTdsVtfp9+VgwWamWbG72/YyXdgKnZ
	 BaZMvjZRc4jihwS3FFjz2o/aa1QZBT2w+APs+6y+LFQyR/JcARQmj32eZkDWx+65N+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=6JvXgnKPVoHHoEM6UUZwtGJuAV0Gk19bOLnlJB8Uy/0=;
	b=VW31vXqlq86VA0ORqk/kkedH+HPpxLjTJVm418U7sewy2WQyOevD7xWVHs1lecZYUrb3
	 Q8oaAq2n+5N8GK1vIxIZyoyzBG3HCbfmHI/gUgIG2qt6kZ5J83LrwPM7uEe/ojC0VHb+2
	 ZG36TNKAH4mb/rOI9/qGkVrEUnq16s96Ulznmks41ugNnNY9f5hoFL4xi2vcg0ZYzVs8K
	 hdVyPr42KPshEF5Vxd3fo3kQDqfjL10+fFNYzz2gvMYTvCAB6M/fvtNmZE7jacAZgoK5u
	 4XDWueI9e/qFvvX/1zoQgLGroPnBRbTpIX9sr6Cp61iphGNRis0oCR8haG6SJKx9yjg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538963;
	bh=6JvXgnKPVoHHoEM6UUZwtGJuAV0Gk19bOLnlJB8Uy/0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LdhVmsOUisV1lZq9nw9aWJiiDfKi6WW2fP16pQ/3Zlko1Ybxfbc3Dc2l1jRPAsXyz
	 7ecYEVsGK9sT+Y7fsPTfcakmF8Rm8o5FsZ+84I6HaR7qSk9rjJewdTfPQbp8yWAEnK
	 i63o9Kye6zj0pywyXv1whLVUxaCJXs2MbO1FBQs9lpmrM2bC53431sXBkEcgD6Kzdk
	 hpA3g5AEE6wVai3wNvADa6ikvejd692O8//d8hGwXT9+nKt/nx4jHPCvxH1Mwt+teW
	 zjILkPZ0cTUx4D6lPa2qMD1yjiv8o3ycAy1dvRZLOW78tuogqgXZDzVhb7vyg5JDcx
	 e0e5HQhdLe56w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEE92811C7;
	Fri,  4 Sep 2026 16:22:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13336B2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1088A606A7
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owbas5dtHY9F for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7820E60681
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=s8Ddb330SG7oAM42K1dG2R3kENGDEJ+VKxdc9U/peSZDIOYGVgXnVVTPJX8OXwGoLZ0o
 IQLSoxaY3hRFQOKcRHIxPQnioiab+buBsscrSLvbyfYFugjLmOIpNIZUlvOznX3AFIKMm
 7RJ2+R0kfRF3elT87iChvhhVk0ZstSs53nmHgOXJ4kmaO38+qOLj/5J4E/FZ2Fxbc9Ttf
 dgw9ILueYFtyXzvz2LRxK9kAlMpiOUyyWRTq/URXwEN1JE0rf0OC5pB9W+vVJ1vIYiGQK
 ek7yubp9SXcr1/Jde4pzO6nORXrkAvxf54FMdcdJK2YtdJy9p1Lbw+ED4zfWtZsg3Pw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AWZwgW6iLtqdhCJN9W/6pYPlsnS/NXKm6bFO8j9uip8=;
 b=kRge3WegTMgqLrN1uCrK/VuWhWYVTYk2OPPk4ElFkefByjLiT1C5WjxMBEsJi6oFynaG
 idEqSAudwlfBhdoBMNiM13HJHkYSHLYWEIkQ8NDf/GWCivUcMhnavA7x6noE7VXtuLZ2s
 nlvRaz1+E9r18ujoUJ9VJ3n8m36V2UC4QERTJrSmFgn7Rov6/sdBBblI5+N89F6XNRU83
 EjPNLE7nd2xqcv1uVDscrc7tPyoejsNjAULV0kwb4tlF4it/IXjQiWEBbWeshsV/yFJ9p
 buAlgLlRCibuIez6R1GI5K+DsWR/jt4a0mbgtMdExtlVfH+ec71Gy9si9Mb1H+YJUlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7820E60681
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB9B394B7B; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 18:16:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f92220f16b3b0c24cadae6f92a662d2ac22a879d
X-Git-Newrev: 91a2916a97a2aa29f98dcdbb4bec19382636dee7
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.CB9B394B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: add 2026.08
 announcement link
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/91a2916a97a2aa29f98dcdbb4bec19382636dee7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
