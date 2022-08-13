Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDABC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 11:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A886405D1;
	Sat, 13 Aug 2022 11:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A886405D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vy0hkUnKA5eU; Sat, 13 Aug 2022 11:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32733405BD;
	Sat, 13 Aug 2022 11:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32733405BD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 685981BF3DA
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F8A3405BD
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 11:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F8A3405BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LfAzOj9MLIw for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 11:00:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD12404DF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDD12404DF
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 11:00:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F0ED21BF204;
 Sat, 13 Aug 2022 10:59:56 +0000 (UTC)
Date: Sat, 13 Aug 2022 12:59:55 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220813125955.210ab19f@windsurf>
In-Reply-To: <20220812204247.171889-1-fontaine.fabrice@gmail.com>
References: <20220812204247.171889-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660388398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvNpdcbcOmadc1CaqfoMUG3bmrzDtLXZR7WQLHRyu0Q=;
 b=HaxNasCpEhHTS+fKqhJCBM8oMrALIBTd9XmMAao6IlVEZ+sU84/sPuRVD8fw2+1zG22Ok4
 EtFWcjssKj+20I2ShWyhGsc42oCKs53hFC80YVFmcmlhj9YrRtHlXw4st7q2JK8FAYLj9G
 M/21fyfSZ49nZ85DwQCbTtF1Z+cqAPHQO5ifYV5L6/mhiGoLb1lUZ3ISVzu9KCdA9wKWX1
 nvP514k1mU4cpItk8ep5cmjfVB4fLfpyRwmkhLmxSSboC9sbGXw4hNh3UukyV1UJ+bgQQa
 TvWibQdWD+gpHoKYv+ub8Ew02agNnc5EBSIu1kXIjwF/DpjiqAzA3gHM7F+ZDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HaxNasCp
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm: needs host gcc >= 5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Joseph Kogut <joseph.kogut@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Aug 2022 22:42:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with host-lld, libclc, etc. raised since
> bump to version 11.1.0 in commit
> 456f704e6b7be147c504d53a78536938f088e8e8:
> 
> CMake Error at cmake/modules/CheckCompilerVersion.cmake:38 (message):
>   Host GCC version must be at least 5.1, your version is 4.8.5.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7f120dbcbd5410477550fa8645e7d1cb0ae6cf1c
>  - http://autobuild.buildroot.org/results/2382d7112618236aeafcaf581dc22a8d938824cf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/clang/Config.in        | 6 ++++--
>  package/compiler-rt/Config.in  | 5 +++--
>  package/libclc/Config.in       | 5 +++++
>  package/lld/Config.in.host     | 5 +++++
>  package/llvm/Config.in         | 6 ++++--
>  package/mesa3d/Config.in       | 6 ++++--
>  package/qt5/qt5tools/Config.in | 3 ++-
>  7 files changed, 27 insertions(+), 9 deletions(-)

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
