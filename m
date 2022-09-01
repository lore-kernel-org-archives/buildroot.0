Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A35AECAAD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 19:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2314860BCA;
	Thu,  1 Sep 2022 19:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2314860BCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1r6wEe6-Zw8J; Thu,  1 Sep 2022 19:48:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EBF160899;
	Thu,  1 Sep 2022 19:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBF160899
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A28E21BF308
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 19:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DCFE401E1
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 19:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DCFE401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHKYD4dqU9m2 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 19:48:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E9C540134
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E9C540134
 for <buildroot@uclibc.org>; Thu,  1 Sep 2022 19:48:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e679:ffcd:1bfc:6eba])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1FB6413FA47;
 Thu,  1 Sep 2022 21:48:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 01 Sep 2022 21:48:25 +0200
Date: Thu, 1 Sep 2022 21:48:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Grant Edwards <grant.b.edwards@gmail.com>
Message-ID: <20220901194825.GM68979@scaer>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ter0vs$i38$1@ciao.gmane.io>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662061709;
 bh=gLSLEU8WL/Z+1eHxbIiV3XO9bFpCJT4Ud0tPcc8Yeeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fEPByyZmZNxiWVcKauuprDEYVqjPrqAR7UKCKrBQYQhaGOcel2CzrSib0Mq67zI0x
 QdXlfR0nX5Ykc+QGToRqWvZzAmTyYrtIQFWxEiYsMLOu4Olu8DjmbeKnW03Cf//Wrw
 kdswHEK9FTi0aunB52cA7QgIscfnRPd54q2/sVBHva8+QgyBfl+mPVj5RagRLohmEQ
 djhw5JZWJY4tI8msHsn0BQcMYh11vL1bf1QV2j4AlEnA8H8iH8QE0/mxdu/mT9pCAW
 7i7MRAv3pOvy9zlc7RXDIGNr3Z/wrv5kLqkr1+TEwJVdN2SNmSgTzGPJ8TMNJj8uAH
 JnHAiJgU5xY8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fEPByyZm
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@busybox.net, buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Grant, All,

On 2022-09-01 19:25 -0000, Grant Edwards spake thusly:
> On 2022-09-01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-09-01 18:41 -0000, Grant Edwards spake thusly:
> >> Is there any source for an sftp-server for use with dropbear other
> >> than openssh?
> > What about gesftpserver, that has been present since Buildroot 2013.02?
> I currently can't select it in "menuconfig" because it requires a
> toolchain with wchar support.  I think my (exernal) toolchain does
> have wchar support, but apparently buildroot hasn't been told about
> it...

Wchar is optional only for uclibc toolchains; for glibc and musl, wchar
is always available.

If you are using a pre-configured toolchain, that has wchar, but is not
enabled in Buildroot, please send a patch to fix that.

If you are using a custom toolchain, then the conformity of whar is
checked. You must select BR2_TOOLCHAIN_EXTERNAL_WCHAR (or deselect it)
if your toolchain has wchar (or does not have it). Not doing so is going
to result in a buildtime error. See toolchain/helpers.mk, line 306,
which calls check_uclibc_feature, which will error out if the setting is
not correct.

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
