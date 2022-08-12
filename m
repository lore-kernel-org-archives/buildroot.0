Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9090AC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 07:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC2F9833B7;
	Fri, 12 Aug 2022 07:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC2F9833B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APgGoWGGpFKy; Fri, 12 Aug 2022 07:50:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B577830C0;
	Fri, 12 Aug 2022 07:50:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B577830C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E64781BF33B
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 07:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C19C940643
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 07:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C19C940643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRtaJkM63adG for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 07:50:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70D2B4048D
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D2B4048D
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 07:50:42 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0120B5C3EB8;
 Fri, 12 Aug 2022 09:50:39 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 12 Aug 2022 09:50:38 +0200
From: Stefan Agner <stefan@agner.ch>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20220811225831.0e3d5fbc@windsurf>
References: <ca7d879728d7de4dc9636c3facd570c83860b9f6.1660131874.git.stefan@agner.ch>
 <20220811225831.0e3d5fbc@windsurf>
Message-ID: <854db24e2bb96b3c3ab5d795c52f7525@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1660290639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEMwlMu5gvh3UFvQoe+5bad5gb70kQ6iVV6LeIbENEE=;
 b=SWcF6CClxN71oceaha1qWvhLLpRmV/g1wZoBVe8WJ/WRd8E6ikLQFSrNGT90YfWafAwsYu
 JCbv7g/brLzO7YlCkyrAZ4g0n+mwnRAOQuUu7GiPdn801HiietlWjr+GFFZTzCprlBkR5B
 6lzcmxjQc8U3U/jgKSyESdJyZOFyZeI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=SWcF6CCl
Subject: Re: [Buildroot] [PATCH] package/dbus-broker: bump to release 32
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
Cc: nolange79@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-11 22:58, Thomas Petazzoni wrote:
> On Wed, 10 Aug 2022 13:45:38 +0200
> Stefan Agner <stefan@agner.ch> wrote:
> 
>> The new releases mostly contain bug fixes. The build system has been
>> prepared to use AppArmor library, but since actual support is still
>> missing it is not worth yet to enable build infrastructure in
>> Buildroot.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> In fact, no, I didn't apply: this patch break "make legal-info":
> 
>>>> dbus-broker 32 Collecting legal info
> LICENSE: OK (sha256:
> 3cda3630283eda0eab825abe5ac84d191248c6b3fe1c232a118124959b96c6a4)
> ERROR: No hash found for subprojects/c-dvar/AUTHORS
> cp: cannot stat
> '/home/thomas/projets/buildroot/output/build/dbus-broker-32/subprojects/c-dvar/AUTHORS':
> No such file or directory
> make: *** [package/dbus-broker/dbus-broker.mk:69:
> dbus-broker-legal-info] Error 1

Hm, I see, good catch.

> Seems like the folders in subprojects/ have changed quite a bit, this
> needs to be compared with version 29 to see how license information
> needs to be updated.

I didn't notice dependency changes from release changelogs (other than
AppArmor which the Buildroot package doesn't use currently). But it
seems the way they get pulled in changed:
https://github.com/bus1/dbus-broker/commit/26c28a36f3f74bb1be0bb0c08ca052dd454e75a5

I'll review and send a v2.

--
Stefan

> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
