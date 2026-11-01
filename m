Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE90606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IRGDG1zY
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4232860623;
	Sun,  1 Nov 2026 22:44:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zTctfYFuM_1; Sun,  1 Nov 2026 22:44:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 690A560616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793573091;
	b=RdMdoly8d9SZrJ16GagksNKAkRoCxtjQV+dU7Xy/WOGgntVOU+rzcwDdeGwGCh/kdTc/
	 Wvtu6QGAkhDi2T8tOrVKbXf6dtSkajwbRc0ZZ6Je8L7r6QItv60xKGqkg343Px7R7vxJL
	 LsqI8rKPAg5BAie/PrVS2xYdeRdegTrkDL5vetbqk5KOCDRNAOtv5UaOSijL7JscEw3Mz
	 ebBuOSTrxdtonSLKurN4sqLg5Y1RtlrzxvrsI4AfqsJCGJk2QEDk1a6f5Mbneaar9z+a3
	 o17TnDI/m98tihCCET8qKckPvXtIoyPWiQznb+3KC2VDxz53DjejFPn0I0+2YrG1MQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793573091;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jWceW6pF0FLjUFIzVFoi6axDCpBsy4mMibmnvTfH4A4=;
	b=sDYA7tMFecPCkUQWpOBcWzE1jtOvV4/6FEpGqA0ZvXGVFGV37kJemWbF+emoyuScKgVK
	 PIB4PRagR+nSNUeUyGAfAlvohwMDlSviL32f6gYvh6bjh2eo3tT2m6XS1FIWbGCmwhTZD
	 LYTLB8NkMZzpBGmNdGonJcsPIk+8MMDDlX6GWVhNN2iiLtQ3hYuhPOLulqeAsO2ssZHeA
	 OuN/giBdJCWSZ8rDAJ2pG+44cQhHrWmgW3pLpSfnhUdnkJKczd2m2M+l4FyFMIuiRctKO
	 tXS6UILEViSmlYamTs6bmA2Y065J6N68JtEXwrzeo8fQ1J0Yxxgkk/zCb74xIaep33g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793573091;
	bh=jWceW6pF0FLjUFIzVFoi6axDCpBsy4mMibmnvTfH4A4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IRGDG1zYnmM++y2WHbeKPqpaA2bjPGwsrUcALjVK+vJNyPEZAIUcfvGW1kdE5u7gm
	 NB/Jxd4ysQBVwoOCQw/TdvAQpDYITqr5BZmHIMEPw55R0Coj3gxQgGheHg+qUSN3Qp
	 dfSqSKDFOVZPwiZRqaB1XKxqnv5DnxQB2kLbkU9BDcOm1jkXI3iQMmzxy73b/nZ7TI
	 Ws7rr7xDqTROYVWOuVFGy92tDOOS+woNSriCLrxlzbnZwNoXbynj3REQ3I29P+8wY7
	 hdipaMMHiqjOLvDLrnBMmsPnTmNKICuvbvnjYiOTNmbXrKhW6ddheEvBzbGkIaE7sv
	 iJvxZTmZJ1QQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 690A560616;
	Sun,  1 Nov 2026 22:44:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB698435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8E9240086
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GJ_qE9h4p5xN for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:44:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E726740042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793573089;
 b=BD19b0rk03faUUBFL4z8g+sXKY7oYKUbuftic4+5yYAQ66zprnkAOYNWi2mJy7e+iCus
 BVqjLYH4SNwJQrEOS5QxMRQFbu0iU6pLv3+OHu7wPkWowG6BPctY2B4Wfee6a+SfCrQrU
 DGwp6hZWZEoZiQFgaPM9pA52cNQe74yV9MWcT+dN0vd13+GOghULraFR/ucIYpz8nJrBj
 sNcPzGmFKCsPIfH8NipTZbs3RhwDSnOGBVeGj1ZqfiHpCbpx7D00UyAdm2PELij7IGWUj
 puxFUc9Lero+XIJ6UYQ6oEDD2y8EZ5xyTFtwZP2+D3KRzA0OzE5I4KwLg+NyiP00GqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793573089;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=iTlyKT3pZiOEnsYuEJzUcaqawW0t2SxbJ5ILEKsY2uI=;
 b=m5PXGEvR/maXGsSc0tbDHxdvqG++a99AdGAAzsn6TFj043kFUgyX0LtXMx+yAOtRZaTt
 pDIuAmbKOq3H5M23EaE7r96HJL/ZWviDMW7Exjm7c9DaicptzqXG8u7DJtdc9FPzDVJxW
 /hrn/X3Uo+MntkjsbRQmKMH/DFnkXLnfOa4A1XkesbbK6VgImNDEVRJmJ2oUhSGi9PFxb
 wUl2sOJlzwGDHKEvJxF/xqeTD5myW4ZTnoF0x/22XEWjgm8i1CCzu1IsRONhynW/ULAtZ
 Lnk4RDC30PhF7A4WskcusOR8FIko3Txbnt+7WwUKGfnq/FQCR7F5XsUFmXOpweXIpwA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="enBH/ap0"; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E726740042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:44:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 6DBF7C49F79;
 Sun,  1 Nov 2026 22:45:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 94CE760750;
 Sun,  1 Nov 2026 22:44:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACDD2103290E8; Sun,  1 Nov 2026 23:44:43 +0100 (CET)
Date: Sun, 1 Nov 2026 23:44:43 +0100
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <aufAny9Sf6-bnoa-@windsurf>
References: <20261030151950.1475253-1-ps.report@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261030151950.1475253-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3] package/libressl: bump version to 4.4.0
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
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 04:19:50PM +0100, Peter Seiderer via buildroot wrote:

> +# Avoid linking problem: "undefined reference to `__stack_chk_fail_local'"
> +ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
> +LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=ON
> +else
> +LIBRESSL_CONF_OPTS += -DENABLE_HARDENING=OFF
> +endif

This should most likely be an unconditional
-DENABLE_HARDENING=OFF. Indeed, we have a global BR2_SSP_NONE /
BR2_SSP_REGULAR / BR2_SSP_STRONG / BR2_SSP_ALL that decides whether we
want SSP or not.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
