Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B605C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 19:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ABF2401F4;
	Sun, 11 Dec 2022 19:01:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ABF2401F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jT9v1HSaaPN; Sun, 11 Dec 2022 19:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D0940258;
	Sun, 11 Dec 2022 19:01:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85D0940258
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7431BF5F5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 19:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB9E60BD4
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 19:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB9E60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mT7AVHKds4iU for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 19:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC11560BBC
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC11560BBC
 for <buildroot@uclibc.org>; Sun, 11 Dec 2022 19:00:56 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1p4RZG-0000bp-43
 for buildroot@uclibc.org; Sun, 11 Dec 2022 20:00:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Dec 2022 20:00:29 +0100
Message-ID: <pan$8d7d7$b70197aa$982d57cd$616426a1@ID-313208.user.individual.net>
References: <20221210100701.3067908-1-francois.perrad__8668.0867172376$1670666855$gmane$org@gadz.org>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH] package/swig: bump to version 4.1.1
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

Am Sat, 10 Dec 2022 11:07:01 +0100 schrieb Francois Perrad:

> Signed-off-by: Francois Perrad
> <francois.perrad@gadz.org>
> ---
>  package/swig/Config.in.host | 2 +-
>  package/swig/swig.hash      | 2 +-
>  package/swig/swig.mk        | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Hi,

this bump breaks the build of znc:

[  2%] Generating modpython_biglib.cpp, znc_core.py
Deprecated command line option: -py3. Ignored, this option is no longer 
supported.
/home/bernd/buildroot/output/build/znc-1.8.2/include/znc/Modules.h:60: 
Error: Macro 'ZNC_EXPORT_LIB_EXPORT' redefined,
:1: Error: previous definition of 'ZNC_EXPORT_LIB_EXPORT'.
make[2]: *** [modules/modpython/CMakeFiles/modpython_swig.dir/build.make:
75: modules/modpython/modpython_biglib.cpp] Error 1

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
