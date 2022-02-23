Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82F2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D87C80C93;
	Wed, 23 Feb 2022 20:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0oB8AJLIAkn; Wed, 23 Feb 2022 20:13:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2936680C83;
	Wed, 23 Feb 2022 20:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5135C1BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D70160AA8
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZgxNnzevlyCc for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B827A6080B
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:13:49 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a23so54631122eju.3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8KneDZEaa6LJv/x/aiIdn2N4fQcFni6uG6fzm2eTXK4=;
 b=YaZ5k8orpA8zD6FmK1yqZP1AKgkL8lUhKFPyXojPO5RUxOl3VYWjeAZ4wLipUSxih1
 rycYVIEQ5ne05SVKAJL6Q9YDBOIb0uYtqNd7vgWtuxz6BVbH9zE7x4ogMw/UQ6Dpa0ul
 9Dtpx5KZhDWjdy/W30LyaWBW/KRRv4Zk/IjwaU10DaHlQ8rNLrGdxCEm8SXClkSCK29C
 DBxGMOEBU2hQYj+NfLl/F1RPkHIWVHVGjQWpOY2luB4zJRNdQs1d6JZ2UsOuMPw89sE1
 fALdIj16B/GCkI9GCqJfHZFRajlRiypVaA6E+TswSbnvM2c7LXmSZbYmzq+n3vJv4l3M
 dN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8KneDZEaa6LJv/x/aiIdn2N4fQcFni6uG6fzm2eTXK4=;
 b=GKBPM6ovxxeUG4oS4MAtR/JROHUzqy3fQuqxXz7aQsc8Tv6zwRgcmLYJQYhT5lQCem
 x7Ma532SZR4eiYKL1Fl7nbHZa6qjFesrLHajvfwsqzZdQ8Jncg3OqXucAcHezXdYWtP7
 loK2QgUrcB/TEMXX/3M78kzRObmmyKKcOGDIs1+nJ5RBBnFSW3ilDUHryG1vT0xLIm7Q
 2xVSKe3OHvwLrCoFEK/YhFbJR192mfILifwvbmQpNNtcmyYaEWMrYFBbXHJogJrReKyK
 1Z7r2VaEZVIc3FRV1YDTlSoqZNVZ+J/sPSmV6hBRTelJtOr+LIxaK+itH+c0CkfGOjvx
 ss6Q==
X-Gm-Message-State: AOAM533JEFKWfxJN39KYnsLWVy5SC7Gkz5nQfek5vcYu9W0SffqRgbSF
 v6J4ih+3PoX7cOnUWV/XyyqXsw==
X-Google-Smtp-Source: ABdhPJwwYD/vmtZBxeMRD3K8FVMiZItxzf1XsGYJ+Knzgx3ALzc3rq0lgaszhO8ieEjS7LIjh2yuQw==
X-Received: by 2002:a17:906:53c3:b0:6cf:742d:84de with SMTP id
 p3-20020a17090653c300b006cf742d84demr994915ejo.576.1645647227892; 
 Wed, 23 Feb 2022 12:13:47 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id 1sm268051ejm.173.2022.02.23.12.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:13:47 -0800 (PST)
