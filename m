Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E997C352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD63D81FBB;
	Wed,  7 Dec 2022 13:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD63D81FBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id we1krseIrBU4; Wed,  7 Dec 2022 13:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0292381F64;
	Wed,  7 Dec 2022 13:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0292381F64
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B0D51BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3591240247
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3591240247
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-1V-zM6_L74 for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:34:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D789C40293
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D789C40293
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:34:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B420024000D;
 Wed,  7 Dec 2022 13:34:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p2uZb-00GsPn-Vh; Wed, 07 Dec 2022 14:34:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221126131310.51007-1-fontaine.fabrice@gmail.com>
Date: Wed, 07 Dec 2022 14:34:55 +0100
In-Reply-To: <20221126131310.51007-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 26 Nov 2022 14:13:10 +0100")
Message-ID: <87bkof49s0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/git: security bump to version
 2.31.5
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  * CVE-2022-39253:
 >    When relying on the `--local` clone optimization, Git dereferences
 >    symbolic links in the source repository before creating hardlinks
 >    (or copies) of the dereferenced link in the destination repository.
 >    This can lead to surprising behavior where arbitrary files are
 >    present in a repository's `$GIT_DIR` when cloning from a malicious
 >    repository.

 >    Git will no longer dereference symbolic links via the `--local`
 >    clone mechanism, and will instead refuse to clone repositories that
 >    have symbolic links present in the `$GIT_DIR/objects` directory.

 >    Additionally, the value of `protocol.file.allow` is changed to be
 >    "user" by default.

 >  * CVE-2022-39260:
 >    An overly-long command string given to `git shell` can result in
 >    overflow in `split_cmdline()`, leading to arbitrary heap writes and
 >    remote code execution when `git shell` is exposed and the directory
 >    `$HOME/git-shell-commands` exists.

 >    `git shell` is taught to refuse interactive commands that are
 >    longer than 4MiB in size. `split_cmdline()` is hardened to reject
 >    inputs larger than 2GiB.

 > https://github.com/git/git/blob/v2.31.5/Documentation/RelNotes/2.31.5.txt

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
