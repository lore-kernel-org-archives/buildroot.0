Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B3AC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 907EA405A6;
	Sun,  9 Jan 2022 18:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHuGiY9U3JaE; Sun,  9 Jan 2022 18:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EF5740495;
	Sun,  9 Jan 2022 18:18:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D81D1BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C0A660BC3
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfmA6iRfV-SA for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1D8460B91
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:18:48 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id g80so32562532ybf.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 10:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9gu/LJKsIL7meh8+mvnI6bSqNiaKepvC6Ngin1mYFnA=;
 b=nTw5Q7PjH19wSXx/C7ro8D9SKCyJKHlIGSOndvMGVXSNsdCFo1i9HteYZ29TVDnPYT
 dhIHLrqD5APFZ8tsYL2n64DEvCjOmpH3MxCwMKZTkzcv07SALZGZvDcHh9+U2KkiT7OA
 XOOYmvV1RM94XkZP9Cp1O82PUxfD9Rxpts8ZBjfbDDlySGwyjvz/13gv1nXvBdNgLHHy
 HREQHD0TileTYURq6eHEvsXb2oVhx0Unncefk1PxgUU76U394GbN1sKt9M/rTqnjyQH2
 4LM+rK2n7uZFTGZVaIgJvo14U9NcaYrHF6xoRZCTm1Cj+Yq+HKahlTmY0gC4RRC2aun6
 /uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9gu/LJKsIL7meh8+mvnI6bSqNiaKepvC6Ngin1mYFnA=;
 b=nL/nkXeaokqfZ25X2trnbROMeji8fbIwG0mM5NkbXjyz1Hvh+UpG0U+WoDiiR48z0E
 0p9aMG4Hae798vBFqu5/jaP5nthXA2P4smvk4AYPybnCpitzaYO8qtqR5GQLrhdR8+Ss
 8uCHZm7W04EH0KDICV/y03LoRG1dcdo/Ga7FELz+RVfHldtyK3F+Drf+CU81I1B7Pxde
 p7M1uKyYqQ9ff8pvkMbch4jDvSmUumjUop8j79P+snmg0DzIQGiQqwoezIlZeoBI5h/z
 nU5b46RINLIjLyKN2zydLchzL2OXXb17gp1Opyp4n++GcvxC1qurFoTjd0Vg97Pc48Ef
 w+zA==
X-Gm-Message-State: AOAM532uY1EkaYT5Bw+/69auVSFeu2ZeZ5stIzP2h5qHRwZcL7t+vTYD
 i95BnG5yJ48p3sZxctzTjnnsXi0oiuIbmZop2Co1vbn4XTs=
X-Google-Smtp-Source: ABdhPJzRdjWZ4+1oqVQMsi8tgGYWPvRvtQHaYFFhrqBAsdBWzFD7CqczV+rWslwj2L57/VVCowQx6XBGiUXcnkLR9hU=
X-Received: by 2002:a25:48a:: with SMTP id 132mr86876794ybe.257.1641752327416; 
 Sun, 09 Jan 2022 10:18:47 -0800 (PST)
MIME-Version: 1.0
From: William Tambe <tambewilliam@gmail.com>
Date: Sun, 9 Jan 2022 12:18:36 -0600
Message-ID: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] BR2_PACKAGE_DHCP_CLIENT fails to build:
 readline/history.h: No such file or directory
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

I am attempting to build:

+BR2_PACKAGE_DHCP=y
+BR2_PACKAGE_DHCP_CLIENT=y

However it fails as follow complaining about not finding readline/history.h:

making all in /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/bin/nsupdate
/home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc
-I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35
-I../.. -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/lwres/include
-I../../lib/lwres/unix/include -I../../lib/lwres/include
-I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/dns/include
-I../../lib/dns/include
-I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/bind9/include
-I../../lib/bind9/include
-I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isc/include
-I../../lib/isc -I../../lib/isc/include -I../../lib/isc/unix/include
-I../../lib/isc/pthreads/include -I../../lib/isc/noatomic/include
-I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isccfg/include
-I../../lib/isccfg/include    -D_REENTRANT -DVERSION=\"9.11.35\"
-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g0  -static   -W -Wall
-Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat
-Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks
\
        -DSESSION_KEYFILE=\"/var/run/named/session.key\" \
        -c ./nsupdate.c
./nsupdate.c:104:10: fatal error: readline/history.h: No such file or directory
  104 | #include <readline/history.h>
      |          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [Makefile:473: nsupdate.o] Error 1
make[4]: *** [Makefile:79: subdirs] Error 1
make[3]: *** [Makefile:88: subdirs] Error 1
make[2]: *** [package/pkg-generic.mk:270:
/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/.stamp_built]
Error 2
make[1]: *** [Makefile:23: _all] Error 2
make[1]: Leaving directory '/home/tambewilliam/Documents/buildroot-build'
make: *** [pu32/makefile:67: pu32-build/buildroot] Error 2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
