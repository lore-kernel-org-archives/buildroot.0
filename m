Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFC7606A330
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 19:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ebfF328u
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D286C60E21;
	Thu, 19 Nov 2026 19:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9n8vsIiyXHq4; Thu, 19 Nov 2026 19:37:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5634160E0A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795117058;
	b=qNdSeZdxEjO5xaU3JiNREYyGnZe/W55mZBOrI7cmAlyo1mpw1vz4JX0XM7UKfblrf41e
	 Dj5j/L8On7/f1/HHpLYhDtOZF420GNPJKP1NGbFE+bRZvkdfW1dBPMugDbjrhBgPw3XMZ
	 tq+7g7X1cC7BsjEAmf23xCOpsEggv0EY0+SIOZdyg/8Y0tljppv83n5YDUC9/2OBzpXlJ
	 Nkj2/rkSCNkcagHqN1YX62CErT3mE+g3O1fmkOG0+WOhptdG8QosD4CD08S2gm4tEpgIM
	 f9lZtmmhZERQMrmWmTWKishO3+2Q6gJzpuIf4yDucP0fcwniGXz3qjy+rfXs8hA4rVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795117058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ewiKmBhizCewdBpyhzzU8AA06ENDTatpogNB9uJ9aDA=;
	b=GA9NgUZSzUDLgkkQYX2Fr9I5As8h9EPt+ZTw0D9b3qIW3inL1jZr2UkfN3JxBC6x0dkb
	 XAbeDxWbFYzdz88NIrACWUYyACG3f7bn12bhHcGZ2N6mL7qy0yW5FTT4y7a5PnhoudFDk
	 0Gb4UVPhoAVyl5jE/CVupLgmUIitz9RcSiPMo6z8WBThP4xRK3DHWAirdZQQK4NtKq63R
	 5ueZ2JA7mcYqYhX8v6n9CNu3djdB8iXzOqesn20mKvWkdC3O5KBmf3mokPwkxKJhHOaM8
	 OVgaLDsyRNdWb/DphkPo2oT3RhITckaClAR7mzViIfSNmI2ODqeCqLrpDfB79beuc3g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795117058;
	bh=ewiKmBhizCewdBpyhzzU8AA06ENDTatpogNB9uJ9aDA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ebfF328u23pmm8CCOirknTBTCmcflMGaN3KTLZrwkuNo1qWakY3LWikqaqu9SwlyZ
	 02hsQFKzJWRYvn0UmLEu3IgA5v15fijkviWsCS/EiZuyfczhRJioKRFSB2egNRkOwX
	 Nh1tQ/zhox6uRoa8oRv0ICXcI4Lr9oli2tvyIL8XSssMzlHRDSdVLbd19D6GEgbjtq
	 gfI4SmREBE2bcqBdvCh7Hv/ctuhPgtC3sL39BClXaD5KsMpgiAXfxn04kK/GeuQOZZ
	 1vqK4WGQ1qImdx0T/d4N/SYIl+q4e5CV9O14Svws3LXR6aeulOFmSOEc8AYcVDaoid
	 V9ipEts7cPrhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5634160E0A;
	Thu, 19 Nov 2026 19:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82EC13A8
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74B98400DB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sauqQ-oqKT34 for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 19:37:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 99F9440099
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99F9440099
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 19:37:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 9A338B00576;
 Thu, 19 Nov 2026 20:37:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Thu, 19 Nov 2026 20:37:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 20:37:31 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261119160005.628790-1-peter@korsgaard.com>
References: <20261119160005.628790-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <40cb13f314a9b19712b0807b378defc2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/ruby: security bump to version
 4.0.10
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 17:00, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2026-89078: Double Free issue in Regular Expression Parser
> CVE-2026-93577: Integer Overflow issue in Regular Expression Compiler
> CVE-2026-97229: Integer Overflow issue in CI/CD Regular Expression 
> Compiler
> CVE-2026-110264: Integer Overflow issue in Regular Expression Compiler
> 
> https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/
> 
> Heap buffer overflow in case conversion of strings
> https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5
> 
> Double free in regular expression compilation
> https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x
> 
> Integer overflow in case conversion of strings
> https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px
> 
> Out-of-bounds read in case-insensitive regular expression matching
> https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r
> 
> Heap buffer overflow in regular expression compilation
> https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4
> 
> Heap buffer overflow in Regexp#to_s
> https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4
> 
> Out-of-bounds read in case-insensitive backreference matching
> https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h
> 
> https://www.ruby-lang.org/en/news/2026/11/18/multiple-vulnerabilities-in-regexp-and-string/
> 
> Release notes:
> https://www.ruby-lang.org/en/news/2026/09/15/ruby-4-0-7-released/
> https://www.ruby-lang.org/en/news/2026/10/22/ruby-4-0-8-released/
> https://www.ruby-lang.org/en/news/2026/10/23/ruby-4-0-9-released/
> https://www.ruby-lang.org/en/news/2026/11/18/ruby-4-0-10-released/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
