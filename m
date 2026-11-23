Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79309606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FGs84r6X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojAi69M3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C3C40730;
	Mon, 23 Nov 2026 21:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4AQuiU9rSRiC; Mon, 23 Nov 2026 21:02:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8EEED40728
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795467759;
	b=tPEN/xB3jJYdVSKGI8iryqfa+NJl29vtE/1m7CAHvlVcap7lryW0e8eQpvcWcE6+mref
	 SOyYLA4jk/RECfEQdENZQpjsvMXd9rpCX4gDHZF+xOY6X4uku6maqCce0GNSEHFU8KRvp
	 A4sb8VpFYwL0zECoKohCYD+s71BCTMvZX8+MR+zfls/Ejg/VRxA9xW8LIvlKz7SRJ8lxi
	 HidGyZTseQFs2de3awnvsXCGPSsejCHTcbf+ksi8ED4XaRNYKE1neHyuFz657WZ0oKHOZ
	 q1mQdtSMqslICs1Ke5E7hv29MtD2qQocbURJBPbu4YO67tHx2O8d+wbnBWgO7l4RGxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467759;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Y06WkWAmSalb5yb7uQIj2g67FrzZjSQwXsy3RM88HDw=;
	b=YxNFOqQeDV3GZSZY3ZTXBHEwynXE6lgXGtlsK3ng5P+WESJ/NPg2r+CdDLbxf5CVgjRz
	 /ab2KH3i4grNMZ+c5c0ktK3J2c7cDnzuReuxoL6FQrashJnLhYlbo5565cQ3eAjPyZTjX
	 24Dxy3Ie4CUGp8WzvxJLoaJ+c6hLQQEq2wDQvgpPSDniJHTbHqXlGCE3SR7tmvhdstto5
	 CQp6qWYdjtLRiE4B9l8YcUgjhfaRWVfaS0NMtIqK8kjvxNDvtwlcDzHJpRPTAyC2155aK
	 rzUjhF4s6nquxodTi2JEd/KEs2b89a1utm5FMJrG0fma1uw81PsJvZFzYOadFihBcUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795467759;
	bh=Y06WkWAmSalb5yb7uQIj2g67FrzZjSQwXsy3RM88HDw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGs84r6XZP/1Dh5y0PmZstHxAYQwJgkrLXKh+mTtwnpg4/2Ays3qOhxHMlkgW0Vxd
	 GKjY9HK+0+v4dqJsT5oZhiX4fKndNtJWUQvpzeZAvRiImsoZEHX+GyUeMrC7tVc5Bz
	 2GQ7+KbLAM9byW/EwBNzzRmVzx6iODEgFS4szqH0YUglsbId3Q9G8LKXUjnJE5vgPB
	 YUHXQXpLckgj2FR19k9yZtmhiVttijcZUWU/OjWKN+4auR4wKQQJkSl4+SpAmt04Ws
	 Gw/FmQ77eooobkNun+w06A3cTETTDVHx+LdovB0gwChJE75nR7gMzGN2/Z+W32rYaS
	 G4hOmIaFO9KeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EEED40728;
	Mon, 23 Nov 2026 21:02:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC6C6371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEA5440081
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zBOSkIWyS6S for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9137E40024
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=ojAi69M3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9137E40024
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:02:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4bb70074ab2so40115495e9.0
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795467754; x=1796072554; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PKyASWIh6C8KdvviOHKpkvorBs2MVMvN82mc+t80vdk=;
 b=ojAi69M3PP25TSDsYF9GnouICrTzt/vNZT0c4IHRyBF5go0TJHsFI8Q6md3SHuVT0R
 jPc/wuPw79WX/rIe65AN2vr0zYSGZUc4hWoP7G/FJxuaKQpbtkn6Gux3fEszs5KeXPV/
 NqXh2pRU8NXJJ9LU+suRGuf11n5wNFR+MuHml3yKhNRijJv5uFf0IMaVTstsnGLeoNo9
 qbdz+Z+p3eeczvh8tbBawFrXu1tx+wqNNyx013vDGegIBhve2MdRkBFAFAQUaRiVU59O
 a55H2BUOxHN3e2s/NrRUvjZCucOuEexlokSCTG6i26yw0Y6711KEvaonP4FziX4Kz94Q
 jt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795467754; x=1796072554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PKyASWIh6C8KdvviOHKpkvorBs2MVMvN82mc+t80vdk=;
 b=q37hbJWQadop2KioWq7lVmQKvM6yhOvYfps6ZqjWSC2dJ/g2br3HMAa0pFKm6tUYV4
 E0SIwR/b5/TQuLb2J6sPjC2z92usXuLxYkSVLXADVQQtFg2pubWNl2ESk8RU59GmO0yL
 1jLnjVO86SHnYcgGRhLBPruhvykf3KcDEvCWUoq6TvPOls4Sm/87Q4VdutAgM7gxg4ZU
 lfnhiA+IBcwJLYMAQhowVzA7mD4D4ImkwcGysufaMj0Hzo1EjRiVP18d2bcclqmZOj4b
 VCMYFVqjCIm6MN85hGnBt3Gh978NqFTKKBZ7GKGVnP6ebiX/J75HK358/I7Nz9l1eJ5z
 sm3g==
