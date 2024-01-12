Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF3C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DFDC6FACD;
	Fri, 12 Jan 2024 16:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DFDC6FACD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eyOsMlG701E; Fri, 12 Jan 2024 16:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7684C6FAC2;
	Fri, 12 Jan 2024 16:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7684C6FAC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB141BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52B0740347
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52B0740347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsYZPS7BYtAI for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:14:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 179FE43A75
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 179FE43A75
Received: by mail.gandi.net (Postfix) with ESMTPSA id 406AF240006;
 Fri, 12 Jan 2024 16:14:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOKAV-00C4Zk-2M;
 Fri, 12 Jan 2024 17:14:03 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240102194155.1345165-1-fontaine.fabrice@gmail.com>
Date: Fri, 12 Jan 2024 17:14:03 +0100
In-Reply-To: <20240102194155.1345165-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 2 Jan 2024 20:41:55 +0100")
Message-ID: <87msta1qd0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] Revert "package/docker: enable selinux
 module"
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

 > This reverts commit 245b13a0778ec6ad061555b0b994e7649ef01006 as docker
 > selinux module is for docker-engine, not for "a system tray dock for X"

 > Moreover, it raises the following build failure:

 > Compiling targeted policy.33
 > env
 > LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/lib:/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/lib"
 > /home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/bin/checkpolicy
 > -c 33 -U deny -S -O -E policy.conf -o policy.33
 > policy.conf:1912:ERROR 'attribute container_engine_domain is not declared' at token ';' on line 1912:
 > type dockerd_t, container_engine_domain;
 > type dockerd_exec_t;

 > Fixes:
 >  - http://autobuild.buildroot.org/results/87d78b6f15875f0fa3e6fc85e352db14ab0383bb

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
