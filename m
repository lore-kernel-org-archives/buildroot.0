Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A62C60BEC;
	Sun, 20 Mar 2022 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id easoIikO4UiC; Sun, 20 Mar 2022 17:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8818C6068B;
	Sun, 20 Mar 2022 17:49:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD781BF352
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A7D76068B
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPbe6fzIffRu for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:49:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15EA760687
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:49:49 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D330660005;
 Sun, 20 Mar 2022 17:49:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nVzgX-00FEay-MP; Sun, 20 Mar 2022 18:49:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220224175119.487040-1-fontaine.fabrice@gmail.com>
Date: Sun, 20 Mar 2022 18:49:45 +0100
In-Reply-To: <20220224175119.487040-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 24 Feb 2022 18:51:19 +0100")
Message-ID: <87o820o6o6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/bpftool: add
 BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > bpftool uses its own local copy of libbpf so add
 > BR2_PACKAGE_BPFTOOL_ARCH_SUPPORTS to avoid the following build failure
 > on ARM:

 > btf.c: In function 'btf_type_by_id':
 > btf.c:461:14: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
 >   if (type_id < btf->start_id)
 >               ^
 > bpf.c:62:4: error: #error __NR_bpf not defined. libbpf does not support your arch.
 >  #  error __NR_bpf not defined. libbpf does not support your arch.
 >     ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/aae772f1cfb16516a57f310c4f022e80a2a8d65e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
