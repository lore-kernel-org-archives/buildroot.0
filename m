Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F21606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=re7IJtDt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D84180D9F;
	Thu, 22 Oct 2026 21:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTrKt6tgTc3E; Thu, 22 Oct 2026 21:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EBB6C8122A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792703587;
	b=haFCE+L2fy/Vu9HQZ2L6AMEvmXE91M6azH9hjTnp0al26LgMttSL/n5qLn/Al02kv71x
	 DHyNnLueC6DTOi3ADQbTajXgacjX22RbUZe22zMeISdBY6TpStQamq/cYh1S8MEfZFMXN
	 J+Li4H+XdKwU4CHXUUbkW95/cgrhj62YjQPGRNVbTynrNFyAOyz0V2/TFr1jM01w2Qwzk
	 WZL0MmQZ5lv+lk15xhKcBHa21fj85WyIwVqpXBlLPTMXPBkqzCuj3mJErEO/PCl6xrmID
	 JnN9+mKQz3wHNBemPInprUMm2J4dfquWJ0gD3940GyoiwpQo4XdIqD4XK4KB7dCYZIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792703587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Forwarded-Encrypted:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=T3mA0b/oSEY38HiO3riREWGE/w6Z+UT7aH/n3a1bKsE=;
	b=G3GYflrL3C6SSPYQJ7b5aC2u9drtYyrEllSglsJna3LCBK+TDRkwBtmOGMwuSq5mScmU
	 5uLopEgiaVp8n4XJqj3M6aUt6NV2gsGRPWMZ22xqwGGKgFG8C+bW8p/AaCyqeBBPAgXd9
	 irmGkXzTeY0+OKfK1OHKPikUHHuh/DJxoa19/S1csYbLsZf4uV3b0KNDekvkAUNMMLsbf
	 Wvj+bdZHPmr47+O7aySViKQV1V6kst7AXZc2PiA3evZM8QboEq1fstm6dG4lCKV8+CxhW
	 BfGcodMwtmNWktj2fK8dXkpAy6EpFWp9Do0mJ/K/0QVT9083H/RcwkYJ4gXtPSj/HMA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792703587;
	bh=T3mA0b/oSEY38HiO3riREWGE/w6Z+UT7aH/n3a1bKsE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=re7IJtDtJazb8k+dASx2H3DMJtK3j7tveJWIECUrKWsAN3y5PIlBgboVIZpP4PPCC
	 Ia23oMPe0u4HPy8k+a7VrpJrM7qZRafcP/QUTk0ygba6hhRz9YBH83FgC0NmB2U0eT
	 +4OzZ6Oz28VxyBjudO6R5rhVQOJ/pGQcHMDLA5ErbmocBNa2SKPJzmmum2Ni6CXtUP
	 Q63m2nLyQBZ2uWzMghK7OzKlSwbJXlICo3VJkQVXPPDVQrmvNcZHkNvam83R8wloLe
	 DSHSXdc2uuI1e2JMZVE4Yrhg9PTsNsP9fiGgdzl/M8pIzvsO9glddeXZqTwoc4KsQ2
	 g+8pFQxgYwnOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB6C8122A;
	Thu, 22 Oct 2026 21:13:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A3C4BC
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69579401DE
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UjXPxQXp8HrL for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:13:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E28F401D0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792703584;
 b=AvNouTw6Z0Re7PnjG+YhTg/MppkQ/IGsERCRx7r7OP2rW7QUAdIXYD7p00vuIkVWtWrr
 jcwMA3RqGdasoXVlVS9TfEQ6RLHT0xOamV9jTGHOBEPbRQRFb8O35mbPb6jgD3MJj2Dnb
 /r42N0czrSNeCxdxtN+5vjiCV1DKxXZOvgBi7kCFLw8j1i6tkRRo8E915SVc12DRgYcD+
 1lPoCc4U4S0xYBqFzOkCK8dw5I4zLPP0UkjE7RSB4ktAuJJtyD9H/MiMXHeGNsQrpJXsJ
 nlhVVJAjG4c1n5wGVXE7/z5yebAi6qZrXmiF0z+ppTi6VGutfegpno/XXGva17s4A1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792703584;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
 Subject:To:Cc:Content-Type;
 bh=Yb3Gp8Haf8YlyRoXQRnaUTD+wo6JZLWUMXym9BNAQb8=;
 b=SjE36osYj7Klt0nd/wwH4Q7bBSVUpmicMiHaeN3YGNE/8MUcW9e/ULBPEChlQnu9HTgo
 52nGYK9tCvL+JllfqZxNdPTDBjR1f9MfFuXvSl3aSdNjPXRB2i92q81TLXPmSFqWNLp/j
 8nxeiH9WWmAm2HU42VnZ7aE6iMb679w6W2KfCAmWML5j2v6utzhSyKiIjPScy8ZFiXOIP
 RG1QbZlyYjvSCu/yifgjkhy7ROx3vOW/K4OGJqdjPcwKW540SeijxyzSCmdG7CPxzZyef
 OhFBCq1tGYYnMOGHhurGETy7UWLDXzjuD4c1BXd2eDEe20FZZTNgQcBQNmUfXKDAAbw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=devoogdt.com;
 arc=none smtp.remote-ip=209.85.160.179
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.179;
 helo=mail-qt1-f179.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E28F401D0
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:13:03 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-533797e72e8so1225001cf.2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792703582; x=1793308382;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Yb3Gp8Haf8YlyRoXQRnaUTD+wo6JZLWUMXym9BNAQb8=;
 b=WCBPWJztIjQb06YOxjfGJglgUzFulrA9i2Tknnz9QPDkzBMib2DeY+UXU3eiH8jWmn
 1r6jdS4xpXbNJP77vliDI5hWR999MHezvcvSTv+ghxjRJTX7sr9LfztZonrS+PICnFKY
 /GAhd63tST1yEDTwgdgI9ZBimEBVvAuvDwhSAptLZC+jZvcK3JzAFZDjSTuNFS6Dksjs
 k+mi6rqK5XWoNzCjvU9kfdiaZx0iSLujCO5U6kHe7XAcbvGV5BCy87t/tu9OGwfDdjZg
 2KHq33o5e/+8EcJWAqb4MB2/x5kOxwjHPLiZTatjyHVtoEfSpb9LyPfZNaDgdO6yzYnz
 nayQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBymGje6UqpYdQgE+pu7EWFZGRiWkA/iLD/ER6W+u2hPcJp7twoXDxnEJeM4OJCd87PDcKDhqYcyC0I=@buildroot.org
