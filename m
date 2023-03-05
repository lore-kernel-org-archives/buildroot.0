Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5D9C61DA4
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 18:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E3D1409FA;
	Sun,  5 Mar 2023 18:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E3D1409FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d31hJaFAs2xU; Sun,  5 Mar 2023 18:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48B1C409A7;
	Sun,  5 Mar 2023 18:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48B1C409A7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB8391BF3DA
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C56A081471
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 18:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C56A081471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xP9FddrfGNY for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 18:23:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFEDF8146A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFEDF8146A
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 18:23:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C606E0004;
 Sun,  5 Mar 2023 18:23:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYt12-001kfW-GR; Sun, 05 Mar 2023 19:23:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230302221217.585882-1-fontaine.fabrice@gmail.com>
Date: Sun, 05 Mar 2023 19:23:24 +0100
In-Reply-To: <20230302221217.585882-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 2 Mar 2023 23:12:17 +0100")
Message-ID: <878rgb6orn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: drop
 BR2_PACKAGE_GR_OSMOSDR_PYTHON
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop BR2_PACKAGE_GR_OSMOSDR_PYTHON as disabling python will raise the
 > following build failure if BR2_PACKAGE_GNURADIO_PYTHON is set since bump
 > of gnuradio to version 3.10.4.0 in commit
 > e37c110bead8b7b35cd97915673fa785ccb39f2d and
 > https://github.com/gnuradio/gnuradio/commit/51d3ad973292763a6fc0cf8e971faa3cf89029e9:

 > CMake Error at lib/CMakeLists.txt:51 (add_library):
 >   Target "gnuradio-osmosdr" links to target "Python::Module" but the target
 >   was not found.  Perhaps a find_package() call is missing for an IMPORTED
 >   target, or an ALIAS target is missing?

 > No entry in Config.in.legacy is needed as python support in gr-osmosdr
 > will now automatically be enabled if BR2_PACKAGE_GNURADIO_PYTHON is set

 > Fixes:
 >  - http://autobuild.buildroot.org/results/49e9f7bf8bfc7008688c1a3bc3744b7d3be3ce18

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
