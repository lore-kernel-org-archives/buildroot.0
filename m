Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0D606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OwHab7fV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=TtoGu+jX
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00DB811E7;
	Fri, 27 Nov 2026 19:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upkdb8KwMhU4; Fri, 27 Nov 2026 19:02:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 374C4812CB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795806131;
	b=a2k0O46Lm0P7V2ETngsOgDFaZb0s1Jjq1YSeN1CnUM2Vn/x7hrO9f0nNaeSjUP8e4Vvi
	 vCTey8VqMixrgV+X8kZE5cLN531b8FDD504NVUnOd+e0j+xaobRLnegD1v6g79EQQFqGQ
	 m7fHnZUzzczfLe/MwFU74NqIEHLIvzuOkqmOAQt3OO3Z0zbPQK2NZ/bSIenWLVboY5LbR
	 jmD4jDxkpzhawE31+yY8iJF5KsKN1mg82fpnL6VaoUcxq8GW68ICGC3J5w9o0VJ+/Hy5P
	 DkDtGQsvosVULHWwFVCN6M+eYr9T4OlqsTRCgfBxPRCVd8gk4bO2M3VvRSWgaAaF4rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795806131;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:X-Injected-Via-Gmane:To:From:Date:Message-ID:
	 References:MIME-Version:User-Agent:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BjqNw7UP8W5ykoYPna9VOygaM6U5hGqVC1IBUo//cHg=;
	b=Lh8dzH8Qd3aqHtQaGL6NrhqlZMVBB6H4P4iOAuVvlVuucPMgowns/Bl7zzvxI0k5tOa2
	 jaCIgR31Zi88wDwnqxFhTsCR+Y0vNLqVREsYaIyaJ043zldVHYr3cmRsUxSdybKvRKP3I
	 FzrqHeMmsFpBSmFjlOaXoRf84oHAVVlrf95hi3lKKw+TVba7ElVUYWfxI/grP3dBVjUUy
	 fnJNe6FMHZyVnMDe6clmmaE2zVC+ZGbCORYN7BXjoZV+OcOgDzn/X+0H1BliNWHNiE+O4
	 Lllz5br9EF3a1gjnE3nTKDEvf6Fi1qFchxCLgWtGLDc8LdWL+P7iwdjrHU+ywK0kNVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=fail header.from=kuhls.net;
	dkim=pass header.d=m.gmane-mx.org header.i=@m.gmane-mx.org header.a=rsa-sha256 header.s=ciao2026 header.b=TtoGu+jX;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795806131;
	bh=BjqNw7UP8W5ykoYPna9VOygaM6U5hGqVC1IBUo//cHg=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OwHab7fVsYUykNynBMw3/VGHQEfKQdplzhvbUJ+teVUZJwTz5/UZ1YK9c7iUeNsxJ
	 aBkNq8PVz5KU0w3bsLlLM7Nz34UyDzuE/nLYsycNML0rzEh1LJTHGyVtvroHEyaLZn
	 k8Wt5TlFXAFUBkERRWnJgrnj0Rxx6t3XokITDH44ew//lGhpv2LFADOeVTYJsX8RBc
	 8hzGfUlU4YTCu71tr8Ft7+eZmBX/eZ7hRxvpPGNdDT2zibS665b7B+/0y6bSZkyu+S
	 QUlc1iVK6c7y/x9bHfryWrw3w8P3p6xXhW+0/jDTDGy9UkEQvE52nnRjTDYUb5PL3c
	 NQiARd3jc7A/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374C4812CB;
	Fri, 27 Nov 2026 19:02:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 541BF373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45E56812CB
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 19:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ElWpflewaFS for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 19:02:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BD724811E7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=49.12.148.96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=49.12.148.96;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=m.gmane-mx.org header.i=@m.gmane-mx.org
 header.a=rsa-sha256 header.s=ciao2026 header.b=TtoGu+jX
Received: from ciao.gmane.io (ciao.gmane.io [49.12.148.96])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD724811E7
 for <buildroot@uclibc.org>; Fri, 27 Nov 2026 19:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=m.gmane-mx.org; s=ciao2026; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2innGSCXmuMli2ccUh/EE4M5JkLXp2BbX7Gqbbp6OF4=; b=TtoGu+jXpvNEDaPj3OXV+VirrV
 qL+TTIXjefPhSS3u4vYEyx5iyg7KJnRokb8X3m5u/AWRPI74KdF4g4As4dHVOEIkUf13upSaRyPY3
 Gd1HGur+ePKgeOdlWWX2mukAEBdPQIXN1hB5NDwuVWODSYm5Bl6gLjYGzDDgqoYQMqFIbm6wH/Msp
 bDzPMMX+WK/4xSAHK9Isf5y8umPoSB1zWj4wxi8/V5CsqFrmiBdXTc1Nn1VRoeasvlIBKZTdqNh9j
 Zj5K+vQYmHR+5k3SXur5Zih6i8q9hSkvYwVl+dOpxlT31n4BY/sSb46LaW4ULpcAjtrHduZOwv2zm
 c9sc//fA==;
Received: from list by ciao.gmane.io with local (Exim 4.98.2)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>)
 id 1xX1Cv-00000002v92-2GXs for buildroot@uclibc.org;
 Fri, 27 Nov 2026 20:02:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 27 Nov 2026 20:01:41 +0100
Message-ID: <pan$7057d$4ad44d3b$c40317c5$932873c0@ID-313208.user.individual.net>
References: <20261101082513.1583784-1-bernd@kuhls.net>
 <audouIxxR5_vsJNX@windsurf>
 <auuy04ugIUfC7nkF__21555.1677205198$1793831681$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 1/1] package/dovecot: fix build with LibreSSL
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Wed, 4 Nov 2026 23:34:14 +0100 schrieb Thomas Petazzoni via buildroot:

>> But then here this gets changed so that the function is now defined
>> when SN_ED448 is available... but why isn't this also changed in
>> test_xd_keypair() ?
> 
> Any feedback on those questions?

Hi Thomas,

upstream committed an updated version of the PR.
https://patchwork.buildroot.org/project/buildroot/patch/
20261127190032.1405754-1-bernd@kuhls.net/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
