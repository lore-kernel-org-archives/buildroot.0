Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D019C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1852541B8C;
	Thu, 29 Feb 2024 15:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SpAYJhed8Nlu; Thu, 29 Feb 2024 15:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A255341B74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A255341B74;
	Thu, 29 Feb 2024 15:58:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C9FC41BF25B
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5EE940257
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bvq7eqpB7TjW for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:46:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D910240139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D910240139
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D910240139
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:46:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3F4BE0007;
 Thu, 29 Feb 2024 15:46:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rficY-004oaD-10;
 Thu, 29 Feb 2024 16:46:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <e050e870b2afb35643036a87df540add584c95b4.1705594130.git.yann.morin@orange.com>
 <20240206115300.0bd8b584@windsurf>
Date: Thu, 29 Feb 2024 16:46:54 +0100
In-Reply-To: <20240206115300.0bd8b584@windsurf> (Thomas Petazzoni via
 buildroot's message of "Tue, 6 Feb 2024 11:53:00 +0100")
Message-ID: <87msrje0i9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] docs/manual: extend makedev syntax section
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
Cc: yann.morin@orange.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Thu, 18 Jan 2024 17:08:50 +0100
 > <yann.morin@orange.com> wrote:

 >> From: "Yann E. MORIN" <yann.morin@orange.com>
 >> 
 >> The section of the manual describing the makedev syntax is not
 >> up-to-date with the current features, and does not properly describe
 >> existing ones.
 >> 
 >> - extend the list of types with the requirements on the existence of
 >> the target file or directory; for 'c', 'b', and 'p', the existence
 >> requirement is inherited from mknod(2):
 >> 
 >> ERRORS
 >> ...
 >> ENOENT A directory component in pathname does not exist or is a
 >> dangling symbolic link.
 >> 
 >> for the other types, the existence requirements are extracted from
 >> the source of makedev.c;
 >> 
 >> - format the types fags, so they are rendered in monospace;
 >> 
 >> - extend the 'mode' description, as it can be set to -1 for 'f', 'd',
 >> or 'r', so that only the uid and gid are set. This is most useful
 >> for 'r', where setting the same mode recursively for all the
 >> sub-directories and files alike does not really make sense; indeed
 >> in this case, the modes are usually set correctly when the package
 >> (or rootfs overlay) installs the files, and only the uid and gid are
 >> interesting to set;
 >> 
 >> - extend and update the examples to show-case the -1 mode use-case.
 >> 
 >> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 >> ---
 >> docs/manual/makedev-syntax.adoc | 33 +++++++++++++++++++--------------
 >> 1 file changed, 19 insertions(+), 14 deletions(-)

 > Applied to master (with the typo in the commit log fixed), thanks!

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