X-Gm-Message-State: AFq9FYKOoh3FeV30OpQC/uckvdf63i2SyCXclRjfdM/+lMFB1gB6Bbx9
 inD9kcWPFmGBU8R+L4kIbQnNWEoUepR+zsLb8j5xXTTIRZQt5cYIZzm1dj5gKA==
X-Gm-Gg: AYBFou1hVgh/osq/9OKTLKriXgP2SY4eQRSZ1cmC97cXV/R++RlM5yqqkrohI5owUyK
 +/K0Ce9RgsScXhPvjO4Nc7vIU041PW/XTpMK3lDEd28CyY3+1sTqwMlmSM15KBsvJ9xEkrkyfyf
 3sHGjlaZvweMtg49VmN3s9+kjCci/CkvaxbI63ji4YRfM/1Z5GxkPmCIV4qDZm5DErN49pTR/WQ
 +fqYYqdrbfjj8PQFCXR53fStx3iVHwJPLrEXW8TlB1L5ALBhkrh+L1Of2iFKH6UE2r8fwXmb+H5
 3gHnKkNSyWNlfJhu4rqsRwTKQWwTL13x8w7owz/d77ISq0mWBMCmB5DU+QTbXY6qLd0X2FXRQFn
 IjjhftCRrbPHWMGPXauNDhzGlECY/sidUNZAd1ceSGqOpKGVHdqWFbYtokjCJw5a5D2el3+be+b
 fVsDTMsEkvZUl12JOcaGKe/c1zs+nGCMZhSyvQrxPkrxSVQMyxDjjVwzde+TQ9y2hmLqeP9gldx
 KUmxsQsFZXv71eRZqPFn+X1L6qSfm3Zzk2jdnvwKheqPq79rYXxIpLtBEwIUgHONFyP7iMvTukh
 Zzqa8TMXwCqiBlUzSJ/wn1smK/0BaoWlKFhtxdaJ24HEDI3lAE24lzgRnYCuWeckmHL6lAclkRR
 ppPn5yFYKL3uWVFMGPiZ5oY+Z8XhQ9gi4LVwVieQQvoGdRPUhGx0Z6qH2ac4=
