Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F36606A31A
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 05:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sP5ThXZo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=VAwKigSd
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3CD607CB;
	Wed, 21 Oct 2026 05:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayn-0ExSiKqH; Wed, 21 Oct 2026 05:22:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D4B8860763
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792560156;
	b=DDsoI6jilkCJNsmq0/fN4mGPFbXNtzLOfTyWJbnPR6r23Cfk8MGbAH3ubCmOySP/eMeb
	 Fxnjkg/FRCFGoaR+JmDbxQOuoyJalLrCxlAjR11shnZuLVEJ/n1P7/0hs+EDVh9lOVg9e
	 F+fUjNG5z7DyImkoqBiEN2SnVbfneejlUU9m0EeGlNZ+TjJvpXoknuVhphnRVmFUB0KcM
	 3jXgKZ+P+FSdIhGWeukctG8SOABg3PnFrHRGQ1gVcnOyfsjH+wtQi1zLu4DYgRZXiClGS
	 RH2OXSvYWeVHnUXKSnKVWyc+fAkBuO/EioGUXqIsKR/zQT7DCbgNGMDC81j+3OvYiAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792560156;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DQkfnYSmlTL0eDYr1pWr2tRLXRDjo35kKS60SMv1zgk=;
	b=BD5FoCEb62AAV15nPFBbQZ7Huu6vV0xSusZrGRtSaZrcj8dZV72IRBc636QkMml9/0ew
	 ABZyzDXbO/8C0X/nauj90pWq4rO9jreqXD/U4+QRqxvd2S94eg40w43w5V7m/kUqP0TbC
	 Zv+GSpYgRKZrKeg0t0qx9Q6VlMau+Qk/yPqG+gZ7pg7xb8WjgQvm83/X0blrCl60gv6jg
	 L/zQrxOYTdWjCvuPhYnVkxlCjXl/qaZklFZ5XbyWoIuXykgsGPlqBpTs/javRt+zcevlN
	 Gw7HEwiV5emOhHGjB6mpOwVaOudBsYifWhMJ8Q/1lzuWE720CysacKywSJ9Khum0Yfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792560155;
	bh=DQkfnYSmlTL0eDYr1pWr2tRLXRDjo35kKS60SMv1zgk=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sP5ThXZotpE7ba0h7ORVhhqExx72WzeIFQcAP+TME/OZ+0gvtq7Wf4DyBDd+Nan1p
	 0XnzaBP72HVBVeqYT1MZ7lFPl8LtABZZhm0QFf9duqRFv3BM/oE3NoO6UpFvR1nsdr
	 wO/Y+00HMikwlc+i8trlbouJN0ZCc158gY5Pssaeqmh15y0g9jZLlHx5diCos7CaIE
	 +IMcFXNLtoWl0MmdXGrO12GpQpDiMa+JX9POe8kwC0/tTZ0sswm4B+GMpngIo+i35B
	 8Nk7OnEngh4BayoB2rIhBR3qP2kbE9QLofSbBpmYYYRS1UP0FI/YpQOL2HLTBJZFFE
	 NUTnC706cB43A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B8860763;
	Wed, 21 Oct 2026 05:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52DED3A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 05:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F04400F8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 05:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dU-doTND2KM6 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 05:22:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9DCB340060
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=80.12.126.236
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792560154;
 b=clzL/LZGkMCh5CPsNCCB5hzoLFnJHNoWgQQuA3715CrI6143Q1RwSk3ENFLfL5Wzw5O1
 ZJtUTRebE2e+103OADH5H1Aa3QIvAAU4RdvRhOjqcp1l5UNeab0CBqxktbkZEI4h1xfNU
 EPHeznWyxcQ529XgRiBGwAcihLQ9OBdyvQvHoor0fYazYPyvF0+XlmpLslBRPZCoT/rsL
 sB+UQiNWUpMACs9qRYEK34Q9I1y0miEYb0Oovz9MXS13o59UsaM2ph4kPW/VpGOivYFLF
 hTRy3xaRYxLCcsNqc8V+tBgQ6P+WoAhcrZA7wlOw1m5PGlSUQgYDBtaSPpI4YdCM/UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792560154;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=UT9og96RxqWW64WvAb0ySDMoqToBOqh162dHg5FXqqs=;
 b=qzt7BVKGO9oo3lDDLDIoDWVCU1dZGcSX93U4ty5HNc6i461JnoqwIIJneFJXH+Qix5Bs
 fcvmPhTUtw+YVbsZjVbnVfrG5ZSaVqwrHzSY5y4DxrVFXWpBOqN6q/Okixh1Y8cqctlbo
 /IlOdCO0aujGMZQ+1Ylh+I/2NrI7CrgVehjr4ApMZWSt18uNCgxkIhzAirVT61emyMhZ+
 4PBlNOY6yZELSJdG2kq4z9CWIpGbu8lwrKt2FEYBMdVmKSyw8aYcU/8cRwJKB7H3Rzoef
 s+HfYL0bnLbuQYM3ZECsIjGhfOnSjvy0S8XQC+J+gMj7dV7Qd7wFgsgldy5Knjop5+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=orange.com;
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=VAwKigSd; 
 arc=none smtp.remote-ip=80.12.126.236
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=VAwKigSd
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DCB340060
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1792560153; x=1824096153;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=UT9og96RxqWW64WvAb0ySDMoqToBOqh162dHg5FXqqs=;
 b=VAwKigSdfGpxTPwbuhFlhCpVWu7fB53iXI6svbuSspYYZ5ZTTgKFpmgo
 bKo8OpDUYvbIrSuoCyGKbF8214566cZMqIPQYDCD7j2WhkatudIbF/3Te
 ZsAzTjUxusdxXj2oOo5hacoAQTsdHXpsJ51TUr2Eag0I+k/lNg9JOD99n
 mkuoNkuoJh2GsDZK5BReCNJir1+hh+sIjHq+QA3FhA1PyIDXbsCSlVb/a
 apGv3lR9efp0GGVrUUUcNn3kYQw3GRVwfPjjPlUn8zG2O6F7P8zLfvN+O
 /UDNmT1j8Fyw6MN6w7MS++gy5rgqkhXFdGdH8vUHiikRwiafRxTHKQpg4 w==;
