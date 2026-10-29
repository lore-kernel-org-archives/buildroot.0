Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56592606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nR4PV1kB
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 276CC81021;
	Thu, 29 Oct 2026 16:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7oAJnDFxhGi; Thu, 29 Oct 2026 16:33:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4A12880FF9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793291589;
	b=er+plJ/kXzpQ9J84677z9V5b12gUIABaIakQTL/0xAudTENFYQYRmqGWZDSiazFbAiAD
	 /xy5af65xXk6bAqaLy1bSBArnrnwDHdqqdT22H+rCeIIug8uHGD8eCmczrE4/hmyH/P4C
	 +5g6Tj9vEnpEAORS+mjLbHA3ScPh1ZB4sNxQ1jmvp0L+Q3s7qJllFI8zEoClkRAyF7AEK
	 FN7iSWnuoCZY9SO0kKKPT3rXRzX2eIg0ZFoSOdEyCeXbDFv0eQOiyQsqGJcU29f8LI6fD
	 Vex6j7+aPwi0Pm+WHI7ZGUV4SMSjqucr/KiOzVYQf+b4B6TiIE4ieEU35nKWnlZkcmQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793291589;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Date:To:Cc:Message-ID:In-Reply-To:
	 References:X-Mailer:MIME-Version:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/vq/x3NOFgXMv19lGzFCrlL7wkPMf6gKTmTrYdiEKak=;
	b=nCSGvsuXmcmUEQeaNAkxIupmspJsegQSo8+1bZOiCCoEJwtz+wAlPsm8f+Kb+1pLHtm4
	 dBMo7sFjq5IpUPRN/SKaUzFrmO2KK1XZOq7V1D0bRAdPJsfXDuCy/E2MsROzjevP8KMgT
	 lvPy3q7+dsVOLLBtZkpE6OSCVEheatuoxPyd2UrZWE93SkqCXhbj4RyNLnXHwLCC6n2Z2
	 XRUblUakyRMLoZzacF7z4RYWCByMy7Fe29Fn0ocX1A4Q5XT4zec+0Wo6QSjumaivBvcKN
	 zYdIvRhhjMOyLzES14E8iGGa4sq2ax8cs7iGTQlq7dkUhgXaFA6kA6QZ/251kGgj+uA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793291589;
	bh=/vq/x3NOFgXMv19lGzFCrlL7wkPMf6gKTmTrYdiEKak=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nR4PV1kBB8jcyOqg9Qdt7FuWiepPRTwvdj4W/zmJq0WOxorHuX0MgRiI8eRbCzmR8
	 AIt1Gi2911pI9bzbwB9wiO4QGBw2/lfcO7gT4zfhPyd1YyRqJte2yapto1Z/j1PSMW
	 Uoi9hukqWK94iNc199iQIWKXsCH6H0iwtG6WpjLMO+a91uk39Q0nUD2TvPZO7lkrl4
	 P7Gk16PpxlDaYbwi3eyZCDqCJRLz+IyTjqa64DixwH9tvOMhr+86slVk3l5yNS3QPL
	 /9+CC6eDBYV558QmS5/yUX7Un9xxXZqh9JQWOOTOA3TFaBOzW4Pk7FGDKhFZzEAFrn
	 Cd0mK3mEkwQug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A12880FF9;
	Thu, 29 Oct 2026 16:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 852582FE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AFD160710
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:33:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrK4aJ7CHGqW for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 16:33:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0458A60709
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793291586;
 b=HrtanRWIQRsKG6BA9Y6hmnzLdzdmL9xg1yvUNqXbCJDK0kQyV53BNhnhPFLwZoNpS1CD
 tV7wpu4lIOJ2hjF7u+wXBj/6bOwGPH3UL2rSyMQmUgIUZF9s2c/UMyhhOH1JyFjUHv+jK
 +0sjqmwpaIQfXAd3fUh18/Vxvf8nAIOoRHEu56ecAeMO7bMexL6eCtOBTOIdY5ZKBqZPc
 2II0LaoMt6ugV6GTO7qsxDJpG11p08588njepI66tXLfPDl/vvFEUPmWrLFipCcOp2TBT
 U25Op8h9/c4Moip5FK1Znejlasyop7Q8E0iXR3QRlZ1oHYXTwXg3tTCyAiKcRcXem4Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793291586;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Date:From:To:
 Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
 UI-OutboundReport;
 bh=zeBNL0BfGb9syHuKViqZ5TMPncMivXF64PGfC6TXRGo=;
 b=dL7Ehhx58hjQpcKPiy+Ygg2waPWvNRhtNmG8UX4Y0cOwhZls7zhirdBvunSoJbYKQPSb
 sMs9rJn/+LOIMVD9Hhlhbqwmlti83m0FGZ0QiW5pb6rX22ePQiRsNxnOclgyvftdC3SK8
 m8rv1H6LefgQlPaLJjsikLo+La37Lic2k0C7xJugeRYg01dqYlV59PQ6Fd9KqKrcSacKj
 8D+0gZ1Wkd2NA6gmFI1ooIsHXvAsmsNkYS8xX8AVjTuB37+pcdL/z+l3tVP485rRopzcI
 HpBw4QCaR+4y8AUEs2WH2LwVJI5TRoB5cJRMsCNH9ghjTPlOuoXtarFpWf13I6BheoA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.net;
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=lDdrEfiB; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0458A60709
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 16:33:05 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Md6Qr-1wmaHF2laV-00q4TB; Thu, 29
 Oct 2026 17:33:02 +0100
Date: Thu, 29 Oct 2026 17:33:01 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Robert Rose <robertroyrose@gmail.com>
Message-ID: <20261029173301.0999fa46@pc-1>
In-Reply-To: <a9587805fd2ea471e873c68c51e1504c@free.fr>
References: <20261027195613.2168721-1-ps.report@gmx.net>
 <a9587805fd2ea471e873c68c51e1504c@free.fr>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q9cAyGR/an6xB7Tihtll2MTW+avEWBYLglSkAZrVssdW/unmgB0
 emwvLXOdZ+0mp5kGrhzCt/Zv/gsB7q/rxIVfigxts6cfJyTY9DcoNDP0fLgGQYagK6w/JNl
 F+whh0r+kAc+P7+E+SKj4sGDgEWOiUmOwsc+y9OHFi+euHVn7RMqVMvj+HI56VJWbVXvcSx
 3X82Oxyczm3V5UNs3d8tg==
UI-OutboundReport: notjunk:1;M01:P0:syGgPcfTZZc=;jXnsP8o4AHGCrbfg0p7kXYsbe1p
 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
 K5xw7DTNofQX/X0
Subject: Re: [Buildroot] [PATCH v1] package/grpc: bump version to 1.84.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Julien,

On Wed, 28 Oct 2026 20:43:21 +0100, Julien Olivain <ju.o@free.fr> wrote:

> On 27/10/2026 20:56, Peter Seiderer via buildroot wrote:
> > - bump version to 1.84.1 (for details see [1], [2])
> > - add patch 
> > 0004-CMakeLists.txt-fix-grpc-compile-without-third_party-.patch
> >   to fix compile without extra/third_party downloads
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> Applied to master, thanks.
> 
> For info, I added the missing links and also marked the
> commit as "security bump". See:
> https://gitlab.com/buildroot.org/buildroot/-/commit/727b904c13bbc2a9a7a530b1f8e47d7d180c2768

Yep, thanks for upgrading/fixing ;-)

Regards,
Peter

> 
> Best regards,
> 
> Julien.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
