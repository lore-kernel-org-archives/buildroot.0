Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CBE728D7
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 19:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 583A342EBB;
	Fri, 29 Sep 2023 19:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 583A342EBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ujuNOAlvBAo; Fri, 29 Sep 2023 19:11:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6293842C3D;
	Fri, 29 Sep 2023 19:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6293842C3D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BD5FB1BF30C
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96B0B40A71
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 19:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96B0B40A71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWMZxAd9d3J0 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 19:11:56 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A520B4098F
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 19:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A520B4098F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11A13FF805;
 Fri, 29 Sep 2023 19:11:52 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmIu0-006EBa-EJ; Fri, 29 Sep 2023 21:11:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230924112512.4611-1-fontaine.fabrice@gmail.com>
Date: Fri, 29 Sep 2023 21:11:52 +0200
In-Reply-To: <20230924112512.4611-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Sep 2023 13:25:12 +0200")
Message-ID: <87il7sg5fr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: bump to version 9.3.0
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch to cmake-package as autotools has been removed since version
 >   9.0.0
 > - This bump will fix the following build failure with gcc 13 thanks to
 >   https://github.com/OSGeo/PROJ/pull/3459/commits/b0b8937c56ced8eb0ffef532b9c691a1a5fc8634:

 > In file included from proj_json_streaming_writer.cpp:34:
 > proj_json_streaming_writer.hpp:42:14: error: 'int64_t' in namespace 'std' does not name a type
 >    42 | typedef std::int64_t GIntBig;
 >       |              ^~~~~~~

 > https://github.com/OSGeo/PROJ/blob/9.3.0/NEWS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/68416dcbed1ece589a7438b085f57064fc20f87d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
