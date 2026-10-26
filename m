Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0D606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EmTFiMbP
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6228460670;
	Mon, 26 Oct 2026 19:26:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76G3BTgW2Pox; Mon, 26 Oct 2026 19:26:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7A1CC605ED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793042793;
	b=XmWu7jiFrSDec8QcHTa8CX5RPsKRQCq3EgpQivw1foQ4+6gwGYMIVqCJAeIf2BcSN9V5
	 Los2EhUFM4ztIGHYAJ7YhCP5al2x4qw/uMtRCjQAw/Cu/5KP4tJGZZ0G2aT2marzDCBJm
	 usFbUcYHumyJ6LRhA2ZgtjqJQocq2/W53frHKTJhSXamsSRvtaT57yesvR8Uc6j+jOmrI
	 j3ez+5/7clWiAWk7F4IC2SyUezrWL1HbCySiMXB93EVvS5NKWPuNL88TAj0IDZOzkaDTi
	 f6M2xJXByz+A57VZOOSJ1pVdfMXreoPVOk9qgOifPUp3CUQN1fHWZb39lqo1zLYE2aw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793042793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 X-Forwarded-Encrypted:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:Date:X-Gm-Features:Message-ID:To:Cc:
	 X-DetectorID-Processed:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Errors-To:Sender;
	bh=bWW1zog3Z7Y2u/9bmvKQ0juyWmAicLITxOCpVLZnEMA=;
	b=WhEAB/SmILuHyvCwISjxhIZeypQJ7eIDThXr4N7B6zwEZM1Ok8eULzR0BlD3hPZyYXsR
	 YFRTUy1TzziGfLKO+bt1rYVdjjA92yIDRZb7NZyGOLLg7KWR+jwj4qEBnK1q5azURoJ44
	 XHW+v/a7C1whT5mPffXHW6/vhs+Uc/gm/EICzzQvqwJah09ugtpIa/1VPqMyL4hpa15SR
	 wxrJekRO3wZNaMbFmMwfbnpWnq+ru+b8MqrJOQkIF8lBnlABTFNKRb6wf9HzAgva0jI9C
	 83abbI5nd1eXqE85MQbPyjtRVnNLQynjMItn820e8ucEJ3Fy89i6ZBC3wA3mZlzK0XQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793042793;
	bh=bWW1zog3Z7Y2u/9bmvKQ0juyWmAicLITxOCpVLZnEMA=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EmTFiMbP/0JY7yEqhSMOSzzwrshkLl3J9VQ69K627pfrMyO/ZEgPDkUeMLevI9mhk
	 36vEfBJdwQsVyFW/Ose3dYX+AuGWfM4IWIlPA0GdkUjary23zYrkobBsaH9cR0cMie
	 teDN9xQNbArE3ucvOSsvq9LrHSEvNb4U9Ihw7teKQ0f711hsN//6Rt3SYWBkrMFK0l
	 E49m5a48gnnpXNZo+zkOWVW2i7K8AyJD+JPQStPSXpriyo+7+KN03s03SnZRfSHfU9
	 vrbq0iX3IDDD7BUlbwhi0bqY5U0w6XK2zRAQRYafXO/X4Dsaq+NbRvuiu/EN97BNLS
	 nXsb08DaKxMnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A1CC605ED;
	Mon, 26 Oct 2026 19:26:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50309356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41F39400D2
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3roax3jssKZh for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 19:26:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E160440062
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793042790;
 b=gYXaZe6pgbJmTKFWYjzLuL/AeVrN5prk8tm3PCCRgoGlJ39kZKIrOTW58Hn7pueEzhEF
 Sq5UHp4V4qM9Sl4B0v9Vf9Cm6Gxo5bfG9PmMTksROY/tGV8CLasxana2R7zZxr9ydao8D
 ZKjTTQM1ASV1slDToUY8tusx8puD7EdGC1cSuxEdwkrpLuM/8VfRvBd0OoK3ydHET6w7c
 +jnEmI0cNZxKoqWW9K1vUsTAhPYmeNp+Sl93972rzgNy31Szjz/5TX2ZCeGL7qize87Qy
 JHQRZSJZvYd76RU9MTY1jCMWthGhUTV5N7AGPOlzfctr6bedVLA21e406A1RWgGjJ3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793042790;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
 Content-Type;
 bh=ZNNpR43ZVMnP3gaY75H19AakP4S5yjybpHYBJj5eNr8=;
 b=MMye+nhJ9YI1OLE5HcC0VvtaSxaQYs+t7K+MW+fNmnkG51h66N+GHBYwPdbKYNpsrMJe
 ocz7xSyP6JsUU3ye0momTN3tfNx+9qRym01HUa1FzdfayDex5lPgt9m1tfEZUJ7sIeUHf
 oWpPpfIKI6tihsMt9vLfFqHMf7trJy0xAWHT9fccyM7ad8/xTvKV820EvP1IhEcxrFn6/
 /bLSZcGMcToHoSRywftuB43SrKojEcIObaTFTRiyqQuklnyiI2I0qlEscFSyPVWf1j/7k
 5lNyioAk9WE+Qi9lKHNWqGJTB/6n8Kvv6sJS67DBnZYpT4U+3RT9nwqFZlSWfCdz33g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=ebCDC1qN; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1062"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1062; helo=mail-pj1-x1062.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1062.google.com (mail-pj1-x1062.google.com
 [IPv6:2607:f8b0:4864:20::1062])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E160440062
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 19:26:29 +0000 (UTC)
Received: by mail-pj1-x1062.google.com with SMTP id
 98e67ed59e1d1-3ad2b3b1c02so1689067a91.1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 12:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793042789; x=1793647589;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZNNpR43ZVMnP3gaY75H19AakP4S5yjybpHYBJj5eNr8=;
 b=E4ho1K3pLWFroVKOn/BS7qKA4Z9fEzn30vFDtU66pzDq5/wDZx6dflG7vLCqE1w6xg
 VZ+5KULF9ES+NJOlXoXsSL2vLDHAmDyLwgZ3mQfwlXrYag4t61JidKY/Zwk0lb8kbGgg
 eqvTI0/a2JCbI14AUxPPAD4yPNgDmCTs9EWBDMA6613i4K/29KHMMn9Dq68YPodrkU6U
 qj7FItVnvacFnh/Bur3BZfL9nKZMXPjTVq/UFK3y976XYJZUhsEQofN3ib3WBsnN3o62
 pMPDURHWmTNc2z65A2UTbIh8O+fvp6egMsNS/kknPd9v9VR45JU08MIaN4C7qrSFqHli
 iWMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxFn+2qUoXL9zX0FDMPUykMK8FHjHnddUlgUTYdAn+wxUjRHwV1iu6Pj05BzYP6w7iubQVjTgTr3+4=@buildroot.org
