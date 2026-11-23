Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D40606A32A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 19:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7K4hjU5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B02FB80E5D;
	Mon, 23 Nov 2026 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BI6qRw5Cx3rz; Mon, 23 Nov 2026 19:24:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8614C80D6E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795461871;
	b=kAxc6WKYShGDivKBOjNclnyEElplNbti/D50IYMXaPWo7SQtfoGLGAtGCp8T2EoQZRs9
	 Kj/hcXkowDSg63tI2YW2XwQ7+UWjM4QmVLJ5csjJx9MrX7q275SLhIXDISFYKdqYa8vpU
	 aYytdzhjJusDHAQtS2igSopQDFLWBIqIEuQ9yyh6HFqSwkrL7lamtGkcACcHucJ6+z7Yg
	 fzsmhKaJTGDRnivrKipvUdH3wY6HtTiMHIZuYdm+fiXt8BtP7BQaVCyxz6oOJE/nwpR3p
	 x6dS9uN4iBxx1HKLabE9ZXPliFx80JEgKhd3V2x+2DfO2GlkZmelLP25qhuB0tPbBfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795461871;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=q34XAflmUcsgbvJBjk2D7VNgCtzpZpfSORicUqZGQe4=;
	b=BhLoLjgrVc5JbrjSLtQ38jkHbsffSBtT+sQL06EUQZknZjOB1x34IfgizkeIf1USwXyT
	 JpRfs3VT/a7f81gcemXfeSIkIvHPkHpk3KAXuXTBX+tZCs2KUJjnENz6tq6QBxOo7vyFt
	 fUgvdOwlpj804KkqKOiGZn9ns9xmUvtIAMYBb7eYHZ7Epetuj4omma0bmrO5lnmv/F6On
	 EZnHu4JaI3D+rNhLVMkzfjjgxT/+HmtV7yXzDq9mGWkafxicXIv67SqvT4AbR1Heeeu/Z
	 n69lT2m4WEwesuQrxphVywj2PoqC8qxB8hjcAoPUclvSsNAkwj6ey0MOsnX+TPZRPGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795461871;
	bh=q34XAflmUcsgbvJBjk2D7VNgCtzpZpfSORicUqZGQe4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e7K4hjU5AJ6hl9xqfjMTMesfjlVuE2DUIFW/AaCr6Qj1olNIS7Y8938vSdMIJTKD0
	 qRuLu0C2oZ+1of3sbNlfPINIIfuLpmlnACjkddfxOqWbTfyou5aPH+6mTJpPMo0TTS
	 oM40r6kqK+c8g8YCm9oLl0tFQqYkdWEVCC2r+kR8nFCBQGEHp2HmKvFJYE5gcrS06m
	 IbbHUE+iTNAyuJCTPHxXvsQuZzr+yjviFwzYcJn3AfwDduxQmkdHLqpL9qGdz3aoJe
	 xRmMg9Abmxfc5W4c8EBHXz5VxM/eelyNjHHFkBGZAsYyOfG3PCFjxz0ONBoTCRy4cP
	 nj8UOUY/lZxZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8614C80D6E;
	Mon, 23 Nov 2026 19:24:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61F66311
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F93A60640
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PeNGEMKyCsN7 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 19:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 83B6E60606
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83B6E60606
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:24:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A7D1CB0054C;
 Mon, 23 Nov 2026 20:24:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Mon, 23 Nov 2026 20:24:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 23 Nov 2026 20:24:22 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261123174624.1851887-1-giulio.benetti@benettiengineering.com>
References: <20261123174624.1851887-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <87da589bc8a653273b3eae7faf46f50d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/swupdate: security bump to
 version 2026.05.2
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/11/2026 18:46, Giulio Benetti wrote:
> Fixes the following security issues:
> 
> - GHSA-68fx-rv4m-vh4r: CMS / PKCS#7 signer name check
>   (forced-signer-name): a crafted signature could cause a double free
>   before the signature was verified
>   
> https://github.com/sbabic/swupdate/security/advisories/GHSA-68fx-rv4m-vh4r
> 
> - GHSA-9r86-v62q-p96r: CMS / PKCS#7 signer name check
>   (forced-signer-name): the check could be bypassed by a signer whose
>   certificate chains to the device keyring, adding a certificate or a
>   second signer with the expected name
>   
> https://github.com/sbabic/swupdate/security/advisories/GHSA-9r86-v62q-p96r
> 
> - GHSA-p837-xh6v-hmff: GPG backend with gpgme-protocol = "cms": a
>   signature from any certificate, also a self-signed one, was accepted.
>   The root CA must now be listed in trustlist.txt
>   
> https://github.com/sbabic/swupdate/security/advisories/GHSA-p837-xh6v-hmff
> 
> For release note, see:
> https://github.com/sbabic/swupdate/releases/tag/2026.05.2
> 
> Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
