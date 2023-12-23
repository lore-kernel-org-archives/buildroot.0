Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4B5C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E0441841;
	Sat, 23 Dec 2023 17:51:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79E0441841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvkRL4eZIq-b; Sat, 23 Dec 2023 17:51:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C08A0418A9;
	Sat, 23 Dec 2023 17:51:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C08A0418A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 28DE81BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7DB60DA5
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7DB60DA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIe7ufFJQY3V for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:51:17 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DABC660D8E
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DABC660D8E
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA1A740003;
 Sat, 23 Dec 2023 17:51:14 +0000 (UTC)
Date: Sat, 23 Dec 2023 18:51:14 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231223185114.74d0336c@windsurf>
In-Reply-To: <87jzpx4qmz.fsf@48ers.dk>
References: <20231129211011.1207351-1-fontaine.fabrice@gmail.com>
 <87jzpx4qmz.fsf@48ers.dk>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703353875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+bDefrIOSR6U8jlqa4nWea9GPGQSMnvhqJE5WYeBno=;
 b=m+WceF65adEOOK/s2q00AH+W4K0Y8iGFRG+C3xE3uRzk+nYPLHkOlhwDm2b8rNMFZKU6VH
 8ME1RnBY/hL7FO5/bO89EFz+BHmkdFQFtkrlKQ1dVZgqmDNP2cAw1v7ZOQqKq+4pfFg4Wg
 77NkSqC4Z4nQugqgWjjzrnNXh9LVkh2SIfvWikn7DBNy3dWpZySeix7HXScKwEREWKaxW0
 bqW9zRDeNN7LK4nIQgr/Aa0oKRlGFtV7fyv0r/A5/Ys+CIhtP93s54ZRbyjGoe2imrz8gl
 RbiRST+QWVFw7YhpWde6A+dokiAzxPtUXOREyZgDIS/V+rREMPvehHsLem8Z4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m+WceF65
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix arm build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: romain.naour@smile.fr, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 01 Dec 2023 21:25:08 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Hmm,
> https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_TARGET.html
> states:
> 
> This variable may only be set in a toolchain file specified by the
> CMAKE_TOOLCHAIN_FILE variable.
> 
> Should we set this in the toolchain file instead? Romain?

I think zlib-ng usage of CMAKE_C_COMPILER_TARGET is non-standard. I
don't think it's supposed to be used by the CMakeLists.txt machinery of
a particular package.

The link you refer to says:

  Some compiler drivers are inherently cross-compilers, such as clang
  and QNX qcc. These compiler drivers support a command-line argument
  to specify the target to cross-compile for.

We are not using clang nor QNX qcc.
https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html also
refers to this variable only for clang
(https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-using-clang)
and QNX
(https://cmake.org/cmake/help/latest/manual/cmake-toolchains.7.html#cross-compiling-for-qnx).

Therefore, my feeling is that zlib-ng's usage of this variable is a bit
of a hack, and it's actually why it works when passed as an argument,
because they are in fact not supposed to use this variable. So I
believe Fabrice's patch is probably the most relevant solution, but
with an improved commit log that details the conversation we've had in
this thread.

Fabrice?

(I'm going to mark the patch as Changes Requested, to have a new
iteration that has a more detailed commit log summarizing this
discussion.)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
