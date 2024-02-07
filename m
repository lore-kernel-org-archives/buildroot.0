Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20DCC4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A38083AD9;
	Wed,  7 Feb 2024 11:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpuw8T0wgT99; Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3857083A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3857083A92;
	Wed,  7 Feb 2024 11:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 568BB1BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43E45421B9
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SriuPgGj9uzu for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:39:12 +0000 (UTC)
X-Greylist: delayed 534 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 07 Feb 2024 11:39:11 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A6D04222A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6D04222A
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A6D04222A
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:39:11 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id C06EBBDE50A9;
 Wed,  7 Feb 2024 12:30:11 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 07 Feb 2024 11:30:11 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <mailman.3620.1707247855.145104.buildroot@buildroot.org>
References: <mailman.3620.1707247855.145104.buildroot@buildroot.org>
Message-ID: <e7cbd25938f13eeb6b674f836fef9619@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1707305411; bh=Pf5TbNRo4IUgkMKMgklcqt9VNw63dywvkgbVYw3KKnk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=pd0VQx7drPJKWSRKUfBz6vaKcIBkKo/eCIc0kLlVhe1Ha+Elb6PkEEXIQLAnLZ8aW
 Md4DScCyY0GigWtVEIzMorY8iLb5W5P2Tmu0NsfVOfAcFv7+Do7/nsY4PoaAkd7BLi
 O8ePo7J2Iyh/bJ3u3S4LFF3fuq3+m2oGwDmBQTv4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=pd0VQx7d
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

Hi Fabrice,

sorry in case I do not reply to the latest message in the thread; my 
in-box is currently a bit crowded ...

On 2024-02-06 18:59, Fabrice Fontaine wrote:

> Message: 30
> Date: Tue, 6 Feb 2024 18:59:00 +0100
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: Romain Naour <romain.naour@smile.fr>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
> Message-ID:
> 	<CAPi7W81fffV_0zMh50hgB7bw7++JZzkdSpFUXXbHMPMKmHtbQw@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
> 
> Hello Romain,
> 
> Le mar. 6 f?vr. 2024 ? 18:32, Romain Naour <romain.naour@smile.fr> a 
> ?crit :
>> 
>> Hello,
>> 
>> Le 06/01/2024 ? 11:12, Fabrice Fontaine a ?crit :
>> > ncmpc is able to automatically detect NLS support since version 0.47 and
>> > https://github.com/MusicPlayerDaemon/ncmpc/commit/c264db04dd30af301e7d85c9d145bb1f1ae3fea3
>> > so let it handle automatically to avoid the following build failure with
>> > a bootlin toolchain which embeds a gettext definition in libintl.h which
>> > will clash with the fake gettext definition provided by ncmpc since
>> > https://github.com/MusicPlayerDaemon/ncmpc/commit/95af27ab2d3ceb9df26ebb4e0d936e392a84c153:
>> >
>> > In file included from ../src/save_playlist.cxx:8:
>> > /home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected unqualified-id before 'const'
>> >    39 | extern char *gettext (const char *__msgid)
>> >       |              ^~~~~~~
>> > /home/buildroot/autobuild/instance-2/output-1/host/or1k-buildroot-linux-gnu/sysroot/usr/include/libintl.h:39:14: error: expected ')' before 'const'
>> > ../src/i18n.h:22:20: note: to match this '('
>> >    22 | #define gettext(x) (x)
>> >       |                    ^
>> >
>> > Indeed, even if NLS is disabled by the user, libintl.h will be included
>> > by
>> > /home/fabrice/buildroot/output/host/opt/ext-toolchain/or1k-buildroot-linux-gnu/include/c++/13.2.0/or1k-buildroot-linux-gnu/bits/messages_members.h
>> > though include <chrono>
>> 
>> We usually want to explicitly handle such option from Buildroot 
>> package to not
>> rely on automatic detection (as currently done).
>> 
>> It look like more a bug in ncmpc build system?
> 
> I don't know, upstream wants to have the same code with and without
> NLS, so they decided to define a gettext macro when NLS is disabled.
> I could find an upstreamable solution as upstream will probably reject
> a patch that removes this gettext define and puts #ifdef ENABLE_NLS
> before every gettext calls.
> Do you have an upstreamable solution or should we just add a NLS
> dependency to ncmpc?

This is probably not related to NLS, but to gettext being included in 
the build by some other package. This tricks Meson into believing that 
NLS is enabled.

Also, the code in meson.txt may lead to unexpected results:

if meson.version().version_compare('>= 0.59') and not mini
   # Meson 0.59 has native libintl support
   intl_dep = dependency('intl', required: enable_nls)
   enable_nls = intl_dep.found()
elif enable_nls.disabled() or mini
   intl_dep = dependency('', required: false)
   enable_nls = false
elif cc.has_header('libintl.h')
   intl_dep = dependency('', required: false)
   enable_nls = true
elif enable_nls.auto()
   intl_dep = dependency('', required: false)
   enable_nls = false
else
   error('libintl.h not found')

-- build is (Meson) version dependent
-- 'disabled' command line option overridden by the build system (> 
0.59)
-- 'auto' treated as 'disabled' (< 0.59)

It would be better to handle 'disabled' first (untested):

intl_dep = dependency('', required: false)
if enable_nls.disabled() or mini
   enable_nls = false
# Meson from 0.59: New custom dependency for libintl
elif meson.version().version_compare('>= 0.59')
   require_intl = enable_nls
   if enable_nls.auto()
     require_intl = false
   intl_dep = dependency('intl', required: require_intl)
   enable_nls = intl_dep.found()
# Meson prior to 0.59
elif cc.has_header('libintl.h') # auto and enabled w/ dependency met
   enable_nls = true
elif enable_nls.enabled() # enabled with w/ dependency unmet
    error('libintl.h not found')

Kind regards,
Andreas

>> 
>> Best regards,
>> Romain
>> 
>> 
>> >
>> > Fixes:
>> >  - http://autobuild.buildroot.org/results/c860e64909dd3b7fa033db0970e1cfc1376c4ec5
>> >  - http://autobuild.buildroot.org/results/36eab556fac80124755bff4110af3e43fe6edd78
>> >
>> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>> > ---
>> >  package/ncmpc/ncmpc.mk | 3 +--
>> >  1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
>> > index bc8a62daea..0965981f23 100644
>> > --- a/package/ncmpc/ncmpc.mk
>> > +++ b/package/ncmpc/ncmpc.mk
>> > @@ -20,8 +20,7 @@ NCMPC_CPE_ID_VENDOR = ncmpc_project
>> >
>> >  NCMPC_CONF_OPTS = \
>> >       -Dcurses=ncurses \
>> > -     -Ddocumentation=disabled \
>> > -     $(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled)
>> > +     -Ddocumentation=disabled
>> >
>> >  ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
>> >  NCMPC_DEPENDENCIES += lirc-tools
>> 
> 
> Best Regards,
> 
> Fabrice
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
