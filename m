Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2125C07548
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 10:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 618038218C;
	Wed, 15 Nov 2023 10:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 618038218C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Riy8SzEEwPD9; Wed, 15 Nov 2023 10:52:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACA082089;
	Wed, 15 Nov 2023 10:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AACA082089
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D58A1BF860
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32B8760AEC
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 10:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B8760AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9kaCeZFB4ySI for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 10:52:40 +0000 (UTC)
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BAE360AEA
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 10:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BAE360AEA
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id BC2F0C3651;
 Wed, 15 Nov 2023 11:52:35 +0100 (CET)
Message-ID: <8950d51a-3b99-4aea-bd2f-473fd32d8f78@grenoble.cnrs.fr>
Date: Wed, 15 Nov 2023 11:52:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boerge Struempfel <boerge.struempfel@gmail.com>
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <20231115100222.29685-1-bstruempfel@ultratronik.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1700045556;
 bh=C8OAbHymGW7QpywnlHvnwbxJ4HokRpO8gD9Lh6d/L6c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QPHrMLrMOm4EIuUNXU5MgborREvtsPWLVDJDxRcdBYiqv0ng42RO9r8GsE3TrRqfr
 ToIJsl/1Byx6CODRNoRtTOc3RPvDEkSJfuYnKKqvcPD1hUZFFDTx3Xinz097vlK1NS
 PFvAlAe0bJ5bmJ8iyQKXqx/OIbyScQ0rNCW7eTaQxkoe9l+WCvkCybOL6RExfapoAR
 0YPRqxWEOEQkkfvDgd4S3dKDK3Pog+LMpfzcuuFBbw0ws1WeAbIULG00OdrVCqRcJ6
 GkgxKVy4ldXM2Sjqw/pgDyrUA3SLJvF7ibIAjx4FjoEgI5pxtsfUflgX6a4QprslVB
 qAkP7X6aOeJkQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=QPHrMLrM
Subject: Re: [Buildroot] [PATCH 0/2] Adding support for gpiod v2.0 and higher
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
Cc: buildroot@buildroot.org, vfazio@xes-inc.com, bstruempfel@ultratronik.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Boerge Struempfel wrote:
> we introduce libgpiod v2.0 as a new package libgpiod2.

I am worried the name "libgpiod2" may cause some confusion. The first
Google hit for this name points to the Debian package libgpiod2,[1]
which carries version 1.6.3 of the libgpiod library. The version number
mismatch is discussed in a thread of the linux-gpio mailing list:[2]

Thomas Williams asked:
> Are libgpiod2 and libgpiod v2 referring to different meanings of "2" ?

Bartosz Golaszewski answered:
> Ha! Yes they do, it's distro's packaging shenanigans! Basically the
> API version and the ABI version of libgpiod are different as we had a
> non-compatible ABI change back during v0.x.y development. Current API
> version for v1.6.x is 2.something.something. You'll see that while the
> development files and other packages are just called libgpiod on
> ubuntu and debian, the package containing the shared library is called
> libgpiod2.

Buildroot doesn't need to follow the Debian numbering scheme, but we
should then expect questions coming from confused users...

Regards,

Edgar.

[1] https://packages.debian.org/unstable/libgpiod2
[2] https://lore.kernel.org/all/CAEdwc-Qm8hqvJhVLWeqLDYGL2mtH7S=TH=pwhzb5T-nMGD_ugw@mail.gmail.com/t/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