X-Gm-Message-State: AFq9FYIE6rP+vzEW/qd8CyXxaKX7ox2D4gD5eRnyPUW0e7hs+pof4lnW
 6FzPGJyQkjxVjsoUZOemkgVMt7KQA/QdQ3A4d2sGKMcz5ZkiJQOTjRijKCbwdtAKWNd0Ul1LgpO
 /eHdfM3TXto8wHXmDMFcDOavPVAlbpoKnOF8vTa6N70pKPSBetsHjVWN/C1+Jql7lE/BrU8v8xg
 N1BWKbYVM8IYdxsaSqszX9e3XWwovAVvMUdbGh06eUGNEuqSTa/7kZgGlynWo/DlExKrRKThe8E
 2/eM1L/oYDu
X-Gm-Gg: AYBFou2EMhhIOuy+soQPNGdeTrHVRUwmRaliAh/i4VtYJ8MmCk/UU74O96CuwQQmZm3
 9ya3xL/GuZ5Vnd0fOFlYzAyyxpFS1GbJ3JVJTXTgx4DHg+sWkNFFMBQG/hqqx0rLVg6LVoRbrVV
 UXpOqzCJlf5MRiIkSpJ6lTLs049YaAXrIBjXprPAxjUWVW1cPtvDb9MxL1tdCvsZXInvS1Wgcxd
 p6fJl5ntCJS9gpbSuLAz64p/LO18JfelJITCjCKRX060Xv/E0Gnxkn3uL7Y8QVp55Z8VK9ZHuZr
 nApwzu9cUU8sv88jyKDfvHncMuGRYj1f8JwCu7O2DfVIdLVjKMxbKuCtJQs9vTLegQaZ9ceSHMu
 OduIH0l7IXZrFgxkm/osWzPxJXcx4K0fpRQvQSGovdXCI7GmpaGP2pyEH54NkDVrpeerHEbgLQN
 JjjffLthzfSX/heYZh6ab0Ee6TERqyv8aOcac=
