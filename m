Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399A2EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 07:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6FE1607CE;
	Sun, 18 Jun 2023 07:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6FE1607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7yg8BFu32_S4; Sun, 18 Jun 2023 07:35:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E129D60773;
	Sun, 18 Jun 2023 07:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E129D60773
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 01B3A1BF5A1
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 07:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC51381E56
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 07:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC51381E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dn6VQJN0jRDS for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 07:35:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7A681E38
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB7A681E38
 for <buildroot@uclibc.org>; Sun, 18 Jun 2023 07:35:05 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qAmw9-0003sT-Vj
 for buildroot@uclibc.org; Sun, 18 Jun 2023 09:35:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 18 Jun 2023 09:08:30 +0200
Message-ID: <pan$26898$f18ae6ad$e34a44a2$ebb4cb5a@ID-313208.user.individual.net>
References: <20230617213057.140556-1-peter__22050.7639039837$1687037511$gmane$org@korsgaard.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH] package/python3: security bump to version
 3.11.4
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

Am Sat, 17 Jun 2023 23:30:56 +0200 schrieb Peter Korsgaard:

> Fixes the following security issues:
> 
> - gh-99889: Fixed a security in flaw in uu.decode() that could allow for
>   directory traversal based on the input if no out_file was specified.
> 
> - gh-104049: Do not expose the local on-disk location in directory
> indexes
>   produced by http.client.SimpleHTTPRequestHandler.
> 
> - gh-102153: urllib.parse.urlsplit() now strips leading C0 control and
> space
>   characters following the specification for URLs defined by WHATWG in
>   response to CVE-2023-24329.  Patch by Illia Volochii.
> 
> Refreshed patches to apply without fuzz after upstream reordered lines
> in Makefile.pre.in:

Hi Peter,

duplicate of https://patchwork.ozlabs.org/project/buildroot/patch/
20230608165305.451682-1-bernd.kuhls@t-online.de/

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
