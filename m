Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6AE606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kktyP/Rz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFCCA403E1;
	Wed,  4 Nov 2026 14:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_rOqCmwRiW7; Wed,  4 Nov 2026 14:35:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9D953403F1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793802914;
	b=R8kcdR5jhSq874zlJ/lgQ7zSPgpcJJ9vU+F0LJJrMv0W4otg7x830SHO7FbHfc19OTuJ
	 h2LF8k2AVjdkjYZ3D0gDuJK9ilPi02EcEnlhXw+CO5rgHrjA2xwtZoKSamRD9Qa+zQDz4
	 KXiIKHZmFe28ZenxayXDdLhl0Dv7FkjHeJmmc97pY+T8ZEMpmuz0dtDVBSJ/V9p/3csq8
	 efxDfLj585ESzdNqcCMaIJyedr6FARV9w7qFas2EDPYVzSJKlMhpLOR+fmfrnPg5UVCdT
	 X5RA05WDWvdjIDfs89BlWAiVuEPL3+JBkE1ygrQvYMVDuebnh2vdEbZ/f6LqpgrOZmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793802914;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oDM/9eh7y5X1esjE7+cxnT5nCi3qYO5TacnwtM9mRlw=;
	b=KUuOl/Tyx+mG/SkM0I2i7v25VOGq/iwD15HQIhz38wpFEFGJwW3uQP5cYYujOJvecclQ
	 zcnOYPvHwmdPwM6T+ggqZXtC0HlpV+hFHIXEPGrw1V1QUpbp1f+KXkUZd8W/hFS6gMB+Z
	 FQc9auU+m0Qrbh4lHR+py+8LooE1Btq3Zih3bCvsbBa7aGWBn2mOkWKvhb9Lr6cEpIgsm
	 XVod5Xl8UYwnRAqnQdVRmkRGEDKGKwSpWq/XPN4DN05MbZAkKkUGCF0hL+ilHFE2CUt8v
	 t4xwp5WLoV9+P4qVktEX2UyQ78zkvCAQnrFEQCxF9dxw5KOXurYx+HdSNTLR+Atsxkw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793802914;
	bh=oDM/9eh7y5X1esjE7+cxnT5nCi3qYO5TacnwtM9mRlw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kktyP/RzYSH/RpRm7fU+x/yaiHeRwmEz0PDM8ovkUzNreNHWRnZNRu1w0eBF8V+dO
	 29PcPUG+SdJJmN1Mzwu2D5QIl/i5s1d5Hso94ckHDvBKZ0bhPv73jOHOg+Pg40C5Sd
	 M5gs7Q1r7F68MyyoHL/PVZuTqpm/0rB0jQ8t4dGOC90G+0KHxh0egtfbAFfREzYEFC
	 Zm5T2cMzQP8lMhfVQwgTXDiyhBoAhIag80QmWcVymZrExWGN6ERSiIRfSH9qHzRfty
	 Xq0r7Mbu2WFFxf78PHvTZxjr7GZrWDV5PNFJUZFPCIWd76E5ydQAVHaYImABTEMp+r
	 hmwVmgJsJTNLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D953403F1;
	Wed,  4 Nov 2026 14:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C61C6341
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB6CF80CBC
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JOs08P7s3cGD for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 14:35:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80BBF80C41
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793802912;
 b=cFTV398kfFAjiJJWQDWU2si2agnFoB8yvUacJjW/AafAfXkwm/NReEufKvm8t0zPOnRp
 2rsR8ed5wpxwpEJWdj4m7sy1EcqXhHlwbw3FvccMnVDMbLruzAvufLrGGy+gOjxA6p7QH
 zxbliVpzx83O6fgnLYedawLsuZmrLKvGtaDTn1kjAktzja+Tj9Fpw0KI/cuQmOpGeDq4J
 1k9Tdbg0RM21+JQTSxNWKoGLCo2bBlM8VriJ0YGaSeYWmOlqlOffUESQ6yDGNXaV/nT6l
 slQmrHLJrqIaqKbRd+nVmrt+62KpoxuF99EJ2Yt86LyB5rxZ5ZEm7R7/M4lHD8o0Azg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793802912;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=5d1yTAzMZh0pJe8s9VA9iThNDteCAyi/xspsU2SSRzQ=;
 b=BrJ5RDNr19tbHMLxMOsz22oIpzkNs/dTagasRKuDW66eLgFGfzNDXW3f3gfZUpkEA/cv
 P/Y/d8IX8Cq2QNLiDfeB8UfoL8nrHa6Y4vhRy1aShfrCIohkWYmsnMZO6dxauKR3ErK17
 haWXgZwmGOAJ4RovIfYckaYxivzni1ulzaKDItLOPUsZI8TGLRuhE6Jrm2JuWAYsB0SL+
 sNMexLNEmroecUGW0slJd9vfZJSxZc6cEHq4TyR+fXjlUJbTj0pDBs1GETYpzBKMn+OK8
 uFXK0bXUziIjEG9l/F8jdzPn7aDvrcZBj4zC/Y9PqIDA/d+RmFiMPHr+eQS+1cGUARQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=IBWwSIoe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80BBF80C41
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 14:35:10 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6b1b13e09ffso1022556a12.3
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 06:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793802909; x=1794407709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5d1yTAzMZh0pJe8s9VA9iThNDteCAyi/xspsU2SSRzQ=;
 b=ODP3jb9oVp4p1qOjbAVbHjgthDO3CjLLo5QQGX0MHm2EnFodA5ygIdBmQ5k2JdPa+r
 fMdL68GvptmQXN9IneqLQO7Xq1PMez8Jf+chsZ3gY4MiKE4pDcPiRaghOCZTEfmCIdMS
 jisiHTyUBPgrmQENBkq0cU5uLpPE9nFrmeCDR1/rUpcfgSAiWrMXZDivtFet3grSK47I
 eh2Xy7WAlaJiG6s3TYqBfuzlJEX67KwAMSAPtR1OL1M9cJc0axbVaEFPRk/VoTsT5N50
 FixZWdS9P170QvUeSxbhd0onbR7Pki4wcjRZjxQBM26AwCkIDSWVBrybhg/MgorVjAby
 0lvw==
