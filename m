Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BEC606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UR2BsC58;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=Z2Y0gH69
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06B3C60600;
	Mon, 26 Oct 2026 06:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZsCT68eok_m; Mon, 26 Oct 2026 06:49:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 398F9605DF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792997371;
	b=WjzdpvC9aycCE2+6dXcAi/ijJNam73FDUXgWbjt8PL/CoBDUsEWLHO8Hd6bA7Dys6sVf
	 WOlNnQIYdp/zPA+uhUODUwnWjeN+NOTDWfVJuEAimOusWJU4OOx9WIM1SNfOks9VL5OQ0
	 rFRk7EVmWBPYsgjhPxUhCYyy4ZT/QlkdzXbVeg4gEFc44ErFIiP2QQuo4e687NVPK1iCV
	 CgAMPU+vS0qCowjhbva+uiMzX9/GTz5hTR7bWhSsYmv+/Q8sxtxiWHTwMjIZitwGcrDPB
	 23FlEiCcFR9V1mldguObPq/s/gjpuq5q4jjViYTI2VI6eL52V1SGGNgav/OTjEFmPsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792997371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KiC33XD5sTlihmDM/Qh7/QCRElhf0COlBv9qQMxXETU=;
	b=rp2EDH7AJWodjpR3hLhs9+iGaG206VtHc2IF6UnuPAs+jj6nmvbkTGYGmkkzdKvxYJvJ
	 asXFE67B4rVOcFSb9P1FdVEvij1d7n2c++5DgJLlu+Jcs+BIVYYDIYUE9qnbmPSDSqLlC
	 iZafMc2Vf8LL8L3f4P66Y++/fs/foQw3Qy1VWux0G6gr4r77dO7t9yOJLOG9Z40Fh9n1c
	 hxI5Ef+o8eVHft2KZ3DtYspO8dl4lOM5zIT9TeVqUuX5FjYgsLmaOBWaiAAS72dG+WIqv
	 Qe23P3F+5J/CjkVUJD/vMdbtz/chi9p5+pT51oAT28V0ExB+aW2SYP6k83sPNJB5wfg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792997371;
	bh=KiC33XD5sTlihmDM/Qh7/QCRElhf0COlBv9qQMxXETU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UR2BsC58BmiZSOhd8NzkCV/Xp3A6ypw5Ygx+fyP8cbrfvVwTOJzf/Ked6y8YLGJzL
	 Hr1HlAaDgQBd4oHhSejXl8AT/fD5cVvwXy6zFTcpAgqFOy1Sqkzg/lZJkeioNMMGaz
	 Gw27bgOKS/bOkM4526OxqP+lAd7aIg8svdyszq/fyWAwV4vcNwrAsDjYprzuTW6fGg
	 L2KO5+N/miYiySqQVRmki8CigGBNpUGDQgMVoqeNOvTbuouK/PuVPZv/FId5Rxl38u
	 JnVIDF95v8z1ByuhP9X0/0l/7rWzyPeGu6lVohTD5vKSZvRXw8bH4N5ghFJq644q4m
	 e3C3gbiF8A/fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 398F9605DF;
	Mon, 26 Oct 2026 06:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D5D64D1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43B5F405CE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1OQws5GVxmP for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 06:49:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 11C4940567
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792997369;
 b=aEZe7XqLkm7diRacsET13AKeUzBcgyhWEZptDRow0sPmCoKPwcLl6xxD1fxnVJei8PrP
 qCYyizAIZ65wVddyP764tGIEJ1Ox8iNRZz95t7wUVZbSiQfCEb3ulSznfCs3FFwOkITeT
 LAWthu1/6uRSyyOdSAe0f2M2aMd/VasYQ+jGovr2ogKfzga+Jid88PkX9Yv03yY/Yr6FO
 re3xVMnIDWpvXnPHGInjIEUnnRSy03/6tzo8ilRrfdNUTqNYsTi9aS/9YIemfQI0dNYTT
 J8DPdanoEW9qujXARUbpYdW5Qquh6xQeY3gt11sAzwhRLCyiWyAQt/ANtxr8D1bNJkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792997369;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=WLrHBe9QChTp81xyreAM8y6Ou8apQWB+Z5zd+ZtAfbw=;
 b=ULBy5F3wJOjpVLD+9wCt5eKd7TH3fL0LOd6J7j1C3XhPftY7w1AXAEAd1Oimz3h7nJud
 3U0RiMqlzk8jEcIJOYbOu0e+ACDbayjbKlKFvsX2yqc5kRK++nJRJmi0bjN7+E3cR2GkO
 nyK4VTFa0fDp7PDDfFxtpGRWdtGsaF0DftappVCWQNedQcqfIyT2KIjSPAwl1Lt0lZIwr
 yQbNMU357sx+KjrQ577OKwZMYXzspni6slVf+0sMrc8aM8P5lTsZQIseI9skuhAMXr+59
 LiLU141D3SUSBFaDsMDXVZaaZVysWDgBbQhRmpsCJixqKvVI6NXvRvv9qC7DdVONsag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=Z2Y0gH69; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Z2Y0gH69
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11C4940567
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 06:49:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Z2Y0gH69AerWftMXA6QClLfohLrSZtWn9xQQJUXrAlQrflrkwvKRd5IoogH5Of/G6AJHZOiQqZRtEdui71a/SHT6Jl46mzs4DfGNWLia4QI13t5lPZvkd8a+OLSHRVSMWE8/HGxHh4EtGypxyUhEipfByxrNEfQjfeQ3oCCLg0mbvcC0YJ/OzyI/rxO/vawVMKSoGI6Q3AXFQCj9ZSflZyiqT+K8g0x3NaUjwDRmTPexFxwsDgi4fj7wg5ugclPHdzSKgNJg/NdHrrGxf+FkAWRqRzDmwI62MF0PMgux8yvDSS2kEj3YzIdhFJkpVzuUNH0Ismh/yZbpUshIhRkEDg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=cEYkepy7gbu4Dp0GnLUFbNxazTyVGd/u9VwH4FZdoEc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1783659385; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 06:49:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLEWI-00000007yAK-1jrw;
 Mon, 26 Oct 2026 07:49:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024164906.3150226-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Sat, 24 Oct 2026 18:49:05 +0200")
References: <20261024164906.3150226-1-thomas@devoogdt.com>
Date: Mon, 26 Oct 2026 07:49:22 +0100
Message-ID: <87y0blhs7h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/msgpack-c: bump to version 7.0.2
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Release notes since 6.1.0:
 > - 7.0.0: raise the minimum CMake version (3.5-4.0 policy range).
 > - 7.0.1: set INSTALL_INTERFACE to CMAKE_INSTALL_INCLUDEDIR.
 > - 7.0.2: fix integer overflow in msgpack_unpacker_expand_buffer().

So does this mean that it is a security bump and should be backported to
the LTS series?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