X-Received: by 2002:a05:622a:90e:b0:536:61d4:cc6a with SMTP id
 d75a77b69052e-536c2714c7emr1951211cf.72.1792703582226; 
 Thu, 22 Oct 2026 14:13:02 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536c167dc29sm2554591cf.3.2026.10.22.14.13.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2026 14:13:01 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-93cbc3ab2fdso10757885a.3
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 14:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBz0Q1t+3F+Lf9swdW6bL6kE4F6SeFRFy+nRR63n10QcHtlOhDCZ78iaOMOrlNjmuFeYr/kq4bn7ctc=@buildroot.org
X-Received: by 2002:a05:620a:1990:b0:93f:237c:1019 with SMTP id
 af79cd13be357-93f6f9dd833mr124605085a.62.1792703581048; Thu, 22 Oct 2026
 14:13:01 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022164212.615-1-a.mestdagh3@gmail.com>
 <atp5h3LsaVTlBV7z@windsurf>
In-Reply-To: <atp5h3LsaVTlBV7z@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Thu, 22 Oct 2026 23:12:49 +0200
X-Gmail-Original-Message-ID: <CACXRmJgcK7muMCy4CDejE8ZiZ3z==C5j9oP0doqcLQK=J53xDw@mail.gmail.com>
X-Gm-Features: AclHuK-EiMMt7DB4LDupkZjcY-cncSULFjRXCVAIeHUS1TQoyE6fESu4msoyI8A
Message-ID: <CACXRmJgcK7muMCy4CDejE8ZiZ3z==C5j9oP0doqcLQK=J53xDw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Aaron Mestdagh <a.mestdagh3@gmail.com>, 
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>,
 Thomas Devoogdt <thomas@devoogdt.com>, Aaron <aaron.mestdagh@barco.com>
Subject: Re: [Buildroot] [PATCH 4/4] package/fluent-bit: bump fluent-bit to
 5.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5088442795452596127=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5088442795452596127==
Content-Type: multipart/alternative; boundary="00000000000022dbb2065e745495"

--00000000000022dbb2065e745495
Content-Type: text/plain; charset="UTF-8"

Hi Thomas, Aaron,

Op do 22 okt 2026, 23:04 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello,
>
> Thanks for your patch. However, why is this PATCH 4/4 ? I haven't not
> seen your PATCH 1/4, 2/4 and 3/4. Is this a mistake or was there a
> technical issue (perhaps on our side)?
>

This patch continues on this: series
https://patchwork.buildroot.org/project/buildroot/list/?series=88
Is it possible to handle those too?



