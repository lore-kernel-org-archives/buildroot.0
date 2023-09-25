Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E1ACE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 07:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AD0F818EC;
	Mon, 25 Sep 2023 07:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AD0F818EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SQkLl-g7HP9V; Mon, 25 Sep 2023 07:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88D9B81815;
	Mon, 25 Sep 2023 07:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88D9B81815
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6AA1BF397
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EA6B4013D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 07:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EA6B4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OzL-4ECiEctD for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 07:55:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 011BD401DD
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 07:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 011BD401DD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 408211C0002;
 Mon, 25 Sep 2023 07:55:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkgQk-002YaA-TN; Mon, 25 Sep 2023 09:54:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230919205058.446156-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Sep 2023 09:54:58 +0200
In-Reply-To: <20230919205058.446156-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Sep 2023 22:50:58 +0200")
Message-ID: <87v8byd6wd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/netatalk: security bump to version 3.1.17
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

 > - Drop patches (already in version) and so autoreconf
 > - Update COPYING hash (gpl mailing address updated with
 >   https://github.com/Netatalk/netatalk/commit/9bd45cc06e02e9bbfe8156bb1e5e2843b7727a51
 >   https://github.com/Netatalk/netatalk/commit/6a5997fbd64d6cd5a5400ea6a0a930d005ed89df)
 > - Fix CVE-2022-43634: This vulnerability allows remote attackers to
 >   execute arbitrary code on affected installations of Netatalk.
 >   Authentication is not required to exploit this vulnerability. The
 >   specific flaw exists within the dsi_writeinit function. The issue
 >   results from the lack of proper validation of the length of
 >   user-supplied data prior to copying it to a fixed-length heap-based
 >   buffer. An attacker can leverage this vulnerability to execute code in
 >   the context of root. Was ZDI-CAN-17646.
 > - Fix CVE-2022-45188: Netatalk through 3.1.13 has an afp_getappl
 >   heap-based buffer overflow resulting in code execution via a crafted
 >   .appl file. This provides remote root access on some platforms such as
 >   FreeBSD (used for TrueNAS).
 > - Fix CVE-2023-42464: Validate data type in dalloc_value_for_key()

 > https://github.com/Netatalk/netatalk/blob/netatalk-3-1-17/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Update .checkpackageignore

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
