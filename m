Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2788606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rfUbPpQS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A858E81775;
	Sat, 24 Oct 2026 12:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3c_zaGcvKeH; Sat, 24 Oct 2026 12:20:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBA9D816F5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792844431;
	b=jgoB+2TnlbAkovOgjyHHxR65ij+XXx5S1wVjV0NiSwApLH/nrzcr7nK+Ityck3dsWdWi
	 XcFWyLaY7OU0+guQlr8r5mbLZnExojFQyvh+XaDLnAR+kzp2OjMdNowUfIcqBTMNdKNjH
	 ViTeyUCMwh7dj9Lxsfa/oYSB9o+9tcUoi/OFmLSgsIUCP7gs9CISj5/h8kJ2ie+DIuLZ3
	 OF+D7fUaf36otSuzzYt1T9gBK4KsyntnXWqkVezm46ZYf03l+MQdm61gPB02ocbPA6wQC
	 +HzPUPlESzbZZMNeWSGEx7PtXFyPh45lAxTJvXdDpO7lxmJELsPOKFeCUgIXSUpMU+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792844431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	b=rpcON2AHNoe3YIHUFHngm9Wl+AlrRXX1JY/qQJQtGc7dgEYafwjoYyQ1OK6sQWMSKYEi
	 a8sKipU0UyZ1YE8iE9iv2TmlYiTRELJG7mi4VUxTVUyO//WfPXOhIf3VRyDpBqcDPtkTC
	 rXC/mm5skJbbRYqX8TdYoK7Uw2SaPNE0G1ksS2uYn6O8hEAZLwdM+9wZe5CYNwtJ9lE4E
	 xVZHfYIIuOyVbny3bZlsFfr5gSAPbCFBPZOnAqTeDjPYVc3o9OyqKBhkEqMOfYhoZDUqQ
	 y8huCFOmND2CHRUemMO7dFIC2o68wlK2l42+YqCDEXFvyHMtALPpPVj5sRdMniQ7VfQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792844431;
	bh=ejdEfKrKUy5ciuLUXf28SzGIyJ/6ag1YlEE1Dlxj5KQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rfUbPpQSKCPowf7RYaAP6lEXDkAKTbKP79rwIINZMbi1sy6E167+W3as5mJ2HbGRO
	 4OL8ecxTf93+nbTjtjx6ZuVH21UiXwj+OI1Zj2XovHJfiWSqhpr3KiIcQ6ESTeUIzg
	 Yyg22Pn7hA9bZG8CxFQ0GXp5tFWVJE3obs9l9dWYBnqerJIOtRTljfmyKysaF5Cuaw
	 yByfcPc55ZSzKATbRRpQZrMiX2+0UirFULby3VAXm0K7cc/hPLLvXjvql/ueiIS78m
	 3iE35oD0KXByJWxeq7m+zMPwqqFrnKcupsDCMuVRwthTPZSk1QyIlahedqZpnMm9DV
	 YZSRTX2vubbYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA9D816F5;
	Sat, 24 Oct 2026 12:20:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5E9643
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2FB7816F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4RXdKaSZ5QS for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 12:20:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 170B9816EF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792844429;
 b=OWyoahfnLim4dmJShaK8F+YDGFHWObI6LQOLdu3zfktVcMTvJoO2UrC8oNZmXC3cYHmr
 q3WVTxHMWO4bWb3MzaoGkCjBq3jUImPcx/INFHqoDnecwSjMI1zEmluafzsysoRAZTmhm
 p5+e87NBhrMqa+3kX4NVaC4+HfnWWxiD1Y06cziAKNxlF7lGgdixG/DBPgX4UJmeOR3/k
 LKu3ixMDWhfHfFDstUZy/5U+3cpoiDV78HFD8vDzCtmhllxM7sgdjTm2VEZtCjU/SGElr
 nCCSV3tPh+meGY99nwwS1HH5PU0XUgCh+MvfUFu6iM+nrLPBnvHCAc+wA/gWoYbN3Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792844429;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=lqmJULBsuA5sY6aLE7QBVEwzBn9VEoFffbFhDtJ3yQk=;
 b=dTc+ndlLKPqMZT3ASVC5q/G21H3EsfgZd41UAak27jbMqLFpLVip3c1mMgbAB9rXe8SG
 v4UJ4BS06aAotVjLwuAcGtC4dnQgvwwXznsKhEs8P7H2ATThE9Dk7zO5HIp3ZRh8L4oQq
 Qj1qcJVFMIPsUvBhR+UR2faZGnlE7volmBEndXxE0Z95LGxNOdR8eRke2fLoZkMiV4ha/
 SOsLzqPKTO5801Va2atCIfCsTyvTtrJcDtGrnoE25nLvaENarsbz02H5zZHobMhdA+p7M
 42RGhJ6QYoO9gevPrgHQQOvtr+cLvhRC6PN4vq93SZ2LaBj8GrnbkETzULQVS6OSxKA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SjfdbjB8; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 170B9816EF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:20:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CB11B19F574;
 Sat, 24 Oct 2026 14:20:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 14:20:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 14:20:25 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023181818.920329-9-james.hilliard1@gmail.com>
References: <20261023181818.920329-9-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <37a1b830c24210fe33065f616a3ef9cb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-fastapi: bump to version
 0.161.1
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

On 23/10/2026 20:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
