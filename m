Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAEBC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 14:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B7C140976;
	Mon,  8 Jan 2024 14:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7C140976
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oP4TMKrDZLLv; Mon,  8 Jan 2024 14:28:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9911C40935;
	Mon,  8 Jan 2024 14:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9911C40935
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E34F11BF330
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 14:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC02E81423
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 14:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC02E81423
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMDZmi9xQeTs for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 14:28:01 +0000 (UTC)
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C043381454
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 14:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C043381454
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id E0D881814B9; Mon,  8 Jan 2024 15:27:55 +0100 (CET)
In-Reply-To: <20240105092816.4ea102f3@windsurf>
References: <20231128113635.3712892-1-buildroot@heine.tech>
 <20240105092816.4ea102f3@windsurf>
Date: Mon, 08 Jan 2024 15:27:55 +0100
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Message-ID: <49076-659c0680-3-4917d600@23968680>
User-Agent: SOGoMail 5.9.1
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1704724077; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9pXHs1UfDfAMhS2hTvB14jvstx6RW126oTZo2XFCZos=;
 b=FzB4SKbggDSULFOx7CFv1hx8fO04NF5WrjyRjDEG2iCyoyY2JyKBDdiWZ1wc9lHMqJErLR
 HgJE2dNMbxQ01EFEnlsnSlTA5Xt5Mv80RcrAqf+ccU/WUE5rFp75/EAhxoto4WuwEv1x03
 kr5VBQC6nHr9VsxIPePSZSKwzDjrQIg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=FzB4SKbg
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH=5D_package/protobuf-c=3A_bump_to_?=
 =?utf-8?q?version_1=2E5=2E0?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Friday, January 05, 2024 09:28 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Michael,
> 
> Sorry for the delay in looking at your patch, and thanks for your
> patch. A few questions below.
> 
> On Tue, 28 Nov 2023 12:36:34 +0100
> Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:
> 
> > - drops support for proto2
> > - fixes compatibility with protobuf >= 22.0
> 
> Is this fixing some build issues? We currently don't have protobuf >=
> 22.0 as far as I can see.

nope, we currently don't have build issues because we didn't bump protobuf for quite a while now.
Main reason is 
- raised dependencies of all the google projects (see [0]).
- some API breakages, so projects have to catch up first

this can also be seen at vckpg [1] where they are also still at protobuf (v3.)21.12  (current is (3.)25.1)

so this bump is just one puzzle piece to be able to bump protobuf and grpc in the future.
(you might remember I tried to bump grpc early in 2023 and I stopped because it got complicated)

> 
> > - to be compatible with new protobuf versions c++17 is now required
> >   when building with protoc (which we do for host) [0]
> > - require host gcc >= 7 for c++17 support, propagate to depending packets
> 
> Why does this requirement of gcc >= 7 only applies to the host variant
> of protobuf-c, not the target variant ?

i tried to express this in the line above. We only need c++17 when we build with the usage of protoc,
which is always a host tool and supplied by host-protobuf since we don't support compiling protobuf
files on the target. 

nevertheless it's still a bit weird, that protobuf-c relies on c++17 while latest protobuf versions
only require c++14.
(this is where protobuf-c enforces c++17 support when protoc is enabled: [2])

> 
> I was going to fix these myself, but then I wondered about the
> target/host question above, and I preferred to get back to you on this.
> Could you clarify this point, and submit a v2 that fixes the Config.in
> comments?

i would fix the Config.in remarks and respin. Should I add more clarification somewhere
in the Patch with the info supplied above?

> 
> Thanks a lot!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Regards,
Michael

[0] https://github.com/google/oss-policies-info/blob/main/foundational-cxx-support-matrix.md
[1] https://github.com/microsoft/vcpkg/issues/34995
[2] https://github.com/protobuf-c/protobuf-c/blob/master/build-cmake/CMakeLists.txt#L145

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
