Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49028C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 22:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A866560BC6;
	Sat, 15 Jan 2022 22:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3sRBJG3uQwd; Sat, 15 Jan 2022 22:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48AA6063B;
	Sat, 15 Jan 2022 22:37:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C49C1BF373
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 551CE40589
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 22:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKeBwMz5iBwA for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 22:37:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4382400BA
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 22:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642286258;
 bh=kqRPf+F2R7fIV0o1mrNrJqr3GI7CVJ+yCEGWspar5BY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=INlhz2MT9dSOyWEG1bvX7eXrecol+HbiFlPHrgDdy5WF5rWR3qrYc5gb3Yo/BNQfT
 k+68Ps0Jq7U4QRU8ar4dI6vAv7wR6lbEQA7yTFIWW95SfmNgKD5HwVte59MZqupdWq
 cnHgLWyb9nrrtfwjpDuQc0wf3g/mCdQX9+/YcLzA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIdeX-1n5L1g40M1-00Ec0M; Sat, 15
 Jan 2022 23:37:38 +0100
Date: Sat, 15 Jan 2022 23:37:36 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220115233736.634f0d0b@gmx.net>
In-Reply-To: <20220112203939.606775-1-james.hilliard1@gmail.com>
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:w84x9n3XVg3cefUHIwoeTwIC2KvZAfid4p+gVJ05or2AHUHTYVY
 pMtz1rmm/j+c+xbkXCgpFA2tya9FxEa7wcCkiJkKQj+r2wknX1Cyji9Q6vXQ6/5mtbF7mQ0
 gnJ5pz2cabFCrpqrozUk1kjLqoUxxYJJITzvUEpcG+YkWcofQRQvSxe0gK6ukYeNww2JFYs
 nsA+qd21iRm282rfIc9DQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XKrEUr0Nb7A=:Xm5alUOvD7UE1hwQufcmcV
 Qqw17kMgXp7o4vcn5k9L3cuBkPM2mO5aRR/qLaR/edKgWpFAtoERDmcsKxG7v6eLtvA6b20gs
 bkX9i0PnBDL4EcM40usa6cS7geWi+4fAITtejDbWWIKxU9jdhtipyneB2y7sV8z5mgZ+hxdMZ
 EEunLioGdRMxDchN0o6PQZWZkB/PlHMP1fDUJtP1mlrCQ7F8wbvDrVUVnWTL7crx4f65m8YPA
 sdz24fB66uotaTyj2HXba0W5M6o+5g3EMALf1sTMwqhwYIFI7Ds6MibY/hB6FUiNMPfTquX1a
 2fWmWi/+6hxkctYPWKBR6wp+ODKzaHT4DqZPWyE0dJvu0VzI6YQU8MMlwZ5nWS+jrnKMujHJ3
 aIWtNPAGCn9TsT3I9kAyOUre2X+DQ5QnZpy1Dd2OqCp0CHch/pACYcyHHx9eJBBuGdtQojxrO
 VpuBf8a/JRf53jGPSmAyY2xf4hbnahLNVw6nDyOJu/bpE9Fg2LmKbuE16WGXe2HrT87jaa2Ph
 0DlXF24ZyZgYsFN0Mjo5jgeWpVCBmf0ph/kmvhtW/SF8jqAbfHBRoyqdSenuZMrGDbE/UMfv6
 nxEWC4aIA+1Bmnu0GCxX9KV6WSo6jsXSbRI8vAQx5eRqLjg3sdLtxOWKwOQfqxe1LwurATscf
 8t84dgrMS3MP0yQ0hWpOhl7grarrKq/FcFYau5FKRrm2HiRWR7JUbHyXjq3TPKdZX+1u8OwHv
 m2LCVJOt9pTBQ/EUjUgurpjPMFuOxb8NVWSgEAxPjXmg9JUTvCmDQYitwJVYldseu7T4owKRh
 /W1T6SG5fNFLlSeuvvbg7MQCrocqJhSwtoTsy0hzavlyiSQJLe7Klcyt77BdkBXKJSktGGMzk
 9lPEACMY84dmGyHwUIyqJntirdP7d3E70/f3s3wez4AoF3mDNRp7TEsji52G9Q4dCJR/+pz7v
 DjgCd0vn6pgFP1fMdjx45WFzBF6tfk2q5Zs0NX/CKCFQlCeyLHfzVVHs3z9K4maSqpnCSa/O1
 q36bX8279UY/yuy3AhcxJkTrb9IpXQs94AE1RdnY4Jo+InM4+KovxUhQlQkk5fGD343sYLfHR
 Yw+1dbeLZpsO4k=
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, *,

On Wed, 12 Jan 2022 13:39:39 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Currently the qmake gcc sysrootify path logic causes issues with
> per-package directories, disable automatic gcc sysroot for qt5base
> install and override all qt.conf paths manually to point to their
> correct locations.
>
> Redirect HostData to STAGING_DIR as mkspecs need to be available there
> instead of the HOST_DIR for cross compilation to work.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
>  package/qt5/qt5base/qt5base.mk |  2 ++
>  2 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> index 2215cbd4e1..db9ab0c364 100644
> --- a/package/qt5/qt5base/qt.conf.in
> +++ b/package/qt5/qt5base/qt.conf.in
> @@ -2,6 +2,18 @@
>  Prefix=/usr
>  HostPrefix=@@HOST_DIR@@
>  Sysroot=@@STAGING_DIR@@
> -Headers=/usr/include/qt5
> -Plugins=/usr/lib/qt/plugins
> -Examples=/usr/lib/qt/examples
> +SysrootifyPrefix=false
> +Binaries=@@STAGING_DIR@@/usr/bin
> +Libraries=@@STAGING_DIR@@/usr/lib
> +Headers=@@STAGING_DIR@@/usr/include/qt5
> +Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
> +Examples=@@STAGING_DIR@@/usr/lib/qt/examples
> +Data=@@STAGING_DIR@@
> +Translations=@@STAGING_DIR@@/translations
> +ArchData=@@STAGING_DIR@@/usr
> +LibraryExecutables=@@STAGING_DIR@@/usr/libexec
> +Imports=@@STAGING_DIR@@/usr/imports
> +Qml2Imports=@@STAGING_DIR@@/usr/qml
> +HostBinaries=@@HOST_DIR@@/bin
> +HostLibraries=@@HOST_DIR@@/lib
> +HostData=@@STAGING_DIR@@
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index bcdf036f00..6c05e710d8 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
>  		-v \
>  		-prefix /usr \
>  		-hostprefix $(HOST_DIR) \
> +		-hostdatadir $(STAGING_DIR) \
>  		-headerdir /usr/include/qt5 \
>  		-sysroot $(STAGING_DIR) \
> +		-no-gcc-sysroot \
>  		-plugindir /usr/lib/qt/plugins \
>  		-examplesdir /usr/lib/qt/examples \
>  		-no-rpath \

This one leads to the following compile failure for qt5webengine-5.15.2:

  .../host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find crti.o: No such file or directory
collect2: error: ld returned 1 exit status


But the file crti.o exists:

	$ find . -name crti.o
	./build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/csu/crti.o
	./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/crti.o


Did not (yet) test with your latest (v2) patch iteration...

Compile with qt5webengine bump to 5.15.8-lts fails already before the linking stage
(see secoidt.h/pk11pub.h No such file or directory failure reported by already by
Thomas)...

Regards,
Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
