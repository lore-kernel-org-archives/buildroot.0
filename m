Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FFBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 21:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29825409C0;
	Thu, 30 Dec 2021 21:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8mOArpxKNwQ; Thu, 30 Dec 2021 21:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DDA1410A7;
	Thu, 30 Dec 2021 21:54:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3191D1BF3C4
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 201A260AC5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 21:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbqnNRA9Nojr for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 21:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 925F46080A
 for <buildroot@uclibc.org>; Thu, 30 Dec 2021 21:54:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1n33N8-0003fY-HL
 for buildroot@uclibc.org; Thu, 30 Dec 2021 22:54:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 30 Dec 2021 22:53:09 +0100
Message-ID: <pan$69874$a4159c0a$a745d152$79b3caea@ID-313208.user.individual.net>
References: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
 <20211230205544.2056341-3-bernd.kuhls@t-online.de>
 <20211230223421.059f0917__21186.4138067298$1640900090$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 3/4] package/Makefile.in: fix per-package
 build with gettext-gnu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Thu, 30 Dec 2021 22:34:21 +0100 schrieb Thomas Petazzoni:

>>  TARGET_NLS_DEPENDENCIES = host-gettext
>>  ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
>> -TARGET_NLS_DEPENDENCIES += gettext
>> +TARGET_NLS_DEPENDENCIES += gettext-gnu
> 
> gettext is a virtual package that depends either on gettext-gnu or
> gettext-tiny, and both of them provide a libintl implementation.
> 
> How can this patch be correct?

Hi,

it is not as I can not reproduce the build error anymore.
Sent v2 without this patch, sorry for the noise.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