Message-ID: <e366e806-ed17-73ee-9416-05639c542b85@mind.be>
Date: Wed, 23 Feb 2022 21:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220215224039.3567741-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215224039.3567741-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/bluez5_utils: fix build with glibc < 2.25
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 23:40, Fabrice Fontaine wrote:
> Fix the following build failure with glibc < 2.25 raised since bump to
> version 5.63 in commit d4c6cf4b1fc0f34e72ff047e76de53d3634f5184:
> 
> plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
>   #include <sys/random.h>
>                          ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks. I've also updated the comment about AUTORECONF to 
say that both Makefile.am and configure.ac are patched.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Use upstream patch
> 
>   ...005-build-Fix-errors-with-glibc-2-25.patch | 312 ++++++++++++++++++
>   1 file changed, 312 insertions(+)
>   create mode 100644 package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
> 
> diff --git a/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch b/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
> new file mode 100644
> index 0000000000..13033da7b2
> --- /dev/null
> +++ b/package/bluez5_utils/0005-build-Fix-errors-with-glibc-2-25.patch
> @@ -0,0 +1,312 @@
> +From fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 14 Feb 2022 21:17:39 +0100
> +Subject: build: Fix errors with glibc < 2.25
> +
> +getrandom and sys/random.h are only available since glibc 2.25:
> +https://www.gnu.org/software/gnulib/manual/html_node/sys_002frandom_002eh.html
> +resulting in the following build failures since version 5.63 and
> +https://git.kernel.org/pub/scm/bluetooth/bluez.git/log/?qt=grep&q=getrandom:
> +
> +plugins/autopair.c:20:24: fatal error: sys/random.h: No such file or directory
> + #include <sys/random.h>
> +                        ^
> +
> +To fix this build failure, add util_getrandom and a fallback (borrowed
> +from pipewire and licensed under MIT):
> +https://gitlab.freedesktop.org/pipewire/pipewire/-/blob/master/src/pipewire/utils.c
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/6b8870d12e0804d6154230a7322c49416c1dc0e2
> +
> +[Retrieved from:
> +https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=fb57ad9b9d107856e5f1c8135da04ffa2f7a11ac]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac           |  4 +++-
> + emulator/le.c          |  3 +--
> + emulator/phy.c         |  3 +--
> + peripheral/main.c      |  4 ++--
> + plugins/autopair.c     |  4 ++--
> + profiles/health/hdp.c  |  4 ++--
> + profiles/health/mcap.c |  6 +++---
> + src/shared/util.c      | 25 +++++++++++++++++++++++++
> + src/shared/util.h      |  2 ++
> + tools/btgatt-server.c  |  3 +--
> + 10 files changed, 42 insertions(+), 16 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 07d068a4d..441bd5f29 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -54,6 +54,8 @@ AC_ARG_ENABLE(threads, AS_HELP_STRING([--enable-threads],
> +
> + AC_CHECK_FUNCS(explicit_bzero)
> +
> ++AC_CHECK_FUNCS(getrandom)
> ++
> + AC_CHECK_FUNCS(rawmemchr)
> +
> + AC_CHECK_FUNC(signalfd, dummy=yes,
> +@@ -68,7 +70,7 @@ AC_CHECK_LIB(pthread, pthread_create, dummy=yes,
> + AC_CHECK_LIB(dl, dlopen, dummy=yes,
> + 			AC_MSG_ERROR(dynamic linking loader is required))
> +
> +-AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h)
> ++AC_CHECK_HEADERS(linux/types.h linux/if_alg.h linux/uinput.h linux/uhid.h sys/random.h)
> +
> + PKG_CHECK_MODULES(GLIB, glib-2.0 >= 2.28, dummy=yes,
> + 				AC_MSG_ERROR(GLib >= 2.28 is required))
> +diff --git a/emulator/le.c b/emulator/le.c
> +index f8f313f2c..7656a657c 100644
> +--- a/emulator/le.c
> ++++ b/emulator/le.c
> +@@ -20,7 +20,6 @@
> + #include <sys/socket.h>
> + #include <sys/un.h>
> + #include <sys/uio.h>
> +-#include <sys/random.h>
> + #include <time.h>
> +
> + #include "lib/bluetooth.h"
> +@@ -509,7 +508,7 @@ static unsigned int get_adv_delay(void)
> + 	/* The advertising delay is a pseudo-random value with a range
> + 	 * of 0 ms to 10 ms generated for each advertising event.
> + 	 */
> +-	if (getrandom(&val, sizeof(val), 0) < 0) {
> ++	if (util_getrandom(&val, sizeof(val), 0) < 0) {
> + 		/* If it fails to get the random number, use a static value */
> + 		val = 5;
> + 	}
> +diff --git a/emulator/phy.c b/emulator/phy.c
> +index 44cace438..7de85fb05 100644
> +--- a/emulator/phy.c
> ++++ b/emulator/phy.c
> +@@ -19,7 +19,6 @@
> + #include <stdlib.h>
> + #include <string.h>
> + #include <sys/socket.h>
> +-#include <sys/random.h>
> + #include <netinet/in.h>
> + #include <netinet/ip.h>
> + #include <time.h>
> +@@ -174,7 +173,7 @@ struct bt_phy *bt_phy_new(void)
> + 	mainloop_add_fd(phy->rx_fd, EPOLLIN, phy_rx_callback, phy, NULL);
> +
> + 	if (!get_random_bytes(&phy->id, sizeof(phy->id))) {
> +-		if (getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
> ++		if (util_getrandom(&phy->id, sizeof(phy->id), 0) < 0) {
> + 			mainloop_remove_fd(phy->rx_fd);
> + 			close(phy->tx_fd);
> + 			close(phy->rx_fd);
> +diff --git a/peripheral/main.c b/peripheral/main.c
> +index 91adb45fc..b82d7caf6 100644
> +--- a/peripheral/main.c
> ++++ b/peripheral/main.c
> +@@ -25,13 +25,13 @@
> + #include <sys/stat.h>
> + #include <sys/types.h>
> + #include <sys/mount.h>
> +-#include <sys/random.h>
> +
> + #ifndef WAIT_ANY
> + #define WAIT_ANY (-1)
> + #endif
> +
> + #include "src/shared/mainloop.h"
> ++#include "src/shared/util.h"
> + #include "peripheral/efivars.h"
> + #include "peripheral/attach.h"
> + #include "peripheral/gap.h"
> +@@ -192,7 +192,7 @@ int main(int argc, char *argv[])
> + 							addr, 6) < 0) {
> + 			printf("Generating new persistent static address\n");
> +
> +-			if (getrandom(addr, sizeof(addr), 0) < 0) {
> ++			if (util_getrandom(addr, sizeof(addr), 0) < 0) {
> + 				perror("Failed to get random static address");
> + 				return EXIT_FAILURE;
> + 			}
> +diff --git a/plugins/autopair.c b/plugins/autopair.c
> +index a75ecebe4..0b09e893f 100644
> +--- a/plugins/autopair.c
> ++++ b/plugins/autopair.c
> +@@ -17,7 +17,6 @@
> + #include <fcntl.h>
> + #include <unistd.h>
> + #include <errno.h>
> +-#include <sys/random.h>
> +
> + #include <glib.h>
> +
> +@@ -29,6 +28,7 @@
> + #include "src/device.h"
> + #include "src/log.h"
> + #include "src/storage.h"
> ++#include "src/shared/util.h"
> +
> + /*
> +  * Plugin to handle automatic pairing of devices with reduced user
> +@@ -131,7 +131,7 @@ static ssize_t autopair_pincb(struct btd_adapter *adapter,
> + 			if (attempt >= 4)
> + 				return 0;
> +
> +-			if (getrandom(&val, sizeof(val), 0) < 0) {
> ++			if (util_getrandom(&val, sizeof(val), 0) < 0) {
> + 				error("Failed to get a random pincode");
> + 				return 0;
> + 			}
> +diff --git a/profiles/health/hdp.c b/profiles/health/hdp.c
> +index 9d9d1e824..b6590cd3a 100644
> +--- a/profiles/health/hdp.c
> ++++ b/profiles/health/hdp.c
> +@@ -16,7 +16,6 @@
> + #include <stdint.h>
> + #include <stdbool.h>
> + #include <unistd.h>
> +-#include <sys/random.h>
> +
> + #include <glib.h>
> +
> +@@ -33,6 +32,7 @@
> + #include "src/device.h"
> + #include "src/sdpd.h"
> + #include "src/shared/timeout.h"
> ++#include "src/shared/util.h"
> + #include "btio/btio.h"
> +
> + #include "hdp_types.h"
> +@@ -1490,7 +1490,7 @@ static void *generate_echo_packet(void)
> + 	if (!buf)
> + 		return NULL;
> +
> +-	if (getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
> ++	if (util_getrandom(buf, HDP_ECHO_LEN, 0) < 0) {
> + 		g_free(buf);
> + 		return NULL;
> + 	}
> +diff --git a/profiles/health/mcap.c b/profiles/health/mcap.c
> +index aad0a08a3..5d2bac3d9 100644
> +--- a/profiles/health/mcap.c
> ++++ b/profiles/health/mcap.c
> +@@ -19,7 +19,6 @@
> + #include <errno.h>
> + #include <unistd.h>
> + #include <time.h>
> +-#include <sys/random.h>
> +
> + #include <glib.h>
> +
> +@@ -28,6 +27,7 @@
> + #include "btio/btio.h"
> + #include "src/log.h"
> + #include "src/shared/timeout.h"
> ++#include "src/shared/util.h"
> +
> + #include "mcap.h"
> +
> +@@ -1905,7 +1905,7 @@ gboolean mcap_create_mcl(struct mcap_instance *mi,
> + 		mcl->state = MCL_IDLE;
> + 		bacpy(&mcl->addr, addr);
> + 		set_default_cb(mcl);
> +-		if (getrandom(&val, sizeof(val), 0) < 0) {
> ++		if (util_getrandom(&val, sizeof(val), 0) < 0) {
> + 			mcap_instance_unref(mcl->mi);
> + 			g_free(mcl);
> + 			return FALSE;
> +@@ -2049,7 +2049,7 @@ static void connect_mcl_event_cb(GIOChannel *chan, GError *gerr,
> + 		mcl->mi = mcap_instance_ref(mi);
> + 		bacpy(&mcl->addr, &dst);
> + 		set_default_cb(mcl);
> +-		if (getrandom(&val, sizeof(val), 0) < 0) {
> ++		if (util_getrandom(&val, sizeof(val), 0) < 0) {
> + 			mcap_instance_unref(mcl->mi);
> + 			g_free(mcl);
> + 			goto drop;
> +diff --git a/src/shared/util.c b/src/shared/util.c
> +index 6e1c83057..33196bf8b 100644
> +--- a/src/shared/util.c
> ++++ b/src/shared/util.c
> +@@ -13,6 +13,7 @@
> + #endif
> +
> + #define _GNU_SOURCE
> ++#include <fcntl.h>
> + #include <stdio.h>
> + #include <ctype.h>
> + #include <stdbool.h>
> +@@ -23,6 +24,10 @@
> + #include <limits.h>
> + #include <string.h>
> +
> ++#ifdef HAVE_SYS_RANDOM_H
> ++#include <sys/random.h>
> ++#endif
> ++
> + #include "src/shared/util.h"
> +
> + void *util_malloc(size_t size)
> +@@ -138,6 +143,26 @@ unsigned char util_get_dt(const char *parent, const char *name)
> + 	return DT_UNKNOWN;
> + }
> +
> ++/* Helper for getting a random in case getrandom unavailable (glibc < 2.25) */
> ++ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags)
> ++{
> ++#ifdef HAVE_GETRANDOM
> ++	return getrandom(buf, buflen, flags);
> ++#else
> ++	int fd;
> ++	ssize_t bytes;
> ++
> ++	fd = open("/dev/urandom", O_CLOEXEC);
> ++	if (fd < 0)
> ++		return -1;
> ++
> ++	bytes = read(fd, buf, buflen);
> ++	close(fd);
> ++
> ++	return bytes;
> ++#endif
> ++}
> ++
> + /* Helpers for bitfield operations */
> +
> + /* Find unique id in range from 1 to max but no bigger than 64. */
> +diff --git a/src/shared/util.h b/src/shared/util.h
> +index 8ef6132c4..c01eccf8a 100644
> +--- a/src/shared/util.h
> ++++ b/src/shared/util.h
> +@@ -103,6 +103,8 @@ void util_hexdump(const char dir, const unsigned char *buf, size_t len,
> +
> + unsigned char util_get_dt(const char *parent, const char *name);
> +
> ++ssize_t util_getrandom(void *buf, size_t buflen, unsigned int flags);
> ++
> + uint8_t util_get_uid(uint64_t *bitmap, uint8_t max);
> + void util_clear_uid(uint64_t *bitmap, uint8_t id);
> +
> +diff --git a/tools/btgatt-server.c b/tools/btgatt-server.c
> +index 15d49a464..4a5d2b720 100644
> +--- a/tools/btgatt-server.c
> ++++ b/tools/btgatt-server.c
> +@@ -20,7 +20,6 @@
> + #include <getopt.h>
> + #include <unistd.h>
> + #include <errno.h>
> +-#include <sys/random.h>
> +
> + #include "lib/bluetooth.h"
> + #include "lib/hci.h"
> +@@ -287,7 +286,7 @@ static bool hr_msrmt_cb(void *user_data)
> + 	uint32_t cur_ee;
> + 	uint32_t val;
> +
> +-	if (getrandom(&val, sizeof(val), 0) < 0)
> ++	if (util_getrandom(&val, sizeof(val), 0) < 0)
> + 		return false;
> +
> + 	pdu[0] = 0x06;
> +--
> +cgit
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
