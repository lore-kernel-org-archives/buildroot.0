Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A704AC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F3AC415FF;
	Mon, 15 Aug 2022 10:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F3AC415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ov9gqaBMvH4x; Mon, 15 Aug 2022 10:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6965415DE;
	Mon, 15 Aug 2022 10:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6965415DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5669B1BF3C4
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D080415DE
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D080415DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9KNU2WMyGoN for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:46:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE21640994
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE21640994
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:46:38 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oNXcA-0001pp-9Z;
 Mon, 15 Aug 2022 11:46:34 +0100
Date: Mon, 15 Aug 2022 11:46:29 +0100
From: John Keeping <john@metanate.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YvokBS1iouu46JsD@donbot>
References: <20220811134533.508348-1-john@metanate.com>
 <20220813221143.GA2854108@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220813221143.GA2854108@scaer>
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=ilCZ4nti4kg0zSyg0hkdWYJDZUKoydwMxZe+4igesa8=; b=IV4lf
 56lc2BT/YMsxZYWIiMxIr+yxfYX0lbO1yOIVBxV3PSU/1EvkTrMTQfKfCWfj0L2y4CqQGG5gawtVa
 nots2PXWNqtyyb1bxyqY67KeVR23vKp0DAsyuoxNcp8sVbrPBumBh/nKISqh2NY6dEIYi80lKJqch
 ooqYy+gYeEK4BPBS/2oFbCf6skvbc8dTrLk/USF06SIxxKg7qsxA5F2+0vxZQvKBfe+nSQ25uadhe
 ujMZugbRBnNJKu/f4Ztmz+g/HDDhQ8o4CeivwAC+y34iOBMCdA+7TKXBLflUNLbNbL+mIpDVAz7Cw
 KL/hFta+mjd24qnRq+u5FW+3sKpiQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=IV4lf56l
Subject: Re: [Buildroot] [PATCH] support/download/git: disable global &
 system config
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

Hi Yann,

On Sun, Aug 14, 2022 at 12:11:43AM +0200, Yann E. MORIN wrote:
> On 2022-08-11 14:45 +0100, John Keeping spake thusly:
> > The build environment should be isolated from the host system as much as
> > possible to keep the build reproducible.  Git's global config (usually
> > ~/.gitconfig) and system config (/etc/gitconfig) can affect the
> > behaviour of all Git operations, so should be disabled.
> > 
> > An example of this is that `git lfs install` will add the LFS smudge
> > filter to the global config and thus always checkout LFS files ignoring
> > the value of $(PKG)_GIT_LFS.  This may mask a bug in the package when
> > the initial developer's machine has LFS installed globally.
> 
> While I appreciate the reasoning and example, there are valid cases
> where we do want to use (at least) the user's settings, like when they
> have proxy commands (i.e. core.gitProxy or core.sshCommand) set to reach
> the outter world (e.g. because they are behind a restrictive firewall
> and need to tunnel ssh-over-https for example).

Good point - this is more complicated than I initially realised.

> So we need something better than just ignoring the local configuration,
> and this is going to be... tricky.

What do you thing about adding a config option to specify the global
gitconfig file to use?

Unfortunately we can't just default the value to ~/.gitconfig as there
is no value which replicates the behaviour when the variable is unset
(when Git uses both ~/.gitconfig and $XDG_CONFIG_HOME/git/config).

The system config is less likely to be problematic as I don't think it's
used much outside managed environments where the content probably is for
proxy settings that should be included in Buildroot.

So we end up with something like this:

	eval ${BR2_GIT_CONFIG_GLOBAL:+GIT_CONFIG_GLOBAL=\'${BR2_GIT_CONFIG_GLOBAL}\'} \
		GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
