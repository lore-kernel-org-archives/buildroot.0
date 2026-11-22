Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966A0606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 17:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NcMhI3IX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51DED80D17;
	Sun, 22 Nov 2026 17:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Le5MbDamzEYP; Sun, 22 Nov 2026 17:09:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5A54B80D02
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795367340;
	b=hr3zSMjZnb/c8bCSEqDmARYpD5e8WZWEMoSOkA4hMvX6MeMFCZBtc58qlMbHiU+heZC3
	 QRu0o2HzvD+urzTMlr+LPtA7VhAnrB1/RHy6MoP2/UijVo05MhR25zr8ERxkS7aaLbE9/
	 ErS1t8XuFds09fMoHcqJEWebzQ/Hnb2OSuUX4ALiOZaxnVvUByIkifKIIS5yzRUbSUCpO
	 FOYyQmXyXQSBtFBM+oHIL/0bhb2tXvUXnAdW+w66yVOrYDzJC4IabcL2XiqimlugF/e54
	 oYTFwr5MsI7cVR0SS8zS8LmbIywhlpHBUgsJ8/jZE6dZxaBfSKFDvAihCjz0rPeaOuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795367340;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=vlrEv7exiehZrfFPdXKd5KU4a4SlOjfzqsKhLz8sjYM=;
	b=monPsvxKzGadukPoJf1OhxD12lTdOtyiJQglQlcdk+0Zl+Qp6hJ4SkR0N0lSAor2fLv+
	 wahOX8+V6D8QOvs2Fr6JLuB7S/snm376LZM1vWKdi0Qp2Woip1m4GZGp84cYfrq1R9UE5
	 MsA6NLu+UGjQg1maLCsOWbwdCckQworn2tVNgIJ/ndTcAclNCkQlFwHCriQSjgJkK/sqL
	 gcDVBP1/sVJLXucs5i4adeV27IXyFPqdN2nxxr/lXRV0EgfTRIJFa+9/kPCPlSPWVVOAZ
	 wxSL2y/9Amc2iq1apR7d9HxAvfX2ILi4tGoP+bD/D51nzLBfuzl5Lk939VTX9NGC7sg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795367340;
	bh=vlrEv7exiehZrfFPdXKd5KU4a4SlOjfzqsKhLz8sjYM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NcMhI3IXVdTCP756VvR8Y+zeWfcwDg3SqVQfDYlQdRJO5751jRCo8xYpTqE0H9mqR
	 slESMgZ0FCs674Vl5fOzI3HXmUurHwh7rrzU7HAD6TT4CtFp0gtsPTTRZ/DoxQH+Xp
	 DjSdRtFX0W7sDJ5iljJ8gBuJ6fyEaZ+LjFbHP0LY8Kdq6p2FV+LTi+la4FuDgwkfjR
	 Iel9yWHIv82CF5SvWyDzNLScx5+JLGZ1qLpD6FNALakU5XpKXtKIT/MAN04MKgZyBS
	 QQskFwKeqqhezyadKxrHFIL+0bdY2unlII2XJmPioa5QUBKTFkDwfFPvV6OlU3Cuud
	 t/ShTmrn5Rgew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A54B80D02;
	Sun, 22 Nov 2026 17:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BAA371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 17:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C293F60608
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 17:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRPCTNH_IG27 for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 17:08:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9399B60600
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9399B60600
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 17:08:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 05BF3B00548;
 Sun, 22 Nov 2026 18:08:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 18:08:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 18:08:50 +0100
To: Pieterjan Camerlynck <pieterjanca@gmail.com>
Cc: buildroot@buildroot.org, Pieterjan Camerlynck
 <p.camerlynck@televic.com>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20261120133132.2258440-1-pieterjanca@gmail.com>
References: <20261120133132.2258440-1-pieterjanca@gmail.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <6d84815b731ee5b77df8bef6b5ee8ae0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/libliftoff: new package
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

On 20/11/2026 14:31, Pieterjan Camerlynck wrote:
> From: Pieterjan Camerlynck <p.camerlynck@televic.com>
> 
> libliftoff eases the use of KMS planes from userspace: users create
> "virtual planes" called layers, set KMS properties on them, and
> libliftoff picks hardware planes for these layers if possible. It can
> be used by the DRM backend of wlroots.
> 
> Its tests are always built and include a mock libdrm made with
> shared_library(), which fails on toolchains without dynamic library
> support, so depend on !BR2_STATIC_LIBS.
> 
> https://gitlab.freedesktop.org/emersion/libliftoff
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Pieterjan Camerlynck <p.camerlynck@televic.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
