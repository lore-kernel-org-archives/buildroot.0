Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCB9C433FE
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 15:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F5241A48;
	Tue, 24 May 2022 15:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwwNhlVZLKfs; Tue, 24 May 2022 15:03:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C5A7415BA;
	Tue, 24 May 2022 15:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C25F1BF329
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47C294027F
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 15:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AuDvnXSEz4s for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 15:02:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29603400C1
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:02:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E1CE340014;
 Tue, 24 May 2022 15:02:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ntW3g-00F6QP-Rb; Tue, 24 May 2022 17:02:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220418215412.892842-1-fontaine.fabrice@gmail.com>
Date: Tue, 24 May 2022 17:02:52 +0200
In-Reply-To: <20220418215412.892842-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Apr 2022 23:54:12 +0200")
Message-ID: <87k0abt1lv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/mariadb: fix build with libressl
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

 > Fix the following build failure with libressl:
 > CMake Error: TRY_RUN() invoked in cross-compiling mode, please set the following cache variables appropriately:
 >    LIBRESSL_RESULT (advanced)
 >    LIBRESSL_RESULT__TRYRUN_OUTPUT (advanced)
 > For details see /nvmedata/autobuild/instance-27/output-1/build/mariadb-10.3.34/TryRunResults.cmake

 > Fixes:
 >  - http://autobuild.buildroot.org/results/cbdbfcdae4b89ac678e1bf6bcded96872c7223ab

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Prepend "LibreSSL " to $(LIBRESSL_VERSION) as
 >    libmariadb/cmake/libressl_version.c prints LIBRESSL_VERSION_TEXT

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
