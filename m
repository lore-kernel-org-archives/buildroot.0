Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16746606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mT+Zt0EM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D25A781466;
	Thu, 22 Oct 2026 22:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gg6oOPvWiyk3; Thu, 22 Oct 2026 22:46:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 87CA881412
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792709191;
	b=MU64Msf4CE9xoz8wAtgdqGuUNw5+l7TOUczbMtz7nywF7Q2olUn5LICqpMyEkEO2EKeZ
	 kZnFjvgkztXa+IvsklmmAioXGD9/SmxjtYL8sXlqXyuHqFcCSfpO7gN6U/SqYig2KODwK
	 hlq87AFbJ5ERE6DegIjpIz4kLUlrMuF6Po6rT2BccSBmv3tblEfN1oPbtxAauG5coLjyB
	 MT3WxKpSvMMR5To5Y9J05Q+WX33TpafiWfNySSU1GfiTi75iDC6MlTSQ4Pqa3emaUXsdX
	 /GpwLDC6oHHDAk53zhrDgZQPxHUlKloJneRR8Y2oU8FdE8Jye/FxsaMfxc41kbF6wrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792709191;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=KKcyYV1/fE5GIrfU+QQ6EY48FFsxsdMQZlGsz6i1aK0=;
	b=djSAHU+SkVXCfDru6epJBqpQg6D5T7UJUufrwUUk+xYPS7rQSZ8ags80l83P3jFb/Zg0
	 h+S1hChvxny446s7M9FAywN1D1BToBlZIg7IaAyQemQXS7him9P7Sc4hUVUWJPfc27V7j
	 /RbqPlul98hV9a1GxdUTR2TZHxtwKr41+0yHkDh/tPRpXg9ddvf2uJwIPobiL7A7zEuAO
	 SkyU1YO7rrph4U9b7qriz5y+JxYOCofzPdP5rhJ9K23cQNi0qE5SQ/qlFSP9XklNcPOR3
	 isvMrCikUAqryNrtJ1zoAIddiLDe1q/U+rGylzDovO4VJHGRKXEBI95TAwzd5s+88Pw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792709191;
	bh=KKcyYV1/fE5GIrfU+QQ6EY48FFsxsdMQZlGsz6i1aK0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=mT+Zt0EM44RRe+J/8phxSpnEbp/tyrqzBzrKcyMpmyJmmuJemlpnMKBlLCZ2L7vTn
	 xpBJ9JDHoAbH0rYLNYX7SJRt84Ulz9fZzaOoBVvi+5FdMTITtDg9n47t55+vBOOVfw
	 ouIXMxegetKhwIlH7BZSIs467KZN4QFFwmCqklfElFPpAgbdCWH7Sv794uYGa4aTLS
	 FKXX8c00ZpIYPZgetXSnVF2/GQw0wveyRoWtjigM5kkMngrB+X4mv2Jrzmc2YB8ZaB
	 loCI4Mcg5YN/o6BGj86FAxMhytNx9AMYQttMs8Ibf+tWli+ZbSSWvK8pA+xqDrlxjA
	 RiWyqpSeISN/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87CA881412;
	Thu, 22 Oct 2026 22:46:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C62233C1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABB3C608AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3UnU8EbbcZVg for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 22:46:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3C40760883
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792709190;
 b=XmrKN4UFq/9WWfhrL7r+vgMcImLhGPlRmhNTO++nK7Kk9zaaGb2gM/gqH/832gX3xou/
 6Z1a6TRjIJ5tLARem1ReUmAx0TLHoscfXdCyPyaAtjH/Msrvw6MOCRuh8brhQncypRIHN
 AEw6QpPV1KGCR3D398Sb+roJrv5qOy0KSBN/2UI7zljQeRBMgflv9dRsYoB1CH9go+FSB
 rkyTx5sw1pTpxWYjTRVzxV4RBesGjg3q9MRU2gMVDPTB+iV244xhQNVQx35X8q4c93L07
 XSPU8qzC8uCwDymBvAAzopH4xaE3LoiCvpckjYxNrVKagkAiZnqDAgT3u4PF2iMLQwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792709190;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=NhfJoBfpf9iG1Uq8S5rhd6kh9wUE89Bwnf3HgMSxv/M=;
 b=NvzKnJnBaYuwGvrfFG+bHw0Og6F0Vvo86fYqBHBlwTc03c84kUjmVYOu++JfnAGgghoU
 /whso9sTOvkNb5A6774zi6gZ5DGtk0A88BdtyPGK7aafxL1IovRcsdcaRiE1ozV6LRlCg
 qPmFnaXnNGvShrfPlXoHhWg0QeF871flWX0IRwh9IRZu/FqePu+MhgaOjOZ87Oqk9PtpU
 1tnhBaxun1vS3zM2XEM3rdyTnb1s1PS6SoXFyR0ubmHoIxPmllJNAL8tTaYlZRM7AGCRh
 RHfrQbfhqA4Mza2wR/u6q/QBZvxKyxciQ2pn4qcUq7UIMNNcqfE9AglGCNG33LVPvYQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=tiTDIXZm; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C40760883
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 22:46:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1wp6f30jSq-00p1Fx; Fri, 23
 Oct 2026 00:46:25 +0200
Message-ID: <69c73771-8203-4c26-9a6c-0f7a5940c519@gmx.de>
Date: Fri, 23 Oct 2026 00:46:23 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Markus Mayer <markus.mayer@broadcom.com>,
 buildroot <buildroot@buildroot.org>
References: <CAGt4E5sTu_c5K+j58Jx8NXGZccX8PQbyTTZJ3HKt6wktgjYHTw@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAGt4E5sTu_c5K+j58Jx8NXGZccX8PQbyTTZJ3HKt6wktgjYHTw@mail.gmail.com>
X-Provags-ID: V03:K1:l/U49IZ/A/c2vo/ggrHbd68K0gyNFS9JZXmUaezfOmKONhhDPBd
 2ZHyv4nai/nhugmQRkxYGPf9HES7+aKvjeggIiNiC1IKVZZKqFyiSFirffZ8G+mlv4uIS54
 ve6R0rCFoUOK7FJc3bW0qgi33M+KAO5Rt4uxakEsckEzE7nxand+LFR4L9MtBVbQCuK5FF9
 ZBPVRKQCJfHJWo45oW15g==
UI-OutboundReport: notjunk:1;M01:P0:og6VsbIOMcc=;jnYagL5FNyzEH9UXWoEefNBrNiz
 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
 xNYde
Subject: Re: [Buildroot] .mailmap file for Buildroot?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 22.10.26 um 23:42 schrieb Markus Mayer via buildroot:
> Hi all,
> 
> I was recently faced with the misfortune that my long-standing e-mail
> address dating back to 2012 (mmayer@broadcom.com) was discontinued and
> no longer works. Of course, I can adjust my submissions going forward,
> but existing patches are stuck with the old e-mail address, which can
> be confusing, since messages sent to that address will bounce.
> 
> The Linux kernel has a .mailmap file for this purpose. This is a
> standard feature supported by Git[1] that helps with remapping e-mail
> addresses in situations just like this one. Would it make sense to
> introduce this mechanism for Buildroot, as well? Surely my e-mail
> address is neither the first nor the only one that has gone away over
> the years without the person also disappearing. So my feeling is this
> might be useful in general.
> 
> What are your thoughts?
I don't see why not, it's not fundamentally different from updating a 
DEVELOPERS entry. Just send a patch with the mapping you need. :-)

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
