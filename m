Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78CE606A31C
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hk/KaNQm
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71FC1606A3;
	Sun,  8 Nov 2026 10:00:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TKbk3oDNUbnm; Sun,  8 Nov 2026 10:00:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A50A26066A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794132039;
	b=I+N6i31gv4WJDnlpjiDwEvKqRCYjZVHvfo3w1ygfrmzETyNlfVEQHOJBaroi/cOQrn0T
	 XrC6hFA1Pk3yCNkgpwD4bi25MpGaTmfmzMvtX/kdxEzwLxqzy8jXGdUbv+l8AqiJnE0Qq
	 PaLh0eGhEjeF/b817oUgnTmgu5bDQeWFNYw/XejTAqK5/B/vPjk6mgaJ5EBr9iqoGAaEY
	 y3kBmI86vydObpt6gzK9eikWU8crQT8KOapaWHOfNn3DvyJ1d1cffTnyq3c/p9wiqjZjQ
	 bbI15JnGnumB7Q2f+DdeaKsNFMXC6prjYnI3jN5q4FVjm62g+W1U9sjuC33yHjDeh1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794132039;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=IwrPaHIqV7irne7JfdtGC04btfXt7T5QbeFaM/fDTdk=;
	b=gyO4/9cB2pN9X4RgAwIjls747DFuAllzW0/Q001ohMPj0U8L4/OOzHbf/N6++Vg6ksoP
	 o6rdzBPHERiLtj0kVtCUK857H0zrqXErWjMhWZNBVAIzUlEP428/3iEV5OWJTXfgQcM1f
	 rZjTuuc1FA6rnfDQtNmiGmbQQyWp5H3bprTJ3agOlDqSb39PFdH1X1udok8zhNEGTNB9M
	 9AoEDU2ULz46PcRlEaD/uheWP3PqwOsbBtHM4bCnghw7my4jqqZ2uzJfPCW9hAhlZo4Pk
	 fi1nvza0vPo01p5Wp0FjMHL54mISCY4DdqkZHCrwlfrRKFMSCIjWVTShn9o4VLrCmJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794132039;
	bh=IwrPaHIqV7irne7JfdtGC04btfXt7T5QbeFaM/fDTdk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hk/KaNQmsN9Vmqd9b5Sg4SFZPkl+Keinzszg6wNNIj3BwAK63OuJIQQDNKxu/6Ga6
	 Qs0uYJxxeoZjGApdixd0dkYfSe1lRscxccGkPF7TvGAhgMdl0BjUoxF6ZBd/xSm/57
	 e/XOxpZ1rODxQbqF0Qpo8xnB5K769qIiYEjiV8bVEK9YgzCQjkWaXA52OrApT+tW7z
	 O08QRkaWbnc+/uTFGWb9m2ykidpWtdWrUwdBculXwgk0ardD6/Pndr10z3427bOtdI
	 9Ig5eYhmLKri8G2krZy5QJ5Es8f+wBBGZZG0fdrzPtUEuI0XFL4+VOq26Uj6YR9kS8
	 Pz9Hh3cNzR1rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A50A26066A;
	Sun,  8 Nov 2026 10:00:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DB12FE
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2786400A8
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxbHUtzN5lB2 for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 10:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1F69040093
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F69040093
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 10:00:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 46588B0054E;
 Sun,  8 Nov 2026 11:00:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 08 Nov 2026 11:00:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 08 Nov 2026 11:00:32 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261107235537.2546061-1-yegorslists@googlemail.com>
References: <20261107235537.2546061-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <3b4fa21a368928716c6cf802f5055757@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/ed: bump to version 1.22.6
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08/11/2026 00:55, Yegor Yefremov wrote:
> Changes in 1.22.6 (released 2026-08-20):
> - Some changes have been made to the code to pacify gcc's static
>   analyzer.
> - 'regex(7)' has been added to the --help output and to section
>   'SEE ALSO' in the man page.
> - It has been documented in the manual that the cut buffer is deleted
>   when a new file is read with 'e' or 'E'.
> - It has been documented in the manual that using a regular expression
>   inside the command-list of a global command may cause the "last
>   regular expression processed" to differ between the first and
>   subsequent executions of the command-list.
> 
> https://lists.gnu.org/archive/html/bug-ed/2026-08/msg00003.html
> 
> Tested using:
> - utils/test-pkg -a -p ed
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
