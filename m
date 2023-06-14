Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23BCEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6767E6133C;
	Wed, 14 Jun 2023 14:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6767E6133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CknCvH8C3Ypa; Wed, 14 Jun 2023 14:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9690761342;
	Wed, 14 Jun 2023 14:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9690761342
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 178F51BF2B7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F17FB402C0
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F17FB402C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 93rK2ir8JUzC for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5BA640137
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5BA640137
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:53:37 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4EC520015;
 Wed, 14 Jun 2023 14:53:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9RsM-008AOG-0N; Wed, 14 Jun 2023 16:53:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230605095607.332091-1-romain.naour@gmail.com>
 <20230605095607.332091-2-romain.naour@gmail.com>
Date: Wed, 14 Jun 2023 16:53:33 +0200
In-Reply-To: <20230605095607.332091-2-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 5 Jun 2023 11:56:07 +0200")
Message-ID: <87v8fqm6xe.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libjxl: requires host-cmake >=
 3.19
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > libjxl requires cmake 3.19 since version v0.7 due to the
 > new behavior of cmake [1].

 > -- Configuring done
 > CMake Error at cmake/FindLCMS2.cmake:40 (add_library):
 >   INTERFACE_LIBRARY targets may only have whitelisted properties.  The
 >   property "INCLUDE_DIRECTORIES" is not allowed.
 > Call Stack (most recent call first):
 >   third_party/CMakeLists.txt:114 (find_package)

 > The portability issue has already been reported upstream [2].

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819095

 > [1] https://gitlab.kitware.com/cmake/cmake/-/commit/afb998704e67d3d3ce5b24c112cb06e770fca78d
 > [2] https://github.com/libjxl/libjxl/issues/1425

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Julien Olivain <ju.o@free.fr>

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
