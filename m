Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD061606A31A
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LAATJ+yv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF35406BC;
	Tue, 20 Oct 2026 21:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ge1yCC3aN1eR; Tue, 20 Oct 2026 21:59:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 90C03406CE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792533564;
	b=EzuXs0DSK/IlP6RT801G0y4Wd3q0hwW/HUp5PGbC8wCEWHg4vrnIEkg7INvOqAz3+E5b
	 MPsB7J/+KA6i+W8Lztnuc0FC3BV/E5UxMavnRsunOuqli2u0RTEtM7pMYZeP2g/1RzSi+
	 UoVO/tfXpVEUBOvEFKf8ssxbA8s9RVBULPVrPQuE0X9rtTB3mpa7MLJKn9uV8DynLIx2x
	 tn+xkg7ZVMAxcuor8/JFKY96sd3ytlemUiSB/bsFfiOU673+ioC5GNinuxBgsmF50XoeJ
	 otVwIub3DVdQHB3c1IOc0Bskkf/CG+J/zd+1WL9w6kY6GT8gaiBcgkmcXLOAg0k7+6w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792533564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/QaH1zC4/XYTffuBJd9SM7PBo5sAZxIGnnDv3iycHrk=;
	b=Z7NEoJynWMSCymo2Y3DCgG7cPjaI64TZShpgWRloyHpo+B2K61sBekBaK4WpGHjJ58Pl
	 GUYQ8r2QGAjbJUi5z2saxHNGQBO+O6UUv3R0eQM2zvhOWhxCn8L1McuhXCLgx6HmD4jxm
	 2eIElZl8Xlb9MKqn/6473inNukaTQX802Ztef7/UmS60aSGzeENUVLmbXLdqH3tsBznvq
	 H8VOnmsGQXRGDvNFF0OmzP6phQz3627gBEsaH8A/6sTqiyEEojKObWGvVS5J/qltEcpah
	 pn/skuZ+iGIpNIz3xzDrfb+1huC0PvS/jsgCYenGZ7TNkBA9yUM0sIgrUV8z7MTU6Cg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792533564;
	bh=/QaH1zC4/XYTffuBJd9SM7PBo5sAZxIGnnDv3iycHrk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LAATJ+yv2Grsdgely7+HRP+6yj6kt6jQvRoIDxxHOFb6CErClBnzJi1JVU+NQHfZJ
	 Wend0sZV7Y2EHiSJNykZ9c5CoynQpvwwo35ZVhHLQcXfzA7i0f5nwCnnc+od8A0ipr
	 dUGerUt3muZSsyxeYr8J3DOujqDpOdPRAVpL2t1ryvx9OgpDOn3dHpT81pwSptA5O1
	 +sWNc6P4Z37GS+Xb1mHj+1RYufEZ4JY7VP+ko6xu+7R+fKquHCyLR7LjZ6Ttry8ycP
	 GVkaAWN1ZUGKf46wKkekwO9nhpS6h8QWW76Hsgdz6OEp4A2UTbgf8cKga6+Gc2Ld3D
	 caCiTQ3rYh8iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90C03406CE;
	Tue, 20 Oct 2026 21:59:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B3D1E9
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A65EC406CE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:59:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cqXJNkyh59X for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:59:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A46D406BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792533562;
 b=pgxmB84rtKtqQQ1+xxaZ5evluCaBM53ZAbgAfO+9HpKWxAY2csfsH/k99rXk0rvqGSfk
 veKxvviy3mFyi4wZ4zCB5dxL3DXF7+04KDrSEY/c3ReZsUtXBsQo9Hf57qPm2FBqp1z/P
 Lx2mICNyk6QcJHH7ZSNUcoG/pKHI8ygpf9JYSvZ+88iMSQJpMPtpSipuXBxC5PQ8WawFs
 Eh9ILBkIn+s/TOJnUsumT2+fhWOl4VyOxDquOXwGCn2W9KIj7TKMjgINluFyNtFRK8vdy
 g/L6M11R8jRaxxHN0BE4/BD/JZdm7ufc01BnOf6D4cmsrgI0ZOQL2njvD0OIKl0/FiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792533562;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=2rVIPY+THNzoGsdU9dbstMEfWnoVrCnaQAPsj60m6LI=;
 b=JRoDdHiXtpsSSFOBHuDwRwBqd7zrl0bGxC9ygxTYUg/qPn1N77Dz+c6ykEKnS4+bbvjg
 gQx+JS6sphWRwTsfMMN/YbamcNSMlIfZ34cXehEo09/pELTA443JWBaniAffVTfoiYjhH
 y5IsffNQoCu9pJ3JQ+Vgs6MfegWD0hUx+gbdfTu3G5EQDtKkE+2ppdzK+s8qvvtArqwUG
 8SexWPE1K3I2m7tOjfjC9FZI2znDU9xE7neLSeWBuSq6W9Oq3K61S8FtvYfFhtJWbK9UY
 E61of3Y7vEV73G2n9/lrvOo4vqL+jgLzyEcnhbuZgssCefy0T6n9Z1eAaXvB7u9zKbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="pPfk/cCI"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A46D406BC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:59:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id DA9714E41290
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:59:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9039360393;
 Tue, 20 Oct 2026 21:59:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4D98D10328E21; 
 Tue, 20 Oct 2026 23:59:13 +0200 (CEST)
Date: Tue, 20 Oct 2026 23:59:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atfkJUGYW0gp_OW0@windsurf>
References: <20261003040254.464487-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003040254.464487-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-vcs-versioning: new host
 package
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 10:02:53PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
