Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72D9C25B78
	for <buildroot@archiver.kernel.org>; Sat, 25 May 2024 06:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81A0C8216F;
	Sat, 25 May 2024 06:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVDS04u7vm0i; Sat, 25 May 2024 06:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BCC78225C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BCC78225C;
	Sat, 25 May 2024 06:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051491D021F
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C64400C1
 for <buildroot@lists.busybox.net>; Sat, 25 May 2024 06:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDnz7ngV-Gv5 for <buildroot@lists.busybox.net>;
 Sat, 25 May 2024 06:17:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61AE2400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61AE2400BA
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61AE2400BA
 for <buildroot@buildroot.org>; Sat, 25 May 2024 06:17:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 179F2C0002;
 Sat, 25 May 2024 06:17:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sAkif-00GtF9-2k;
 Sat, 25 May 2024 08:17:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240523162148.1468596-1-fontaine.fabrice@gmail.com>
Date: Sat, 25 May 2024 08:17:29 +0200
In-Reply-To: <20240523162148.1468596-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 May 2024 18:21:48 +0200")
Message-ID: <87h6emifeu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-cffi: add luajit support
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > luajit is supported since the addition of the package in commit
 > 13114d0f9352531e5d7ebed45cd3f679407c61d9 and
 > https://github.com/q66/cffi-lua/commit/cb92c44e781d81e31eb7fe21911b01e54a2c3893

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/lua-cffi/Config.in   |  2 --
 >  package/lua-cffi/lua-cffi.mk | 10 +++++++++-
 >  2 files changed, 9 insertions(+), 3 deletions(-)

 > diff --git a/package/lua-cffi/Config.in b/package/lua-cffi/Config.in
 > index f4a760ce0d..ceef16ee6f 100644
 > --- a/package/lua-cffi/Config.in
 > +++ b/package/lua-cffi/Config.in
 > @@ -1,6 +1,5 @@
 >  config BR2_PACKAGE_LUA_CFFI
 >  	bool "lua-cffi"
 > -	depends on !BR2_PACKAGE_LUAJIT
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # libffi
 >  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 >  	depends on BR2_INSTALL_LIBSTDCPP
 > @@ -13,7 +12,6 @@ config BR2_PACKAGE_LUA_CFFI
 >  	  https://github.com/q66/cffi-lua
 
 >  comment "lua-cffi needs a toolchain w/ C++, gcc >= 4.8, threads"
 > -	depends on !BR2_PACKAGE_LUAJIT
 >  	depends on !BR2_INSTALL_LIBSTDCPP || \
 >  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 >  		!BR2_TOOLCHAIN_HAS_THREADS
 > diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
 > index 30427ac34c..d6e059d273 100644
 > --- a/package/lua-cffi/lua-cffi.mk
 > +++ b/package/lua-cffi/lua-cffi.mk
 > @@ -9,6 +9,14 @@ LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 >  LUA_CFFI_LICENSE = MIT
 >  LUA_CFFI_LICENSE_FILES = COPYING.md
 
 > -LUA_CFFI_DEPENDENCIES = libffi lua
 > +LUA_CFFI_DEPENDENCIES = libffi
 > +
 > +ifeq ($(BR2_PACKAGE_LUA),y)
 > +LUA_CFFI_DEPENDENCIES += lua
 > +LUA_CFFI_CONF_OPTS = -Dlua_version=$(LUAINTERPRETER_ABIVER)
 > +else ifeq ($(BR2_PACKAGE_LUAJIT),y)
 > +LUA_CFFI_DEPENDENCIES += luajit
 > +LUA_CFFI_CONF_OPTS = -Dlua_version=luajit

FYI, I made these += to get rid of a warning from check-package:

package/lua-cffi/lua-cffi.mk:16: conditional override of variable LUA_CFFI_CONF_OPTS
package/lua-cffi/lua-cffi.mk:19: conditional override of variable LUA_CFFI_CONF_OPTS

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
