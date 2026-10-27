Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B3606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DFoIelUu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b202r1iC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4908680BF4;
	Tue, 27 Oct 2026 05:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USE7Vh8lQGOA; Tue, 27 Oct 2026 05:58:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 851CF80BE2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793080689;
	b=qiVj7Ow4+6HCSUDeCzHE8edPWQ7KPaTJtrqJgzYHUXUP9RMZypZcVJNEjXCU7iPpwODK
	 /PfGCzwYLHN7UeHYLjkEdpM6ha2R5juagyRcY4UIt6UxoJeiFiUagJ3dzldaBj6zUreiz
	 j1Peu7fnqv7xEi5ZsZYL+JGMTGcfw+1WeDv7qFGqMhXP4wjXAm+pV0L3LiB1O7lQrVW1u
	 o8KqS3RAjJ+X9xi6jD6xsLWWKe5SNwoyUEn9uT92D2i3mMTlMl+KnaCFE5fqjZDNsmPxS
	 wKRC6SwnWH1d7h7G7c0NxJ+SpJHRkwpm/HkojAV0PMBVo8RKkb5wTdPOMqlXzqO7xiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793080689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:From:To:Cc:
	 Date:In-Reply-To:References:User-Agent:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eLykzfDm+spznKNvr04RBa5njEo1jdkFxaTvfsy6VUg=;
	b=bKyYl/hv0LCAcWO3sCXvYIAsSyHNPhVOfPGqQN6IwZOABzRDjxXgzfFlA3u+7b2BROx0
	 56YdX82T0ubp4k1BbL8K/kvpbImRQ/XN1jJ+2g2lC8pRq17NQGeR7reAzwcA2fns7jCuk
	 MJ6aUBM1kNCXu0fX77BKorXWETrIzSFXZ4oKTPhbnZJHMJJOW414j5O7AC01dWvD52Drn
	 J1I6pCcQoTp9yH7o5TGLqGSHYmK4RAWWtkcYCYaS/OxiqCNmw3takwSxD+7TY47+1brZP
	 +INBkZ8Hvl4Ga94o4FaclbqRwV9FQXqbJ2yeBhlhnywWV7b0S73c3lAlCr5+FVoRLHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b202r1iC;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793080689;
	bh=eLykzfDm+spznKNvr04RBa5njEo1jdkFxaTvfsy6VUg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFoIelUuOLfh/0bo9nPK57RSQhLotRudOa66ZYo0n7aqZFgFaGxQHf4QzuYPQDR9E
	 sXaUJHVRpSLBnDU39SXmp+qfMsNGwMi0EaaOO9d5bo2Xp6hxbWvo3veVhYfJs+RQb+
	 SDViFoWF8ppG7bw9i0CTD3ydIIGReciTyQ+IRFqt41mbSLT2R2638u/Z7eZzO9pw7H
	 h0yuYtBPdhTLbslTRbbsDlY9Lk/9vqJyTU+ekZLaKSi/jH/b1Wkk7NeFg2U4WGMSjF
	 X5QVTH03r13w+rfs9WxOR6MOOMLpFEFat0wuvjRoJkaI6g748l+vmRPU4e0Bpwlg8E
	 WS7IRpozMkxnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 851CF80BE2;
	Tue, 27 Oct 2026 05:58:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A1652AC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B7E680BE2
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:58:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFj5mm4W0GDq for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:58:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 713AC80971
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793080687;
 b=EQQsoGYnsUCO82kA+MHu+0xF0QuG1bWeBCzUC2Us1Kmkb7udarct9j7ye9yKtxBtjOKG
 qRulHqtrGGMePR0LRDJvKLNkLwyOXDWsAqwimIcFG8+O36PEY5APJuXE7ZCG9rRw71vjf
 oEOODrbNl1R0SdkEFNAlJq3uuKYJyzOZMpZtedJ+mauzJrOf3v4eUdzdGsu51wCSevo5p
 /cCWYRL1xyrmc6jUNOVXFT0LSewp4johgl3gnOuw+oJOkvCyrudbR/P1gXtfQubQoJ1ce
 jG3a/QKFo4f7VqOMXEN0dGnvlgrhCTmIZSa+Z/eBBuNciis84r4HduAPoc5BIJGWpCA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793080687;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
 bh=jYOHgL3aqbLW0XAJaE9WDD0E2p1IpSSUkKztzEt8g/8=;
 b=WCh+Q4OGPY55teYpRfNrt8Rz4eiQh4cuZzsNDfirap49faM5dosyifApL8/2p1bHubEN
 6VyGJ+MkGJZcAaxbD4D1tH5Gsm7bJMXbmlhhc9HBvNRlnUKmZ+hfpMT9Z4xLdwX9Ayxc7
 pETbrBLEnZ6i3iEbXypuDoepNHI5d5BLPlXFAxB3HtBLcmc0XI3voLLeVue/PvdJ7L5gz
 QT8b7h9J17yiibZxNLagKsqOp0RjDsrTcP0+/EABXrQQOsU7Rdk13KyIEzlbLphVd5CaW
 63yVdo2hnFRrX5D4D7ygu/EJJkeEVy1fT5yK98I3xe4PVnt88fHbKvjFhlv4xgONaqg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=b202r1iC; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=b202r1iC
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 713AC80971
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:58:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a7992e2f7dso7004335e9.3
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 22:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793080685; x=1793685485; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=jYOHgL3aqbLW0XAJaE9WDD0E2p1IpSSUkKztzEt8g/8=;
 b=b202r1iCg0Jn4YanDBlctPeH3Qu+6wMaJZNlvd1klLNOwN9x/s5cNZe/Rbvp95KerZ
 Kw8/MPnPm2FvIFmlcNXaNRjRVobrUJ8ZqxeuL+W26EjhE7YNdLo+bvsHW6VqiH2FF+Vj
 ZHDGKbVjFAKMEmqgrM9bawWYOFI7e+lFxXfuVXWcokep+bVyHNZeDH8YW9PgFrXyig3J
 Y8unrmXrBH07tZ894zsBSspF+HsK5LICBbthqLksPhysaG0rsEM0lyQ7UAyShCGjsq7Z
 30PmiF6vIauRPinrNTXmgpYbaqAwGaEHrNYHlRP9o87P6g7vKyZdoksE8nIEyRqoBXqs
 EUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793080685; x=1793685485;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jYOHgL3aqbLW0XAJaE9WDD0E2p1IpSSUkKztzEt8g/8=;
 b=Zv7KalnTzVXQMRg6+YbDEoNci2OEkV+rV1mDIR3gDkxjMpESuVSGWs3yao/+c15iLx
 fXQoFGiNcb8oLshspsTpeTG2mZRjooXI37So+LFoJgXKNR7hy1rn15JlrBmsN4cSofZh
 +yLhsONx49utqiKIw+JBn1elaXnEzSobaVx2Hu6gZ2YOyvP2ZfbCSnG9PVmi9J8xc/fk
 p/ziHHq1Ra2k1fcmmeAk4raejw4bGuW8WBbb2f1mRQejYZHBPuU6+SoEFXpeQdviLUL4
 F1AiFtAzMVwkn+p/iv9NYo3QZIEPC53YdzaU1abeqRq2frFC4ADDdjFmevWrXD4e5XCz
 xNNQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByo30+ac5dQIkICK15nrNVF2fUEXVpOmuVIsE9vuE/Fopp+9kS08BfZg0mzl1GRCwovQvSzxCMuR4E=@buildroot.org