X-Forwarded-Encrypted: i=1;
 AKwUvBysSlK9ot2EYeKb2hQ61CMj7UXZsqzu2/t92y2XoMI7CP99s2900EVR//CE/AzUVH7/vPBHEy8Fhvc=@buildroot.org
X-Gm-Message-State: APuU4Z871AECwSTaaDVOguqxQx2O+cR9nx1BM2Rpsefi7NGGuNmfZtYT
 SEos6xps6Kagh7w3kuWs/zj6est8o+fwI7k8n3CZYV+oTFSO7qDR3R1CZ+GAkQmabVI=
X-Gm-Gg: AYBFou3+XVHubFpf1cAI7QE00FZTlmCLxTiouX0r0rC1LbDYeMX4UDuoSSUX9ifQawT
 HOXNdKoxhlgCmc3NvZrgNyI4Aio5WLyw8K7Myxrz9mZWjnHHzFgFEiMDcvqCh5GLnaA09tZfHU4
 CRTDRACRIGuMGqEWoIqJ47EMwlUpIy3zoODqzSAjoNrNkdc7ieX022C/MzBXXJwgUyIdyEMAsTH
 zEe3DClGYW0Go90xwRenRYhyn7wvcTyPGlGU2Ntn2AGUrp4nBwMjnRno5ezgAvG/aDVBOWlYRDx
 z1Yqmgs9sHMnLvsCMYhxJFG+Ma97id/D99/QZ7GGI+O57uAqg2La/9R8W/dRPw+5Ry52hCEKr0q
 7SV+91/9/u//NSZqmO1MpD560ON1pzSEX6b9oeOZJ+PeRFfp439O9kfLSbQjVWjsox+B6cKraCZ
 27LV6PhS2TlRFksuBP79nC/RSaK3UxsASfU/PVASM/2D4eXCVSE/FE+BwQvekchMrx95b+ghCnD
 cA6wbhghG4G1QV7DonnuW4p+BNHRUoHopeMc9SifdDeQddYQ97xKEuolgMfJ2ZAPFV57N7qS8JK
 mj+b/Y0IA5FSGD0WucZXLw==
X-Received: by 2002:a05:6402:4496:b0:6b5:6612:3e82 with SMTP id
 4fb4d7f45d1cf-6b566123eebmr1513845a12.38.1793802908401; 
 Wed, 04 Nov 2026 06:35:08 -0800 (PST)
