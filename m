Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12B4C87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 12:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2E5C40AA1;
	Wed,  6 Aug 2025 12:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qt5CIJTXo6s; Wed,  6 Aug 2025 12:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1ED54101D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1ED54101D;
	Wed,  6 Aug 2025 12:58:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E3D4233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5443784511
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMxXGNsVFlo2 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 12:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E1C6844CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E1C6844CA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E1C6844CA
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 12:58:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -126968428; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 06 Aug 2025 12:58:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1ujdij-00Gdba-39;
 Wed, 06 Aug 2025 14:58:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20250806031309.201044-1-ju.o@free.fr>
Date: Wed, 06 Aug 2025 14:58:17 +0200
In-Reply-To: <20250806031309.201044-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Wed, 6 Aug 2025 05:13:09 +0200")
Message-ID: <875xf0k3o6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=uS7KVJIK1t2tSDPUGYSvzGqrxQKszJmTg9KBTgltLOuDD/nl4+NOqjLxDPgJzltmnIJwJguefbyqh9YO9Qn0AA8/J2FF8njpmeIcXGp6/z2J01tUOxkF0FS4lKNTeL/KuCCAcoccMtBtzf6Oamn8bUlee6iQCiiDTDTBy8VCEgrzbL6bHKxxNQuWR6hQBf8PQ/mCDhmqNL8e+r5qAvNhqysh0zE5hZTVPYLuBL5qs499v9KLyHKlAR4gUk/VVITekoSG/v7otnmDgve/EXsbShPhcGoIFthvSRNoZWQEb8sR9BNteXkT/uIWpvPspedVQDmaEXq/Sr8l4Pab3aL6ow==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=EMO5imLpHC7bRDm8xLOSJXsSyCaqSnvGcmvACGfeUcc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=uS7KVJIK
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.07.00
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > See release announce:
 > https://lists.ubuntu.com/archives/fwts-devel/2025-July/014057.html

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/10928033628

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