X-Gm-Message-State: AFq9FYJ7SljW+v6Tqj/W2OcpWpsIEGNHCUTCY71f4evD6jOOMl0xGaYB
 WNbt2p2FSEWMidti72HPfkPFD3+9hsRyBTNWSz5OKepgUMHPLM2Yf9yvVrcJkspW
X-Gm-Gg: AYBFou1UuRH6L5IMZ1trSTXrXhj23qI57l7THnrMEuZ+iyFGM43YAtJA/M8K/3TQbVw
 tnU+Pi/VIfjydfH7uoWkB9qf0ldowFu+g9NHg/n4/OhGaB61SDywOVTtIrn7Y4I7aOGK2i0kiwJ
 6NEcBTBLFUMUuw3WHD+dw6Ea8nDfrOoX37AUPxD2nZt/GFq/xFkUxphn/WhdXAVWlRcNpP+XsVD
 joullQlTMViE1kbkzoHTK2JRT+u25STdpLgYNS8quVlZC8NH/no/kMaB3VInzQm0fHMXoMb10ZF
 Wk8Fc6yy4y3ddjeThRfIl7Kr4vf15v1gqM/wBqnaHv5J7A5GbjBoYOCQZMoYPoKtUlDUzCFrTG+
 4dM9NPM8wZkuF2Ba2CIKidzzr+qm1FJZwNudmyJUurkId81eXsys4LuCMkCn48CDwFJeyGPetuN
 Y5VfPk+Cyk8V/EJLL3IME8NH+6b19e9OMRt8lnjAT9crEplB7zcsdOBICZu22jJQJppHIvX+obd
 oFspgRa3iy1b3Tgtmb9IObMnsr/04mX71PMhvzcCV1LNskRwRDJ2znHYAOrxPy5NbXzjMBxDgZB
 a5eag27xZLB0bf4oXh7xU595AYaY5iLknan5DuIs2GmjNPkn/Ucd1sIC
X-Received: by 2002:a05:600c:840e:b0:4a2:5267:3cd4 with SMTP id
 5b1f17b1804b1-4a35ac3f101mr160721015e9.3.1793080684609; 
 Mon, 26 Oct 2026 22:58:04 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net
 ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm21278882f8f.57.2026.10.26.22.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 22:58:04 -0700 (PDT)
Message-ID: <a4b6456aaf3f6454e8969b16a443dac45aae70f3.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Date: Tue, 27 Oct 2026 06:57:44 +0100
In-Reply-To: <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
References: <20261024220915.2813680-1-alexander.sverdlin@gmail.com>
 <at5oC97YlhN98HHS@windsurf>
 <e34f4a3f8aaee192923e3ecdde4a287a1cfaabda.camel@gmail.com>
 <45a821b584840d1cabe6df1dfe083fb8@umbiko.net>
User-Agent: Evolution 3.60.2 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] boot/syslinux: Bump to 6.04-pre2
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andreas!

On Tue, 2026-10-27 at 04:54 +0000, Andreas Ziegler wrote:
> > > Does it make sense to keep syslinux? Even Wikipedia says it's
> > > "discontinued". Do you still use it?
> > 
> > I'll be fine having it downstream. I just thought, there is still an
> > interest [1] in this update ;-)
> 
> Yes, there is still interest in this software, and I sadly mourn the 
> absence of the don't-delete-host-syslinux patch.

Maybe I can look into creating syslinux-host package, so that I don't
need to patch much in the sources and still have a functioning installer.

If Thomas makes his mind about the existence of the original syslinux
package at all ;-)

-- 
Alexander Sverdlin.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
