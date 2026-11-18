Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4A606A339
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 18:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GwAOo3PI
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E8A81027;
	Wed, 18 Nov 2026 18:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fKXKHjHeXFXX; Wed, 18 Nov 2026 18:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 724FF80FB4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795026700;
	b=EIqHHY/1Eb3T/6VjWdbH8KkwKaWIJ9bRyzVCxrDdIFYV8vfYmYS8uX7uspKeyBXhx81O
	 s5RspqzD1yER/Zh07ZNDwthwr6xQ5qibtg4/W/oHeam8akYdwDdwWb9IL/jxHtOXzmoEm
	 k2DvctKQiVT/7ATlma2VzznknvNRCeSrvx6IrfFfjnylYIIgHvvEby8QGXQ4qEvQCmy6z
	 eeM+Tp+rl0qH9QiD98uUNEVdGvqH7YB/HLqwh9cl9gdn4jtx0H09FIEldPjCdAV3PwlMW
	 2uzUx+X5kGKrDTBN07K2r9P+6qLz/xqpSWa8Oho1yGM4iQpg3twiuN77Y7PgQiJ0sew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795026700;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kjyx6gNT3bdmtdk4W2tUm1NqAseCr0CHjFi4ZZhO8XU=;
	b=fX2mi4YvNcx3fhVxQTfxkbo/TFuD2nonOBtNVJZztxanPfvy9yRm7irue4Qv+corgNef
	 v736FuDA9wMZjM8ZeNdwfNymIFqGLQTPi0JDalZwB2rzkvgGnioRsag1w+M2v80Q/cpWe
	 g+Ga3Gpl/4ChPmzl8q+ex3tSjZ9wPmIQWAKV7oput/iNoCiDJno9Fd5rWUDaNndx8a4Dr
	 1FwEVH5+xNyldsI7B+vGbRNHaUXqpr6pOJShjCO61+aD0lraMYNXBy/NZKBPmUAm1Tn9h
	 qvANIr/8bliU7WebBCBIGpVsiABHbmFtsX6SzPV/+ooHMkHroq9g0+6i8m4OT2zGrSg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795026700;
	bh=kjyx6gNT3bdmtdk4W2tUm1NqAseCr0CHjFi4ZZhO8XU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GwAOo3PIaTvMHjOTHSaGrlECDZ+8wHdGyR4yyhhrLw3jztzPs8rYHA3i+dpvjyyzA
	 /C33UnkhB28w6bz+1Y2I0CHuOWaYhtn/qJPukB4wtVrN9TijLlKkoNZKUhWjnZWh9x
	 8Cp5Px1Bg1MXhGbGf9FrB7jyoRINfj582WYj2PwCFe6Caj8hpJZ1WjrsxZFGXrDEdj
	 Usgj9hjfgEAQ8G+6+F5rVLewghDU8CY5kxSi2dYBv4Lec1Dj3rCXpjAN5GZK0FF2X+
	 YwbSUVQRfY2BLapc9cgLD2e6C9yl7V5HXzQXMzSvaRzpr2Xm6lfW43BOJB3+J3jr6p
	 LsXdVs3a+ksnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 724FF80FB4;
	Wed, 18 Nov 2026 18:31:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D004B13C
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1EE4400A8
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F97o1OGWiWSx for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 18:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9A9B340095
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A9B340095
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 18:31:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 39A3219F57E;
 Wed, 18 Nov 2026 19:31:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 19:31:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 19:31:34 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20261118182004.190167-1-bernd@kuhls.net>
References: <20261118182004.190167-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <fe13d31f2cd5a44dfad2101121af83b7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: security bump version
 to 1.5.5
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 19:20, Bernd Kuhls wrote:
> https://blog.clamav.net/2026/11/clamav-155-147-security-patch-release.html
> 
> Fixes CVE-2026-76411, CVE-2026-76414, CVE-2026-76415, CVE-2026-76416,
> CVE-2026-76417, CVE-2026-76421, CVE-2026-76422, CVE-2026-76430,
> CVE-2026-76515 & CVE-2026-76516.
> 
> Removed patch which is not needed anymore due to upstream commit
> https://github.com/Cisco-Talos/clamav/commit/f15e90cfa57753b6c475bafe044e071853215bfa
> which fixes the problem differently:
> "Keep cl_ASN1_GetTimeT() through 1.5 so code built against clamav.h
>  keeps working, and mark it deprecated. main removes it for 1.6"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
