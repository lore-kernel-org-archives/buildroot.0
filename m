Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AB7C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 12:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C04608B7;
	Sat,  4 Mar 2023 12:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C04608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bg4t_u3I1jHj; Sat,  4 Mar 2023 12:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A2ED60644;
	Sat,  4 Mar 2023 12:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A2ED60644
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1DB51BF228
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 761D560644
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 12:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761D560644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpluQ3i-wjbW for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 12:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F3D860030
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F3D860030
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 12:49:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0490EC0002;
 Sat,  4 Mar 2023 12:49:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pYRKA-00GhgF-3c; Sat, 04 Mar 2023 13:49:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Stefan Agner <stefan@agner.ch>
References: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
Date: Sat, 04 Mar 2023 13:49:18 +0100
In-Reply-To: <12a7772dc9c30d31bc4dd7a4e15ca12425c14834.1676297701.git.stefan@agner.ch>
 (Stefan Agner's message of "Mon, 13 Feb 2023 15:15:34 +0100")
Message-ID: <878rgcel69.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/pkg-golang: disable version control
 information
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
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Stefan" == Stefan Agner <stefan@agner.ch> writes:

 > By default go tries to include version control (VCS) information in
 > binaries. Since Buildroot separates version control from the build
 > process it is sensible to disable this behavior.

 > This avoids build errors when building with a git repository higher
 > up in the tree owned by root. In this case the go build system
 > calls `git status --porcelain` which returns with an error:
 > fatal: detected dubious ownership in repository at '/build'

 > Signed-off-by: Stefan Agner <stefan@agner.ch>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
