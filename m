Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90310606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AdTvmh8d
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7958D60ED8;
	Sun, 25 Oct 2026 11:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id enVJN8Zn54IY; Sun, 25 Oct 2026 11:58:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A6A5A60F08
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929498;
	b=Yl+oJ9yKmIeljbOfYz75Pvgzrhl4wV5XeBKhYzqNE7CL0hjh+hZBJy2dzKSs2LPthWCv
	 OuTMtSF8gI2VFnqREmDsUaekaiJEvpsBiZEAA2Y1XXGdwAH9UiSGzYlQh8D1AkCYgJYag
	 kMo6w6Lb6VSbGztgsQcKtH76LNjYe2UDA+usrD65eVBdx2Lc4LmB8jPtggtye03wB2zzA
	 negFguOiha7xsDF/YiKo8IrYQEutNDg+eJhgr1+pA6QYQu0tdy5+aGJk8ukwLseWOubwm
	 +Eb12Ip7gn5nJjTVA8QMB/7YYKsWCiKQO+uhuy9ptPJdfa8pfWq3eipb4Wow0lUmF2A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929498;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	b=SEhn4l28GAQRTLlJjDfEQjYYlQg9TRcZy9bFEKFJBbR65VGHS8xFZhovgpz4Cg1wwpyR
	 W1ufNL+qVn1uMOOdyDrq+Xna1CeyKv/WqvyHECO6BkK1GKFw3zh3yWbTZegAN7EqryY73
	 L89oEE95fFNSLDkA1T6lSmttweGynh6ni5cDW3VWtZ27ia+F/rw0Umzhgi63rmeXxYO/u
	 0otub/2TRM9SMPG/ay+y4U4adusmGrrBUhD77Vrdb74nhPAJJU0QLGBJrn7SuhPEw05Mf
	 xcUlrccG36kHUyBvbaWHMuR6YUJFhxVa0d1KXasAiusvbQh2G/GnqjOPxqhPfTo42kA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929498;
	bh=tcb73frC+hYz6xGuxSaj1LCq7kHDhvWUOlKa31sCcGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AdTvmh8dLjazp7K/BNhNiMZwIJfM0o8V1Gyl3wmFqfN+bYrzBII0vO2D6c7uwbDpC
	 azIrPjnbFL8vNecE5iuaZ+5mtUhxYM8adFkt58MXlxm6cOlZNEu48wumVSe3PN9oS4
	 f544HmRtpnetRMlZUPA6DtaynT2CyMWjOrEOLyquJWbUrtIOQpbJsytEV6zGpLp35l
	 qEIKi9YZOxPo/gV/ztEAVOx5IPjxgQ0kH88xp+93opnli9NHtgoDQTfmacfSrJ1sNK
	 CqgtRzbI0GcNCeg9dx00UUBA2JMBDde+R25R5NYNOwoYgHaWIIfnxG45Q0PTVCD/lX
	 x9gKztvR4b/Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A5A60F08;
	Sun, 25 Oct 2026 11:58:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B01443
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 701868168A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iG4XWr74Z19F for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ABA97816DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929496;
 b=ORhEFW/e1t5xvDMC8/7Jtvni2InPB5ieh3Si8p0JieQuc0iZOf0jRZRzP8y4mwslWaeg
 Yf1DamBOr9H8mfPFHAjSes953Ahj58G8F1Kvcu1ExPRepJl1FJ5ecm/0DjQv4IYtWgymo
 cB1uRQbL6mCse7dO77xHJQ0IPcO+VLvqftC7D2mcjLAhBNRuwf22t3qEOgphbigLtqtUi
 rfsoaReQcz7AkuZ2iZkRkT94ZSqzIa2qvpndsHUteNx3ezJCPVU1sRXNAsf5Yd+NMUof1
 EIn6d3ePFGsoJB7ymBp5vDPfmDLizBuHG1NmP0xIOtTmRKZ/nYKA/H3Wxn2S/UCeuJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929496;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QmYn6d+L8cgMQVhMS55vMMzMU1676dDAG/CD+dL20Pg=;
 b=jGZ0tvf7nixwUfBczdt8pyS3GwvRXFUsBV2V9NRlg6I4iRFkQ/UDfQUUhx3yDGOLYPsZ
 OKfFrGLMKzNAhamxpSPs3dqPbKkSHk1ughVlRVIWiozWlEgOb9TJfR+KXIJfYOQpmBwnV
 /nsJbdYY1NhHDcB1P193lCAAa00Jpf/LjgkCPqZQy1tI4IDQPlcKZ28Zc0jyJ0F1NrWp1
 1+kVeh58HEg0XN2Qn/Yq7HaPiR2nVgofWAuZMIsQn64sxT2GQbQJOsAhRpVXObT8INdpz
 /GgZ5jELOa/KEwc/EyzovfPxQ0KXppo6RsjTPcS5NPavQg3Xw8kfTcCqmHHa06clSgQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mtTMnusO; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABA97816DC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:58:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 600D32003CE;
 Sun, 25 Oct 2026 12:58:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:58:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:58:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024182913.1957467-5-james.hilliard1@gmail.com>
References: <20261024182913.1957467-5-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <2cfb3c1a6fcb6e498b7d4ab43eeb47a4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-starlette: bump to version
 1.10.0
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/10/2026 20:29, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
