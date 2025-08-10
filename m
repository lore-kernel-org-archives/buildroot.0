Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71906C87FCF
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 19:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC646102E;
	Sun, 10 Aug 2025 19:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGppuVbSBHIF; Sun, 10 Aug 2025 19:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F0D60FC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80F0D60FC0;
	Sun, 10 Aug 2025 19:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36B4031
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28684822A0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSm5ixQu16iT for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 19:59:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CFAC8220A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CFAC8220A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CFAC8220A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 19:59:56 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1114270345; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 10 Aug 2025 19:59:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ulCCq-006nA7-0v;
 Sun, 10 Aug 2025 21:59:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
 <20250810124820.2116495-2-thomas.petazzoni@bootlin.com>
Date: Sun, 10 Aug 2025 21:59:48 +0200
In-Reply-To: <20250810124820.2116495-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sun, 10 Aug 2025 14:48:17
 +0200")
Message-ID: <87wm7bne17.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=UfEhPVNP2BlbYVMlRwNOheYlKG62mgLVu9+2ktHAtjVQTtSOtdBxbMzAQxdrJ+N3yINYzHhqlh8fdzUziJxoPgQdPvqQMffl8tik4VOk46cv3sThSG3ZWlmzu31jb1hZ8RFUJ1Ryd77NUiXIvDeHLKJlP5DIYjWr6xxZdT+ovUCVaGcCAKYLc1akQLKfcJrEdsd7mlhfGm1itxtE+rLXdvp07YS5z6dOO906/Dg0RLRM0Db//jwFJ5UUXK25sPZ0JlnhvUTgnKzUcOmGsvAxy3VZkVeFrXoCqELbC21T3Wi5PccyOgDWvd9qTkQay05fb2QCTJpcSnFPo/fJIzludw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wDWWaYbiak/VLSrtKOtbW2IpC4cZrz5GOnKnJy+rD1g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UfEhPVNP
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 drop tweak for Microblaze bleeding-edge toolchains
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > This issue has been fixed in the Bootlin toolchains thanks to the
 > Microblaze "atomic fix" in GCC.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