X-Received: by 2002:a17:90b:39a4:b0:3ab:de4:7fa5 with SMTP id
 98e67ed59e1d1-3adeae80d56mr6463553a91.56.1793042788640; 
 Mon, 26 Oct 2026 12:26:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae40405cfbsm381276a91.0.2026.10.26.12.26.28
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Oct 2026 12:26:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-c2dd399f761so315938366b.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 12:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBy9cC0TJj90Ix590raoAuSw7IFt/niNh/X+Z12UCxUzmKjRfHmd0qzZWKBkWkAwrPIV0HvgTDO/qrs=@buildroot.org
X-Received: by 2002:a17:907:608c:b0:c33:62c0:d8cf with SMTP id
 a640c23a62f3a-c46bdd978ccmr896812066b.13.1793042786773; 
 Mon, 26 Oct 2026 12:26:26 -0700 (PDT)
X-Received: by 2002:a17:907:608c:b0:c33:62c0:d8cf with SMTP id
 a640c23a62f3a-c46bdd978ccmr896810266b.13.1793042786345; Mon, 26 Oct 2026
 12:26:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAGt4E5sTu_c5K+j58Jx8NXGZccX8PQbyTTZJ3HKt6wktgjYHTw@mail.gmail.com>
 <69c73771-8203-4c26-9a6c-0f7a5940c519@gmx.de> <atsMtHazGzkiwaXR@windsurf>
In-Reply-To: <atsMtHazGzkiwaXR@windsurf>
Date: Mon, 26 Oct 2026 12:26:14 -0700
X-Gm-Features: AclHuK_2KfUMq8ucRi6AePR-4V7Bv5Q97Ef9CT7CBhQN8t_juA5qyftWdH_oGGo
Message-ID: <CAGt4E5s-wtR79wGrzGxxrd=Cbkb0fjNyaB8uBDv99S-vhZWsxg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot <buildroot@buildroot.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: Re: [Buildroot] .mailmap file for Buildroot?
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <markus.mayer@broadcom.com>
Content-Type: multipart/mixed; boundary="===============7940420177439307166=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7940420177439307166==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006405fe065ec34e95"

--0000000000006405fe065ec34e95
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 00:29, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Fri, Oct 23, 2026 at 12:46:23AM +0200, Fiona Klute via buildroot wrote:
>
> > > I was recently faced with the misfortune that my long-standing e-mail
> > > address dating back to 2012 (mmayer@broadcom.com) was discontinued and
> > > no longer works. Of course, I can adjust my submissions going forward,
> > > but existing patches are stuck with the old e-mail address, which can
> > > be confusing, since messages sent to that address will bounce.
> > >
> > > The Linux kernel has a .mailmap file for this purpose. This is a
> > > standard feature supported by Git[1] that helps with remapping e-mail
> > > addresses in situations just like this one. Would it make sense to
> > > introduce this mechanism for Buildroot, as well? Surely my e-mail
> > > address is neither the first nor the only one that has gone away over
> > > the years without the person also disappearing. So my feeling is this
> > > might be useful in general.
> > >
> > > What are your thoughts?
> > I don't see why not, it's not fundamentally different from updating a
> > DEVELOPERS entry. Just send a patch with the mapping you need. :-)
>
> Agreed, it makes sense to me as well.

