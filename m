Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB4FC79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 10:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A21F8405D1;
	Sun,  6 Sep 2026 10:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JP2IuQ6t0N_C; Sun,  6 Sep 2026 10:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C0DEB405DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788689895;
	b=XfymId6S78hBfrEOZ5LlGcMAZaFFuASGAER2Ff2ZvAVqw6WnxDgiuV3syaYM+k3uyeTD
	 OsBhD1kXJmuOqolSl0t2UUxcI/ssPPQd5gWOzFFujQgn1oiaVkWS97TWk+a5V0hm9jLgd
	 BqbG6uGsiNilwUk0lmfsFbV3Y3VqunBepr9HmMeWl35moOVBqPLjrJFYYooNLkU9Nfni5
	 7juLaVV8+WGDGcuPqvXAW7lmFQVkdWQShV++9FJEWOZtNofnxl8t4kFvld7kOAZoRw5eM
	 zwGLiGfRoj84jgm02//E5Bi6LCH9DR7TVTcghsYJ6d5aqPRgWlZalQZX2WgOXNNQ4CA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788689895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=BEW5CaZqM/D0Xu0q6M0+pyw7HZQPZfiQdd4nXN0RTkQ=;
	b=gHEqJn/3AGhi1Sdykwzw6K5Hje1e2tnEr0cvyUICFP/cUP30hOoHE2WG7+svOiJC1j3Q
	 Ny4b5OTXn7plVKa65Y4MNI72DLV+v5VbzEhFveGG5T+3lN/g8uTO4z9Wg6GAt5SdIjwuO
	 /MzJPEm2n6EdFlMc7TYGLN9hxRzGum7IQ1U0BWxmxXaIduK37kkpCvhOqXR7QvPWD33Jh
	 D2nf9qcTEUoDR4wweSjj0RhuLBTNAKXaNOblYtcfs07ppStI3bfcJYgauKUVfZj//UsoS
	 GQgWnYDnHXjHXZgRPi71k6z64Ajth3ZHpd47uUDol4vS1QFlqo60VGoNhxoEd0HPJzw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788689895;
	bh=BEW5CaZqM/D0Xu0q6M0+pyw7HZQPZfiQdd4nXN0RTkQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rZ952iPIBVVCaeW6WVx+R2iSYJiQ7Jx+0TKZSX0Ud8mUge9HWbxVOqoOTTIkyDwZV
	 FRAxPOotZHs79BbImMZKHJ4gllPrGt6fCExnU1eKLPBiJxSomj8qdsaYUB47HFkzNo
	 j/NiKVy7rzL5MkQXRFYzWmBI882xgvUuppBEncm02C6UV86KmpMiG0Vm788dB1jNke
	 uqUol+1QYDzU/vWiQEr9zHmJnMT1muomhqyuA+4QSxENkHSGm+hol3v0ExIuAv5090
	 mvtsADxA9toRF9nt/1dp6fq8SxxBvvwcmeueRwsbDbaDdipDFJ76i8GspiMgRRh3MF
	 KD/I0jM0fSWmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DEB405DA;
	Sun,  6 Sep 2026 10:18:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C565C372
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B72C4605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMJpJmk5l9E2 for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 10:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D125C605EC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788689894;
 b=nHSXu1VVwwOQI2a3pnG9y/EO5OvvdlePcWkDMygqMumRCK8gKTkLpEr5Nf20db2r/fLh
 8S/AQ2WQ0bqXwAqS3nVrW9mi3rwZZMfaX8LwxxM5lc7my9VPeYrHnJSbhWWQocPijuaWG
 Tx2WQjHrcRdQxGF3hIDgw6L2qZUZSQh3O+t3tHqMVAWdif0HlHb5o7eubHp8yRCmxX/tb
 16uVX93gXamh8p6t/FrtC5qaq2aAoi9ErdDf+AfZ28gDbOuGns4P82iV+r0zQ408pGNMj
 YpJmZOGKlNZqv+69RNpJPHze521ot9yqBpdG3/6m5jh3dYUt2Kf2HY1ytcRCsny80gA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788689894;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=V4lWTuG9uvY/TtFPwl4ZNLcjW+k9slw3CgzBRQssx80=;
 b=HKyZxFh+yHWhZpG3xKh5KOHGh5R795oExKV7HFU3x9u9rZRCapXjSipZhY+fGTpM9Lpl
 FDvwOIqM0q0c42Yz1ElJoxqgVlJjXFdN45sDoGZdpK6En6HJJSccAJnnUzGxk5hETSdpG
 4AmDGnhYkYuXPxxlxu4u8Pxu3/BBS/v6AO2Ldx4kf7KCH9cARDOL5mJIf3Lab6wBpbZY3
 FlEl9rK7ni6CmpH4Uf5twCL0JXQgsdF3orXID1fwBoq3e/GhOXXzlGg2zWRRRDNXia1m4
 naOOUCAbi6zfuYRz+j2qy59cdbKOA4wTHQezHB5NZ5wPlUodHTPm3vJdmdWvH8vOqBA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cpoWqaS9; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D125C605EC
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 10:18:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 15EE778034E;
 Sun,  6 Sep 2026 12:18:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 12:18:09 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 12:18:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904161228.115468-1-bernd@kuhls.net>
References: <20260904161228.115468-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <354d8111cceb38cf0554607af709f1a0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libde265: security bump version
 to 1.1.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 04/09/2026 18:12, Bernd Kuhls wrote:
> https://github.com/strukturag/libde265/releases/tag/v1.1.2
> 
> Security fixes:
> (CVE numbers will be added when assigned.)
> 
> CVE-2026-XXXXX (GHSA-xp3h-6f5r-8cxp) Heap use-after-free and double 
> free
>  in multi-threaded (WPP) decoding. A crafted stream whose slice 
> segments
>  repeat or rewind their slice_segment_address within a picture re-ran
>  CTB rows that were already marked finished, so the CABAC context 
> handoff
>  between rows was no longer ordered and the shared context table was
>  released twice. Slice segments that do not follow the previous one in
>  tile-scan order are now rejected with the new warning
>  DE265_WARNING_SLICE_SEGMENT_ADDRESS_NOT_INCREASING, and the WPP row
>  progress is reset for each slice segment. (medium)
> 
> CVE-2026-XXXXX (GHSA-mm7m-v26f-wf8x) Heap use-after-free after
>  de265_reset(): the pointer to the previous slice header was left
>  dangling when the DPB was cleared, and a dependent slice pushed after
>  the reset copied from freed memory. (medium)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to mster, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
