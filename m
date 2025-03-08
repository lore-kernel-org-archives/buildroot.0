Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34894C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 11:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B458142B;
	Sat,  8 Mar 2025 11:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nd9MO41ZuuUa; Sat,  8 Mar 2025 11:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBACC8149D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBACC8149D;
	Sat,  8 Mar 2025 11:34:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 743D61C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43EC6409D0
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:34:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mAkfKV76ngqn for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 11:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D98B4088D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D98B4088D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D98B4088D
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 11:34:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1588D19F751;
 Sat,  8 Mar 2025 12:34:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Mar 2025 12:34:32 +0100
Date: Sat, 8 Mar 2025 12:34:32 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Christian Stewart <christian@aperture.us>
Message-ID: <Z8wrSOraiHBxlQWD@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <4f56e492d92a06450d65a951c2d92781@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f56e492d92a06450d65a951c2d92781@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741433677;
 bh=Kfalc8uOGTfcyGgfeFaglPvmf/J00XfOFvW23Hq7Ues=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dcSl3nHaAFA2lcrFodSKdEgRz8KDoEN0WDakQ8VBdoqQ4WH8SVPZzfugw8p5kd68T
 IJgHKNSbsywcvcxY4FKAjLZQvEnAJTz0AA/kvzN4vI67I3PBYbARpRnvX/6MgYFwSf
 sXvYU61zHlIVBX3y6hBS/+6Ebao4z8ONDkeI7ueHNmyTyDyRfDtC/Esa+cH4hTOrB9
 v+eU8otD7NqS8wWI4wo+Lq7gg3cGwWUMORZzGtr+95jSR/hdF0FhgBkXnq5+QkZj03
 bG7knMrL+3/7NyjL4FmvJCvKpY2Q6xz5f+WzdO3rArApqw/NptZSm17xIf5QOI/EQt
 mC3Q57RCaGb6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dcSl3nHa
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Julien, All,

On 2025-03-07 19:55 +0100, Julien Olivain spake thusly:
> On 01/03/2025 16:05, Yann E. MORIN wrote:
> > Podman is a container manager not unlike Docker, but is daemon-less.
[--SNIP--]
> > +        self.assertRunOk("useradd -d /home/foo -m -s /bin/sh -u 1000
> > foo")
> It would be nice to keep tests idempotent. This can be useful
> while debugging tests, and avoid rebuilding everything at each
> attempt.

You know that you can just remove the "build-done" filestamp in the test
build directory, to just rebuild the image and not the whole thing,
right? ;-)

    $ rm -f run-tests/TestSkopeo/build-done

> It is even more useful in tests with a long build time
> like this one.

Well, you'd get other issues as well in case the tests are failing: if
the test fails to remove the images from local storage, then restarting
the test will fail even earlier, as it expects an empty local storage to
start with...

Furthermore, the virtual machine is abruptly terminated when the test
ends (the qemu process is killed without letting the VM a chance to
shutdown), the filesystem will be inconsistent, leaving all sorts of
false negative (or positives) if restarting the test anyway (e.g.
removing the images from local storage, even is sucessful, might not
have had a chance to hit the disk yet).

> If possible, could you improve the test to make sure it can run
> at least two time in a row with the run-tests "-k" option, please?
> For example, with a construct like:
> id -u foo || useradd ... foo

Sorry, but this is not a good idea I believe. The tests should be run
from a clean build, or at the very least from a clean image (which is
easy to do, see above).

In retrospect, I believe the build should always be restarted to always
start the test from a clean image, and so the "build-done" filestamp is
in fact counter-productive: we _want_ to rebuild the rootfs image before
starting tests.

> There is possibly few other places that might need cleanup too.

There are so many other tests that are probably not idempotent either,
unfortunately, as soon as they do not use the CPIO or do not use a
read-only persistent storage.

For example, the docker-compose test is not idempotent, as the image
will remain on the disk (but OK, the second run would not fail, just the
download would not happen, which means though that the second run would
not test the same thing as the first run).

So, I am not very inclined in making this one test idempotent.

Instead, I think we should really just get rid of build-done.

Thanks for the review! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
