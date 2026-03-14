Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2525A107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBEE60EE5;
	Sat, 14 Mar 2026 07:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pm07qo7udFZu; Sat, 14 Mar 2026 07:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B8560BC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773473229;
	bh=B4cG2QpLwWC3/K9HHkmj4kJnfG+z/uJOxkJ5pV6cvbg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jf3U98U4rkbfyVOiSzqE4J3yc5eXXuwjSvyNFs4GR/pZBxPTnD2q1r22ZsA4lJIyB
	 UkeG34vSsFghxugc7wFVUIFZDfM4ieVQWXLMDZWQkiZAMVF3AxoyhcRWmqYYkyU0vV
	 S/xRmnMlnyBqqjQVv8E4Qzgfo8qwpg6HjDZcL4AtfbJnXdOe/cQQ6tA+miqNqAyzcm
	 RBb2LCkMc98JmGV7E8uPgSKEZso7mbHXMFbgM0YrrN+Mpsg4B8KUdGQO0s8kZyc+Wy
	 7Cfa5e9UUQM4rK4lQdlX7rIX5+q2QxEsToipDvPEbCszNyESG+pOqVPRyEp/f9XOlt
	 fyI06DrAyW8xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B8560BC6;
	Sat, 14 Mar 2026 07:27:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E0A6B201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE9F880ECF
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsQ3Ovt7EQyT for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:27:06 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADB4180DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB4180DCD
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADB4180DCD
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:27:04 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id CBC35BDE1BE2;
 Sat, 14 Mar 2026 08:27:00 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 07:27:00 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Rustam <rustamabd@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <CAPzS6u_1RaVGk3gaD0jk1pP0e_azWxPFSX42G_ejqR-sWAOJKA@mail.gmail.com>
References: <20251227211415.2269024-1-rustamabd@gmail.com>
 <20251227232420.1644a29f@windsurf>
 <CAPzS6u_1RaVGk3gaD0jk1pP0e_azWxPFSX42G_ejqR-sWAOJKA@mail.gmail.com>
Message-ID: <132cf3552a756277ea2fa7c1e7e5b4ae@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1773473221; bh=uCFuuWNgxwXWGBpBHOyXRYNj7K/UXyaoNwJ9Ui9quaU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=0YK6VcoJZ1N9ihvlWaaaKondpmQ6Uzk2NeT5CIzsFKWFZHigAYL9CxSNrnW4Erk8N
 nsnN24VR4mMwtzlRnIlwfNFoRqqwKbIUcKTflaNM8JkQciI7jR5VrvU7x9dUqtmmnS
 85mREHJvh2/1rJZYqrOtfAELP7XCSFw6GYPzIEME=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=0YK6VcoJ
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain/toolchain-external:
 introduce BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS
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

Hi ALL,

On 2025-12-28 16:10, Rustam wrote:
> On Sat, 27 Dec 2025 at 23:24, Thomas Petazzoni 
> <thomas.petazzoni@bootlin.com>
> wrote:
> 
>> Hello Rustam,
>> 
> Hi Thomas,
> 

[...]

>> Currently restricted to glibc-based toolchains as glibc is backward- 
>> and
>> > forward-compatible with different kernel versions while uClibc and musl
>> > are not.
>> 
>> Not sure why this matters here though. Could you clarify?
>> 
> This is just a safeguard to prevent issues. From personal experience,
> uClibc and musl sometimes run into issues unless they are compiled for 
> the
> specific linux version on which they run.
> So this feature is only usable in combination with glibc.
> 

Actually this suggestion came from me. I have Buildroot build my 
toolchains, using uClibc and musl. I occasionally had problems when 
switching kernel versions and forgetting to rebuild everything. This 
might be a dependency issue, not directly related to the toolchain, but 
since Rustam only tested this using glibc, the restriction seems 
appropriate.

> 
>> Thanks!
>> 
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
> 
> Hope this clarifies,
> Regards,
> Rustam

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
