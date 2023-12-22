Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3245EC41535
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 11:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C8961AF5;
	Fri, 22 Dec 2023 11:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C8961AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEVZNI0ThuIu; Fri, 22 Dec 2023 11:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03D6061B34;
	Fri, 22 Dec 2023 11:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03D6061B34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37A241BF2CC
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 11:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1108E83A3C
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 11:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1108E83A3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VI-qqpDAaX2 for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 11:49:02 +0000 (UTC)
X-Greylist: delayed 393 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 22 Dec 2023 11:49:02 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F5883412
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53F5883412
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 11:49:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 7EBC51814B9
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 12:42:25 +0100 (CET)
To: buildroot@buildroot.org
User-Agent: SOGoMail 5.9.1
MIME-Version: 1.0
Date: Fri, 22 Dec 2023 12:42:25 +0100
Message-ID: <4b-65857600-3-6c386780@147677216>
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1703245346; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=0jymJlA3eVrTm4ckWAn/E+ARS06iFW8a5T+B4570sR0=;
 b=qZPVes2tmvLjbNJliMxz+eKOPL6joafkwRK4DeUP9BE2LtY5Z0nxuqHkMxeJAWrwHY1UmN
 X4sxqIh7yE5h/DCCTsosfk+zuMd3eCy05oyrGI12pKgVuLHWknXt/dkirJeCukLJe7SxhR
 XyM4r2WHrMZctNlcDLU1Y0VAWVuW2kQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=qZPVes2t
Subject: [Buildroot] =?utf-8?b?UkZDOj89PT91dGYtOD9xPyBCb29zdDogZGVwZW5k?=
 =?utf-8?q?s_guard_for_C++11_support?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

I'm currently looking into bumping the boost package to the newly released 1.84.0 version [0].

A lot of packages dropped the C++03 support in this release (and others will follow). 
So this means a lot of altering of dependent packages to propagate the C++11 dependency.

Now "C++11 Support" is a fuzzy term. Looking at the gcc cxx-status page [1] we see that the first version having full C++11 support was 4.8.1.
Since we don't have guards for patch versions this would mean BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 would make sense.
So when looking at the depends-guards in the different packages we find a mixture of version claiming to guard for C++11 availability. The lowest version I found was gcc 4.7.

On the other hand the lowest gcc version in a toolchain at bootlin [2] I found is 5.4.
So the likelihood someone uses an older toolchain seems to be pretty low now.

So my question is: would it be okay to enforce a gcc version >= 4.9 for all boost libraries requiring c++11 or is it necessary to try out if lower gcc versions would also work for certain libraries?
Please advise!

Regards,
Michael


[0] https://www.boost.org/users/history/version_1_84_0.html
[1] https://gcc.gnu.org/projects/cxx-status.html#cxx11
[2] https://toolchains.bootlin.com/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
