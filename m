Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D6FCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 19:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C03C82BED;
	Tue, 16 Sep 2025 19:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQOiwzCRPt59; Tue, 16 Sep 2025 19:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3138582BF4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3138582BF4;
	Tue, 16 Sep 2025 19:56:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A58199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E833A82BF4
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTN0Sjk5hW-1 for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 19:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35B3E82BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B3E82BED
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35B3E82BED
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 19:56:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1075019549; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 19:56:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uybms-0033lw-0N;
 Tue, 16 Sep 2025 21:56:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org,  Adrian Perez de Castro <aperez@igalia.com>
References: <20250916122005.30652-1-thomas@devoogdt.com>
Date: Tue, 16 Sep 2025 21:56:26 +0200
In-Reply-To: <20250916122005.30652-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Tue, 16 Sep 2025 14:20:05 +0200")
Message-ID: <87v7li9no5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Os43ZjEQCNZ1/zkoYgddDVdCA3d9ttulcN2VUhJOEdduLmMiBiJx60D5+bOWzp7xOEWIbwi2/1QNr3bKE1oi+HRIyNdc8ESy0FY8GjqVNdVrvy/K1AnxUdVJc9h8il8PsUd3L3xnvA+ZTgYQdiH22FZsL4/RVyZDBRFB24y92otJz9SQr99dvmb47aq2Ov+CK9EyMHLlY0NCPS1DPbnDxUwgzbCNzrgA4lS/tjwUK1zXnsOeRinUs9oJujueY5Dit9I8I4a7Fqvx7RsevNv42L/dlc7wKq8p546xR6sS4VfnZsaHCMgYiN1XVsdV8duUCaIrzU37+BUBfpl3Hjz8Ww==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=rJyQYWj38YmhdlHQXJtnAZfFGY8RbS7xMnyaF7/sT0o=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Os43ZjEQ
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to version 2.48.6
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Fixes a number of crashes. Release notes:
 >  - https://webkitgtk.org/2025/07/30/webkitgtk2.48.4-released.html
 >  - https://webkitgtk.org/2025/08/01/webkitgtk2.48.5-released.html
 >  - https://webkitgtk.org/2025/09/03/webkitgtk2.48.6-released.html

 > And brings some security fixes. Security advisory:

 >  - https://webkitgtk.org/security/WSA-2025-0005.html

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed after marking it as a security bump, thanks.

What about wpewebkit?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
