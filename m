Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58295C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 21:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03AB940901;
	Tue, 11 Jan 2022 21:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bf6ubW-aISKo; Tue, 11 Jan 2022 21:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02CE2408FE;
	Tue, 11 Jan 2022 21:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B65211BF989
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3CD9408FE
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d6eN_g8mzopP for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 21:22:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5EEA24016A
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 21:22:27 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3A96A20003;
 Tue, 11 Jan 2022 21:22:25 +0000 (UTC)
Date: Tue, 11 Jan 2022 22:22:24 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220111222224.221ef0da@windsurf>
In-Reply-To: <20220110075804.1499122-1-fontaine.fabrice@gmail.com>
References: <20220110075804.1499122-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/git: add xdg SELinux module
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

On Mon, 10 Jan 2022 08:58:04 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> xdg SELinux module is needed to avoid the following build failure raised
> since bump of refpolicy to version 2.20220106 in commit
> f6691d122ce25fc580ca88243f79f75cc2808ca7 and
> https://github.com/SELinuxProject/refpolicy/commit/64e637d895c516d7a6b6cbcd46b187136279fddd:
> 
>  policy/modules/services/git.te:121:ERROR 'attribute xdg_config_type is not declared' at token ';' on line 115358:
>  	typeattribute git_xdg_config_t xdg_config_type;
>  #line 121
>  checkpolicy:  error(s) encountered while parsing configuration
>  Rules.monolithic:78: recipe for target 'policy.30' failed
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/98d5b3db313000855721c0ad994951fe8cc781c0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/git/git.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
