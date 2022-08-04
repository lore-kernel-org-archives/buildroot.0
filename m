Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3665C19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 10:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13C9B8135B;
	Thu,  4 Aug 2022 10:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13C9B8135B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivdYg2OHgfm1; Thu,  4 Aug 2022 10:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EB708130A;
	Thu,  4 Aug 2022 10:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB708130A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E9F2E1BF30E
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 10:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0904409E7
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 10:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0904409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWJ-E1j16kfO for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 10:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26094091A
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D26094091A
 for <buildroot@buildroot.org>; Thu,  4 Aug 2022 10:53:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71D02240002;
 Thu,  4 Aug 2022 10:53:34 +0000 (UTC)
Date: Thu, 4 Aug 2022 12:53:33 +0200
To: Jameson Collins <jameson.collins@gmail.com>
Message-ID: <20220804125333.11005bc9@windsurf>
In-Reply-To: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
References: <CACoTCHeTKbTU4QSBs4qtyUXKDNOH+5u4Y-rGhy4QeuvK=kAENw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659610414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBiNe5xRycTmjhioRVRRU+eAS6ovxouS9cMgL5sjvFc=;
 b=nFc93000hUFVoATidPtKulJvaN/hm6hDQw3rxRjfkJrT64y0bURfsVOYOe89iToXj/Y2SY
 eguZlUwdB9NToRXjelxEk9CSwMqNIcpCKhx6cWaXkrDI+YkF8VwyRwImwKO9tM5qQLYS4q
 1cfHehPSWjx+tW3lQ6mTP9AjU3HyFXVFGNSXX2qKnLsG1HKXejhd9GGlm/AABD770g9F8P
 aSRcYtLtgXiayJXUOxB/EDKWLep0KB35YnX5A7f0r+HPdWSFSgBuD7YerdgxXMlTqyH4mU
 m1dgDFpFCahCkZhYAFlsCUeCoCAlB/MrshmpvplXORAWLLVOvKNlijRB3Yasjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nFc93000
Subject: Re: [Buildroot] Defining a package with no dependencies
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 3 Aug 2022 19:30:07 -0400
Jameson Collins <jameson.collins@gmail.com> wrote:

> If I have a package that doesn't build anything, doesn't depend on
> anything, and doesn't have anything depending on it, is it possible to tell
> buildroot to build this package without first building the toolchain?

You could do:

<pkg>_ADD_TOOLCHAIN_DEPENDENCY = NO

but that's normally reserved for packages that are part of the
toolchain build.

> An example of a package like this might be the `flash-my-board` recipe that
> is shown in the manual.  Yes, in this case the package doesn't make any
> sense unless boot.bin existed, but you can see how it might be useful to
> have a package that performs a task and not necessarily generate a build
> product.

flash-my-board inside the manual is *not* a package. It's just an
example in the external.mk, to show that external.mk can be used to
provide additional custom make targets. It has nothing to do with a
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
