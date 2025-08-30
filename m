Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB66CA0EFF
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 05:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E554B80A87;
	Sat, 30 Aug 2025 05:00:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KWVhc2ykvuA3; Sat, 30 Aug 2025 05:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A38580A84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A38580A84;
	Sat, 30 Aug 2025 05:00:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FBF869
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 05:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 366F940058
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 05:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEPw26G8LIrc for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 05:00:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 22F274000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22F274000B
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22F274000B
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 05:00:15 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D5CA63520516; Sat, 30 Aug 2025 07:00:11 +0200 (CEST)
Date: Sat, 30 Aug 2025 07:00:11 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aLKFW9aM7cTdELxw@waldemar-brodkorb.de>
References: <20250829170522.2436314-1-thomas.petazzoni@bootlin.com>
 <aLIR6yJyANhTHgfj@waldemar-brodkorb.de>
 <20250829235155.721a4774@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250829235155.721a4774@windsurf>
X-Operating-System: Linux 6.1.0-38-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1756530012; bh=vjaXYAQMbRKgKHMZIWhGBWil8T3ydKnNoDa90vhYOhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DeAt+0Gdei+d0MmqQZPJPBxsV9BjOIUHSH+M8W3SvFiMcr9j4wHkea83BEpqp8KeP
 0Urhhd1/vKNLQX8SrEC7hBy7bqjcPBFxBUTyVaX1WlkY/bdsmy0N0lSX0mp+b1pFS3
 N6I0dy6yIE2ssjENOXtZo98689CunuoMNo0V9ZdIQEX5RySl/628sS8/7UaYuCb8rH
 KBBn5jAVvxiSjh5hYCXzbMgG/irUsqUzgays9AS6s5+Cjn8lxOI5FxbBJVij7+tlCQ
 bsZ6ALcNvVZXm5UTcrgyg9Ryg8xL4QoSzpJDTy3YhzAon/z6XWOQpWCbAWW/e1lgKk
 YXc08A4S0luZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=DeAt+0Gd
Subject: Re: [Buildroot] [PATCH] package/asterisk: fix build caused by
 libjwt bump
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> On Fri, 29 Aug 2025 22:47:39 +0200
> Waldemar Brodkorb <wbx@openadk.org> wrote:
> 
> > > Waldemar: you did the bump of libjwt. Are you using this library?
> > > Independently of Asterisk?  
> > 
> > No, I am fine with that change.
> 
> Sorry, but that doesn't really answer my question. You are both the
> maintainer of package/libjwt and package/asterisk, and you bumped
> package/libjwt, which is only used by package/asterisk, without testing
> that it doesn't break asterisk.

That is not true. I tested it. At least a basic test as always:
buildroot$ git checkout f11b9db0b5f150d73e10a0c25989e2ec6300588e
buildroot$ make raspberrypi5_defconfig 
buildroot$ make menuconfig <- choose asterisk
buildroot$ make
buildroot$ file output/target/usr/sbin/asterisk
output/target/usr/sbin/asterisk: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, for GNU/Linux 3.7.0, stripped
buildroot$ ./output/host/bin/aarch64-linux-gcc --version
aarch64-linux-gcc.br_real (Buildroot 2021.11-12449-g1bef613319) 13.3.0

The reason for the failures might be a newer gcc.
 
> Now that asterisk uses a bundled libjwt, do we need to keep the
> separate libjwt package?

No, for me it is okay to use the bundled one and remove the separate
package.

best regards
 Waldemar
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
