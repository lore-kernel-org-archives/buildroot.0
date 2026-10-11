Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3180CA9EC7
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59CC88109C;
	Sun, 11 Oct 2026 07:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6n7DbQdvjuB2; Sun, 11 Oct 2026 07:17:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D528C810AA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791703030;
	b=jj54J+iUcmHWCY7VD8r1rnMchmizhvZQ5InLEUwWMOhiiebg4N1WaUd7i1mXkYFFunlz
	 jadiGg30AOJdzNUPB4XRRsR1TnCja/hyHqs1UgUvGG/wA94+5qlig0AEktVJm3MqFe9cm
	 6i+aEEPTyZ2NPRYx08HfTSuFjDM/NMed8RTVJ9Jb2inw96F2uOPSfugg2HZ3DbLhUkdY0
	 21Al0E+W2brJTt77ivRxlMbl4SITTgi64/4pADXAINBWhmdjqzH3eIBJx8CYoKF/1zPZy
	 651MzWGirDQDkKsJzGwSssUEvVldwcpSU2rdAZiP5HUiy+CCYD3/scqm/+3aOFkDniA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791703030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=biIYfOaA3Obl1PEIlhnJ7OLVFXjUgWaRteLzczX6+ZI=;
	b=kK4sZJ8Bz0Vf6F8yflJPucXLAeljOi76h7acZz7HVCrL7t7QNteMsZbiq8O025c4Ev3p
	 EEzfzJxLrMePdZv6jyLVQTkmZQfE8nqnIlFBbmT4xA43UxpqXLw/gvsdYjOn3CCT0iLeN
	 5/4rHiiOs+QHxnjBHCs+nWIpGqNBOqwzhNAxy0tdu/CJ297FHQFzyV2SEN2p1bVmWqX+J
	 MXi0bahDsI4mJqKRV2wL+iywD+wn9tZEHB2vr1hesS+uzQo/DNd2MR8g9rOkLogbX+IZS
	 Y+414u8JudCT7uhx7C+rKsGpv/b6PiIQt0/bySKA1sNbaFZea8RUFesllw6T17O5vDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791703030;
	bh=biIYfOaA3Obl1PEIlhnJ7OLVFXjUgWaRteLzczX6+ZI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HsYwSh4kofRaL3/FvLAQfuQXkpeB+1pd47QuiGERbLIZsY0ardKdT/AZZQ/B3fczt
	 pkkLJ/W3KgpwKcf6Z00tu2TB4FCRiVxnOMKHTKa07/zHQoZ0IgXOkYTKDC/2ndJxG3
	 7tfaS6Sx2BN3tADOCF5Avx9ySErx6pTqSCSFM/1sCicSvclfkQQgYsrK/qY0TgUvey
	 HBg7qVAqgrDm0xR4pawod3dOcfVFpjCDTifrEGfOUTO6ZmRxJb3AHNhQO4SEVVhFZf
	 cyQP3Pbepay/cUxcvlrW+UIDzqMjvdInwvNhAQnI6/wyUrWH6P37e2XnYGVVjgHJdL
	 K3OgSwcRxnxPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D528C810AA;
	Sun, 11 Oct 2026 07:17:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B485C1DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1EB140765
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0671Tvk2FQD for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 17E7E406C3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791703026;
 b=sEWHhneIdTQfjRZJQPZO+sno5BfYbhuHPYWMy6eqWOVmwrKufLdleTFixLyjsEKO78hl
 vXB91xvow5iSXyNTIxE1nyb4Xq20axydxPMmWNNOZyEVRmrQ4HMOGfHmflQ4Szv7k1YyE
 7qY7n2ah0OAf5Bky3crFWonxO6gPZbjygw/7/J3fWqqtEEpcCo6iBgAHmacs05AFVNCJU
 db8Qj3Wc5sIdHI/8eZJYkRH915+zsyhfoKwbK7I0w4lrLnoFnDRZRYI5H3hPG3CNLTGMI
 EY5hNV7TeOR09kGjvoq1q/2vZPplQVDrutCeHsDsiVAmhhX3m0l7wa+9rTHr+C5FH8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791703026;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lsrbw0bDAwtKsSDGgeRiO1PiiikmB/j7kkQLduJ3oyE=;
 b=DJHAxWAcr/2vRcoHUjOwSjFk9T/p1pjA75Te9iorIKqdIFsFMlRVw7RxsudzfSAJn6t4
 H1IRC65QATQYuEwN2pq/0zLu780Iywkj0m/mz7lzMUf4uT/UzyvQO8+n9/RKehLeBjE53
 bYohlaHspfOA9JD/JHb5i0bHhe586CWlwM89cz3dK7+sX22pCxUdVYQDlIW1g2rmM/qeZ
 Yi6M0QhHpkg1bcEePx3pdjxsHULJLVsgzJu2tlNuhuzY39jxzHeZOF45eKA3+eGO7sVS3
 hdSwNHYg8yJvT0sniAe5/6PHxRWN8KD60Wi4HcfVHCw+WSZnCLlVbyZidQYHzmbuY3Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U6G5xyhz; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17E7E406C3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:17:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B86A31A11DA;
 Sun, 11 Oct 2026 07:17:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 838C8605CC;
 Sun, 11 Oct 2026 07:17:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4F93B11D70925; 
 Sun, 11 Oct 2026 09:17:01 +0200 (CEST)
Date: Sun, 11 Oct 2026 09:17:00 +0200
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, "Ernesto L. Williams Jr" <realcontrols@gmail.com>
Message-ID: <ass1wMnIPU3Z5VI3@windsurf>
References: <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
 <20260810181422.10955-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260810181422.10955-1-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2] package/szip: fix build with GCC 15
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

On Mon, Aug 10, 2026 at 11:44:21PM +0530, Shubham Chakraborty wrote:
> GCC 15 defaults to C23, which no longer supports K&R-style empty
> parameter list declarations used in szip. To avoid carrying intrusive
> patches that rewrite legacy K&R-style declarations, pass -std=gnu89
> to CFLAGS to restore the older compiler behavior.
> 
> This fixes identical build failures across multiple toolchain configurations,
> including both static and dynamic builds across all libc implementations
> (musl, glibc, uClibc).
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/63f/63f9317b194fd20118c9107c6ac0531bbc990023
>  - http://autobuild.buildroot.net/results/257/25798dd0612a2fefaf6ab2865964b87604831e31
>  - http://autobuild.buildroot.net/results/88f/88f7df044908fdad5b629303c7e8c324754336ff
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Thanks for the patch. In the end, we applied the series from Yegor,
which replaces szip (unmaintained) by libaec.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