> On Thu, Oct 22, 2026 at 06:42:12PM +0200, Aaron Mestdagh wrote:
> > From: Aaron <aaron.mestdagh@barco.com>
>
> Could you please fix your Git setup so that your full name is first
> name + last name ?
>
> > Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion
> > and improved OpenTelemetry processing.
> >
> > The 5.x releases also add Google Cloud Storage output, Windows Event
> > Tracing input, NVIDIA GPU metrics, and new metrics processors, alongside
> > FIPS, TLS, and proxy improvements.
>
> Did you run this update through ./utils/test-pkg ?
>
> > Signed-off-by: Aaron <aaron.mestdagh@barco.com>
>
> Your Git setup should also make sure this uses first name + last name.
>
> > diff --git
> a/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
> b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
> > new file mode 100644
> > index 0000000000..c98bce88a9
> > --- /dev/null
> > +++ b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch
> > @@ -0,0 +1,18 @@
> > +From: Buildroot package compatibility
> > +Subject: [PATCH] ripser: initialize temporary diameter entry
> > +Upstream: https://github.com/Ripser/ripser
> > +
> > +GCC 6 does not accept the implicit default construction of
> > +diameter_entry_t. The temporary is assigned before it is used, so
> initialize
> > +it with Ripser's existing invalid-index sentinel.
> > +
> > +Upstream-Status: Pending (
> https://github.com/fluent/fluent-bit/pull/12533)
> > +
> > +Signed-off-by: Aaron <aaron.mestdagh@barco.com>
>
> This patch looks very odd. Could you please generate your patch with
> git format-patch? Or now that it has been merged, just take
>
> https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167.patch
> ?
>
> Use an Upstream: tag pointing to the upstream commit, i.e
>
> https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7ded167
> .
>
> Could you send a v2 after addressing those comments?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Kr,

Thomas Devoogdt

>
>

--00000000000022dbb2065e745495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Thomas, Aaron,=C2=A0<br><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op do 22 =
okt 2026, 23:04 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petaz=
zoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hello,<br>
<br>
Thanks for your patch. However, why is this PATCH 4/4 ? I haven&#39;t not<b=
r>
seen your PATCH 1/4, 2/4 and 3/4. Is this a mistake or was there a<br>
technical issue (perhaps on our side)?<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">This patch continues on this: series=
=C2=A0<a href=3D"https://patchwork.buildroot.org/project/buildroot/list/?se=
ries=3D88">https://patchwork.buildroot.org/project/buildroot/list/?series=
=3D88</a></div><div dir=3D"auto">Is it possible to handle those too?=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
On Thu, Oct 22, 2026 at 06:42:12PM +0200, Aaron Mestdagh wrote:<br>
&gt; From: Aaron &lt;<a href=3D"mailto:aaron.mestdagh@barco.com" target=3D"=
_blank" rel=3D"noreferrer">aaron.mestdagh@barco.com</a>&gt;<br>
<br>
Could you please fix your Git setup so that your full name is first<br>
name + last name ?<br>
<br>
&gt; Upgrade from 4.2.0 to 5.1.2, bringing multi-worker network ingestion<b=
r>
&gt; and improved OpenTelemetry processing.<br>
&gt; <br>
&gt; The 5.x releases also add Google Cloud Storage output, Windows Event<b=
r>
&gt; Tracing input, NVIDIA GPU metrics, and new metrics processors, alongsi=
de<br>
&gt; FIPS, TLS, and proxy improvements.<br>
<br>
Did you run this update through ./utils/test-pkg ?<br>
<br>
&gt; Signed-off-by: Aaron &lt;<a href=3D"mailto:aaron.mestdagh@barco.com" t=
arget=3D"_blank" rel=3D"noreferrer">aaron.mestdagh@barco.com</a>&gt;<br>
<br>
Your Git setup should also make sure this uses first name + last name.<br>
<br>
&gt; diff --git a/package/fluent-bit/0001-ripser-initialize-temporary-entry=
.patch b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 0000000000..c98bce88a9<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/fluent-bit/0001-ripser-initialize-temporary-entry.patch<=
br>
&gt; @@ -0,0 +1,18 @@<br>
&gt; +From: Buildroot package compatibility<br>
&gt; +Subject: [PATCH] ripser: initialize temporary diameter entry<br>
&gt; +Upstream: <a href=3D"https://github.com/Ripser/ripser" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://github.com/Ripser/ripser</a><br>
&gt; +<br>
&gt; +GCC 6 does not accept the implicit default construction of<br>
&gt; +diameter_entry_t. The temporary is assigned before it is used, so ini=
tialize<br>
&gt; +it with Ripser&#39;s existing invalid-index sentinel.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending (<a href=3D"https://github.com/fluent/fluent=
-bit/pull/12533" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/fluent/fluent-bit/pull/12533</a>)<br>
&gt; +<br>
&gt; +Signed-off-by: Aaron &lt;<a href=3D"mailto:aaron.mestdagh@barco.com" =
target=3D"_blank" rel=3D"noreferrer">aaron.mestdagh@barco.com</a>&gt;<br>
<br>
This patch looks very odd. Could you please generate your patch with<br>
git format-patch? Or now that it has been merged, just take<br>
<a href=3D"https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81=
d28d7c08128fd7ded167.patch" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c0812=
8fd7ded167.patch</a> ?<br>
<br>
Use an Upstream: tag pointing to the upstream commit, i.e<br>
<a href=3D"https://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81=
d28d7c08128fd7ded167" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/fluent/fluent-bit/commit/56df8d278c927b2e7b81d28d7c08128fd7de=
d167</a>.<br>
<br>
Could you send a v2 after addressing those comments?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Kr,=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thomas Devoogdt=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_=
quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--00000000000022dbb2065e745495--

--===============5088442795452596127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5088442795452596127==--
