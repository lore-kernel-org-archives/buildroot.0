Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD71606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DtSEc/S6
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB1BA60A79;
	Fri,  6 Nov 2026 16:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbOrRD5RB8wk; Fri,  6 Nov 2026 16:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0C10860A52
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981398;
	b=MCk5bu8qSHsfBoOXj/RfhtjSUq/E8zLDNTDpUXCP0HFjh40Z+/lLHFCuJmY4pCmjlz9d
	 OxSLKBtrSLZkQlWE5tq8GCv/5vMioY0wUatGw/Q/eSBUKJQSrfomf9CDzb01uF/6Vo238
	 VfQeBxSaMZEPn80ezTXhHUwGwzjOPqotIONiy7I3ECAM4adQOLoBAKKY+PgRWYKe06K8e
	 LJsMtGbGki9qhMdFegjnl0riSvJrqbkzLC0A40NtXKKbt3MNMXwrcY0eiBUvmlJXhAiJe
	 QLZ2IEwdtwClWxYe4qk8xIkWb8fwaC6zEpN7/0Lf6E1QzXu6fbt/TD+KESZ4p3fvY5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981398;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ao1MWYFZBuFtisqT7N0eaxqtukqQ275aBxUScrCpMc4=;
	b=PMIQ/aIm5SUKE5brCMEELDhFhKVEsVmXyEdAdvPqg65gPcwY9/MeWk9cArfRFXaH7gqI
	 tsO43qDXrWz9IJrLii4CG7LR3Brjvi21V97BoTk9RFtJrXFSeQpNuidpovk+P/o+Ne7pR
	 fBfMCm5JbaMOQKCY8A2ywO2zqsLAVlhls+3rHsvdypbRjAxX4DElRn4fz4DAnJkh/+ois
	 cU2p23IS8kDqEI6cGJtfn92hpIQI39LSXuUeanjs5I+pNdzSEoMng0W0UkDpg6UFsVLWL
	 GXo1RRnxLzyGY8QDk7GmbOIy9XpMhfi3zdzVRFk9mbXGfZ6NDKfV0AQsgoLvp/TjIRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981398;
	bh=ao1MWYFZBuFtisqT7N0eaxqtukqQ275aBxUScrCpMc4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DtSEc/S6cj+p8kmJNLREqHCcot24VyUaNMKINvRlj2prPlPzEvJ42o3l/MsPoihk2
	 er6cT6IPV358xF2I7S6bxhQblnUEkB/8E0AHb8EWXKknaDdxvW78nqEaoovfAXgpaZ
	 BqMkYNSr1Z5JlmMhQmrpET8cURWgc5ppj7EnQ081pTgDjSpzQwSdPK4M9i/pFpHhI7
	 zIQ+HOitDk4Cw7t5JqucWhV5oHc3tpImRbRrpfN6W206tpTjvD8TEwk7tn/78pa9F9
	 fEz+oZL1MKLbdIvpJghs0Sdq9IgYde4iHmBpkgoY/SjbkIrFRE19OROpImwHGQM63N
	 ksiReeaZ3eHgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C10860A52;
	Fri,  6 Nov 2026 16:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 661D14B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8A9403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcjewEv9HhOv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7B6B6400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B6B6400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so7107995e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981375; x=1794586175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wqEgA+uE7qUjTPvjMI4KpCdhS8XwNi0C6AUrXH3K3Ns=;
 b=Ezv4uJpHVfEqKrV6OTGPiNdaTJy8FHNpGcYqYGvcyZe+hjpm46fA75uLU94qGM10YL
 Mb5v9NppYSoaOf0F/WTsVVLcIhq05MmIvZozeU/MELfDOB63ymGK4A6RZsHpr77xaiAf
 4LlK7m0y4BeFvII79wxBtOdQLA6jcvSjZXfYy5oTvbwdt3yQ+g4DF81L5+ij0dZy9Qm4
 OZBYCgyYxdDcZPYn1GJbGnrnCg8UnFlpqoOeRya96s4dI7iWEYMC525Tr3VXbfYjxPJJ
 rI2ZnnMLiZTbhw0soCmFBkU2Prg/KG/EehNIGOXcQ8kiOwA0BEAXfbm7F19gPc19F1Kj
 ggew==
X-Gm-Message-State: APuU4Z8Try+/lIYxSoxFthD+KE9KC3AcbtdDEnPgLCSSD8zsxvHOlUXx
 IC2Yup91Qf7B2Yp5gBTWYeCak+dgwCHeM83OqOLVniCEaHNgzl/0YNz6i89NWNAmebbzpVHhsvd
 pSf9tr6Y=
X-Gm-Gg: AYBFou0s2gZ4p0VruF2NHYE3Y5wTrvaOFJUFccYmQr2++kxcjBBpomO1HTOqDb0GkEF
 JKTLLvpfnzObhZVZPETx1aUPzgEAUe/6QsphbjXREkQoZ3rrCDeYN0Xvm4dHI1FcPqlgXwAejDb
 0Sk2XtuWJMK8gFRCaH/s64fvBY6BLYFslhJE0xCpNe1t7MrGPEQYXnidIxZ+4Q++pPBvKaq6ZKy
 TyE68Gl70F7VCh+3dKijixToJ/sKBJDVwYtn6TgRmHcXJV26U1UsaKrY//5H60sCmmBRK7npNcx
 FYyzV/8abeb32yFkLO46t7fg/is+TDqRI1NKgqNGUJ30v+f3O84+Fo0xQJAQI2BdkW/L1K8R2w1
 IpNQzufB3wsc5e75WoCz1yq/mYPFtuahQsztAbUwQzVasLoOwpliIaQivzCCLbNlzTzUogH5eeL
 pPrLDGS1+QCobL1Auu7+zFP/+6iPhs2KIdziR6gGfeT4dYt7H3TDIe/DpuUCWM6ttDPXFtQM9DT
 OWnDUYmPaeSzzdO/TzvU63WEzazJWK5j54U1o37kSjxrpxRj3W12ytitRQ9JLtNXk2W5ZqpIkSG
 PDsKBIuuHGV8OF2D0BBtaIS0/H2D4D0=
X-Received: by 2002:a05:600c:871b:b0:4a1:e57b:667c with SMTP id
 5b1f17b1804b1-4b6df5e87f8mr49174785e9.26.1793981375121; 
 Fri, 06 Nov 2026 08:09:35 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b573366ea6sm154657485e9.14.2026.11.06.08.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:34 -0800 (PST)
To: buildroot@buildroot.org,
	Markus Mayer <markus.mayer@broadcom.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:32 +0100
Message-ID: <20261106160933.607220-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026192351.224135-1-markus.mayer@broadcom.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] .mailmap: create a mapping for my original
 BRCM email address
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Map my classic Broadcom email address from older commits to the new
> standard format. (The old address now bounces.)
> 
> With the mapping, Git will show the new email address in the "Author"
> field of old commits, unless --no-mailmap is given. Signed-off and other
> footers do not change.
> 
> Using .mailmap is a first for Buildroot, however it was introduced into
> the Linux kernel in back 2007 and is a standard Git feature.
> 
> Signed-off-by: Markus Mayer <markus.mayer@broadcom.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>  create mode 100644 .mailmap
> 
> diff --git a/.mailmap b/.mailmap
> new file mode 100644
> index 000000000000..bda50ce6c619
> --- /dev/null
> +++ b/.mailmap
> @@ -0,0 +1 @@
> +Markus Mayer <markus.mayer@broadcom.com> <mmayer@broadcom.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
