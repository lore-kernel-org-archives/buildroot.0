Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB641606A681
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 06:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AjcC2r9v;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hBfLIE6Q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F10C80E3A;
	Tue, 24 Nov 2026 06:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acKCwuYjWFPd; Tue, 24 Nov 2026 06:12:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7913780F32
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795500772;
	b=NbylMmnmCqWXR0mviffHnR5ukbktZVYn9AHphSL3UmE5PtaqkGYD2niwsg1UIzPqSmDr
	 6PAgI9x3FoU+jYKlXYbtSE9Hcis1qslu3FohXEqYra8pdoqo6aghxmlDk2wPHtlzkrFdp
	 aMmY7fwNs4BMfJV7oyNY/bROctH2h2iuNpLCmlV/PN3Jf7TULTlh+7YmnlUmZDCqz8zTZ
	 aAilMZHg1JJ939ewdg/Txid0VYh2fxcooxshJM/96XATYlSuwvpzJN449DqOGwCG8j1EA
	 VGs7s3IkWowK2LLo1A17KHMISUGvkFjxQqJXoAKdnzgjXAWH/yh0p4ztKzKIbQARogA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795500772;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:Received:In-Reply-To:References:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Errors-To:Sender;
	bh=A1yNdXb5tmqUJV+kfqEbnN5i16fQ+ZRyeK6IDQxgtV8=;
	b=meIqe52pBXYl7MWBuejFMZgfuDK9cIqQ1nvxS3UpAoV2vFh3Vm3KkmORQe2OI9E7w4v1
	 58JcNoBWGa4/83T7fgxSWVQEkRtaOYt2PXJTg0+YDpFviX7yuR/GkXOqe5wmWttcD/cOP
	 i5n0vJ+Y3HAPrJsNqo3DTOO0FfgMi3D38m3vgYTm2fOf0v8z42b56yW3Ghtu+6A/b4Bzr
	 rNtV2rIInLzJFA99PcPviZXI/ZBmOoAMkqgPNXxMLy4WFuB+qTH1/mq5LY78C1ELhh0SW
	 31rgeNFx5l5SCvdsx9NwyB5BRSPC6DSjGbGTaTyVOMxZuSiwYrBBF3KAJWipS/uYQqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795500772;
	bh=A1yNdXb5tmqUJV+kfqEbnN5i16fQ+ZRyeK6IDQxgtV8=;
	h=In-Reply-To:References:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AjcC2r9vYGQm+M/xUcmUzNGdImYnym7JLA9cKNzbexWHkwWS6OL6SfCbFx/sMGguU
	 qDvPliMyLcHV/wkNfd7OY/4kjX347LRs/SmZQdxrmmxqCWkyUrxV1Fm5gyzg7PWp/q
	 0hQ3EaBXi8HfuIhRA3zgQZ/AaoZoHgPluvdVYNwAs9qk3FugeQVjBJSNe6GIk7drji
	 yo4PgOOm0kHgLQi6kwMIX905nV/3ph2pCgXnRD9t8CoV+rNOlnrDnEiZO0rtd4+mwx
	 4fYsfBI2+BhTi8WByvi9/+1mQQs/w4FKM4eePEzd84KjD0JBRqOI83/sm5+b7a7Yoi
	 vKwM44Tu1PzIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7913780F32;
	Tue, 24 Nov 2026 06:12:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 242B63A8
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 06:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16112400AB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 06:12:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFoKFXOE5EPE for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 06:12:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6431F40068
Authentication-Results: smtp2.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::102c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=hBfLIE6Q
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6431F40068
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 06:12:49 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-3ae7626d14aso1978669a91.2
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 22:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795500768; x=1796105568; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=I6l3PrKQruH2eUf5fsky23xCX/VNPmVvVYUQUU7gLeM=;
 b=hBfLIE6Qg7D32TmidKmw6Niu1arL4lHbuNoxS6nJiRPl7Yov6s4nqpygljPkLFh/G6
 qvUFLeI3ECEuASq9hg9ShQ0zR9mrGoHuTr9JsyXKKaCXa1seSPWWOh7Ms7Vn2brKDdvs
 1jS616ZxIPHyVTpcIzKkKmKgDhX7C5L6NeY+u5SCoIhY8XgNdslFwaF8+XObilsDb3tC
 9yids/ofg8Wvy4V6D3sFu6HCO4OKzotPB4WHno4Fh9lcqJ5Y9Ml+w5rn6HgB3t+3uO8H
 +ca8fvptZ4mv/sj/KbEcGYnrMQbr7A6igoxxEZKy5emTofm+pD57C11zl6PlaRuQVDjt
 5HRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795500768; x=1796105568;
 h=content-type:cc:to:subject:message-id:date:from:references
 :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=I6l3PrKQruH2eUf5fsky23xCX/VNPmVvVYUQUU7gLeM=;
 b=eBRw9sUzgV8KcrrawekcR1Iy75r2qoddEYIJWmcT7kpbCLoloFYE8rJ7meOm+N85Hm
 yQ6Bzm5xsetwoSEafLRoBtbl8tKDnpOcokwuBvxPGcBEsYjNkrp9tcz8dA69GpqBdrGV
 ou2ezlCI7nuoRE/qkHWkJBxNnJcIrGI48XYOZvvfy1Pw3wwSRlZ6SMcSlpwNLG3sxyFO
 LOXUv6pRvQrCg/sjkHyhZSF0pez//W/EB3h3YZB3WBZLIsSx++mtnJgfvY/vtxxGxXR7
 eslcp7wNAwfdbIyRZmYK00jukzaa0gMy74uCoEwO5Jvhst6PLEqFEAqZzl8T6jbw9/ph
 kktQ==
