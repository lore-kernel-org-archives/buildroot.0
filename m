Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2730C282EC
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C8982385;
	Sat,  8 Mar 2025 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkVoDmaWgKpM; Sat,  8 Mar 2025 22:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 615118239A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 615118239A;
	Sat,  8 Mar 2025 22:03:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E846C1C9
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9818606BB
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgMOy3JQAhoC for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 22:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D259E60632
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D259E60632
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D259E60632
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 22:03:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 556A75FFC0;
 Sat,  8 Mar 2025 23:03:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 23:03:24 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 23:03:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <Z8wrSOraiHBxlQWD@landeda>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
 <4f56e492d92a06450d65a951c2d92781@free.fr> <Z8wrSOraiHBxlQWD@landeda>
User-Agent: Webmail Free/1.6.10
Message-ID: <e4c6b89d497cd5586d63bfbce4d0baf6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741471407;
 bh=76MM8qqLpnDh1fp3ISNFBXeeAYxTFYsEHlXak9a8nAs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=blKuAnnSvXc2M4V/6NczzFHj7TgMhAKW/8UQYkbcIaRLSPFq3IwmmvtAH7TObfdIi
 deYYUjnZC6Wm4wpXm9dg9ci4IlR6Z5uzuGyOkumS102D4z7ERYcQkiCCuj11QWx/QE
 G/795IWPWBYnXgV+goJqwysrL4O9FXEDl/HeN4JXo2jem2Tip9Yv4NPToTJqY4im1+
 5zn7uvakeF5CsF87EqoW6xvWEokn0QcOC5oife4zm7W6HEEHO5v2Mkqj4//wcmj4/6
 RMLtrixGwxq+QQE/4wosxe7r77h1T6yAPk6WWSDz9fGq2GhbHpkpVVgbGRgo39s0uf
 zireoEUpjRlVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=blKuAnnS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 08/03/2025 12:34, Yann E. MORIN wrote:
> Julien, All,
> 
> On 2025-03-07 19:55 +0100, Julien Olivain spake thusly:
>> On 01/03/2025 16:05, Yann E. MORIN wrote:
>> > Podman is a container manager not unlike Docker, but is daemon-less.
> [--SNIP--]
>> > +        self.assertRunOk("useradd -d /home/foo -m -s /bin/sh -u 1000
>> > foo")
>> It would be nice to keep tests idempotent. This can be useful
>> while debugging tests, and avoid rebuilding everything at each
>> attempt.
> 
> You know that you can just remove the "build-done" filestamp in the 
> test
> build directory, to just rebuild the image and not the whole thing,
> right? ;-)
> 
>     $ rm -f run-tests/TestSkopeo/build-done
> 
>> It is even more useful in tests with a long build time
>> like this one.
> 
> Well, you'd get other issues as well in case the tests are failing: if
> the test fails to remove the images from local storage, then restarting
> the test will fail even earlier, as it expects an empty local storage 
> to
> start with...
> 
> Furthermore, the virtual machine is abruptly terminated when the test
> ends (the qemu process is killed without letting the VM a chance to
> shutdown), the filesystem will be inconsistent, leaving all sorts of
> false negative (or positives) if restarting the test anyway (e.g.
> removing the images from local storage, even is sucessful, might not
> have had a chance to hit the disk yet).
> 
>> If possible, could you improve the test to make sure it can run
>> at least two time in a row with the run-tests "-k" option, please?
>> For example, with a construct like:
>> id -u foo || useradd ... foo
> 
> Sorry, but this is not a good idea I believe. The tests should be run
> from a clean build, or at the very least from a clean image (which is
> easy to do, see above).
> 
> In retrospect, I believe the build should always be restarted to always
> start the test from a clean image, and so the "build-done" filestamp is
> in fact counter-productive: we _want_ to rebuild the rootfs image 
> before
> starting tests.
> 
>> There is possibly few other places that might need cleanup too.
> 
> There are so many other tests that are probably not idempotent either,
> unfortunately, as soon as they do not use the CPIO or do not use a
> read-only persistent storage.
> 
> For example, the docker-compose test is not idempotent, as the image
> will remain on the disk (but OK, the second run would not fail, just 
> the
> download would not happen, which means though that the second run would
> not test the same thing as the first run).
> 
> So, I am not very inclined in making this one test idempotent.
> 
> Instead, I think we should really just get rid of build-done.

You are right. It is probably the "run-tests -k" command which might
need to be idempotent (rather than the test itself).

So, forget about my change suggestions in this test. I'm taking a
note about a possible future improvement on run-tests, instead.

> Thanks for the review! :-)
> 
> Regards,
> Yann E. MORIN.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
