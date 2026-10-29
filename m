Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6C1606A31D
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gj2Aw4Y5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4057F60A7D;
	Thu, 29 Oct 2026 21:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wb5ua4hRNEBm; Thu, 29 Oct 2026 21:34:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 51C4E60A70
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309653;
	b=KQnqwZ2Hj7/BmL05z8ThFXk0wfNyVuLvV77qsQEhHSFrAZobTzB+dL1ugNC22DxdTQ/s
	 RiLAOhpKNGqhU46ZG9eMLcnhlEsp1cMJd+3bY1z3oGqchBjTn5kjjsMjpEOrEFRDHTIdk
	 drsF3wWmJWr98L19jEgWTSkJKcMvYBGqEofUmqV5l12W9qnQC4447G3FtnNbddA0QNwrb
	 +zSI8+iAlmn9WMCEG/a/0U+q/A1K1bYyHA+6P5WOdE8ScLzBQQ+ZylwejVhP0IyyjfwPi
	 TCF+dC4XOvCgyFEsPr9ZuRUlhfraBuLRECS+cBas0PbPScqGUwhBQL4fppYCh2mM4Ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309653;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bv9OtG103UY/MaSyzb8LDK3L5w0DrCTsGU3zZG6toEc=;
	b=DTQznlISAk3HUbBhXGKHWkMvfqWQIDRql/RCAfIsfo3X4TsYm7dABjodZ782cMWbORg5
	 PaJizv5G++ztdd9vID28g/9UaNbeC7SQSaGZYjreL1JtXf5uYowfHJrdR8Jy/ZfHd4QRQ
	 /weuh0jNt3WisX5TDdKvV0sTQ1pCup9fR48W9W30mvdJfttHbTadS34vBPi8tEUJWyyg7
	 g6W0uFjmI5DFPz+OicMcnWorgm2ZGPKV/qIPEVFMQ+6/HRStTnslGV5g1MoVx3AFcFNn2
	 5RjIxCyNV8usyaChMGXbjE/ESwC1hMIyOmQYWgaOyRhYNvxc6/eHgtHiP/EowQ9YbNQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309653;
	bh=bv9OtG103UY/MaSyzb8LDK3L5w0DrCTsGU3zZG6toEc=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gj2Aw4Y5Wvzw24l0zeV1oi4e0vj4bKYD0ceJM6HWT1D6dvuwzTmGZ0goN6uljkFTU
	 4vMkH41y/39GY9h6Uu3A+7hF3NIdk+Qh3pbh+mN0VVr2qHEKqfzdcHX+oqiCvZX1bk
	 Hj51GL4KMfUqpp/g4XduTHlrupXZqB07dnK+MyEPKAuH6DIy7sEg0XJqcZncFOu2Qa
	 e5F5RgyDTODWgJeHCtBIr4Buc12D/juFRe/PyHmOUtzYJoBbwpkGXijUh7yzPnGv1e
	 26cWVxwkeH+Ci1lMTUOGceYDhpUL3+bRDMGBMu5586iZxgtflW5u8r964eQovch/7z
	 mgNiqaLk9CmUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51C4E60A70;
	Thu, 29 Oct 2026 21:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BDF41DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6110640508
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SD8S0Nr_okf5 for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:34:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2B8DE40176
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309651;
 b=OEAjIA2axl0Tj4KovCouljpPGwYtWyC2mypUPZc9mOwTR4tmVyiHKmCnHWGlCk2woK6E
 /xrk8bjdIIIoQIRUXKVCA5KeLpGb0/qRx2JzR+ROkJZxp0d1GpkkML4aBeTJkIoaWM/qH
 BD5sNEN7TdOPVKu4H47SqHNBe7oHmEhrNwkxE/ZEGCbdFFlFvtouefV1CbUgVRBuUx55V
 hhof4tLJZMebfyGonnfRGazH2RCi9ySuuaOEbeLG6JNUQsXZPj9qYUuhF960NcblCl/TE
 HKVyDjO4LWpRj7cqUaLAWXo22NkmIxK8J/Y+LkiTErmmFDE2EAl4uTKsSTRjCBYSXVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309651;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=gHaRIf5BQGMlqSLKhIVhQ5wUV6kJ67OxTRfpV2YZRN4=;
 b=XS8unk7dDZCX99v7vfWh27UGMX8rXB3b8mtMgd37Jj6/MVO9fdX2o34nvnFtpZu0dHVf
 rpBBjqU0p5AiVlFfSD9bVnMVk4vF76PWXnDnbJihmlIwQQ91d33F2OJWsUAedxnGTK2o0
 kNYW85EIlLSHlWjqqxGHaORpEfJPAizXK9Qdlji4m5KBG5nXYK/cB35K8CZI1BXBlbLzY
 nP/GqGL3HDuRujvSvQXv0Ea01i6RwUcLSfJ0xy9nAJVGWWWzLfEr1qXVrm6YnLoJjem9V
 kCZtI1lyTvWJ5vtEtfpkH7oBpRKckMHUT57qDUIiCH8cRuaIhz9w6Zd4eS0G0t05/0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B8DE40176
 for <buildroot@uclibc.org>; Thu, 29 Oct 2026 21:34:10 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1xMXl9-00010t-4M
 for buildroot@uclibc.org; Thu, 29 Oct 2026 22:34:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 29 Oct 2026 22:33:19 +0100
Message-ID: <pan$ae294$bd983f48$791067ea$427f8b9c@ID-313208.user.individual.net>
References: <20261029204953.1447140-1-bernd@kuhls.net>
 <20261029204953.1447140-2-bernd@kuhls.net>
 <auO2ugenOrGrEKGM__30665.5666836136$1793308450$gmane$org@windsurf>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: bump version to 3.15.2
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Thu, 29 Oct 2026 22:13:39 +0100 schrieb Thomas Petazzoni via buildroot:

> Are you coordinating with Vincent Fazio on this python bump? He has been
> doing a lot of testing work with Python 3.15, and my understanding
> things are not yet ready.

Hi Thomas,

yes, I mentioned the new series in the work item:
https://gitlab.com/buildroot.org/buildroot/-/work_items/
193#note_4120357815

so he can use the newest python version for testing.

My personal repo does not contain any python-related bumps anymore so I 
will try to help Vincent in the coming days.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
