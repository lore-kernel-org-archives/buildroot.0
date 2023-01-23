Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5BAC54E94
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 16:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 045C660F0F;
	Mon, 23 Jan 2023 16:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045C660F0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTTEcKd9NDDF; Mon, 23 Jan 2023 16:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C4AA60E61;
	Mon, 23 Jan 2023 16:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C4AA60E61
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B30AC1BF285
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F8BB40A8D
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 16:11:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8BB40A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yoq9RQ5xPAz for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 16:11:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF2204038E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF2204038E
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 16:11:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 96F4820017;
 Mon, 23 Jan 2023 16:11:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pJzQC-00D30q-CY; Mon, 23 Jan 2023 17:11:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230123135253.1733981-1-thomas.devoogdt@barco.com>
Date: Mon, 23 Jan 2023 17:11:48 +0100
In-Reply-To: <20230123135253.1733981-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Mon, 23 Jan 2023 14:52:53 +0100")
Message-ID: <87edrl9qnv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/fluent-bit: add new package
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

Now we just miss the change summary ;)


 > +++ b/package/fluent-bit/S99fluent-bit
 > @@ -0,0 +1,55 @@
 > +#!/bin/sh
 > +#
 > +# Starts fluent-bit.
 > +#
 > +NAME=fluent-bit
 > +DAEMON=/usr/bin/$NAME

check-package complains about this:

http://nightly.buildroot.org/#adding-packages-start-script

There are also some shellcheck warnings.


 > +PID_FILE="/var/run/$NAME.pid"
 > +CONF_FILE="/etc/$NAME/$NAME.conf"
 > +
 > +[ -r /etc/default/$NAME ] && . /etc/default/$NAME
 > +
 > +start() {
 > +	printf "Starting fluent-bit: "
 > +	start-stop-daemon -S -q -b -m -p $PID_FILE --exec $DAEMON -- -c $CONF_FILE
 > +	[ $? = 0 ] && echo "OK" || echo "FAIL"
 > +}
 > +
 > +stop() {
 > +	printf "Stopping fluent-bit: "
 > +	start-stop-daemon -K -q -p $PID_FILE
 > +	# https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/yaml/configuration-file#config_section
 > +	# The default grace time is set to 5 seconds, so use 6 seconds to have some margin.
 > +	TIMEOUT=6
 > +	PID=$(cat $PID_FILE 2>/dev/null)
 > +	while kill -0 $PID 2>/dev/null; do
 > +		[ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
 > +		TIMEOUT=$((TIMEOUT - 1))
 > +		sleep 1
 > +	done
 > +	rm -f $PID_FILE

So the pidfile is not removed on timeouts. Is that on purpose?


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

Where do you see that it gets set to /usr/etc/? I just dropped this and
ran the configure script and I ended up with the normal:

grep SYSCONFDIR  build/fluent-bit-2.0.8/CMakeCache.txt
CMAKE_INSTALL_SYSCONFDIR:PATH=etc
//ADVANCED property for variable: CMAKE_INSTALL_SYSCONFDIR
CMAKE_INSTALL_SYSCONFDIR-ADVANCED:INTERNAL=1

And indeed, building it I don't see any references to /usr/etc:

strings build/fluent-bit-2.0.8/bin/fluent-bit | grep /etc
/etc/machine-id
/etc/ssl/certs/ca-bundle.crt
/etc/ssl/certs/
/etc/hosts
/etc/resolv.conf
/etc/nsswitch.conf
/etc/host.conf
/etc/svc.conf

I do see that it gets confused and ends up installing the default config
files in usr/etc/fluent-bit. I don't right away see why this is so, but
indeed explicitly setting it to /etc fixes that. Notice that it does
lead to an invalid service file:

https://github.com/fluent/fluent-bit/issues/6619

So maybe a better fix is to just move the files in a post-install hook?


> +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
 > +	cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
 > +endef
 > +
 > +FLUENT_BIT_POST_INSTALL_TARGET_HOOKS += FLUENT_BIT_POST_INSTALL_TARGET_HOOK

Again, why not just build with -DBUILD_SHARED_LIBS=OFF?

I see that the package installs a shared library in a custom
location:

target/usr/lib/fluent-bit/libfluent-bit.so

What is that used for / how does it find it? I see there is a
FLB_SHARED_LIB option to disable it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
