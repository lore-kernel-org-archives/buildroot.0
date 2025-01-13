Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68A6C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 18:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EE3E40234;
	Mon, 13 Jan 2025 18:17:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQjI83Ka_Sdd; Mon, 13 Jan 2025 18:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A2E640224
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A2E640224;
	Mon, 13 Jan 2025 18:17:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5822195D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38A4D402E0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcGZb5o5Loac for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 18:17:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2482B403F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2482B403F1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2482B403F1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 18:17:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.119.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1sycUN47hT-00i0Fu; Mon, 13
 Jan 2025 19:17:53 +0100
Message-ID: <e327553b-93a3-44cc-9b70-48bab7497067@gmx.de>
Date: Mon, 13 Jan 2025 19:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
References: <20241211191630.1414970-1-bernd@kuhls.net>
 <20241211191630.1414970-2-bernd@kuhls.net> <20241229221255.2138fc09@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241229221255.2138fc09@windsurf>
X-Provags-ID: V03:K1:4qnmmRC9YMYEGyi56BaAR1h7v3iTyAzZwDrHlKoRO1FXZabCAYA
 W8oLPEg0G2Og628v3Z6hl5Lsj5tkEMxznwXBTmJpnPi7yB+J8+yosOgj/mv8ciqPauDeIA7
 D+y7bFsAwu+Oq/O4XWb4XzhweT0CT6HK4RapVD6QooIYAXefBc85gVgT24LzPsPwHE+O44n
 1/sHB1Of9V34XXNa0NMsA==
UI-OutboundReport: notjunk:1;M01:P0:kyzHZ96vG5U=;4OecKzY2H8g7ylL7w6DD5blG/aE
 qQpxLG8hBew3qAqIVH8wdYYOyRSg+69bqqsBIIZXxJHsbLKLor4dCani306YXwucXccxSk9Z2
 N89gsecXCw6JaNe+uah4Pf1RiRScXSVWLirkalIdckJ6gIBS6mpUOPP43pl4OsQ/7U58hLtnt
 v0oJpT7VDgCQzh7V86K4Q0yFHGYNQUoMx470AcuARbB3n/yDBTds9n2nUGgFS2y1hNzMhINDq
 loOKA/T6TGXHupWDdUHYY0Snbjb3oggmdfrOe1CxUvjWSUOb67CthNLjFpo0mAEweQh08Oh/1
 rfMj9EmW1M4KcK1/fNRqLxm65A03IcRt/QLCC16krtc0RBhFNmwgJ0SV5TCugh5dqlhOsrBAb
 S2pRNDZazW6B/NG16rz1voFfWvbzuCaP4HpOjH36XIXYvVp38kcIGDtF9fzRjCJOUegbileuc
 HtWv9WRRWyPNwytMy4zd5K70mNSSUShcfCkxvriJsGTA6s8U972FGCHLrtN6PhOavAEqbgxjt
 cpJXDajziK+Wo/6m0XlgBTHPE6jlQlrFIFmFx+oI5G2YbzMv6esnaDTZIyJD62I1lAUbehrbE
 4/GxnKNxnvtZMiLJQ7NXfSzGApvcQY3CCealVcFnkGOdxwm1VVO1w+qN5o5V69ERsO8r9O2t9
 bfH/FBkDiStn0QL3rVsWxyakkU2olgjC7SVHK6M9XTkgeb9YxtS4unIchMHfOZK6lf3jOiPDD
 c1I4Hco1Vabmh0U7nZ9Ure9n4fZBKxGq6K3ue86YsZbLxslqp54FDPzigtzuBOX1e1dugDxtt
 eSt9go8RNGgcOY0bx7hhetkwQZpfcx5Ezo9x+Eq1NO8IkSpaBqfLeyIJfz3yXOZTAifGaqjjx
 R+U1tVXdbGyMq2XgQq4md6OxzisMpzLcU+GtIf8H3YQmwQli71olVKCvPcq4r1OqIKcDqlopI
 KJMxAUHmadqz0LKDsWYy+s5VbitWhPMxLqno0sx6ncdK3xxcDSBDOxVA8eKRPlpQ3sOC24604
 zTvwXsKUJsuVJngTQVY3UOLc56yivNDTNgUO67dW2UQP43lgNbmOXOKXX7pjawJqNud46LP5n
 dllO4+ioM1t0Ws7fzGpjXE8I/S0E4XGKXZcvJMnmrGbiqRQ9C/IgPuQ/U1hYv/Gxptr+CC0oo
 =
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736792273; x=1737397073; i=fiona.klute@gmx.de;
 bh=ymG2x1OauD1O4p5KGNRDAmmECPs3Ky07Ns0BiAwCDRg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=H0RSgcTWrfsUqyaakf6zXsoJXgJUOOPnlH9ZmV6tn+KcQZs0MFcZdGG37Nic8liB
 VnU3RulW2O8ekepF3GwOtwQ3U9SVW2N5FHkAb+6er0h9FVZ7zYT1TCNfmwmQnAJ0G
 ZYQ4WBc6zz/cI2dXXTyQYQ5OFFQL1LJrpTcqpcmIcOWh6eMNgyH1ecBOXHcy2oGzX
 WQ3qwIGVr4KopvEqOBmIjArpyBLpE/qGDiwwTT7FGt4zX6Mt0TfM8OjFvP+gaT0WF
 M3D0C4JcKlLONMJ2IQXflyGSIAE7G5bZEjZOM+rgiHr9a8DMCqHnzworH3Edmjj89
 4WBkyN/q3jYHdSSbfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=H0RSgcTW
Subject: Re: [Buildroot] [PATCH v2 2/2] package/python-emailproxy: new
 package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 29.12.24 um 22:12 schrieb Thomas Petazzoni via buildroot:
> Hello Bernd,
>
> On Wed, 11 Dec 2024 20:16:30 +0100
> Bernd Kuhls <bernd@kuhls.net> wrote:
>
>> +PYTHON_EMAILPROXY_VERSION = 2024.11.11
>> +PYTHON_EMAILPROXY_SOURCE = emailproxy-$(PYTHON_EMAILPROXY_VERSION).tar.gz
>> +PYTHON_EMAILPROXY_SITE = https://files.pythonhosted.org/packages/2b/49/386e675f2b0706083fdf02ad3666b98d0875a2e1cdcabff8df9fe641d2e3
>> +PYTHON_EMAILPROXY_DEPENDENCIES = host-python-cryptography host-python-pyasyncore
>
> I am still not happy with host-python-cryptography
> host-python-pyasyncore being dependencies, while they definitely
> shouldn't be needed. I know James asked you to use
> --skip-dependency-check, and it apparently wasn't working with:
>
>    File "/home/bernd/buildroot/output/build/python-emailproxy-2024.9.12/
> emailproxy.py", line 52, in <module>
>      import asyncore
> ModuleNotFoundError: No module named 'asyncore'
>
> Do we have an explanation why?
>
> Adding those dependencies really feels like a hack.
Looks like the upstream pyproject.toml requires importing the module to
read the version:
https://github.com/simonrob/email-oauth2-proxy/blob/3ed7dfdcd1d7a9dc2a392aecaae7bb5d913acec0/pyproject.toml#L45

My guess is that cross-build wasn't a consideration there. Might be
worth trying to convince upstream to change that, otherwise the question
is whether it's preferable for Buildroot to have hackish host
dependencies, or a patch to make the version static.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
