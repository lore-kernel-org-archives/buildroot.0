Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FA606AC32
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NQB2q8/t
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D87607D5;
	Wed,  4 Nov 2026 22:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUZ1sXZ2M9J9; Wed,  4 Nov 2026 22:00:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 36FA1607A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829646;
	b=eczZtT8LdcdKmPVXzVf+mTWhu+g6/kjU2r45Bsft0sCK//DbCNpbZbpYHliIRycyF68h
	 lJaqu7M6mZw3YhQmo/6+TZBp8/wYqP/VEfh6ArBNA4Z2spqL39az/Aty6KV1pCEikincm
	 gYuWRNXKndLyBb0L0DFISiea9gi2PoQhjSw1hah2vuyLOV0sfuMvCQf29d5mntnvS16At
	 WnkP7b+/th4CyZmSBayF5lkGKV7QcYJF4tXtzQyTzFYYrnqbxwZ1JE7S1IutrUOzbuC5z
	 EakjdZn2ZmUt/CxAzqOIopZvZimNG+Gc2AsnjhB0EDpoRAWA2cGRcf3S+YJAWFQwqxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0hklgv0jSMHnU/xezZNSeYAofILV22+A48vq8ac36CM=;
	b=tZcO0G3VFcg1mxi9lNow6ppVndJXhKlAYaQoCyRX0CKfJ7yikk9yQ8/YTDcfNgYJz8o3
	 uOQLXvsDYfcSh/sBFWr5xpHC0vlTinnY+Fxq1rpArnUEaR+VbgGSaj3seJUYYdgKJT9WO
	 vJ+5CyDyaBhbU5f4QqAh2o3yO5jXJmTxdMFaFa6+APIPr7Y7oMkgJ1arLKlRUX66BN1D+
	 FB5gH1KZUT5SFJPgBrbJ+E44a8/UaHOcMBVBFWAl68f1Q23etTwuQFcNMP2QIEza5ycx9
	 Ib5OJ4x/fAFagR26Uyo/IwWDy9yvtuyu2o676KsegoVq9ypJ2QGmDFoNimGb4V8u07Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829646;
	bh=0hklgv0jSMHnU/xezZNSeYAofILV22+A48vq8ac36CM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NQB2q8/tfSL2iQsRs9OG868HFcf2+wKEdmMyO4A9YcBJYTWQDuL1yJp+oGEDPuIVU
	 uoOG0+XvVxean2elZIxlOj7k0LitA2tszTXB2iuYEqMX+0gdWjxlRp35waWuqLPtH7
	 qmdJgcLYGOFagNM2z4CQ44kSMR26hrfvUg9HA26pKCeVBTTzOFYETR6gVz/1pHXPJ/
	 6Kfu7WKNCfY4HHEEYfRh6ShKXZgNvlyUBnHvry0GzwdydR36oVoZagrKyccz4+EIER
	 gvOLCwPUbh8EeHfoznRaIJwsjAcJRkEBJxwmbM9Qu/0bR9mLvCoKE27mSJZuaf4Hbc
	 bRp3VnhB59USg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FA1607A3;
	Wed,  4 Nov 2026 22:00:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92AE6362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 842878127B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe_eWeAyfKms for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:00:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EB6481279
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EB6481279
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:00:42 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id AA53D4E403FF;
 Wed,  4 Nov 2026 22:00:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7C0395FD65;
 Wed,  4 Nov 2026 22:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 455EF1032925B; Wed,  4 Nov 2026 23:00:34 +0100 (CET)
Date: Wed, 4 Nov 2026 23:00:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Gregory Dymarek <gregd72002@gmail.com>
Message-ID: <auuq_jTHRS99ywq9@windsurf>
References: <20261102205914.70727-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102205914.70727-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: security bump
 version to 1.13.19
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 09:59:14PM +0100, Bernd Kuhls wrote:
> https://github.com/freeswitch/sofia-sip/compare/v1.13.18...v1.13.19
> 
> Fixes CVE-2026-110658: https://github.com/freeswitch/sofia-sip/pull/347
> 
> Updated Upstream: tag in patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

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
