Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7682606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=V3guenaC
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 949D460887;
	Thu, 22 Oct 2026 21:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UFoZNGbikcPk; Thu, 22 Oct 2026 21:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CFB8460874
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704193;
	b=V8Lju6k0ZgG+KFm0Rqg1ZMc5n6LpsXMuCNIYzpHkU6AOQYpdVWyobCADzIyH8PgetKyc
	 Q3Ldlm0zFyeTFxHXWD9G9GWxQaT/Le1rVL8VSCnoo+yICrPtxvMOStzb7Aoq8bukZLrFR
	 HNYHMpWNzaWSErY1S7bNgQL1wzGOf8MX/EbtQ/617K0WKlOaoH2ROh1+szV51MtUNRY5G
	 QQR3DPNRn6uFYvtZG/sRfiHcWfDMEd/0HaQPnzGYcx+q3XO3cL1ta0QS9J7tWU0tb4XsW
	 wiVEJHH0wcg6UzfbsFWO10YRFyphC46upNBtu7hALAPTImZLd5DCi+VdSwQ+d0BevgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Injected-Via-Gmane:To:From:Date:Message-ID:References:Mime-Version:
	 User-Agent:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lih5Kh+w0XQN8i8pucH1yE9QqPfxWNLKmgK6Dyv0k+o=;
	b=kGZ01U0BCBEbyMX0h5KzgpQ4RVT4MBVmLxzyR7L75P7KKlWI64am4upUO5ziq7yZ5xrD
	 1BoBI65U4KSG5MJ82ZPB8R01InsvdIytEuZTI4bD9oSQZOX7xV67OGolM9TzHqjLhEOG8
	 qhdBuGjZ8JCtY3McaS39Te+JmRbpyGp2SsfRTL+GEk9uaLcdCFl3nxJPjtFxs/GTyYE/k
	 o1rzalQ/1iT2TXLaeZJeyB8al/GQqYNA8Vt4Gzms7fA24J9MG9qcumPIAcbMtfTsf3WoQ
	 1oZjqo9NJWLb4A0tjOwc+xvQb+2sD6WCqQddBzyuHF5sIf+2TTr+GcxjzzhVoKAdpFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704193;
	bh=lih5Kh+w0XQN8i8pucH1yE9QqPfxWNLKmgK6Dyv0k+o=;
	h=To:From:Date:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=V3guenaCP61DNf0JAwgF5ikVUuPVQGSnS012a4/uSo7ipKh7z1thFmF+GrHcmPIuC
	 lN3q/ZNYhUGKOR+xK0jXOX+dRbj1QSbVaIHlsGZUGtjxG93JO9rt5o+hFyhh++a+t+
	 BzFd1te1k8aUf3r7oUv2ukV+46Ozcqo59V2ehFT8nixeie2PHcD/nfpgUzwpJzdONp
	 LPRnSp34Ii88VbL715VTF8VmDnDBt0dgae6p1dQTsufVpdlGPUg9oqIQddDk8EeHc7
	 sBUhKl+q4TN7uaIHD3PzDhDG8CVnlGm06nY4i05/kPbQYh8z4ONRSb1dyclrbO9zaR
	 mWp9qTnSsOrkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB8460874;
	Thu, 22 Oct 2026 21:23:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B0AF7356
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9725740270
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNwcwLwZ85o1 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A627E401D0
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=116.202.254.214
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704191;
 b=GUzbhIK3vsTkAOqBAuhw7OTO0yPeavLOG62mfPFfFVU9WAhDZ64unRMLDCGklzEYqlt1
 8uKr4e0HqEd85+oIGQ3Mmci1+y1JPnBbK+kmLMK5Yr1uyD9s2eh9UM+8VZOHuwyfXPmVf
 wSAWECQJ6eWSrOGEL+j+QifpO8YYO1Vg/8kZp6kEr8JLW4PUB8KBNfF2ij06ZYUSAIVUI
 Jfvexz12Cm50BSnbt4UTKDGxeghJBopQesFPOiz0Tj80cf3XYx2fdOqJ+ZCq5BNpptRQz
 ipAakJHzna8f1xSd98qsblSDFmRGWOEnJRYgjTRdZexZTE7JC5II6hprsxMUxl6q6vg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704191;
 h=Received-SPF:Received:X-Injected-Via-Gmane:To:From:Subject:Date:
 Message-ID:References:Mime-Version:Content-Type:
 Content-Transfer-Encoding:User-Agent;
 bh=wWppa6ddDhp0BhgmcJ7zDJ1wmecD8f00daQLV/dBmu8=;
 b=h5NsT5M7Pn23sMT/4cm8NiLn12pxtdqvqIBCv+FAp2HONEp1rGd4Kn5mmDxLz/gmXYiv
 Gxj5F+KH4gf8jKoCVEdhxJugWVrqW3Dl3A+ClFCfO+bh7nJ/NpEPDAbWqPOxN9PzZyCkm
 rRVKLty2pZ6Ht5CcmMOxeDeBY0RjHIoWJybQLg8JkSy+9XSDrHRZVJgNvTpwFWvxGdMS8
 WE/74KwDKIdDukm54ftqXJe6+fCX9KEmnuPSFR0vmGdJG4vKde8CfpQBn3suOUWW9d/in
 fYakv3VrpSmP5OEYIhS5u29k+xb1fIMo6JFnwSEcOf5rPKI4Ampytil15AJ3jjoG3Gw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=fail header.from=kuhls.net;
 arc=none smtp.remote-ip=116.202.254.214
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=kuhls.net
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A627E401D0
 for <buildroot@uclibc.org>; Thu, 22 Oct 2026 21:23:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1xK0Fh-0000Od-88
 for buildroot@uclibc.org; Thu, 22 Oct 2026 23:23:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 22 Oct 2026 23:22:08 +0200
Message-ID: <pan$1f3ab$25c10f86$a1f8462e$f59a0295@ID-313208.user.individual.net>
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-3-j@j-ernberg.se> <atkstjA4-icjE-BI@windsurf>
 <CA+tfhucpM468eDtqH3pDG7WZkfDJQXcy64ZNQkOumgS6GTkSbg@mail.gmail.com>
 <CAAHg4ZgbxrM1D8aLNBeF6i6GEMw_Ai6eaup-c2SmB4rVVG6hbw__27146.9597982772$1792703609$gmane$org@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
User-Agent: Pan/0.162 (Pokrosvk)
Subject: Re: [Buildroot] [PATCH v2 2/8] package/libest: Drop java support
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Thu, 22 Oct 2026 23:12:56 +0200 schrieb John Ernberg:

> Hi Bernd, Aleksandr,
> 
> Bernd, are you using libest? I see you have worked on this package
> recently.

Hi John,

no, I only fixed easy-to-fix bugs I came across during allyesconfig builds 
for the upcoming bump of libopenssl to 4.0.x.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
