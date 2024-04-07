Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D69CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5EA881C56;
	Sun,  7 Apr 2024 11:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXh7E_-QUsXW; Sun,  7 Apr 2024 11:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC6C781CE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC6C781CE3;
	Sun,  7 Apr 2024 11:30:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A37E81BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C743407C4
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tg0VqqTaDMan for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:30:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58400407C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58400407C0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58400407C0
 for <buildroot@uclibc.org>; Sun,  7 Apr 2024 11:30:12 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1rtQiv-00037M-6M
 for buildroot@uclibc.org; Sun, 07 Apr 2024 13:30:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 07 Apr 2024 13:29:43 +0200
Message-ID: <pan$a424$ea89d883$a12e2e72$9f204800@ID-313208.user.individual.net>
References: <20240406073216.1054073-1-bernd@kuhls.net>
 <20240406073216.1054073-5-bernd@kuhls.net>
 <ZhJs8G5Uyf0Rs4ai__34546.5504725993$1712483606$gmane$org@landeda>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 05/18] package/kodi: bump version to
 21.0-Omega
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

Hi Yann,

Am Sun, 7 Apr 2024 11:52:48 +0200 schrieb Yann E. MORIN:

>> Added new required dependency to tinyxml2:
>> https://github.com/xbmc/xbmc/commit/
9e983ed0449aaf3007d8bfa3261056b120d84188
> 
> So, is the dependency to tinyxml still needed?

yes, kodi is moving to tinyxml2 only module by module:
https://github.com/xbmc/xbmc/pulls?q=migrate+tinyxml2+

>> Upstream removed the bundled groovy/apache commons binaries:
>> https://github.com/xbmc/xbmc/commit/
d6bc920e056baad7782f47b86cba85d1336bb134
> 
> Any reason why we can't make those additional host packages, e.g. like
> add host-groovy, and then use the new -D options listed int hat commit,
> to point kodi where they are installed in?

No, but I did not saw any other java packages in buildroot and did not 
want to create a new type of package just to provide some host-only files.
Since kodi includes code for the libdvd* packages I extended that part of 
kodi.mk to keep it simple.

> Also, I see you use sha256 hashes for those, but kodi uses sha512
> hashes, so I think it would be better to use the same hashes as kodi, so
> that we can check that indeed what we get is what kodi expects.

Will be included in v2.

>> Set KODI_SOURCE_DIR variable to root directory of the source tarball,
>> LibreELEC added something similar:
>> https://github.com/LibreELEC/LibreELEC.tv/commit/
70abdd27a22b22547060fcb00a2c70ea61721465

[...]

> In Buildroot, as we cross-build, we build the tools explicitly, without
> using the Kodi build process, and thus we must set that variable.

An updated commit log will be included in v2.

>> +	depends on BR2_HOST_GCC_AT_LEAST_9 # C++17
> 
> It's not Kodi itself that needs host C++17, it's host-kodi-texturepacker
> so the dependency needs to reflect that:
> 
>     depends on BR2_HOST_GCC_AT_LEAST_9  # host-kodi-texturepacker
> 
> (unless kodi itself needs it during its own build, of course, at which
> point you'll need to expalin so in the commit log as well.)

It does to create .xbt files needed by skins:
https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L187
https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L472

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