X-Gm-Message-State: APuU4Z99yko9Vjhz8hfjJSaQHrIseCnEZ6YwSoNaQ+g0z0vfSt8eloQ4
 sibo+v5J2T3IoffRcOfJsDCzoYt6Rr3MSKxylzuUikB6i8RkiwwQbeIojnfpl0BD
X-Gm-Gg: AZFdTZf8ng9tdibhi6ygmnXFt72ytJI2WXJnLtlIGFOQx5mmY12jKZ2Pd6GG8D3xfYY
 SUNjzTtIpICpMRN2PjSuftcsl4ptW3NY3SbKezsPAOohSTA40m2/d0psfQvYukUIeId6B+Tuc7x
 zgxtuxGvJHceTrqurrvwOnDLXcXZNKKyoDQBA4LOwCS3hUttnRO5kWnZwKig1f82jcWD7pyX2A2
 mVAiAToS6hQa9B/jpl8UhYyy18U+9lE7vIqQ+FI3RKaVayzlNa0mxx9BGjopMk91Ek1GJUSFx4v
 IjAtKfscbSb7TSBcQtrRuVTuUrnjWZ18KUnh/6I3EYuafTd/yYVflnF1dOAZmAkwyV/UbC4Yzdo
 nMCkekn44nQRZbWPta3zPJpAGa1NhR7otje3xEMvknkVgN5C8f1IN1w3Vm9G23dS4vzRdCA3o4M
 g1zbxyVuIvwAk9nrpBAI8Cnlqi6i5AYKYEsbeSLaJTNfsSNSscsWXmxtXOhQZg5SxAqzVb5slRN
 D6NLnEY0ZL4XECtLWNMho2AC+E8+rVlzrXjwN/tnPlBMDcz3xfHm2DVI1NJ20PMZ7iTrnAnFVkF
 875odnivEIeJbFHY8rCfxkeDufx/tJG/LUaU4CqPZejlNkSH/lE=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id
 5b1f17b1804b1-4bb888236a3mr265202425e9.24.1795467753946; 
 Mon, 23 Nov 2026 13:02:33 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm379035235e9.7.2026.11.23.13.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 13:02:33 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Simon Ruepp <ruepp.simon@mailbox.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Nov 2026 22:02:32 +0100
Message-ID: <20261123210232.3715643-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240724085442.134872-1-ruepp.simon@mailbox.org>
References: <20240724085442.134872-1-ruepp.simon@mailbox.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/qt5/qt53d: fix compilation error
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Simon,

On 24/07/24 10:54, Simon Ruepp wrote:
> Compiling the qt53d package currently fails since the required
> source files of the assimp library are missing.

I think this patch can be dropped. The build failure was fixed another
way: qt53d now always builds without assimp support, in 11e380fb03
("package/qt5/qt53d: always disable assimp support"), after
bc1a1dfece and 79b13f6e67 found that neither Buildroot's assimp nor
the bundled one built.

With assimp disabled, the extra download is not used.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240724085442.134872-1-ruepp.simon@mailbox.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
