Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E58DCCA47F
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F04F611EE;
	Mon,  6 Jun 2022 12:32:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0oFmlHpA9Oi; Mon,  6 Jun 2022 12:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8143A60F01;
	Mon,  6 Jun 2022 12:32:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE8631BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB72241A27
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGpwqWlrW_6b for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:32:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06B55418B3
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:32:15 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 30DE9C0004;
 Mon,  6 Jun 2022 12:32:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyBu1-00Cpjj-AH; Mon, 06 Jun 2022 14:32:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220518212740.464658-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 14:32:13 +0200
In-Reply-To: <20220518212740.464658-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 18 May 2022 23:27:40 +0200")
Message-ID: <875ylevupe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.4980
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2022-1619: Heap-based Buffer Overflow in function
 > cmdline_erase_chars in GitHub repository vim/vim prior to 8.2.4899. This
 > vulnerabilities are capable of crashing software, modify memory, and
 > possible remote execution

 > Fix CVE-2022-1620: NULL Pointer Dereference in function
 > vim_regexec_string at regexp.c:2729 in GitHub repository vim/vim prior
 > to 8.2.4901. NULL Pointer Dereference in function vim_regexec_string at
 > regexp.c:2729 allows attackers to cause a denial of service (application
 > crash) via a crafted input.

 > Fix CVE-2022-1621: Heap buffer overflow in vim_strncpy find_word in
 > GitHub repository vim/vim prior to 8.2.4919. This vulnerability is
 > capable of crashing software, Bypass Protection Mechanism, Modify
 > Memory, and possible remote execution

 > Fix CVE-2022-1629: Buffer Over-read in function find_next_quote in
 > GitHub repository vim/vim prior to 8.2.4925. This vulnerabilities are
 > capable of crashing software, Modify Memory, and possible remote
 > execution

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
