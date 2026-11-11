Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E64E606A31C
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Ms2THki9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=BTpqo4zi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43EBE40AE4;
	Wed, 11 Nov 2026 11:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id By5uz5S7GATF; Wed, 11 Nov 2026 11:14:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C27440AF4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794395676;
	b=gDq/0bRS9Y+5Npx0zYK7iMaeeaJkcPmmXUhi3uVnSOXYxcosPPigBR3XDgfyoF8Wrd+r
	 VGPXl0p/rNpKy9qHsteHHw0JnCzD6esJ7/vN7thgmsTfBzA995CbIVdAWBiN1FngJJNFn
	 lVWx23Orn0mgBNbFXclXsXPPRfcrBx1a0I3XXhMGZeC1kcBGs+b4s1YYtsdfuGMuapOsA
	 osQQO5Hg0lmyHxRAiCJJEfpXTqgUCqtXgT2QP5hSDw7q8bFx/wMLZpRcSq1J3dkTB6Swu
	 7amQ7STC78PkKoMt7sHyH3RoGkvEWXwT1vLfUwznYNREjI5uPQIRevnQmLdOTgPp0Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794395676;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZQbgkOShADYlNB4u9S048NA0u75O/tFt4UqJKORV7xY=;
	b=bT0zd8U6vq2LmiZy4z9nXvF5OGprGxAuWPHACzHRkzcfMn3UO52budxaQ1cb+9EmFkHT
	 QAWxRzdX6e4YF2iZk9ES4R0U5xu00ljbIcikt0FdceQrwmAAtD+AzWAqhRaaEw3abWMtx
	 8ggejVazc0USQDAdpQjhnoyVHzvGXWyq2RsXf2sZ8vkjwZUjRmwj+ib8nORw522d+/WDM
	 uddql8ZJnO77XQThC/DtM/Xfd/qGrboIWWaCXjfcsqIHJwoymfqGSXeUsHh9SxsbtESJY
	 QE4n53Uon8kKjT+KArL/BDWttWeMO75EROxTs3mI5/snWSTN8vJnIacT3q39zVf228g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794395676;
	bh=ZQbgkOShADYlNB4u9S048NA0u75O/tFt4UqJKORV7xY=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ms2THki9cMhyB0iO6lWW2rDBxeHDGnBhMOu6Wflii/uF8qKW5iN8m1LzPaZjk465P
	 +rFoyuqIImnGLw7E5CwyYnqVYloI2iFxk3U3RqqhHL/uA5RKwQqLHMrQpbetWXDKBG
	 1LGACeiBw4NztdMgZpoDaQk0ws+fYScvtCVYkJToNTOLj3YxYpQvUJ/DYme3onIA9D
	 ulx2S78/WhwfMO47ANILuzL92DM4AL2XHnjDpGdtWLJhUMGb0GWDdjAmCZBOD9a5N/
	 7a7Tho2cmUELvLd7OiXyfaY66MxuF2BLQ1KhR9mwvkLKYv3HISFHr2LTlLmGF3MdPf
	 ByI+ICKqAVM2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C27440AF4;
	Wed, 11 Nov 2026 11:14:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6737B17CB
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D7D981312
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AV1DQeEyndY9 for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 11:14:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 76E94811D8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=BTpqo4zi
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76E94811D8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 11:14:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=BTpqo4zi6GDKnpU1hEIiRIxniuUNbMWRuDPX2R0le9Xt+iTZheHuYmKec5tLO47A0H7Tul8ud+z0V0u4HdLJBZdQvdwH8O5g9l+7IWsnk0FtJUMpUspYKn5CbqpkIfdoQ1j38QFR7LjFh7fE4hgYK/ZSu1XAs7XrVhDAiGhv5742cPOODQme6jvDNt8dvrGp60/Jwti1fU8dflEbp2qnDq7FBSiPCuYgahSc6ftcwPUQ6x0/u9q4mNV/MZY7oH/0CaPyH4XyEl/crfW51r2yu2mF1Fx0Nmxw9ClCeLGunw/x7JbCkedkFP9kZw053zUMUnLZWsnefNpPt9SxInK3Rw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=CORqL7QomjP7Br17uscpDCAnr4DzdQEXLkz5PKlxzhE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -883100060; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Nov 2026 11:14:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xR6Ha-00000002QvJ-0n5E;
 Wed, 11 Nov 2026 12:14:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
In-Reply-To: <20261109123245.2226001-2-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Mon, 9 Nov 2026 13:32:28 +0100")
References: <20261109123245.2226001-2-buildroot@heine.tech>
Date: Wed, 11 Nov 2026 12:14:26 +0100
Message-ID: <87h5hnk4bx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/fmt: bump to version 12.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@buildroot.org> writes:

 > minor bugfix release.
 > changelog:
 > https://github.com/fmtlib/fmt/releases/tag/12.2.1

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
