Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B022C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6BD4064C;
	Sun, 16 Jun 2024 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jA5xGSGHjbll; Sun, 16 Jun 2024 10:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E21AE402C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E21AE402C4;
	Sun, 16 Jun 2024 10:25:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67F931BF31B
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5424E402C4
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 10:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLIbgQu1tiIK for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 10:25:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D6B4540297
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B4540297
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6B4540297
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 10:25:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05CB9240003;
 Sun, 16 Jun 2024 10:25:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sIn4Q-001TKK-1E;
 Sun, 16 Jun 2024 12:25:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240611205205.1C12587EEE@busybox.osuosl.org>
Date: Sun, 16 Jun 2024 12:25:10 +0200
In-Reply-To: <20240611205205.1C12587EEE@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 11 Jun 2024 21:55:21 +0200")
Message-ID: <87sexdp4l5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] editorconfig: leave patch files alone
 wrt trainling spaces
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit:
 > https://git.buildroot.net/buildroot/commit/?id=85736a27c8cdddcc65ff769852fde60834f302c7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > It is perfectly valid for a patch file to have trailing spaces, when for
 > example an empty or space-only line is appears in a hunk: if the line if
 > part of the context, whether it be empty or with only spaces, there will
 > aways be the leading space introduced by the patch itsef, making for a
 > sapce-only line; if the line is space-only and removed (or added) that
 > will also appear as a space-only line.

 > Currently, our editorconfig wants to unconditionally drop trailing
 > spaces, so when one edits a patch file to add their SoB and Upstream
 > tags, such a patch would get badly mangled and would not apply, causing
 > quite some grief and questioning (sad experience looming in the recent
 > past here)...

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
