Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74F606A32E
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oG382DDJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A11860777;
	Wed,  4 Nov 2026 22:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0STythUuh26; Wed,  4 Nov 2026 22:33:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6330E60844
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831602;
	b=tPv+DEj0auC8KpDpoZm1JdmcEHlz/nPTP3MDMU3pkRzDL1YDH4xuWPGJvDDZ0z7YZNS5
	 1c/blT26uTBQQU2A0ABqeZ2Ll0+gQ6p6EnDNouZq/kqskQgVXnDcKKmMGuVzItlrbHxGR
	 dTnSdGIe6kSDditpoDVWdUuvqenk0+KLFn/h/06XNNule6625CAd4FOTVh7dV4l5zInOj
	 SbR8btGCepaA4Avukt2bGAQuQQA5QBEzT24AAi78mPJ0gLZh4mExK/vYJKDWLeoXO+aCN
	 4mFmEpa3STPj2ccgLApzaPYfjj+LpUO6gcO3Gg4Yr0ifaYPboBuYRLtiiBPrfs85BYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=blEmx65YlhWEsOIQp75Td0J5Vhlm/fbwubw2a2DixaM=;
	b=nEqJyjbBDC4F3cmWOLvK6kCZnzjJSmpc/LDE+kQLY4N7qD6q30tTJYXIJNeu9pbex3Jo
	 MVma1buEPEsjJfuIl7Dem5WhTSMV44GvInf/uOmarWJ6v6ia5JkPrc9LdHemXHJbDDjsz
	 lSk4C0XpN4XneWfrjuz4BLcWoVQGwLgyEFxTcC5StTpl3qowsnpRD2l0bn6rX5NV6QK+W
	 NGs4GI6yAlSJ7jbzyVjwgPRmBd4ZoZQDBSXM2S6bBkTOcfqlnWy7baJirItlCjNaS2CMx
	 cghi377LTytjKUTeixDRI4deIOTyYXQn+8v9sfdSmTfbEtypTDmahT3M5jnyTnPeCow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831602;
	bh=blEmx65YlhWEsOIQp75Td0J5Vhlm/fbwubw2a2DixaM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oG382DDJmVsCFvL5clDgKyI3EGLZyA7Z++8KFHrF9pl5Zw0C9moZ8zYWGWHq/FvAP
	 qUBy56r7qs9hgXOg20cq/8RlFoDNwUvUtSiOsWQxaphvt2TVv9jkDQYi1sSU5graT7
	 CZB3dWeaFe7hb8EsAzldk+xvV0QDjchxUPQWIOKlfYQ9QKe4wHmk4Q9uLzu0+AqeeS
	 ZrmaK0ZM0kLjbn3vsZR7VeBf/xeXMlXYDye2fMv7xIyKTvCRlQvdEGW2ywf1NEZYSa
	 Uw3Q77hzFS8OGyC7qzQ3bik9nxM3MAMv+qi3Gc+CU0DB6bm/CJS1OpHEvse02w0GSE
	 JYQMfTBNiqbAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6330E60844;
	Wed,  4 Nov 2026 22:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D12FB362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C365A40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8b6jq3m8Ixmr for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:33:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 78E5D4008E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78E5D4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7139A4E403FF
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:33:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 463825FD65;
 Wed,  4 Nov 2026 22:33:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9EA4D103291FD; Wed,  4 Nov 2026 23:33:16 +0100 (CET)
Date: Wed, 4 Nov 2026 23:33:16 +0100
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <auuyqBagbo3a9G7Y@windsurf>
References: <20261104211902.3623831-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104211902.3623831-1-angelo.compagnucci@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Jesse Van Gavere from qt6
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
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:19:02PM +0100, Angelo Compagnucci wrote:
> Jesse asked to be removed from the qt6 package, his only entry.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Applied to master, thanks!

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
