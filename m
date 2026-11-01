Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E2606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PNm/0VgV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44293405D1;
	Sun,  1 Nov 2026 17:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWBsCYAWFVWj; Sun,  1 Nov 2026 17:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6533340357
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552976;
	b=sj8iw80pT2GUEOqXAyF1gTU3CdVuc6jO3/fysUe7eoluk7UXp9JkVGh5/qi7B3f8PLf1
	 p6e5ILKTrS4MUx8I0V9FdCkayolG8kqE7sXUKVkRDLi5FDlbPT9ZZ0npL/DwQOsUZvAo2
	 1MnQVFTpCYQ0f3TJF/K7LYeOTRJbGR32RgH8zb6UXL/JyJnaWvc+GqKwA4FhWWfaNPSkF
	 ZP5ty4/p+X3QUM06Hs+9iQhFIwerwiTU0Jqr0GBMimmQAU22p4XTqzytCEFw+ii/Iu+Pc
	 PLBAk0WPP2eeA/vWe/xSLbnJxv8uVq5VsRQ3fFftE9UvyQgHPdFl3CnssSNqBYmt6EQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552976;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=WslK+atdmeGZiCdGhxSTh8mpTADevARHZzx4Im1Xl/D/yF4qw45WpDxfbc4PLNb/KipK
	 iZtlCnqKktMJazi4yB3QF1byroOKRD9CPur+jmnBwpv7AwM8gmbnzNZwBClnbkzGAv5qQ
	 MgoWzM5KS40MWudZ/q8cs3P4UjZbQ9SXdsHjTf0eRFzNe58hwJSngTU0Tuzul6lGWPuhl
	 /hKmzWikYwZ2CYjPF4paGzFDu7vSgS9j+NtOKr75a3uerWLLaUqihBtyisRdVBvogCuQX
	 RUJ73f7ANeWrMERCE5CVeR4g2ygQkm9cjF09hIZcVQQ8QVEOQyopEDoHLN48gWZ9ftg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552976;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PNm/0VgVT69MRChWsFoXlPJAPBooVfANlMmGLrAyLcVLgNwbdbE4ipcuhm9b3QwnE
	 FrBmOsTYH4NODwjJNTKWeSfimRzjNBnEUPRBaB6NfRAH9qRdTnW40JpvOb/ag+p+ue
	 49lvf+/65tP+szB2oX/pHnEWhQmxyYeKtgwRP3ukNTMTHfJJtqfZcL/z9zWoevxKJQ
	 Ekf3h0reH/4zdbY1CZWG4s6iP9pDe318SGjLHhBZBRCH/GV1qwB3UpSvijR3eNno87
	 e71mTuZg/6IWDOSAlDX5zUzReuH0Cy8N6hLCHVXyR56OMcjHr/6mVwA/Ayx9bYYFC7
	 EeGXyjdPkuEgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6533340357;
	Sun,  1 Nov 2026 17:09:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C06323
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26A2F40357
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urpoaF6vbaBR for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:09:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7577D4032B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552973;
 b=HpAI7651VHfo028pTnC86ebOasN23EPYvuJoGOg0HTBCJqLDDW+fYckdMahUSTxaf1Vh
 i54NsmyzVEDWV2zPngS3f+p1OFuExYbrIEVUC6woAGyPAWKELQqweyeW8tvUgeFf2ife9
 b/GH4yUoHXj6i0ikNhHCbGqboPJfMUD++aVe9P0QSIw6917CKa5gZUwi2jTjR1beRc/xn
 AU600KkwC7c+Ig8sICtKxzVLWfaDcUjFm7yXIEYxRfNbRm/BVKIP40TSZTigokqA4VHN9
 m/tfE8P6CGiLosNT7eqxsCX3BkM/Jsme4vIhI/21qejKgTHADqPg2zNIoo3C2XZUhLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552973;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=CSfrdGcNEg4Fpio0cOgGhjiAocHZMB1ymmZuNAYE5yyGNl8x45hnnWcO2e/npdBSffdJ
 knvKpOckmN7rchHaKGidw9Fq3MSZGV6Abgk0htyvf/QsW1+ofz0CK1Ax73mnVBl/Tdu/a
 x2mxKDe6j5Piy7Fb6Na0s1YR5YNymMkK7AVhz6OD62IYbzlrQRAQMXZvEBfnRmu5ZaJ7J
 s+4tYQ3djwV/+BOPtlcmsA6jFBq68Vk5nJK+G3szd1970yDXITFNXO1YyyalqjhbYfV9c
 CmEXgZSZE/wcpzTFuXGepKZ36MI7AxS83R6pWA55rSAZYbSXUQBliEjh0xqg6LVFHgQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DIRkREWG; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7577D4032B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:09:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 953EF2003C3;
 Sun,  1 Nov 2026 18:09:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:09:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:09:28 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
In-Reply-To: <20261031172019.2683287-8-james.hilliard1@gmail.com>
References: <20261031172019.2683287-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <9057d787207c86b2231dd97bd17a8595@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-iniparse: bump to version
 0.5.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
