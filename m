Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B4FC52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 18:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67BD881F09;
	Fri, 23 Aug 2024 18:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgEPwqLMVx-1; Fri, 23 Aug 2024 18:14:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F8F181F11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F8F181F11;
	Fri, 23 Aug 2024 18:14:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6119A1BF2E4
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 18:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D02181F11
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 18:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tEntGQa6pdZ2 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 18:14:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE17681F09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE17681F09
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE17681F09
 for <buildroot@uclibc.org>; Fri, 23 Aug 2024 18:14:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1shYnZ-0007b9-Qr
 for buildroot@uclibc.org; Fri, 23 Aug 2024 20:14:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 23 Aug 2024 20:13:23 +0200
Message-ID: <pan$3353a$2e55676b$9120cc6f$48d29d03@ID-313208.user.individual.net>
References: <20240822181830.65052-1-bernd@kuhls.net>
 <20240822181830.65052-7-bernd@kuhls.net>
 <20240823190707.71d0dc45__15506.7127708875$1724432855$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH/next 7/7] package/kodi: needs
 python-packaging
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

Am Fri, 23 Aug 2024 19:07:07 +0200 schrieb Thomas Petazzoni via buildroot:

> On Thu, 22 Aug 2024 20:18:30 +0200 Bernd Kuhls
> <bernd@kuhls.net> wrote:
> 
>> Needed for external addons with python >= 3.12, for example:
>> https://github.com/emilsvennesson/script.module.inputstreamhelper/
issues/550
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd@kuhls.net>
> 
> This looks like a fix, isn't it? Why isn't this targeted at the master
> branch? The master branch already has Python 3.12, so this should be
> applicable to master, not next, right?

Hi Thomas,

yes, it fixes a bug but this bug does not occur with any package provided 
by buildroot. Being in doubt about the policy for patches being added to 
the master branch during rc-phase I sent it for -next. Feel free to apply 
it to the master branch.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
