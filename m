Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25950C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 13:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A314C41911;
	Wed, 15 Mar 2023 13:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A314C41911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79_zBLZTW4sT; Wed, 15 Mar 2023 13:05:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E7B4190D;
	Wed, 15 Mar 2023 13:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E7B4190D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B14921BF31D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97FF14190D
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 13:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97FF14190D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjMTPCQbLwkz for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 13:05:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EF14189D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34EF14189D
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 13:05:42 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82B50100007;
 Wed, 15 Mar 2023 13:05:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcQp0-0024Uk-Hq; Wed, 15 Mar 2023 14:05:38 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230303190726.4421-1-fontaine.fabrice@gmail.com>
Date: Wed, 15 Mar 2023 14:05:38 +0100
In-Reply-To: <20230303190726.4421-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 3 Mar 2023 20:07:26 +0100")
Message-ID: <875yb24125.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libglfw: add wayland dependency
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix added by commit 0bbb12eff3b9f9d9719c48644c2b3d563e80de48 was
 > incomplete resulting in the following build failure:

 > -- Checking for modules 'wayland-client>=0.2.7;wayland-cursor>=0.2.7;wayland-egl>=0.2.7;xkbcommon'
 > --   Package 'wayland-client', required by 'virtual:world', not found
 > --   Package 'wayland-cursor', required by 'virtual:world', not found
 > --   Package 'wayland-egl', required by 'virtual:world', not found
 > CMake Error at /home/autobuild/autobuild/instance-9/output-1/host/share/cmake-3.22/Modules/FindPkgConfig.cmake:603 (message):
 >   A required package was not found

 > Fixes:
 >  - http://autobuild.buildroot.org/results/9c032902418a4ab0c9aa655eb29eddee0711815d
 >  - http://autobuild.buildroot.org/results/7381e114fa5c796c6edbb2c8e3987563bb32b6fa

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
