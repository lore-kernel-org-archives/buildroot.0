Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336ABC28CF5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 20:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF515417A7;
	Wed, 26 Jan 2022 20:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v7v6Mfvd1nlK; Wed, 26 Jan 2022 20:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36425417A5;
	Wed, 26 Jan 2022 20:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72CBD1BF4D5
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6101160DC2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 20:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2qWkSFUQq6Q for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 20:09:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52B2D60B1B
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 20:09:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BE329C0005;
 Wed, 26 Jan 2022 20:09:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nCobz-0006N6-ID; Wed, 26 Jan 2022 21:09:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220102174329.2823931-1-fontaine.fabrice@gmail.com>
Date: Wed, 26 Jan 2022 21:09:47 +0100
In-Reply-To: <20220102174329.2823931-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 2 Jan 2022 18:43:29 +0100")
Message-ID: <877damfed0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libiio: set PYTHON_EXECUTABLE
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Set PYTHON_EXECUTABLE to avoid the following build failure when
 > BR2_PACKAGE_PYTHON is enabled but libiio finds python3 without
 > setuptools on host:

 > -- Found Python: /usr/bin/python3.5 (found version "3.5.3") found components: Interpreter
 > -- new
 > -- Python_EXECUTABLE /usr/bin/python3.5

 > [...]

 > Traceback (most recent call last):
 >   File "/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.23/bindings/python/setup.py", line 15, in <module>
 >     from setuptools import setup
 > ImportError: No module named 'setuptools'

 > Fixes:
 >  - http://autobuild.buildroot.org/results/d80e56e4ad84c8e7f244cf6d1cb96c116e8eb734

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
