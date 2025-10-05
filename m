Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF56CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 13:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F275409F0;
	Sun,  5 Oct 2025 13:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VeXpfv_4MFoz; Sun,  5 Oct 2025 13:35:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5760A409F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5760A409F3;
	Sun,  5 Oct 2025 13:35:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1565B226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07840813CC
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-4KravuMaHx for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 13:35:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7935F8143C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7935F8143C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7935F8143C
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 13:35:17 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1160153956; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 05 Oct 2025 13:35:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v5OtO-00GmIT-0R;
 Sun, 05 Oct 2025 15:35:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,  Alexander Dahl <post@lespocky.de>
References: <20251004100747.1412268-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 05 Oct 2025 15:35:14 +0200
In-Reply-To: <20251004100747.1412268-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Sat, 4 Oct 2025 12:07:47 +0200")
Message-ID: <87ms65320d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=JUmWW3jYXYINvy1+3cd8cYJqwH5KpEB8U85BsOJbFgeO6yDgoFOA5FuvvdkOTAfeLzQKcRvRFEFrRIEztlb2p1/RVgebIFObERym6cv5udCpyRcPdCexwKK98TUeeNE7W/3xZekacoeAtPaYH7cGcQQlEiou9vj5/nYTfJ6QF7M+HkFuEAoop74Wu/2EdGJicgpOoQjiMZl3hZzLeHGa26G/dlLCO6iYg/ddhd+o5nK2N+woWsoFolO/SIwbc2ZJkfxuMJ000MEruiM4btEWpMwHYHj8DeToMBS27a8tqm/G9fLsufdZ5m0xRtX9DNXHt8YVTAFW76wL4HvOsjPXgw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=pWpTkZeCaNf7huFhEMzceqX2kZPbtrkPVI2DmxLWcKk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=JUmWW3jY
Subject: Re: [Buildroot] [PATCH 1/1] package/fastd: security bump to version
 23
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

>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:

 > This bump includes the security fix for CVE-2025-24356.
 > Fixes:
 > https://www.cve.org/CVERecord?id=CVE-2025-24356.

 > The COPYRIGHT file was renamed to LICENSE [1]. The hash file was updated
 > because a date was removed [2] and the libmnl version was updated [3].

 > Release notes:
 > https://fastd.readthedocs.io/en/stable/releases/v23.html

 > [1] https://github.com/neocturne/fastd/commit/fa88c739b9afe053905bddc7fbb9c252e290c35d
 > [2] https://github.com/neocturne/fastd/commit/318c944f40c90e048e370b2f75598bfcd79a1790
 > [3] https://github.com/neocturne/fastd/commit/c08a3d59debddf5f99e442d9529a142f04549b50
 > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Committed after updating FASTD_LICENSE_FILES, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