X-CSE-ConnectionGUID: pmfl9qFvTNSmQRdm6hfwJA==
X-CSE-MsgGUID: m5Zjgd7+Tp+EbuFIA9s05w==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2026 07:22:30 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:22:30 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Wed, 21 Oct 2026 07:22:29 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 21 Oct 2026 07:22:28 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: bYBjFFoPSTGOFlOP6ur0Qw==
X-CSE-MsgGUID: fEOB/Cy3QxGDfqTlFePZxQ==
X-IronPort-AV: E=Sophos;i="6.27,169,1787004000"; d="scan'208";a="488033961"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Wed, 21 Oct 2026 07:22:28 +0200
To: Florian Larysch <fl@n621.de>
CC: <buildroot@buildroot.org>, Martin Bark <martin@barkynet.com>
Message-ID: <athMFB-DQ98pvKhX@yd-6wlzhs3>
References: <20261020144902.10111-2-fl@n621.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020144902.10111-2-fl@n621.de>
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 1/1] ca-certificates: remove roots chaining
 to eMudhra intermediates
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Florian, All,

On 2026-10-20 16:46 +0200, Florian Larysch spake thusly:
> Remove root certificates chaining to compromised eMudhra intermediate CA
> certs as suggested in [1].
> 
> See [2] for more authoritative details.
> 
> [1] https://emudhra.we-have-a-problem.com/
> [2] https://groups.google.com/a/mozilla.org/g/dev-security-policy/c/0R3XLJL6FuE
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Acked-by: Yann E. MORIN <yann.morin@orange.com>

Note thqt there is a newer version of ca-certs, 20260816, but it is
still too old to have the revoked certs already. There is also
20260816+nmu1 in sid, which supposedly has the leaked certs removed, so
maybe we could also bump to that shortly?

> ---
> Note that this is a fairly drastic way to resolve this that might affect
> a lot of legitimate certificates too depending on your application, so
> I'm not sure this is a thing that should actually be merged.

Well, I better get errors about legitimate certificates, rather than
silently connect to compromised hosts.

And those who have legitimate certs will have to ergenerate new ones
with a trusted CA anyway, since theirs are no longer trusted by major
browsers already anyway.

This also means that the reference image (in support/dockeR/) must also
be regenerated.

Regards,
Yann E. MORIN.

> Just putting this here for reference after discussing with Thomas on
> IRC.
> ---
>  .../ca-certificates/0002-remove-eMudhra-parents.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/ca-certificates/0002-remove-eMudhra-parents.patch
> 
> diff --git a/package/ca-certificates/0002-remove-eMudhra-parents.patch b/package/ca-certificates/0002-remove-eMudhra-parents.patch
> new file mode 100644
> index 0000000000..46ff520f56
> --- /dev/null
> +++ b/package/ca-certificates/0002-remove-eMudhra-parents.patch
> @@ -0,0 +1,11 @@
> +diff -Nru ca-certificates/mozilla/blacklist.txt patched/mozilla/blacklist.txt
> +--- ca-certificates/mozilla/blacklist.txt	2026-02-23 16:32:21.000000000 +0100
> ++++ patched/mozilla/blacklist.txt	2026-10-20 16:21:52.412423854 +0200
> +@@ -2,5 +2,7 @@
> + 
> + # Blacklist explicitly distrusted certificates to explicitly ignore them and prevent build errors
> + "Explicitly Distrust DigiNotar Root CA"
> ++"emSign ECC Root CA - G3"
> ++"Comodo AAA Services root"
> + 
> + # Expired CAs
> -- 
> 2.56.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