X-Gm-Message-State: APuU4Z+9n8QIQy60r51kwuoo4nzn64oSlXbKQcEX25ef53DowkTeNifJ
 /roZXyq9cYJctMeBxNuoQCusSqN6u/6Qnq6a5KAwKBjOurK43J//ei3Hm7Pin2Eqh+X86E5DWkq
 TBI++Wdms04mIIrYCPaUggeddLDAMiWvO99RY
X-Gm-Gg: AZFdTZcxdgX+AK2ZFQdo9ejSjGelDT0hV6abmHFyeGPHl1xfYtQRRMzIC4BVTMkBuEz
 0U3eARcwG7j9iOIDXy5FhbusEQnosNrA5ahqNHq8RHQ6m0NWYZpzzguAJJRcpDD9mGy68DfsR5/
 q6epHG7r7wZXUYfNzBzeoMsFUxspuh9PvsxhcNzra+CD5y8IpP5NqS6SBxhTG2JCskCB2ieVu5L
 fMeKdWqce6K3qvNI9rvfZMJhZbB4ESaIL+72Us5a92AklURgqaVIsbwW5ZFJxJ11r54+HPPlUVq
 VWv5amlN6scQo29FL3UGav9xpW1+GCDlAZezmnJXAVIop6ji33gy51jFeQkSWCWcLTUKdVSpGFh
 v5Xp/jZswkeerj1NHhh2GYEeJW/nmE4A3Y4lUb04BEaOFRwqvcjhkVZl9B6IEfgFE+vKTOC6bIF
 4RSn3YWAvC5Zccnnt+Di9NZDfqhtQ=
X-Received: by 2002:a17:90b:2fcd:b0:3ac:9176:e82b with SMTP id
 98e67ed59e1d1-3b41c95a18amr12852339a91.54.1795500768450; Mon, 23 Nov 2026
 22:12:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received: by 2002:a05:6a11:d504:b0:77d:f2b0:cae7 with HTTP; Mon, 23 Nov 2026
 22:12:47 -0800 (PST)
In-Reply-To: <20261123174622.1851843-4-giulio.benetti@benettiengineering.com>
References: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
 <20261123174622.1851843-4-giulio.benetti@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 24 Nov 2026 07:12:47 +0100
X-Gm-Features: Aa3M54pc-LDB81WI9rKwrfP9QdUeSA8t8-_QXLmDyeRI2IB39yOtU5thKMxbC5Y
Message-ID: <CAB1t1CxXpCa1vLFvBHDtNpyZiNz2eWTUjGeWfdDd=x2SX8omXw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH/next 4/4] package/nfs-utils: bump to version
 3.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7367813279404912931=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7367813279404912931==
Content-Type: multipart/alternative; boundary="0000000000007f5ec90660ff995f"

--0000000000007f5ec90660ff995f
Content-Type: text/plain; charset="UTF-8"

Hi Giulio,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

--0000000000007f5ec90660ff995f
Content-Type: text/html; charset="UTF-8"

<div>Hi Giulio,</div><div><br></div><div>Reviewed-by: Petr Vorel &lt;<a href="mailto:petr.vorel@gmail.com">petr.vorel@gmail.com</a>&gt;</div><div><br></div><div>Kind regards,</div><div>Petr</div>

--0000000000007f5ec90660ff995f--

--===============7367813279404912931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7367813279404912931==--
