Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB498C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 08:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98AF760B70;
	Wed, 16 Feb 2022 08:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4IGVMWyLj9vy; Wed, 16 Feb 2022 08:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E2460AE6;
	Wed, 16 Feb 2022 08:29:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAD7C1BF2EA
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 08:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B90A0813D7
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 08:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0nDBhk4hNvxl for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 08:29:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9261F813CC
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 08:29:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 87F0F60006;
 Wed, 16 Feb 2022 08:29:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nKFh9-0002na-O7; Wed, 16 Feb 2022 09:29:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220113233758.110264-1-aperez@igalia.com>
 <56d88177-6e09-dba3-6b27-2119cd55db52@mind.be>
Date: Wed, 16 Feb 2022 09:29:51 +0100
In-Reply-To: <56d88177-6e09-dba3-6b27-2119cd55db52@mind.be> (Arnout
 Vandecappelle's message of "Thu, 3 Feb 2022 21:39:53 +0100")
Message-ID: <87leybi58g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kf5/kf5-extra-cmake-modules: do
 not build documentation
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 14/01/2022 00:37, Adrian Perez de Castro wrote:
 >> Pass needed CMake options to disable generating documentations. The
 >> documentation is built using python-sphinx, which is not packaged in
 >> Buildroot.
 >> 
 >> Prior to this change, if the build host would have a Python installation
 >> with the sphinx module installed the automatic detection tried to build
 >> documentation, which would fail in cases where the sphinxcontrib-qthelp
 >> package is missing from the host Python installation. The error message
 >> in this case was:
 >> 
 >> Extension error:
 >> Could not import extension ecm (exception: cannot import name
 >> 'htmlescape' from 'sphinx.util.pycompat'
 >> (/usr/lib/python3.10/site-packages/sphinx/util/pycompat.py))
 >> 
 >> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

 >  Applied to master, thanks.

 >  (AFAICS the v2 was in fact identical)

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