Thanks for the feedback. I sent a patch with .mailmap a few minutes ago.

Regards,
-Markus

--0000000000006405fe065ec34e95
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
CO6BIthxg6DZxe8QX7fU1/ze/Sfit5oGfwL5pIKbrf+45WC0vcigdGUipnqp8EJDtevB1R6VyX6I
Zwzw44IetO/pVOR4+ccsGluBLOYeCnBYXGVnoxQGlsjd9mt6r9cXEGbXwM3CefzkcZnl3guI4mZ+
QmID/IhGR+pkBsCMJ+m6L8P+EwwzpcLq2HOZDW+bGs4XoKQSVEv35tF8ZZ3tWjN4tJqvBuM47Szz
xfFXu3n8HzhnIlJ3kOtVEouFwXPHqd48PWE2oe0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWFya3VzLm1heWVyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUOhY3qGryWd+4u9EfO2uy5VJR
TegwDQYJKoZIhvcNAQELBQADggIBAEYNARwWmBV6+jK7b4Ni6bK4HJYmv+j6oCRxBij6iDZaGi7t
ViT+cW5+6CQx+JH/ZLneBeBBBir+/bPwSVWiGq8+0MY4qmp5/s0OwW6HOlQInfUkRP2rmPXcxXAQ
csa3zZV3BpulKUy5m1xQ0aBPMYOPYM8j8xLjDTGPNLIzcdulWKp1Z3Vkch47t6i+F85X7BNLXStL
QYiiBWWfeVBdnN0lQY4qZzOr/cVzt9ckbbg/MeLn8XLKp6XqDXq4/Wm9zjciCCI6aD3sBhseuHGT
AE53XLDow8sjpLzbuDNuEfWRdMQ2HJ+jV4NdR4ziLEhhffacZ3jyjOXrJukxgRAi7o2ExYBZXGgC
eAbzLptOlSQ2n612ee5XzEcokgO0dJYH2Rw7IJi2C4EkTgAv9tgM5AdNumGesD9Ey9e9wdifHym/
99EUGUsRG6XRN8blWs2TULS+EYIKeZ07ymNC4ORz7WOgbYO0qfoXPmof4PE2ufbdvWtaczaV45Oi
WAsoCFjYD5lF9atG2EbUCp+4//SxcuCE98DJWnEQqywur73mdf6hbrOftTBHjup5FjTqqzRI9Lwc
2+6v81FYpZqF4j1yLmnl4mucGv50e0CCBk3oU9qKyrhe9gS+eeOwqXXfJqpHhHS0qxvIQe6crT5C
P5+fkA6kPvUERR9U3F/kaj2PE9t4MYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMGoBpiBwWw4nLX59TMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCDg4aez
iofNpzGzZ2iSnBjg/reQoUEZ1vao3PpKrI+gCTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMjYxOTI2MjdaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCp/jPvrRlKZukUGZ5I+EHWNHPRFibKi9Tq5Tzkxl9F
eVPVYhWnvFSYSv/K/E18LDHx0ZFMXCFPRbsyqdNScjm/4g23NC0dOEvkBBN9XOECtiO5lAOkFOX6
2mAinxRHVGG9CFJrHmg/glG8fiOaCy7q485wMqhk18K+z+VALxutVTxdNmk8ReqookkB8VENbVVb
JfjAVIezFvwP7cfWsOSoiQh7PDBjv0kOy0vEaZQf8hr+Q0BfF8FcL45XS1REL5TgIEArG1hRlpmA
VDiY5Z3vAIDDTx8927c6Icpwe+EqWt1WTYqngc8ltaKhCpw252h7pc7HTPSKIL+pSAlQ4pQT
--0000000000006405fe065ec34e95--

--===============7940420177439307166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7940420177439307166==--
