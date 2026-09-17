Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29443C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E996A80EE6;
	Thu, 17 Sep 2026 07:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BZMj72-hj_D; Thu, 17 Sep 2026 07:55:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 19EF18096A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789631748;
	b=gjkUbEkZFx3Jn6ZeLdwbVLn9RsihUKV6Mgahp91ESuyw0w2pWigV1xAs6govbXpqUh59
	 o1P634VCYPp6yJYyBb6G0E/CMTjD8SxT1mk/x1bKJfnMbj9o5hoOD13bkkhWa6j9q0Gmg
	 dkzxi5OPPH993w4uxtZbouJUnHk4WUjUGnxMobJlyas330QxG1oBfa0Pr1NrTDE3GbFmO
	 Mo8im45wFkZ1KUB1gvtYaYmaN12ckYb+i4xnYK5lkxt4Je0X6Zp/OoR70O6Aoy0fkrh6Y
	 C0K6TVxtOk6Cqm1kd5bFV0aAESkUQMTmwP+viy12jTWy6sDhgdPjbB+8oyhhfuVB/WQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789631748;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Wd7JDjZkB1temfVScww3KByygGYfmUWkWah5FZYNug=;
	b=NDeVMw5z2YKkKvphwc8wBujC7NiNmnz+vuHzaJZW2PB1LVcOtyoVt5YoWKrRHefHLmT0
	 w7FuzQniUJDaGrJHF9gF65wqHus86LXsGe1J5ODFKYXHm/EPEShJfG7pMIkJaRO2o9Hue
	 6hPz6GL9GFVyRNItCBczFgZFQJp/lSHsho0U3bIQrWeS9ZJaxDhfPD4jG7U3PwrWRDp3i
	 UC8VH/9apYQV5XGjevEawMsVS+ro7DmYmH7loaOoi4mH1+NdY9i/LFFOxkv2crpW9E+ot
	 R35fwGbwjYSsSA7y29MlobGqzdhfJ/eibPSkX1uyzXqDNMiq1jAf9SV1gRtgg3ahcbQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789631748;
	bh=6Wd7JDjZkB1temfVScww3KByygGYfmUWkWah5FZYNug=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lMHzVFjiUinDiJIpI5PSblwjiH0DawvcTpsPCTD10hzTFSVrabVW5UislhQZVJUC3
	 +fOxTW4trkTPOYLJYwOeHa3pJ2ZpVnrdKjji5//wCbsUZOTWQGaaxdOUYOla7Pp0/A
	 9mbhcbIaj5X259HJmJ+RpFiyAIlG24cyFu+An70XqLp6ssVibU8Fxn2MfJ8pp0k7eL
	 K4U6t/XkcWZ83DNyEmMvwzyGk6hZ2NmqFazVraYWuraNdQFAzA26RvLO7MFIN+ZX2A
	 KrcsLXZALqoL2Pld49PHoKWAIHjfn8mzZuutiEYXCeb06F6L3rhluA2twmQYYJI6nB
	 OoyHYVMi00Dvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19EF18096A;
	Thu, 17 Sep 2026 07:55:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 960112EB
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 878238096A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwromJmKrxdU for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:55:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F2FF2808D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789631746;
 b=nEDJYmd7oGB7L9pQbexAP0p13zWewxnhzWIKzD58sMzMgYxHjBcUB/WzERH2olR2lAXA
 AsRuy+3wY9/0P9JTWoslyVLYd3g8myhUUtXescVOcBub+t23E7ykg+ip/12eo64M7rUVR
 iD2f1v2ug3+O9D4adqJ3D0pZD+SUis+1XKUsXEb02jEDRcWMKROKhlJG6bYq/n3Bjrath
 JZoLjL8Ukil0NDQOUA+bt/UkhdKxZ9I1CM5B8zE7pksUZIKBl5jzRIA4KDvSoMi1wo6yR
 gN5beM7tYCFANCR3fsNH2CEzlI2lAIiSEMLOo2CBk1jIgz786Ojngy3L/DN1Q3PWO+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789631746;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Nh0wTqNoh7sIoMeGOMERpxPKFaQC1ofBYXCk6VhH8Uo=;
 b=gIzuD0TAOII+2BdX1+vWaFi0c35qfsaCe1BGDUkss+upWVrLDBt8H3cTqz3WAKpmsBpD
 l9N9LNrbLiuVK0JMJnhcqOBnfUatbOg/1Y59rgCEwJXEq7CqOH7T3zU54S5O91mn3nBqr
 kqMVedqIs7NHXI+/YRR8BQJkerYMZZdr0MOuYhYLBtza6wTIEPPWFnVtRB285u42qCmkO
 cQlhszfGhKsY1+mAq/PZKYkVfVPCrz1cbqGqHIa3fXj+Ltqqem4nt9OHqIOx8oZxyzxv1
 GPgKptlKGtFrAba4ltOCDaRXkw4p2kzsHbkYAFDQ7C4Iy9YuKIEBHh2o/PKP1YZzB5Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=A+FHl9kO; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2FF2808D8
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:55:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D373EC63440;
 Thu, 17 Sep 2026 07:56:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8AFD25FAA3;
 Thu, 17 Sep 2026 07:55:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BDD2E11C7A20E; 
 Thu, 17 Sep 2026 09:55:41 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:55:41 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <aqucwrwMlEvUBdCO@windsurf>
References: <aqZWRD3zV37x5UzL@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqZWRD3zV37x5UzL@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/nim: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Sep 13, 2026 at 09:52:36AM +0200, Waldemar Brodkorb wrote:
> Nim is a statically typed compiled systems programming language. It
> combines successful concepts from mature languages like Python, Ada and
> Modula. See https://nim-lang.org/ for more information.
> 
> This is a host-only package required for the new chawan package.

Then this should be in a series together with the chawan patch.

> diff --git a/package/nim/nim.hash b/package/nim/nim.hash
> new file mode 100644
> index 0000000000..c455ab91a9
> --- /dev/null
> +++ b/package/nim/nim.hash
> @@ -0,0 +1,3 @@
> +# Locally computed
> +sha256  2639a06a5ea7a7fcf57df1e7e1ef4d1b2bee58c7ac9bd00dbd2aa5bea1e5a56a  nim-2.2.12.tar.xz
> +sha256  1ef33f7376a2e4b4c090fcaa42d8a206c19bc70d8d816665ff983bc14c5fe159  copying.txt
> diff --git a/package/nim/nim.mk b/package/nim/nim.mk
> new file mode 100644
> index 0000000000..b9a83e4939
> --- /dev/null
> +++ b/package/nim/nim.mk
> @@ -0,0 +1,22 @@
> +################################################################################
> +#
> +# nim
> +#
> +################################################################################
> +
> +NIM_VERSION = 2.2.12
> +NIM_SITE = https://github.com/nim-lang/nightlies/releases/download/2026-09-08-version-2-2-8e8fbf60693418dc95bb0d762fd660231d08a583/
> +NIM_SOURCE = nim-$(NIM_VERSION).tar.xz
> +NIM_LICENSE = MIT
> +NIM_LICENSE_FILES = copying.txt
> +
> +define HOST_NIM_BUILD_CMDS
> +	($(HOST_MAKE_ENV) cd $(@D) && ./build.sh)

Surrounding parenthesis are not needed.

Otherwise, looks good to me.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
