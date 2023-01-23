Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA617C38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 12:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5501A415A3;
	Mon, 23 Jan 2023 12:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5501A415A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zo5sHGz-E-nm; Mon, 23 Jan 2023 12:14:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05A3C415A6;
	Mon, 23 Jan 2023 12:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05A3C415A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B7C371BF59B
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93BCC40914
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 12:14:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93BCC40914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Si45dcghqzx for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 12:14:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A398140471
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A398140471
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 12:13:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9F7E040007;
 Mon, 23 Jan 2023 12:13:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pJvhy-00CJDM-Po; Mon, 23 Jan 2023 13:13:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230123103224.1267225-1-thomas.devoogdt@barco.com>
Date: Mon, 23 Jan 2023 13:13:54 +0100
In-Reply-To: <20230123103224.1267225-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Mon, 23 Jan 2023 11:32:24 +0100")
Message-ID: <87ilgxa1od.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: add new package
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Samuel Martin <s.martin49@gmail.com>, Grim Delcour <grim.delcour@barco.com>,
 Anton Danneels <anton.danneels@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Fluent Bit is a super fast, lightweight, and highly
 > scalable logging and metrics processor and forwarder.

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>

Thanks. When you send an update to a patch, then please mark it as v2,
v3, .. (git send-email -v<n>) and include a summary of what you have
changed since the previous version for easier review:

https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

> ---
 >  package/Config.in                  |  1 +
 >  package/fluent-bit/Config.in       | 13 ++++++++
 >  package/fluent-bit/S99fluent-bit   | 51 ++++++++++++++++++++++++++++++
 >  package/fluent-bit/fluent-bit.hash |  3 ++
 >  package/fluent-bit/fluent-bit.mk   | 43 +++++++++++++++++++++++++
 >  5 files changed, 111 insertions(+)
 >  create mode 100644 package/fluent-bit/Config.in
 >  create mode 100644 package/fluent-bit/S99fluent-bit
 >  create mode 100644 package/fluent-bit/fluent-bit.hash
 >  create mode 100644 package/fluent-bit/fluent-bit.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index 995dae2c57..b281a67157 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -2610,6 +2610,7 @@ menu "System tools"
 >  	source "package/efivar/Config.in"
 >  	source "package/embiggen-disk/Config.in"
 >  	source "package/emlog/Config.in"
 > +	source "package/fluent-bit/Config.in"
 >  	source "package/ftop/Config.in"
 >  	source "package/getent/Config.in"
 >  	source "package/gkrellm/Config.in"
 > diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
 > new file mode 100644
 > index 0000000000..c8f9d4e489
 > --- /dev/null
 > +++ b/package/fluent-bit/Config.in
 > @@ -0,0 +1,13 @@
 > +config BR2_PACKAGE_FLUENT_BIT
 > +	bool "fluent-bit"
 > +	depends on BR2_TOOLCHAIN_USES_GLIBC
 > +	depends on !BR2_STATIC_LIBS
 > +	select BR2_PACKAGE_OPENSSL

Can this work with libressl? If not, then it needs to select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

 > +stop() {
 > +	printf "Stopping fluent-bit: "
 > +	start-stop-daemon -K -q -p $PID_FILE
 > +	# Fluent-bit takes max 5 seconds to exit,

Where does this guarantee come from?

 > +	# so wait max 30 x 0.2 = 6 seconds.
 > +	TIMEOUT=30
 > +	while pidof $NAME >/dev/null; do

You already told start-stop-daemon to write a pidfile, so it would be
better to use that (and possibly remove it at the end). You can use kill
-0 <pid> to check if the pid is still running.

 > +		[ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
 > +		TIMEOUT=$((TIMEOUT - 1))
 > +		sleep 0.2

busybox sleep only support fractional seconds if FEATURE_FANCY_SLEEP is
enabled, so it would be better to use sleep 1.

> +	done
 > +	echo "OK"
 > +}
 > +restart() {
 > +	stop
 > +	start
 > +}
 > +
 > +case "$1" in
 > +start)
 > +	start
 > +	;;
 > +stop)
 > +	stop
 > +	;;
 > +restart | reload)
 > +	restart
 > +	;;
 > +*)
 > +	echo "Usage: $0 {start|stop|restart}"
 > +	exit 1
 > +	;;
 > +esac
 > +
 > +exit $?
 > diff --git a/package/fluent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash
 > new file mode 100644
 > index 0000000000..ce7cea7b59
 > --- /dev/null
 > +++ b/package/fluent-bit/fluent-bit.hash
 > @@ -0,0 +1,3 @@
 > +# Locally computed
 > +sha256  8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf  fluent-bit-2.0.8.tar.gz
 > +sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
 > diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
 > new file mode 100644
 > index 0000000000..c213ca2239
 > --- /dev/null
 > +++ b/package/fluent-bit/fluent-bit.mk
 > @@ -0,0 +1,43 @@
 > +################################################################################
 > +#
 > +# fluent-bit
 > +#
 > +################################################################################
 > +
 > +FLUENT_BIT_VERSION = 2.0.8
 > +FLUENT_BIT_SITE = $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
 > +FLUENT_BIT_LICENSE = Apache-2.0
 > +FLUENT_BIT_LICENSE_FILES = LICENSE
 > +FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
 > +
 > +FLUENT_BIT_CONF_OPTS += \
 > +	-DFLB_DEBUG=No \
 > +	-DFLB_RELEASE=Yes \
 > +	-DFLB_EXAMPLES=No \
 > +	-DFLB_CHUNK_TRACE=No \
 > +	-DFLB_BACKTRACE=No \
 > +	-DFLB_LUAJIT=No
 > +
 > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 > +# large file support.
 > +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information.
 > +FLUENT_BIT_CONF_OPTS += \
 > +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 > +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
 > +
 > +# Move the config files from /usr/etc/ to /etc/.
 > +FLUENT_BIT_CONF_OPTS += \
 > +	-DCMAKE_INSTALL_SYSCONFDIR="/etc/"

Hmm, why is this needed? This should already default to "etc"?
https://cmake.org/cmake/help/latest/command/install.html#installing-files

I see that there are some bug reports related to this, E.G.:
https://github.com/fluent/fluent-bit/issues/6619


> +
 > +define FLUENT_BIT_INSTALL_INIT_SYSV
 > +	$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
 > +		$(TARGET_DIR)/etc/init.d/S99fluent-bit
 > +endef
 > +
 > +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
 > +	cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
 > +endef

Why is this needed? Is it possible to link against an external miniz? If
not, perhaps we should build with BUILD_SHARED_LIBS=off to ensure no
conflicts in case we ever get a miniz package?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
