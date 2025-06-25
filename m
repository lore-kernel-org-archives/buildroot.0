Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAAFC7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC0B683F91;
	Wed, 25 Jun 2025 13:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvnFQw884VUf; Wed, 25 Jun 2025 13:56:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 255F583F97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255F583F97;
	Wed, 25 Jun 2025 13:56:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CF565E27
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0A1141C4E
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvxHJ9ry3Hru for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:56:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0AF2541C25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AF2541C25
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AF2541C25
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:55:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2008838261; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 25 Jun 2025 13:55:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uUQbU-000Vbo-36;
 Wed, 25 Jun 2025 15:55:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20250625125220.104466-1-peter@korsgaard.com>
Date: Wed, 25 Jun 2025 15:55:56 +0200
In-Reply-To: <20250625125220.104466-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 25 Jun 2025 14:52:19 +0200")
Message-ID: <8734borklv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=0VfsADk15c4imcIkUUEGaaRVVa0CwH5Oi3NiFNW1nWCp7y+W16dN1VvpifoPnfyR3vFgndiRGP19VNAubPJHGQ9ogx8eY3r2N0H9b+h5UFNAmhklP4S2bcH9tcaaySlIc4AOEoKCUBxucI/O1XesOLtuuy2LvlpVQSfBxpp7fTkhs1DYJwsIAH1llLgo5HNwVDq13njLT2gkECmDvZMcAxTFHBvqsc0hwSFb0ipKJoxD2oaOGucs11ubt25NKYVkyH8vhd5Y/wJ1aN0hVjmfBfPiinXNFbzBPeqfOgPzBHwTisER9jgRK7yKQb/nDie976uuDjzOD5MmigKlcIkuvg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=5Pe/4ZKQr2gs6p1YJUgrYsP5UCMNNtt0anPub76htVc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=0VfsADk1
Subject: Re: [Buildroot] [PATCH] package/libcurl: unbreak threads + c-ares
 conditional
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
 > conditional for threads + c-ares, but ended up with a end-parenthesis too
 > many - so the condition is never true.  Fix that.

 > Reported-by: Tibault Damman <tibault.damman@basalte.be>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