Received: from arch ([79.132.229.115]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55ac925c2sm776866a12.34.2026.11.04.06.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 06:35:07 -0800 (PST)
To: Mattias =?utf-8?Q?Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Christian Stewart <christian@aperture.us>
Date: Wed,  4 Nov 2026 15:35:06 +0100
Message-ID: <20261104143506.409665-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87zevrb4g2.fsf@gmail.com>
References: <87zevrb4g2.fsf@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-golang: record vendored Go
 modules in show-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Mattias

In reply of:
> Thomas Perale via buildroot <buildroot@buildroot.org> writes:
> 
> > Hi Mattias,
> >
> > I haven't totally check the series yet but during the ELCE2026 Buildroot dev
> > meeting we have discussed this issue. Go is not the only case this would be
> > required: Rust, the kernel, potentially NPM packages and other standalone
> > packages that support generating an SBOM (such as wolfssl, brotli, ...) would
> > also benefit from a proper SBOM generation support.
> 
> Hi Thomas,
> 
> Thanks for the context from the dev meeting, I wasn't aware of the
> discussion. A generic SBOM step sounds like the right place for this, and
> I'm happy to rework the series in whatever direction you settle on.
> 

How would you like to proceed ? Should I first send an RFC of this 'SBOM' step
to give you a rough idea that you can comment or you would prefer to work on it
yourself ?

> > The idea was to add a "<pkg>_SBOM" step to the generic package infrastructure
> > so we can both have something shared per infra such as Go and individual package
> > implementing their own procedure.
> 
> If it helps, the series is already split along those lines: a post-build
> hook in pkg-golang.mk writes the module list to the build directory, and
> generate-cyclonedx only reads a generic "vendored_dependencies" field from
> show-info. Turning the hook into a $(2)_SBOM_CMDS step in pkg-generic
> with pkg-golang providing the default should be straightforward, and
> other infras could fill the same field.
> 

How I see things evolving with the addition of the SBOM step is something like
the following:

- If the SBOM step exist for a package the generated SBOM(s) are saved to a
  known target directory. Maybe something like
  `output/sbom/<pkg-name>/<pkg-name>.cdx.json`.
- If the SBOM directory exist for a given package, `show-info` list it.
- `generate-cyclonedx`: if it sees that there is an associated SBOM for a package
  it include the component as 'sub-component' nicely, add the dependencies, etc...
  (I can expand on that part). If it's a not compatible SBOM (SPDX), link it as
  an externalReference.

So imo 'show-info' shouldn't record too much and leave it open for script
consuming its content. But right now it's just assumption and I expect to have
another opinion while developping a solution.

> > There are still some missing links before we move forward this way:
> >
> > - How do we support the variety of SBOM format (CycloneDX, SPDX, compilation
> >   database)
> > - Do we include in the CycloneDX SBOM or just reference it ?
> 
> I don't have a strong opinion. What the series does is record facts
> (name, version, purl) in show-info and leave the format to the generator,
> which keeps SPDX possible later. For packages that produce a complete SBOM
> themselves (wolfssl, brotli), referencing it from the package component
> seems simpler than merging, but I haven't tried.
> 
> > Some question for you for the Go case:
> >
> > - Would it make sense to use the utility CycloneDX maintain for Go instead [1] ?
> >   If we go with the "<pkg>_SBOM" step I described it's something we could add
> >   to the dependencies. And Rust packages could also use the CycloneDX utility
> >   for Rust.
> > - Can you compare the output of this utility to the one you propose so we can
> >   better assess the pros and cons ?
> 
> I hadn't looked at cyclonedx-gomod before, so I tried it. I ran
> "cyclonedx-gomod bin" (v1.12.0) on the Go binaries of an Infix [2] build
> (x86_64) and compared it with what this series records for the same
> packages:
> 
>   package      binaries  cyclonedx-gomod  this series
>   podman            3         164             164
>   cni-plugins      17          14              14
>   yangerd           2          11              10
>   webui             1           3               2
>   netbrowse         1           0               0
> 
> Both read the build info Go embeds in the binary (go version -m), so the
> module lists come out the same. The differences I found:
> 
> - podman: "+incompatible" versions. The series percent-encodes the "+"
>   in the purl, cyclonedx-gomod leaves it as is.
> - yangerd, webui: cyclonedx-gomod emits "pkg:golang/../features@(devel)"
>   for a "replace ... => ../features" directive. The series skips local
>   replacements since that code is part of the package source. I may be
>   wrong that skipping is the right call.
> - webui: the series records github.com/openconfig/goyang as
>   pedigree.ancestors of the github.com/kernelkit/goyang fork that replaces
>   it. cyclonedx-gomod reports only the fork.
> 
> Things cyclonedx-gomod can do that the series cannot: module hashes and
> license detection. The hashes were empty in all 181 components here, as
> Go doesn't record them for -mod=vendor builds. License detection needs
> every module in the module cache; in our case the cache is only filled
> when go-post-process runs on the same machine, so with a populated DL_DIR
> or a mirror it would need to download the modules again at SBOM time. I
> don't record licenses either, so neither approach gives us that today.
> 
> Practical differences: cyclonedx-gomod produces one document per binary,
> so we would need to merge and deduplicate per package ourselves
> (cni-plugins has 95 components for 14 modules), and it would be a new
> host package that follows the latest Go release. The series is a small
> Python script using the host go we already build, and it stores the
> result in show-info rather than in CycloneDX directly. On the other hand
> cyclonedx-gomod is maintained by the CycloneDX project, and if Rust and
> others end up using the CycloneDX tools as well, consistency may matter
> more than the points above.
> 

Thanks for the summary. Personally I prefer to have something 'in-house' like
you did to generate the SBOM but I think the maintainers would prefer to have
something upstream to not have to maintain it.

The 'hashes' and 'licenses' property might be needed for certain security
regulations.

> Let me know what you'd like to see in a v2.

I think we first need to agree on the 'SBOM' step and how to pass it to
'show-info' to avoid unnecessary work from your end. Let me know if you prefer
I send something or you want to give it a try :-)
I can of course provide more explaination on the topic if needed.

I uploaded the report of the Dev Meeting so you can read the discussion
https://elinux.org/Buildroot:DeveloperDaysELCE2026#SBOM_Extension

Best regards,
PERALE Thomas

> > [1] https://github.com/CycloneDX/cyclonedx-gomod
> 
> [2] https://github.com/kernelkit/infix
> 
> Best regards,
> Mattias
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
