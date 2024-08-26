Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C331CC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 17:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EBE5402D7;
	Mon, 26 Aug 2024 17:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paePlcUA-CIV; Mon, 26 Aug 2024 17:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E39D140374
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E39D140374;
	Mon, 26 Aug 2024 17:30:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 715371BF336
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 17:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A28480ACE
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 17:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HWj68_hRqXi for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 17:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com;
 envelope-from=veredz72@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96531804F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96531804F6
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96531804F6
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 17:30:51 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-70df4b5cdd8so3700372a34.1
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 10:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724693450; x=1725298250;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QIvk8MOM4ncB2uURWazh7BX+qNORD9l0fMXGSTMJfPk=;
 b=S5zxSgm2wpb80C+QuYEKbHf0byW1Sh0oQqGekNWx6efy3SU9eAuDYRftjHhsXDvAAe
 ok5samt+Ae8rswBioET4zR0GHj28MdtdDUr52/xTV7AtLQ5FSABJDw5a7P5R6YqPzdYA
 z3dp2i44V+pVr2LbfFDecMxdMtHeU5euI08YZXMO621bcmCfZYR3+YZ3y8OeHetixw62
 STGNRjV5eI8eOD+aB8r03Zj1H/zaZePc6MzH/m3orZa9PoARFIF9OPYahNDdPV3zudNb
 Cs+l4tkby2MpUcVy2gUel+TYe6nm0ykg99oLRqI9d3VZlRWtY0G6n5HPctEbccnJvHRw
 LTHA==
X-Gm-Message-State: AOJu0YxXwElVzT2jLqB+5J9FsfB7HCnKvI4KWuXvflu4JTlSzD5+/l7W
 GPvAAL1CUgZxjwvMizzO+tDTsNPFQK972tXu1dzA8VxRr2Mx2keGz0LrgcNkJVIYIPw1s5MSxT9
 MnA1x/rJNBgWFjit7gT0srR8j+qVl1W2l8Vk=
X-Google-Smtp-Source: AGHT+IG75fxBYM4EEhPJ3iSZqjLSEjur6gT60x2QIjYTvYpp4oxOIm3ecoxjkIOTFHtyBHWV8ZdrxrwqyslTa6iPEcE=
X-Received: by 2002:a05:6830:2a15:b0:709:3fb0:3bee with SMTP id
 46e09a7af769-70f48459161mr115404a34.27.1724693450348; Mon, 26 Aug 2024
 10:30:50 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Mon, 26 Aug 2024 20:33:38 +0300
Message-ID: <CABRndgxTm1MSRGOhSayghfmwBo8bUJEeH_0icAsNyihN-Jt2rg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724693450; x=1725298250; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QIvk8MOM4ncB2uURWazh7BX+qNORD9l0fMXGSTMJfPk=;
 b=frokj8rigclkANB7NyZCZATwF4qbGeQ8VMqj/Gzvu+MnmD1KOaKdGXzDBK7AtG7g6k
 7MODDM10hxBQtthzsEd4Us4gt7Ry/ivwe7opodKK0ziCSPzvd7hguE4SXH+9lxrQ21os
 L0poTgtl654Nq5LniVby1RInA0AwX4/cILwOyqKUWO/ZOt0LeJJluTZ9uj1VjvkmYF38
 7hiAHH3Ews7IN5GZGZfZtpou8yXa15645y6jbkGHfWXLvHJuviSRksCUMp9cxOglse54
 8H9h60HxXr5yFQq/7urQusTJmyVTELLPoRRanEujf2tMy5qjbUtSDWWYm1b0MTHvVRga
 0u6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=frokj8ri
Subject: [Buildroot] 2021.02 : luksFormat - Cannot initialize crypto backend
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
Content-Type: multipart/mixed; boundary="===============7221440066687376096=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7221440066687376096==
Content-Type: multipart/alternative; boundary="0000000000007461370620997ca8"

--0000000000007461370620997ca8
Content-Type: text/plain; charset="UTF-8"

Hello,

I built rootfs for x86 CPU with buildroot 2021.02
In order to use luks I included: BR2_PACKAGE_CRYPTSETUP
Upon boot completion I ran:
cryptsetup -v --debug luksFormat --key-file /tmp/keyfile /dev/sda3"

and got:

# cryptsetup 2.3.4 processing "cryptsetup -v --debug luksFormat --key-file
/tmp/keyfile /dev/sda3"
# Running command luksFormat.
# Locking memory.
# Installing SIGINT/SIGTERM handler.
# Unblocking interruption on signal.
# Allocating context for crypt device /dev/sda3.
# Trying to open and read device /dev/sda3 with direct-io.
# Initialising device-mapper backend library.
WARNING: Device /dev/sda3 already contains a 'ext2' superblock signature.

WARNING!
========
This will overwrite data on /dev/sda3 irrevocably.

Are you sure? (Type 'yes' in capital letters): YES
# File descriptor passphrase entry requested.
Cannot initialize crypto backend.
Failed to set pbkdf parameters.
# Releasing crypt device /dev/sda3 context.
# Releasing device-mapper backend.
# Unlocking memory.
Command failed with code -1 (wrong or missing parameters).

Can you please tell what is the cause to this error ?
I'm using vanilla 4.9.20 kernel with x86_64 defconfig.
Should I add any component to buildroot ?

Thank you,
Zvika

--0000000000007461370620997ca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I built rootfs for x86 CPU with =
buildroot 2021.02</div><div>In order to use luks I included:=C2=A0<span sty=
le=3D"color:rgb(0,0,255);font-size:14px;white-space:pre"><font face=3D"verd=
ana, sans-serif">BR2_PACKAGE_CRYPTSETUP</font></span></div><div>Upon boot c=
ompletion I ran:</div><div>cryptsetup -v --debug luksFormat --key-file /tmp=
/keyfile /dev/sda3&quot;<br></div><div><br></div><div>and got:</div><div><b=
r></div><div># cryptsetup 2.3.4 processing &quot;cryptsetup -v --debug luks=
Format --key-file /tmp/keyfile /dev/sda3&quot;<br></div><div># Running comm=
and luksFormat.<br># Locking memory.<br># Installing SIGINT/SIGTERM handler=
.<br># Unblocking interruption on signal.<br># Allocating context for crypt=
 device /dev/sda3.<br># Trying to open and read device /dev/sda3 with direc=
t-io.<br># Initialising device-mapper backend library.<br>WARNING: Device /=
dev/sda3 already contains a &#39;ext2&#39; superblock signature.<br><br>WAR=
NING!<br>=3D=3D=3D=3D=3D=3D=3D=3D<br>This will overwrite data on /dev/sda3 =
irrevocably.<br><br>Are you sure? (Type &#39;yes&#39; in capital letters): =
YES<br># File descriptor passphrase entry requested.<br>Cannot initialize c=
rypto backend.<br>Failed to set pbkdf parameters.<br># Releasing crypt devi=
ce /dev/sda3 context.<br># Releasing device-mapper backend.<br># Unlocking =
memory.<br>Command failed with code -1 (wrong or missing parameters).<br></=
div><div><br></div><div>Can you please tell what is the cause to this error=
 ?</div><div>I&#39;m using vanilla 4.9.20 kernel with x86_64 defconfig.=C2=
=A0</div><div>Should I add any component to buildroot ?</div><div><br></div=
><div>Thank you,</div><div>Zvika=C2=A0</div></div>

--0000000000007461370620997ca8--

--===============7221440066687376096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7221440066687376096==--
