Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69086606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CopzS27x
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44CE1816A3;
	Fri,  6 Nov 2026 21:22:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuTlycVG6Q7x; Fri,  6 Nov 2026 21:22:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84015816D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794000131;
	b=cfO6yb85rAYNOtsHNF1DYfs3OT2e3x1kiTrwoJ+nMd3yjYF6SVwERAErg5MFEg2mwIyN
	 Lm1MK8MQJAU+X109GiF2LFtCpODJ5aOmvsay0mFE5fJpNXZcrnMQz/JPkFYTGKFLoYKRa
	 UaT4ow/+jjjIOVylapefApaNAdTMEBTmDlqxAs6RNLXcB753Zd/DJ6o+EhvJ8xqbVo9jx
	 LsMTAPb6gI1g8Zcd2JpvlBMqNZth8lTx5O36la0WnLfWPUd630saEPJQ3f2+h61h+fD7e
	 dudVNpmlgLG4dYsVYXHd8aKRZNcoxPG6YZCmw67J9SVaocGKDKj48pqVvZO3DsqrYqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794000131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	b=YL22hhiLFHQnZAmOj5AZ2mE4dJHAGBj302fRg7DD3abmly8HDg09E6o4rkbnBU63s9y/
	 JYJ9RT2gVO7dpQ1VBeTDJT0NrQDFkEfV/MOLxE+vzBag/7vTacjKue9S5vStzW2Tf1vSe
	 b/VoNwzDuxEs6NfUAUZ4GuaaetY4sXpNEW+2F8JIIGFuw+JWAlTf5HyPeoMSsIPcEpFv7
	 kELdGIg833s0Y+1JpT6nHFMfy3H6v/Pe4R/WNqvpXAppIyBwq1+jJ8WuPAdlq1P5qs5QF
	 tupFi6su1dQE968G3SDFlvBShG82kFpz7v9QQeknR1lnvW4pKX8Vg7Ql7fdgX3L+02w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794000131;
	bh=u+S2SpFsblCQRyjhcbz1tasU8kVLtQftqcpCPlGPfHM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CopzS27xdHKYDYjIj0K/bTU5tCGCPOV7CjCJehN9P62KnTkmIwSDxpM+sqTrsU8bU
	 KS6lJ+/dPTJBgpXYzASBMcCyHagjCEE5a43vQqHrsD2ZPFFe0/uFs1m1Z1Cc+DDHuw
	 g6cQhb1iXqmbWYxfjqDxVlvroegnFiHCF8AlsYVhqT/9bmNFFu41Sy4jNQM3saexlY
	 ycUZ8T+kxQvJTsW/kv/hTv0/+hvlbe+RHTjfhqLnQT7tIrtkvMYK+q7Kyn0O3zGRA5
	 HdN3owuFllwdPKrxrfDXnIhoBjJwII9I75nVM6dfnmQ1RRnkLL+Ds5XkS3d/DLK827
	 6iGusLboljNsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84015816D5;
	Fri,  6 Nov 2026 21:22:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A076F235
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9233D4094D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snyoY36ITVZX for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:22:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E080F40907
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E080F40907
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:22:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5434D19F5B2;
 Fri,  6 Nov 2026 22:22:04 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 22:22:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 22:22:04 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?=
 <flavio.tapajos@newtesc.com.br>
In-Reply-To: <20261106191536.2120153-28-james.hilliard1@gmail.com>
References: <20261106191536.2120153-28-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <d5643742c02b04c08e7435e7538e61c4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version
 2.1.8
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

On 06/11/2026 20:14, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
