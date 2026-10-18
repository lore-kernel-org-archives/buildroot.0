Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526E9CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 12:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0B4B60656;
	Sun, 18 Oct 2026 12:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWl1RkazAmxo; Sun, 18 Oct 2026 12:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9FC506061A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792327383;
	b=dzL7wPj5/jnOLrBlPsPjUEc1i7J8+2FviexkQVRARNTHkwykC9UY//6HJfV/6KbOebk9
	 YqFKZgODGwfM7zbj3EfO12rrvpo9JZOId+zW2ULpxWS73IUEqTxUa3SckMGt+hQjjjthu
	 Ta6gydMGh/kWG/vzhKOEvfT6hS0jLWJ9nYxhjzn6kpBDl6BgZNlXLTotOM4ZxiTkiwki+
	 q54N788K/tkP7I6oeDli5iBrXoN+UW9e3vmP3TcMXLT7cw8rZcQ90nH5N3qz1epKTtMQi
	 +GJ5XNeWzuZWS7Nlrho5+xUkhA9u4K6dZR5S+6i1egdDk+Y0P+CUlP1H5w/7ZOCul4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792327383;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=a9DXn8usw+sVHjWDpoZkqNcD0kIkM20JSrgo23mZYyM=;
	b=FPJHvFCwL93gUwTdMOjw4RFmJFA3LnWKedoXlNV7691DChhGyOA59lWE4olYEE6BZR8R
	 OtLGSIS3pPDfuuFRTtUpCuGPCWEFdzI/bHWNAk1Q8o82cpHsfNWp64tXUmFTJN1fmcdrM
	 lpAssh3EYPEawI9jkIqMcjw9EWYPP0aR5/UEwgyM1+nrv8AZf+BPLdOycF7UP9oC2dlUS
	 c+iSILeBLCpNQJtocNLUfx2mZcPg8x2MLuf8u4mFZwO7bPLNot2bAfPMCHiHXFw3Jn3xx
	 th4fkOwlznjn7Zir5/prCFuzU8sJcs0fj1VRAGGh6PbKdngcTr3Ec6NLTur4orKFp3g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792327383;
	bh=a9DXn8usw+sVHjWDpoZkqNcD0kIkM20JSrgo23mZYyM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrArAraFmo9EHn4RhHOeQ5nAPA60q3z0zV9Yks9x5VX0CQLv25/o52aehIjgXIE4i
	 d340S6qcwjiiJlVNW7vEmw64ab03eDSNYANr9FOnGBeLCHRCGhkn5Wm0pVUfaBXjLz
	 SPsfYpoPNAGfZWbfrxKgqbvi9HP7Tg7Rq3reMRUUb5JGQiobb5MEBupnyX4HxUAbia
	 tD/HiHL0m5Zy4++ZQerotNOaVVI6axnVh20Bi6mbjYB8dvsxY3fSwofJTZpwY4Svpv
	 gdIgQ41JMEwqKDJKRjrhfQfWEZ255lGSSQufXbTOHfRZlI7dmg88GIKeg/gBigngm9
	 ypYMNEgCYnzQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FC506061A;
	Sun, 18 Oct 2026 12:43:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6B5B1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8FCB4081B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDld331ReXPA for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 12:43:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C713740818
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792327381;
 b=raJdY68li2ojrnxELRMXkg66y35rFnOs0oAXT+rxfroyTqrKLH/gOGpI/jAlISH5xLMm
 mHuaGSejU2Px7bGQ9zar6bzMQsoNxJGHX6+d4eCQSJy1sZMUJiDpS/aRKTlK3xsGBOZvv
 FCiCjPiDzzcP1xKvV9+2yIuyPH2+XiA7Wz+IKR/1uYVvqm4rpuFsbpr/HFSuHJ9DrrS4U
 iQYVXgmLZtKPKfmNcUCZYqnhkz2cbQJX4RILi7T+yMYPdOeUTkCMUxkZwNY+w22GP3BN3
 PPvZsxPiqiRiEC/bcqH6d4gMDi3vt/TmRzv3iFlTC7282O6VtUCXuEPyEBOWvhnI/7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792327381;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=Okt8VbKL8FvY57MI6ndNdhzU2TMsHoPkReVkPm0APW8=;
 b=Ge9uUhGdsieFCVQESKhb/OtZAJcBm9Ov08CgF/8LvN05nURDWxIRbvmI+XI1vlL0Fx9k
 qUS4QBRKZvlK6CS8BKYZp6DdMD6wdT6VQy+AwGUGj5JMlQDXj6sINIB8CZlIsD3nig4QT
 GuifXRnkbM+vVfS7dqn/JEkC47cyBAGihOXeiNoyVqMcspNepQ3QX6k8EhC2rTU1bxv/S
 UZIoBbUy9yunONHH0CsKzYbfKYfY/bo+/tMTZEwtFKZv0TKXSroXnKY6/gHm6aqnvleYA
 wNRKXPiJt2P0Y5PCisxbAVQCTCSq0w3surBEYpj7QOrze7z+ZDC0/Hk5TqYqoCDjkDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=AclMQLiV; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AclMQLiV
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C713740818
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:42:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=AclMQLiVpXFofuC79SXYR79eLSO14tSQIll5jLy7w2BZh/PUIBhNBGasXXT6lI4wrlmVc2DuHHQyIZg42eD0iZczM9kb4m7CkdzrbLaHTGsRkiiZ7JGGozyuXLT/J7EEVBs4IbM+/BU+D9qeSu2pxHUiGTMYm99ewoRWYdos7Uamq54HtlXnbLW5i1aWjmPNLs6GnhYFQANwl1oiqPFoEUK5m6ke3/BriCapRUtAv7/HECn8zgAymCfE858+jSM2glk+RUCpl9W9u64hBdRTc8yLIoKYnOpS/ogElzgLlhDqAPUKk2RjQXruF7+oFd7haOsAN1wLpJBBVqdSlHPcYg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=UI5GddubgVheS4sKkeDrTJF1gJpgpB3yPcw2OggHWQk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2033375689; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 18 Oct 2026 12:42:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xIQE3-00000001Z3f-1UKV;
 Sun, 18 Oct 2026 14:42:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>
In-Reply-To: <20261018120941.1476904-1-fiona.klute@gmx.de> (Fiona Klute via
 buildroot's message of "Sun, 18 Oct 2026 14:09:40 +0200")
References: <20261018120941.1476904-1-fiona.klute@gmx.de>
Date: Sun, 18 Oct 2026 14:42:55 +0200
Message-ID: <877bjf2n8w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/download: enforce
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

 > BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
 > if any download cannot be successfully verified against a known
 > hash. However, support/download/check-hash would only warn if there
 > was no hash file at all for the package in question, and allow the
 > build to continue.

 > This is a security fix and should be backported to all stable
 > branches.

 > Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Committed, thanks.

Maybe we need some more download tests?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
