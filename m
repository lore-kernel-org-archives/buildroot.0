Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29662606C985
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=WwjXg7e5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=olHlGos4
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0499D60AB8;
	Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFvA7wYc509E; Tue, 10 Nov 2026 21:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4988A60AAC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794347954;
	b=BGFnifSPqoyqQVN1alihW6bCqfY6d5kIbgB1WIpLZlMECDErTAA254PYHHeKBeYXIyih
	 eJNLrXyWynn6kVmNGMKGgu3aOqAT8Y3CACB0MtShCfDJGIlJ6XZN9Lek0cK5/cS9qLXES
	 j26mIaYJJUYm4y7vFK8AbyaAZ7d9K+pHwguedIRzBEjO3r2+4dXx+eXj6zIOrmTXFHh7F
	 59aVVkJBHQxc7jn4TVrp9JPvtHeIckmVGhbjUEFtXCul/QmpYGoA9a3T1qsF8gvQd5mOd
	 uKmu5m8geZ6P/MPkAFISMPCHF6hD6/M3bx7J73vjXuBUzq44K+7vaXr9muSqcqJzu8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794347954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=O1WZENiBlvll+uIKCVPFYtnaZgOWoYlfDikyFsLJW8Q=;
	b=c1I7Uyf6R0U0TTareFAGLJHbBnzNpx//ZXkVbB7NfwJqFhSLyTssE6YNWxjUq+SM2TVd
	 5uWbEl08JhGf0HhMEyjBOyQ9xbyEKdVcYfBnqYLvj26QyTy/Qt8WACF8SZYO6t5J4wzNU
	 HZMSmU9u/ZxiWPBAE/gmHULifWP+D+Z/22PJ7p+lXdOosU9BccVP/OLsQWwbr1MMJjle2
	 pwl7vfRa6LS/Y24Goiyhssxk6veoACin2kBcg3nwQKn4pO6GM7TjmhtqvFZrN1XwBVDCf
	 hkoagTAiP29M+0B7MVYSH3vtfRFfMkmSisuKhknYgn2GouD1FCvkcxk1vLlvAOhen2Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail3 header.b=olHlGos4;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794347954;
	bh=O1WZENiBlvll+uIKCVPFYtnaZgOWoYlfDikyFsLJW8Q=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WwjXg7e5DJ51f0EOad8XdZCBE+3YJvx/0DlQnzQg/QMER79rX8HjveJqvvhm5db8h
	 lkH8uRsK+DS7h90Vub4QsK91y5i+Bz4fW54UFqh3LwpqSOc9RbVz/Gaes7iRRzSPdK
	 JrZHqmaOXQpXFRKv/I/IapLkdGAvervO4PhGkA1YDYyQuIvY1mEBu1kStCXep7FxX8
	 YEJ+QWuazDkzVffPeQvgYxEU97dccZnVGeIuWeTJCjBZjaJ79wG28X0ByRAM1r9XNV
	 FhOgAvVA4mTn8xtUpT1O1o7NmRNB+M9RtEErtGCTdSszScrlfHptRz+Xwej1Qfte0W
	 pJyKH1bVQ/H0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4988A60AAC;
	Tue, 10 Nov 2026 21:59:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8D191FC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA2CC60AAC
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caTniZ69ziMe for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 21:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C34B860859
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=olHlGos4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C34B860859
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 21:59:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=olHlGos4F6v7nF79B2BmAfO/e1BhNuJgiGtmTEzBZFdwwLElTz78MY6ZYoHiXq//TCZHQbXV/UOaGyW/uwpVWIOCu5iOGFMvD2WhKJTE4RxOg8/7Kyslhch1tGPAiDQIQNRYCoDUx5ffXDCplAUvu1eUqfVwL6Yuml3KrjJgcko6EV3yBj7AWYK9I21vQC191Vt6CkCzR+afrUebcMtFECJuy2kwu9U+sQuu0GPLMqzfLRlr5ZiukQ1QdvzwPXzGvl1RWJScmPLdSahoqeoSYSZYxQTykt9lpQ4AHJp1+V2ga8gz+1ng9VtFUwPwLLpNSOcM95JHYNU6f1DbcvwSNw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=N2nBYqJUJPHT7tQwemy7TZ2wBn3PfPFFnEpQNMw2rHA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2027971742; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Nov 2026 21:59:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xQtru-00000001tud-3wEP;
 Tue, 10 Nov 2026 22:59:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAGm1_kteJW7+sSRg1m43k=Tn5r_ARZGAUZLwf8M6gQrXJU8s4g@mail.gmail.com>
 (Yegor Yefremov's message of "Tue, 10 Nov 2026 22:42:28 +0100")
References: <20261110105623.702862-1-yegorslists@googlemail.com>
 <874idovc2y.fsf@dell.be.48ers.dk>
 <CAGm1_kteJW7+sSRg1m43k=Tn5r_ARZGAUZLwf8M6gQrXJU8s4g@mail.gmail.com>
Date: Tue, 10 Nov 2026 22:59:06 +0100
Message-ID: <87eccstkk5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libaec: security bump to version
 1.1.8
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> Notice: My tar complains about some unknown extension headers:
 >> 
 >> tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
 >> tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'
 >> tar: Ignoring unknown extended header keyword 'LIBARCHIVE.xattr.com.apple.provenance'

 > Good catch. I opened a related issue:
 > https://github.com/Deutsches-Klimarechenzentrum/libaec/issues/69

Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
