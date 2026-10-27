Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48293606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jk5Rwhot
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F12060735;
	Tue, 27 Oct 2026 08:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_B7LhCSABHW; Tue, 27 Oct 2026 08:16:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A287B606FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793089008;
	b=pEYkb1oj6AG+v3sGqNH5mGcXvw98u4fQboH7QtlZfLOvDeUD2oZkj+A9jbxuvWqL50ZH
	 hR9UITJJid+JmSed+4YeIOtluAd0Tat2OizY4UDZ1VYLbm5gA69uQ76vnoeZNTy7Pfc5d
	 bbU/rsBDz/UR2B5lODbmTnVUdim1Dxr4ZGj2llOIS61PknNO2q56X0YAy5G5RV9hAN5uM
	 lZ2+Tmh7QvoPvyntHvvlbFMNjKUEdOUaf8uXEQVPAchfaQxb7XmbFopO8Omb5OAcLxVNd
	 uxhirIPdNP/qoXJzZ7JpgZ1jgVUjQFbyRoesht2oab+hdUxsLeGrXhdMdfZpMQVIr4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793089008;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0x3QgZBzKhyANtsewi5NAxZ+P4jsJxdEGB8H8xt9scc=;
	b=P9wWCIu05r/MVGR3+G+aClnGBx6lAcGwlqn9374dpz+K9kxgyMHCP+pz6NBmrJIxbxeD
	 v9keeIeukFaJU1HARqw/VxnAoW7ieqOLdVOQ9/BPpTfnopYFEGq9zxTJ4L5N2ZfwTdncy
	 oyYjMjj0LEU6EH9DhvHZTj2xDhoApftyFKA+3QFLhZlebp39+Q2E2+8wtPr7V961owTIi
	 rVzDCUxFYxaqb+BsGOHdpSpUlOixLhGsXkG1/5dlBPfNNwXlzwpOY1Vf8FSZrYmEo1TEO
	 e++JGd9ElKRm5T7LwjOL/TYq7i/4F9/vWtDBSo1MLpp5Oht97b2WT4GB3PuBP0WWuxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793089008;
	bh=0x3QgZBzKhyANtsewi5NAxZ+P4jsJxdEGB8H8xt9scc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jk5Rwhot7hL62+tnDGqfx1L4Up2vd0LopDibPcOcwQ3wRmktW5zj32IAyWWqUi9Ed
	 lAIWdnsZTv4IGw281ONyY77E1FqKqkixAdALP48laELfT77mBwKPR8Dk33Tf2o1cXY
	 ELErp8nZQpIN7+xgIYr7waMxGVIpfCleUlUatq+ltz/AStky1Q2CZFlxtjafMPbFec
	 1YtvvycVXKLPGejlmHhE4sKO+F1nFrxJ0J+6DP7mesiSDYZCFPNqSNX9egj4c6rVIS
	 Qv3bkyZO3dAR3noJHPB/mERW+raTgANuEz3iosLAGMGUOKWYm00i/v6IZL3GAp9RvO
	 CsTQYDrQjZK/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A287B606FA;
	Tue, 27 Oct 2026 08:16:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D86C7120
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEABD40462
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id azcVv_8fxQ9i for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 08:16:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2D23E405DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793089005;
 b=Ky3D8YLxjVLZhjzqQo8BySxuBq5PqWjAUxHPv5mGMqf0aCuM5/m68ffnIUnFUJGxBOro
 Gp8ek1GLkLh1J8q87m0npE1c0aOyLDiXd4GSrLsqicLZMS6GKPV4AlXQjlJJBVdbU3SG0
 4fF+jKsIey9JQec0VDEpRFhTBJmz7MbOs7N+VEm08SGhV/qfowcu5ZOk0BLssL8KuFwT4
 UcMFC9iaw4Y/PqrG2oQOBMrhU5VJ4+BSh9ms64BtwjyDpaWlwI4SI5t7JWbUHopQWsW2+
 nj6YQVN+HMCDSnWR4G+v19smI+/nABjuRKbtaDPEFJCmuMnzI1IYFW2iz544SLZeu/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793089005;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=DOOjd153kvv904kl6zT9PmqYyUkV4DnubpKBaUMFU4s=;
 b=HinHzai8q/LqGTC+yGXRSfP0EACaZ3B7HOP8kaDhTZdXzq33/CYo8MKxs10CNquqRitG
 j9MG8otBqAVfWSHNj5cQ5FTldgk88JBijODX1WOTR0q22CF2vhaTxzgWVL+DlFrWR1+5I
 6fhdBJciwhutPEfdG2ig0OLqgAAFIGGf5mkEhGDGLhRYJbVLC0h4nx2p1amHE211eyMBA
 c7obICRxXpWJDIlhb0oyogfZu0QTtwtW9MTQJwU+GSvMLVpqjbHnZysbrTLdEMcvZZxJ3
 OLnGpAsRueexYzVy1OmdAyNIozfnZxa2aF7qpNKJS5XhEV06focVQQMqZfu7/Tt6oRQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qUDNuiIv; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D23E405DA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:16:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 753EB1A1367
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:16:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3018E603BD;
 Tue, 27 Oct 2026 08:16:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D7CB10329044; Tue, 27 Oct 2026 09:16:41 +0100 (CET)
Date: Tue, 27 Oct 2026 09:16:40 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <auBdlYGcrTcDwaPR@windsurf>
References: <at7t6Uwmu1T_lD8h@waldemar-brodkorb.de> <at8LDvBotiu7gDNY@windsurf>
 <at_KHTpsxXu-Vk93@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <at_KHTpsxXu-Vk93@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] perl packages for LTS branch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 10:46:05PM +0100, Waldemar Brodkorb wrote:

> > The point of LTS branches is to maintain
> > them in terms of security fixes and bug fixes, with the same
> > functional scope as the original release. They are not designed to add
> > new features, otherwise it's a dangerous slippery slope with no limit
> > to what can/should be backported.
> 
> Last time I asked about pam_pkcs11 this was no issue. The LTS
> maintainers added it.
>  
> I understand it shouldn't be done for complex packages like maybe
> Firefox ;), but for so simple packages, why not.
> 
> I speak here with my $work hat on, because we maintain the packages
> internally and we use LTS. I just want to cleanup the stack of
> external packages and patches.

I'll leave it up for the LTS maintainers to decide then. For me, LTS
was strictly limited to fixes. Because otherwise it's difficult to
draw the line between what is reasonable to add to LTS ("ho, it's just
a very simple package") and what isn't reasonable ("oh it's a very
simple package, but not completely simple").

Thomas, Titouan, what is your policy?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
