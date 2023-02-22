Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8B5C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CABDC4013C;
	Wed, 22 Feb 2023 19:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CABDC4013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfnOKNws4gpj; Wed, 22 Feb 2023 19:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A784026A;
	Wed, 22 Feb 2023 19:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A784026A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 256791BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F372660BFB
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 19:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F372660BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ft-TywAOZYaA for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 19:44:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0AFF60B96
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0AFF60B96
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:44:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C3B6CE0003
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 19:44:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>) id 1pUv2c-0089Qk-F5
 for buildroot@buildroot.org; Wed, 22 Feb 2023 20:44:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20230206153040.1FC2B83CA5@busybox.osuosl.org>
Date: Wed, 22 Feb 2023 20:44:38 +0100
In-Reply-To: <20230206153040.1FC2B83CA5@busybox.osuosl.org> (Peter Korsgaard's
 message of "Mon, 6 Feb 2023 16:30:20 +0100")
Message-ID: <87wn49qyc9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/gitlab-runner: use
 LIBCURL_FORCE_TLS to enforce TLS support in curl
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=b95f7591bd83a0e483d2b6db49258d2ea8b44f3d
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > BR2_PACKAGE_LIBCURL_OPENSSL is part of a "choice" option so it cannot be
 > selected.  What seems to be really be needed is HTTPS support in curl, so
 > use the blind LIBCURL_FORCE_TLS option instead (openssl is already
 > selected).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
