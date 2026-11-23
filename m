Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B5606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RB1NpAfJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A71F605F7;
	Mon, 23 Nov 2026 19:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rc_goydORKFr; Mon, 23 Nov 2026 19:41:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 326FB60600
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795462917;
	b=IFEwtfqegWlE3nWh8eOulWeN+8OY3f39PRJ6zNIIl+nH9Af7iu4NWK/rvnlVrlq+HDmT
	 IQMUOecptAQYJIXS7S29ooySnplcIqOMvHWaeCzWC5wKSZMN9telQFEgvZGmqmgNtkx/3
	 ynaGq5hjqaTeWigynQgMQ+gC/mM5HHp4bSbu4jJZ1ekSxutvWEKYz1IOkfVtdjmLJ2JMZ
	 +wgHSRTgMSr4oWem53GRN0EKfJ8VFr768l3+UFL5kza4HvGa/i5aIULAwlEkVMAjhrvvy
	 QsnhqRqAlsNDrT2s/mQB/MwHqsjx1AvpYpQYGGBupg5+IfcxksHJUsPyqVHq84C2osQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795462917;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=1C8sFS/3KQKljMGl2RhNOIEMXKrByL9Bs8PpVtT5Da4=;
	b=CW4zV+eeIybotInQBjqcQLBI3p96Dy8gtbAgrg5TJAlZ26lgxSSk3vszgnWG4D2NSj9G
	 GRG6nykthloHM0ztgrdeH6fgPlPO7u3fEAI5Csx+JxJsP/kPYf2gxVB4lHjvVDRy0xdvi
	 CDoqCskxsB6JzI2vGs2Cef6Xv4dxcU5zhyGzhzq9QE7mB1KAJTJiWh1uHOuXJR9SjBd1Y
	 EZbUw6ZiZVKVuh3bG4lPtblBvc+PRNkLS6rt5vyBvshsgWo4n6y5DjV7Dc7Zhx39SVSpe
	 wLOXhEWV1l8Bax2DSGrm1chNb9fZORoXe4WAHzoZrNUwgJM27KgpUMjsLnYqfb6oGjg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795462917;
	bh=1C8sFS/3KQKljMGl2RhNOIEMXKrByL9Bs8PpVtT5Da4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RB1NpAfJGvD5+4vUe8i4n7igudlAylvdTbhRzfkb8pLXLDlafZoEFfe+K1H6j/RBe
	 zteAq4paPkahTEK/CxSmPV1cpXV1rxhF0dBiFK2GoiAWMUZTFYquJo3ofICHO9tSoG
	 SGhrGGAHnxT+Ap28xRC/MeU0NMBh5cR1/hmXc26YPYTmn19On80mUkv3vgJUWCU5MV
	 FPGElSLWOhUpupG9MOi4LjKnM2ZDFqk9rn0btivw7Nc5qSbQ0PmjY7t9XI8LD5DZWC
	 Us3JyQHU6SQkIiyKRzRwdcZYsfTxcTuDwYPlB2UxZzK2U/y0Z/OhsRCue3dWJG8ZSx
	 BG9nasBkl1x5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 326FB60600;
	Mon, 23 Nov 2026 19:41:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD0CC260
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B191D60600
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d3NLB-agGnNd for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 19:41:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A28A5605F7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A28A5605F7
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:41:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 033D319F58A;
 Mon, 23 Nov 2026 20:41:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 20:41:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 20:41:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261123183232.233737-1-bernd@kuhls.net>
References: <20261123183232.233737-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <b1e61a681a20ffe8557fdae83e22ed48@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 6.18.x, 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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

On 23/11/2026 19:32, Bernd Kuhls wrote:
> Update the latest kernel releases to:
>  - 7.3.5 -> 7.3.6
>  - 6.18.64 -> 6.18.65
>  - 6.12.118 -> 6.12.119
>  - 6.6.162 -> 6.6.163
>  - 6.1.192 -> 6.1.193
>  - 5.15.225 -> 5.15.226
>  - 5.10.274 -> 5.10.275
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
