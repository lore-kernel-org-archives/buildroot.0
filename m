Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C0606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GQU/HhVE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77CA860815;
	Tue, 24 Nov 2026 11:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZn_mBDNZyld; Tue, 24 Nov 2026 11:08:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9B92C607EB
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795518511;
	b=OF8YMktaOuVEmmE3J48W+3fkQyFVwC9R5jeAqE1PNSL8dZt7dwDaBz5OW+cjQHRDfn43
	 jZ6zP81gwnlnqirDsC7suRXNdyV/iO4+goNnOO/jZo2xif9Ro+yTj0cpxYiqKHsnMd3fU
	 Wn1kVgWkPAB921IWUIRgA5AOprYgcM1xOCWSUJb9f8LgVhp6Uzo5D51xwLI4fp50HWisj
	 Ag2JjaFFSJcAt9DJk/s8VhaDk66e/j/bjUQBi23oUTChP+CY4rfdP9gXsoC9nuX7cvKq1
	 0cO2Omev3Q50GtU6WOYo8UAa9HrEJeXxOlBAjOwVt/WxVARd4B+NDJ3z4XY/6jwPtFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795518511;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=3Q1ms9F8ivH8tlr9tqfquyJfVlLM2G29TmCDw4czY4k=;
	b=UdWS+JHIvbdwIh6pDzzyKg7LbCwf0UTuWS5j0Ev6ByO2JGnvSLYd5lOJNoTtzhXRE+V7
	 MSfoL1m7Ery7kqQZaxScP3/pVEQcpzF7joZD8ija6FPrC5df1y4KyqDDCeTcQ//zLcTMb
	 g1Ndf03f2e8I2fxLS0F4mbHXfRl9lc7mQylSEe0jsG3zUkIsStYd8aDpTb8JEHExbSL0G
	 QdqIhWa6OVo7bKlbC8ggt2ZKWXpcjDGEuTsvnxdWewTflASrf5nBPtLMqDZ9HoflSRbAX
	 prccxUnlhQqxLtoMwBl1ZHeR6oyJDdDkOx8IAbDUe40byX7arZPqYsTzqbN6kNC/PeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795518511;
	bh=3Q1ms9F8ivH8tlr9tqfquyJfVlLM2G29TmCDw4czY4k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GQU/HhVEtwLVLhK95WpZ2Jhb6ywl/6nDmqTLw5MKsp7GSOkpDuRODlG3Uq8avYWRx
	 YVccqGP1MleJyiPHtOPchnLykdzWzp/1jqt+At+XY35xPHmJwQTiD7oo+2HQs02MNL
	 1nTxJJhZicEgEUNwF3maSDTHh1l1eyn0nXd1a09Tohn0dTcS4B125bTts+xfgUzDi8
	 gFjlBsJ2MhfxSJ0oCMrucdaE8zxrDGs/b+1O7QRKTt5V33wm7+vu4aTH9ZQmEfZIrk
	 BtWb9b+2IMpfDwkBh19PzOIrXcbWeYivy1+FE7qb4OsjwV/IdaNzWCUPUGnwVUnMeU
	 buIxGbDB/UM2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B92C607EB;
	Tue, 24 Nov 2026 11:08:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 59597715
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A184407C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VHH52J5h93C for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 11:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D591407A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D591407A1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 11:08:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0876019F5B2;
 Tue, 24 Nov 2026 12:08:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Tue, 24 Nov 2026 12:08:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Nov 2026 12:08:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261123215318.3796094-1-bernd@kuhls.net>
References: <20261123215318.3796094-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <8f3f507f065478912e70aa3f7f08aee4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.11.0
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

On 23/11/2026 22:53, Bernd Kuhls wrote:
> https://github.com/libexpat/libexpat/blob/R_2_11_0/expat/Changes
> https://blog.hartwork.org/posts/expat-2-11-0-released/
> 
> Fixes CVE-2026-124317, CVE-2026-128241 & CVE-2026-134703.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
