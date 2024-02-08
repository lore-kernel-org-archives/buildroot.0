Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A142C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 07:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D260042EFA;
	Thu,  8 Feb 2024 07:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-0VuX5Xr0Zr; Thu,  8 Feb 2024 07:59:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94B2B42EFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B2B42EFD;
	Thu,  8 Feb 2024 07:59:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C90E1BF36A
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 07:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 396068129B
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 07:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSxlhy89Ikp1 for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 07:59:25 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 52A2280E50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52A2280E50
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52A2280E50
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 07:59:23 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id A3C0FBDE1553;
 Thu,  8 Feb 2024 08:59:20 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 08 Feb 2024 07:59:20 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <e7cbd25938f13eeb6b674f836fef9619@umbiko.net>
References: <mailman.3620.1707247855.145104.buildroot@buildroot.org>
 <e7cbd25938f13eeb6b674f836fef9619@umbiko.net>
Message-ID: <a5777d5db49e22b535a9adb4f5996d4f@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1707379160; bh=n9gzxRiiQOVqinrghGQEUUeYavLt4/lioe6PEJ0cA7Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=wdvjtN8hBo40adB6Sy888NGGFeVDg7SftpvrlF12uyWhAmxZZyfvJ1X03UdNjUA72
 kafTQX5b3Du7OPD9DEqP8wXy+3203cd0Sdy2isE4+T3pnf2VsfgIl5ewdASiPHiMSh
 racxf26mmM/nhmcivBnldfSp5qjSNb573RP/Ru4A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=wdvjtN8h
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice, Romain, *,

more complicated than I thought ...

On 2024-02-07 11:30, Andreas Ziegler wrote:
> Hi Fabrice,
> 
> sorry in case I do not reply to the latest message in the thread; my 
> in-box is currently a bit crowded ...
> 
> On 2024-02-06 18:59, Fabrice Fontaine wrote:
> 
>> Message: 30
>> Date: Tue, 6 Feb 2024 18:59:00 +0100
>> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> To: Romain Naour <romain.naour@smile.fr>
>> Cc: buildroot@buildroot.org
>> Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
>> Message-ID:
>> 	<CAPi7W81fffV_0zMh50hgB7bw7++JZzkdSpFUXXbHMPMKmHtbQw@mail.gmail.com>
>> Content-Type: text/plain; charset="UTF-8"
>> 
>> Hello Romain,
>> 
>> Le mar. 6 f?vr. 2024 ? 18:32, Romain Naour <romain.naour@smile.fr> a 
>> ?crit :
>>> 
>>> Hello,
>>> 
>>> Le 06/01/2024 ? 11:12, Fabrice Fontaine a ?crit :
>>> > ncmpc is able to automatically detect NLS support since version 0.47 and
>>> > https://github.com/MusicPlayerDaemon/ncmpc/commit/c264db04dd30af301e7d85c9d145bb1f1ae3fea3
>>> > so let it handle automatically to avoid the following build failure with
>>> > a bootlin toolchain which embeds a gettext definition in libintl.h which
>>> > will clash with the fake gettext definition provided by ncmpc since
>>> > https://github.com/MusicPlayerDaemon/ncmpc/commit/95af27ab2d3ceb9df26ebb4e0d936e392a84c153:
>>> >
>>> > In file included from ../src/save_playlist.cxx:8:
>>> > /home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected unqualified-id before 'const'
>>> >    39 | extern char *gettext (const char *__msgid)
>>> >       |              ^~~~~~~
>>> > /home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected ')' before 'const'
>>> > ../src/i18n.h:22:20: note: to match this '('
>>> >    22 | #define gettext(x) (x)
>>> >       |                    ^
>>> >
>>> > Indeed, even if NLS is disabled by the user, libintl.h will be included
>>> > by
>>> > /home/fabrice/buildroot/output/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/or1k-buildroot-linux-gnu/bits/messages_members.h
>>> > though include <chrono>
>>> 
>>> We usually want to explicitly handle such option from Buildroot 
>>> package to not
>>> rely on automatic detection (as currently done).
>>> 
>>> It look like more a bug in ncmpc build system?
>> 
>> I don't know, upstream wants to have the same code with and without
>> NLS, so they decided to define a gettext macro when NLS is disabled.
>> I could find an upstreamable solution as upstream will probably reject
>> a patch that removes this gettext define and puts #ifdef ENABLE_NLS
>> before every gettext calls.
>> Do you have an upstreamable solution or should we just add a NLS
>> dependency to ncmpc?
> 
> This is probably not related to NLS, but to gettext being included in 
> the build by some other package. This tricks Meson into believing that 
> NLS is enabled.
> 
> Also, the code in meson.txt may lead to unexpected results:
> 
> if meson.version().version_compare('>= 0.59') and not mini
>   # Meson 0.59 has native libintl support
>   intl_dep = dependency('intl', required: enable_nls)
>   enable_nls = intl_dep.found()
> elif enable_nls.disabled() or mini
>   intl_dep = dependency('', required: false)
>   enable_nls = false
> elif cc.has_header('libintl.h')
>   intl_dep = dependency('', required: false)
>   enable_nls = true
> elif enable_nls.auto()
>   intl_dep = dependency('', required: false)
>   enable_nls = false
> else
>   error('libintl.h not found')
> 

<cut>

meson.txt works like nls=auto within Buildroot, thus reflecting the 
setting of BR2_SYSTEM_ENABLE_NLS, so no worries.

The toolchain seems to have been built with NLS support; the C++ library 
makes use of this:

[3/73] Compiling C++ object src/event/libevent.a.p/TimerList.cxx.o
FAILED: src/event/libevent.a.p/TimerList.cxx.o
/home/data/test/autobuild/host/bin/or1k-linux-g++ 
-Isrc/event/libevent.a.p -Isrc/event -I../src/event -Isrc -I../src -I. 
-I.. -fdiagnostics-color=always -Wall -Winvalid-pch -Wextra -Wpedantic 
-std=c++2a -O3 -Wcast-qual -Wcast-align -Wdouble-promotion 
-Wmissing-declarations -Wmissing-format-attribute -Wmissing-noreturn 
-Wredundant-decls -Wshadow -Wundef -Wvla -Wwrite-strings 
-fno-threadsafe-statics -fmerge-all-constants -Wno-non-virtual-dtor 
-Wno-format-truncation -D_GNU_SOURCE -fvisibility=hidden 
-ffunction-sections -fdata-sections -D_LARGEFILE_SOURCE 
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O3 -g0 -D_FORTIFY_SOURCE=2 
-fPIC -MD -MQ src/event/libevent.a.p/TimerList.cxx.o -MF 
src/event/libevent.a.p/TimerList.cxx.o.d -o 
src/event/libevent.a.p/TimerList.cxx.o -c ../src/event/TimerList.cxx
In file included from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/or1k-buildroot-linux-gnu/bits/messages_members.h:36,
                  from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/bits/locale_facets_nonio.h:2064,
                  from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/locale:43,
                  from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/iomanip:45,
                  from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/bits/chrono_io.h:38,
                  from 
/home/data/test/autobuild/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/chrono:3330,
                  from ../src/event/Chrono.hxx:6,
                  from ../src/event/TimerList.hxx:7,
                  from ../src/event/TimerList.cxx:5:
/home/data/test/autobuild/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:23:2: 
error: #error "libintl.h included here"
    23 | #error "libintl.h included here"
       |  ^~~~~

Probably the least invasive solution would be to add a new ncmpc 
dependency:

+ depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT || BR2_SYSTEM_ENABLE_NLS

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
