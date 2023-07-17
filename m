Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DFEEB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 14:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E6F81E7A;
	Mon, 17 Jul 2023 14:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32E6F81E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fla1U1TmOdDA; Mon, 17 Jul 2023 14:09:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7347B81E76;
	Mon, 17 Jul 2023 14:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7347B81E76
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4C21BF304
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:09:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848C681E76
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 848C681E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o_i8Tj0G1ELp for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 14:09:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C4481E4E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87C4481E4E
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:09:37 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 25B317802FE
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 16:09:34 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qLOur-0000ES-Qz; Mon, 17 Jul 2023 16:09:33 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.96)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1qLOuq-001R1Q-1Q; Mon, 17 Jul 2023 16:09:32 +0200
Date: Mon, 17 Jul 2023 16:09:32 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230717140932.s3yxrzyqdjf2ljcd@zenon.in.qult.net>
References: <20230714090804.kaid6vdlxiubf632@zenon.in.qult.net>
 <20230714121834.22742681@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230714121834.22742681@windsurf>
Subject: Re: [Buildroot] [PATCH] package/elfutils: enable building with
 musl-based toolchains
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Jul 14, 2023 at 12:18:34PM +0200, thus spake Thomas Petazzoni:
> Hello Ignacy,
> =

> [...]
> =

> And the fun game is that this work needs to be done recursively: once
> you have checked if for example libbpf can now build with musl, you
> need to look at the reverse dependencies of libbpf (in this case, only
> package/kmemd).
> =

> Could you have a look at doing this?

Sure.  I started having a look and stumbled upon an issue while
test-pkg'ing libbpf.  Aside from many toolchains just being skipped
(supposedly because of their lack of the minimum kernel headers
version), it succeeded with those glibc and musl toolchains that it
didn't skip, and failed with br-mips64-n64-full.  The latter is based
on uClibc v1.0.36 and it turns out uClibc prior to v1.0.38 has no
working definition of F_DUPFD_CLOEXEC, required by libbpf.

Now I have the following problem: how can I determine, from the
Config.in's point-of-view, that the uClibc used by the toolchain is
too old?  There are variable that are set when the toolchain is
uclibc-based, but in this case I have
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=3Dy and no way to know the actual
version.  Forbidding libbpf as soon as
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC=3Dy seems overkill.

Ignacy

-- =

Ignacy Gaw=EAdzki
R&D Engineer
Green Communications
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
