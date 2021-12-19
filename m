Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B609C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 10:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DE9040143;
	Sun, 19 Dec 2021 10:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NcFNG3hSd73r; Sun, 19 Dec 2021 10:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9997B40127;
	Sun, 19 Dec 2021 10:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA261BF340
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 10:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A8C184CED
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 10:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGifPrmTQfcV for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 10:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC4A084CB0
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 10:13:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8DA2EE0005;
 Sun, 19 Dec 2021 10:13:39 +0000 (UTC)
Date: Sun, 19 Dec 2021 11:13:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <20211219111336.49cd5d7a@windsurf>
In-Reply-To: <20211219073119.1087539-3-thierry.bultel@linatsea.fr>
References: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
 <20211219073119.1087539-3-thierry.bultel@linatsea.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 3/3] fs/cpio: new option to use dracut
 tool
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

Hello Thierry,

On Sun, 19 Dec 2021 08:31:19 +0100
Thierry Bultel <thierry.bultel@linatsea.fr> wrote:

> Adds an option to invoke the dracut host tool, providing
> a configuration file, instead of having a full cpio archive
> of the whole target directory.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
> Changes v1 -> v2 (suggested by Arnoult and Yann)
>   - was a new fs type, now an option of cpio
>   - deals with the case of a build with no kernel
>   - gets the kernel name in a smarter way
>   - checks for the name of dracut configuration file
> 
> Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>

Thanks for working on this! What would be nice is to add a test case in
support/testing/ for this. We already have lots of tests for various
filesystem types in support/testing/tests/fs.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
