Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E218DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 09:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8709F40448;
	Mon,  2 May 2022 09:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEGu-ImNDGaq; Mon,  2 May 2022 09:32:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E46954016A;
	Mon,  2 May 2022 09:32:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1361BF280
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 09:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6629860EA3
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 09:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbltjoxTw3RC for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 09:32:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A435460EA1
 for <buildroot@buildroot.org>; Mon,  2 May 2022 09:32:48 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q8so14273601oif.13
 for <buildroot@buildroot.org>; Mon, 02 May 2022 02:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zvh2zSV5eliTHr+XnXzeUTm4VAgy1JvqIsL7mQwmyhs=;
 b=F+gcqYvi4X/Ep+awko7FQHg8zkO3YJYxY9qDZAmRECWsm08WBJxoKtQ1PlWsU4wLIP
 GupI9wil0n1+dHR75JHX8C4Dmd98U7DvskH79NPlm9r2fzOL9fMMCsin4uswsxEVoJD9
 orIMmmfGSfpPFQQeTLkUxNsGiubtSWuVtjcJB7TXT5RZ3yy9NgQ7Vd9OXrLKpI+a9iwH
 E5v/atIXmTlUQmi8NIexchNOEb8QjTCl1CBJVP4BrfmTu80aJlySomXGKKPDmlJTC4xL
 YDyFkiDqBsBDw33RLF5K067RYdBQ6S7ipJA/AbfVzFt9oAmvddLjh33Ccfb6ufOpr0TF
 cbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zvh2zSV5eliTHr+XnXzeUTm4VAgy1JvqIsL7mQwmyhs=;
 b=qNnB1wSCzAd0Ck+7ppNlaxja93aNzSppAqeIeFyfFGTjYIzkCStMz5Ww1h9iiXDcjs
 XzUZWwqp5TrDbBwpUZKDhysi/rnLq8xzm4O5BOkALpqzcHLP1rIjB3ZDlJ0j1bD8PUIv
 FfJBo6DGlJ0mn4m51u9uu62hXUlxNeEzUyzjDnesgKI753PHERdDVlCN6Nt0/NLdWOuK
 AcJBFrL5RfIjgcIUuXTGX5G1iMN8881H+lSxEUKciZ/8FtuIVKxSQ0cgMsT5i/XN8uEr
 NyLIY5YSA+Y4rhylyzzio+SxgmZytpqg5IdSBlVLwdVg6Gstnkt4/0El1eyxlIq8zQjh
 fNbg==
X-Gm-Message-State: AOAM532QxIltdrQO0txVwZghTcmRQhHa7QahoLB2nU82VoqivdjAk0hf
 swrSBSKdooTLWDFVRySokHlv6ujbKEg71mUGNxulEIka/yKsvA==
X-Google-Smtp-Source: ABdhPJwfPWWVBoDmcJ++STGNas2KtdVvTA2J49FXoTomAlXBWIAu4S7NBVOaEEnzcCPReNoKE1+QIihjUQRl9uQYMhg=
X-Received: by 2002:aca:3d88:0:b0:321:141:ce0b with SMTP id
 k130-20020aca3d88000000b003210141ce0bmr6476365oia.200.1651483967475; Mon, 02
 May 2022 02:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220420170326.1901572-1-Jason@zx2c4.com>
In-Reply-To: <20220420170326.1901572-1-Jason@zx2c4.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 May 2022 03:32:36 -0600
Message-ID: <CADvTj4ooNyKJj29R8HcYUwQ3WyQb_skzRe=-SZYVy8-sn30=zQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [Buildroot] [PATCH v5] package/urandom-scripts: actually credit
 seed files via seedrng
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
Cc: Michael Fischer <mf@go-sys.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 20, 2022 at 11:04 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> The RNG can't actually be seeded from a shell script, due to the
> reliance on ioctls. For this reason, Busybox now contains SeedRNG, a
> tiny program meant to be called at startup and shutdown (and at
> arbitrary other points in between if desired).
>
> Since this is currently in Busybox's git tree, this commit adds it as a
> patch to the Busybox package. Then, it wires the init script up to call
> it.
>
> This is a significant improvement over the current init script, which
> doesn't credit entropy and whose hashing in shell scripts is sort of
> fragile.
>
> NOTE NOTE NOTE: While I've added the patch to the Busybox package
> directory, I don't really know how to wire this up and what to do about
> the various config entries. I was hoping that a Buildroot maintainer
> might have a better idea of the best way to do this, and could just take
> this patch as a starting point for whatever the real commit winds up
> being.

Add a kconfig option(ie BR2_PACKAGE_BUSYBOX_SEEDRNG) here:
https://github.com/buildroot/buildroot/blob/master/package/busybox/Config.in

Do something like:
ifeq ($(BR2_PACKAGE_BUSYBOX_SEEDRNG),y)
define BUSYBOX_SET_SEEDRNG
    $(call KCONFIG_ENABLE_OPT,CONFIG_SEEDRNG)
endef
endif
here https://github.com/buildroot/buildroot/blob/master/package/busybox/busybox.mk

Probably also need to make sure that urandom-scripts is only built
if busybox is built as well if unconditionally using seedrng in the script.

Add something like:
depends on BR2_PACKAGE_BUSYBOX
select BR2_PACKAGE_BUSYBOX_SEEDRNG
for BR2_PACKAGE_URANDOM_SCRIPTS
https://github.com/buildroot/buildroot/blob/master/package/urandom-scripts/Config.in

Once there is a normal util-linux variant then busybox would not be
required and that variant could be conditionally selected if busybox
is not enabled I think.

>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
> Changes v4->v5:
> - SeedRNG is now part of Busybox, so we don't need to carry the source
>   in-tree here, which was the primary objection to earlier versions.
>
>  ...eedRNG-utility-for-kernel-RNG-seed-f.patch | 309 ++++++++++++++++++
>  package/urandom-scripts/Config.in             |   4 -
>  package/urandom-scripts/S20urandom            |  78 ++---
>  3 files changed, 330 insertions(+), 61 deletions(-)
>  create mode 100644 package/busybox/0003-seedrng-import-SeedRNG-utility-for-kernel-RNG-seed-f.patch
>
> diff --git a/package/busybox/0003-seedrng-import-SeedRNG-utility-for-kernel-RNG-seed-f.patch b/package/busybox/0003-seedrng-import-SeedRNG-utility-for-kernel-RNG-seed-f.patch
> new file mode 100644
> index 0000000000..493c31b247
> --- /dev/null
> +++ b/package/busybox/0003-seedrng-import-SeedRNG-utility-for-kernel-RNG-seed-f.patch
> @@ -0,0 +1,309 @@
> +From 47660dc9581e251f555ca9b05b630276f1d487ee Mon Sep 17 00:00:00 2001
> +From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> +Date: Mon, 4 Apr 2022 18:21:51 +0200
> +Subject: [PATCH] seedrng: import SeedRNG utility for kernel RNG seed files
> +
> +The RNG can't actually be seeded from a shell script, due to the
> +reliance on ioctls and the fact that entropy written into the
> +unprivileged /dev/urandom device is not immediately mixed in, making
> +subsequent seed reads dangerous. For this reason, the seedrng project
> +provides a basic "C script" meant to be copy and pasted into projects
> +like Busybox and tweaked as needed: <https://git.zx2c4.com/seedrng/about/>.
> +
> +The SeedRNG construction has been part of systemd's seeder since
> +January, and recently was added to Android, OpenRC, and Void's Runit,
> +with more integrations on their way depending on context. Virtually
> +every single Busybox-based distro I have seen seeds things in wrong,
> +incomplete, or otherwise dangerous way. For example, fixing this issue
> +in Buildroot requires first for Busybox to have this fix.
> +
> +This commit imports it into Busybox and wires up the basic config. The
> +utility itself is tiny, and unlike the example code from the SeedRNG
> +project, we can re-use libbb's existing hash functions, rather than
> +having to ship a standalone BLAKE2s, which makes this even smaller.
> +
> +Cherry picked from upstream commits:
> +  - 4b407bacd4c1628782d24c3e044e43780bb057a4
> +  - 453857899616acf1c77d0d02a4c2989b2cf5f1eb
> +  - 31ec481baf106cf9c6d8f34ae6a55ab1738dea6f
> +  - 3c60711f836b151b8f361098475c3b0cd162dd17
> +  - 398bb3861aa39ae6d3ada7bb54698653b4de370b
> +  - ce9a345632786d5585044ed71ed4c98c305b918f
> +  - 3cb40f89de42aa694d44cb6e896b732fa062ee75
> +  - 57fea029cc3d6faf5a8b9ad4b17b543359fe7ccb
> +
> +Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> +Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> +---
> + util-linux/seedrng.c | 259 +++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 259 insertions(+)
> + create mode 100644 util-linux/seedrng.c
> +
> +diff --git a/util-linux/seedrng.c b/util-linux/seedrng.c
> +new file mode 100644
> +index 000000000..5a41addf0
> +--- /dev/null
> ++++ b/util-linux/seedrng.c
> +@@ -0,0 +1,259 @@
> ++// SPDX-License-Identifier: GPL-2.0 OR MIT
> ++/*
> ++ * Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> ++ *
> ++ * SeedRNG is a simple program made for seeding the Linux kernel random number
> ++ * generator from seed files. It is is useful in light of the fact that the
> ++ * Linux kernel RNG cannot be initialized from shell scripts, and new seeds
> ++ * cannot be safely generated from boot time shell scripts either. It should
> ++ * be run once at init time and once at shutdown time. It can be run at other
> ++ * times on a timer as well. Whenever it is run, it writes existing seed files
> ++ * into the RNG pool, and then creates a new seed file. If the RNG is
> ++ * initialized at the time of creating a new seed file, then that new seed file
> ++ * is marked as "creditable", which means it can be used to initialize the RNG.
> ++ * Otherwise, it is marked as "non-creditable", in which case it is still used
> ++ * to seed the RNG's pool, but will not initialize the RNG. In order to ensure
> ++ * that entropy only ever stays the same or increases from one seed file to the
> ++ * next, old seed values are hashed together with new seed values when writing
> ++ * new seed files.
> ++ *
> ++ * This is based on code from <https://git.zx2c4.com/seedrng/about/>.
> ++ */
> ++
> ++//config:config SEEDRNG
> ++//config:     bool "seedrng (2 kb)"
> ++//config:     default y
> ++//config:     help
> ++//config:     Seed the kernel RNG from seed files, meant to be called
> ++//config:     once during startup, once during shutdown, and optionally
> ++//config:     at some periodic interval in between.
> ++
> ++//applet:IF_SEEDRNG(APPLET(seedrng, BB_DIR_USR_SBIN, BB_SUID_DROP))
> ++
> ++//kbuild:lib-$(CONFIG_SEEDRNG) += seedrng.o
> ++
> ++//usage:#define seedrng_trivial_usage
> ++//usage:      "[-d SEED_DIRECTORY] [-n]"
> ++//usage:#define seedrng_full_usage "\n\n"
> ++//usage:      "Seed the kernel RNG from seed files."
> ++//usage:      "\n"
> ++//usage:      "\n     -d, --seed-dir DIR      Use seed files from specified directory (default: /var/lib/seedrng)"
> ++//usage:      "\n     -n, --skip-credit       Skip crediting seeds, even if creditable"
> ++
> ++#include "libbb.h"
> ++
> ++#include <linux/random.h>
> ++#include <sys/random.h>
> ++#include <sys/ioctl.h>
> ++#include <sys/file.h>
> ++#include <sys/stat.h>
> ++#include <sys/types.h>
> ++#include <fcntl.h>
> ++#include <poll.h>
> ++#include <unistd.h>
> ++#include <time.h>
> ++#include <errno.h>
> ++#include <endian.h>
> ++#include <stdbool.h>
> ++#include <stdint.h>
> ++#include <string.h>
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++
> ++#ifndef GRND_INSECURE
> ++#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
> ++#endif
> ++
> ++#define DEFAULT_SEED_DIR "/var/lib/seedrng"
> ++#define CREDITABLE_SEED_NAME "seed.credit"
> ++#define NON_CREDITABLE_SEED_NAME "seed.no-credit"
> ++
> ++enum seedrng_lengths {
> ++      MIN_SEED_LEN = SHA256_OUTSIZE,
> ++      MAX_SEED_LEN = 512
> ++};
> ++
> ++static size_t determine_optimal_seed_len(void)
> ++{
> ++      char poolsize_str[11] = { 0 };
> ++      unsigned long poolsize;
> ++
> ++      if (open_read_close("/proc/sys/kernel/random/poolsize", poolsize_str, sizeof(poolsize_str) - 1) < 0) {
> ++              bb_perror_msg("unable to determine pool size, assuming %u bits", MIN_SEED_LEN * 8);
> ++              return MIN_SEED_LEN;
> ++      }
> ++      poolsize = (bb_strtoul(poolsize_str, NULL, 10) + 7) / 8;
> ++      return MAX(MIN(poolsize, MAX_SEED_LEN), MIN_SEED_LEN);
> ++}
> ++
> ++static int read_new_seed(uint8_t *seed, size_t len, bool *is_creditable)
> ++{
> ++      ssize_t ret;
> ++
> ++      *is_creditable = false;
> ++      ret = getrandom(seed, len, GRND_NONBLOCK);
> ++      if (ret == (ssize_t)len) {
> ++              *is_creditable = true;
> ++              return 0;
> ++      } else if (ret < 0 && errno == ENOSYS) {
> ++              struct pollfd random_fd = {
> ++                      .fd = open("/dev/random", O_RDONLY),
> ++                      .events = POLLIN
> ++              };
> ++              if (random_fd.fd < 0)
> ++                      return -1;
> ++              *is_creditable = safe_poll(&random_fd, 1, 0) == 1;
> ++              close(random_fd.fd);
> ++      } else if (getrandom(seed, len, GRND_INSECURE) == (ssize_t)len)
> ++              return 0;
> ++      if (open_read_close("/dev/urandom", seed, len) == (ssize_t)len)
> ++              return 0;
> ++      return -1;
> ++}
> ++
> ++static int seed_rng(uint8_t *seed, size_t len, bool credit)
> ++{
> ++      struct {
> ++              int entropy_count;
> ++              int buf_size;
> ++              uint8_t buffer[MAX_SEED_LEN];
> ++      } req = {
> ++              .entropy_count = credit ? len * 8 : 0,
> ++              .buf_size = len
> ++      };
> ++      int random_fd, ret;
> ++
> ++      if (len > sizeof(req.buffer)) {
> ++              errno = EFBIG;
> ++              return -1;
> ++      }
> ++      memcpy(req.buffer, seed, len);
> ++
> ++      random_fd = open("/dev/urandom", O_RDONLY);
> ++      if (random_fd < 0)
> ++              return -1;
> ++      ret = ioctl(random_fd, RNDADDENTROPY, &req);
> ++      if (ret)
> ++              ret = -errno ? -errno : -EIO;
> ++      if (ENABLE_FEATURE_CLEAN_UP)
> ++              close(random_fd);
> ++      errno = -ret;
> ++      return ret ? -1 : 0;
> ++}
> ++
> ++static int seed_from_file_if_exists(const char *filename, int dfd, bool credit, sha256_ctx_t *hash)
> ++{
> ++      uint8_t seed[MAX_SEED_LEN];
> ++      ssize_t seed_len;
> ++
> ++      seed_len = open_read_close(filename, seed, sizeof(seed));
> ++      if (seed_len < 0) {
> ++              if (errno == ENOENT)
> ++                      return 0;
> ++              bb_perror_msg("unable to%s seed", " read");
> ++              return -1;
> ++      }
> ++      if ((unlink(filename) < 0 || fsync(dfd) < 0) && seed_len) {
> ++              bb_perror_msg("unable to%s seed", " remove");
> ++              return -1;
> ++      } else if (!seed_len)
> ++              return 0;
> ++
> ++      sha256_hash(hash, &seed_len, sizeof(seed_len));
> ++      sha256_hash(hash, seed, seed_len);
> ++
> ++      printf("Seeding %zd bits %s crediting\n", seed_len * 8, credit ? "and" : "without");
> ++      if (seed_rng(seed, seed_len, credit) < 0) {
> ++              bb_perror_msg("unable to%s seed", "");
> ++              return -1;
> ++      }
> ++      return 0;
> ++}
> ++
> ++int seedrng_main(int argc, char *argv[]) MAIN_EXTERNALLY_VISIBLE;
> ++int seedrng_main(int argc UNUSED_PARAM, char *argv[])
> ++{
> ++      const char *seed_dir = DEFAULT_SEED_DIR, *creditable_seed, *non_creditable_seed;
> ++      int ret, fd = -1, dfd = -1, program_ret = 0;
> ++      uint8_t new_seed[MAX_SEED_LEN];
> ++      size_t new_seed_len;
> ++      bool new_seed_creditable;
> ++      bool skip_credit = false;
> ++      struct timespec timestamp = { 0 };
> ++      sha256_ctx_t hash;
> ++
> ++      int opt;
> ++      enum {
> ++              OPT_d = (1 << 0),
> ++              OPT_n = (1 << 1)
> ++      };
> ++#if ENABLE_LONG_OPTS
> ++      static const char longopts[] ALIGN1 =
> ++              "seed-dir\0"    Required_argument       "d"
> ++              "skip-credit\0" No_argument             "n"
> ++              ;
> ++#endif
> ++
> ++      opt = getopt32long(argv, "d:n", longopts, &seed_dir);
> ++      skip_credit = opt & OPT_n;
> ++      creditable_seed = concat_path_file(seed_dir, CREDITABLE_SEED_NAME);
> ++      non_creditable_seed = concat_path_file(seed_dir, NON_CREDITABLE_SEED_NAME);
> ++
> ++      umask(0077);
> ++      if (getuid())
> ++              bb_simple_error_msg_and_die(bb_msg_you_must_be_root);
> ++
> ++      if (mkdir(seed_dir, 0700) < 0 && errno != EEXIST)
> ++              bb_perror_msg_and_die("unable to %s seed directory", "create");
> ++
> ++      dfd = open(seed_dir, O_DIRECTORY | O_RDONLY);
> ++      if (dfd < 0 || flock(dfd, LOCK_EX) < 0) {
> ++              bb_perror_msg("unable to %s seed directory", "lock");
> ++              program_ret = 1;
> ++              goto out;
> ++      }
> ++
> ++      sha256_begin(&hash);
> ++      sha256_hash(&hash, "SeedRNG v1 Old+New Prefix", 25);
> ++      clock_gettime(CLOCK_REALTIME, &timestamp);
> ++      sha256_hash(&hash, &timestamp, sizeof(timestamp));
> ++      clock_gettime(CLOCK_BOOTTIME, &timestamp);
> ++      sha256_hash(&hash, &timestamp, sizeof(timestamp));
> ++
> ++      ret = seed_from_file_if_exists(non_creditable_seed, dfd, false, &hash);
> ++      if (ret < 0)
> ++              program_ret |= 1 << 1;
> ++      ret = seed_from_file_if_exists(creditable_seed, dfd, !skip_credit, &hash);
> ++      if (ret < 0)
> ++              program_ret |= 1 << 2;
> ++
> ++      new_seed_len = determine_optimal_seed_len();
> ++      ret = read_new_seed(new_seed, new_seed_len, &new_seed_creditable);
> ++      if (ret < 0) {
> ++              bb_perror_msg("unable to%s seed", " read new");
> ++              new_seed_len = SHA256_OUTSIZE;
> ++              memset(new_seed, 0, SHA256_OUTSIZE);
> ++              program_ret |= 1 << 3;
> ++      }
> ++      sha256_hash(&hash, &new_seed_len, sizeof(new_seed_len));
> ++      sha256_hash(&hash, new_seed, new_seed_len);
> ++      sha256_end(&hash, new_seed + new_seed_len - SHA256_OUTSIZE);
> ++
> ++      printf("Saving %zu bits of %screditable seed for next boot\n", new_seed_len * 8, new_seed_creditable ? "" : "non-");
> ++      fd = open(non_creditable_seed, O_WRONLY | O_CREAT | O_TRUNC, 0400);
> ++      if (fd < 0 || full_write(fd, new_seed, new_seed_len) != (ssize_t)new_seed_len || fsync(fd) < 0) {
> ++              bb_perror_msg("unable to%s seed", " write");
> ++              program_ret |= 1 << 4;
> ++              goto out;
> ++      }
> ++      if (new_seed_creditable && rename(non_creditable_seed, creditable_seed) < 0) {
> ++              bb_simple_perror_msg("unable to make new seed creditable");
> ++              program_ret |= 1 << 5;
> ++      }
> ++out:
> ++      if (ENABLE_FEATURE_CLEAN_UP && fd >= 0)
> ++              close(fd);
> ++      if (ENABLE_FEATURE_CLEAN_UP && dfd >= 0)
> ++              close(dfd);
> ++      return program_ret;
> ++}
> +--
> +2.35.1
> +
> diff --git a/package/urandom-scripts/Config.in b/package/urandom-scripts/Config.in
> index 987e442e22..070ffa5e9a 100644
> --- a/package/urandom-scripts/Config.in
> +++ b/package/urandom-scripts/Config.in
> @@ -4,7 +4,3 @@ config BR2_PACKAGE_URANDOM_SCRIPTS
>         depends on !BR2_PACKAGE_SYSTEMD
>         help
>           Initscript to preserve the random seed between reboots.
> -
> -         WARNING: this is a poor fit to try and get high-quality
> -         entropy at boot. There are better ways, like haveged, or
> -         rng-tools.
> diff --git a/package/urandom-scripts/S20urandom b/package/urandom-scripts/S20urandom
> index 6c6aea9eee..346bc5b11e 100644
> --- a/package/urandom-scripts/S20urandom
> +++ b/package/urandom-scripts/S20urandom
> @@ -3,67 +3,31 @@
>  # Preserve the random seed between reboots. See urandom(4).
>  #
>
> -# Quietly do nothing if /dev/urandom does not exist
> -[ -c /dev/urandom ] || exit 0
> -
> -URANDOM_SEED="/var/lib/random-seed"
> +# The following knobs can be adjusted by placing uncommented modified lines
> +# into /etc/default/urandom:
> +#
> +# Set these to change where the seed and runtime lock file are stored:
> +#
> +#     seed_dir=/var/lib/seedrng
> +#
> +# Set this to true only if you do not want seed files to actually credit the
> +# RNG, for example if you plan to replicate this file system image and do not
> +# have the wherewithal to first delete the contents of /var/lib/seedrng:
> +#
> +#     skip_credit=false
> +#
>
> -# shellcheck source=/dev/null
> +unset seed_dir skip_credit
>  [ -r "/etc/default/urandom" ] && . "/etc/default/urandom"
>
> -if pool_bits=$(cat /proc/sys/kernel/random/poolsize 2> /dev/null); then
> -       pool_size=$((pool_bits/8))
> -else
> -       pool_size=512
> -fi
> -
> -init_rng() {
> -       [ -f "$URANDOM_SEED" ] || return 0
> -       printf 'Initializing random number generator: '
> -       dd if="$URANDOM_SEED" bs="$pool_size" of=/dev/urandom count=1 2> /dev/null
> -       status=$?
> -       if [ "$status" -eq 0 ]; then
> -               echo "OK"
> -       else
> -               echo "FAIL"
> -       fi
> -       return "$status"
> -}
> -
> -save_random_seed() {
> -       printf 'Saving random seed: '
> -       status=1
> -       if touch "$URANDOM_SEED.new" 2> /dev/null; then
> -               old_umask=$(umask)
> -               umask 077
> -               dd if=/dev/urandom of="$URANDOM_SEED.tmp" bs="$pool_size" count=1 2> /dev/null
> -               cat "$URANDOM_SEED" "$URANDOM_SEED.tmp" 2>/dev/null \
> -                       | sha256sum \
> -                       | cut -d ' ' -f 1 > "$URANDOM_SEED.new" && \
> -               mv "$URANDOM_SEED.new" "$URANDOM_SEED" && status=0
> -               rm -f "$URANDOM_SEED.tmp"
> -               umask "$old_umask"
> -               if [ "$status" -eq 0 ]; then
> -                       echo "OK"
> -               else
> -                       echo "FAIL"
> -               fi
> -
> -       else
> -               echo "SKIP (read-only file system detected)"
> -       fi
> -       return "$status"
> -}
> -
>  case "$1" in
> -       start|restart|reload)
> -               # Carry a random seed from start-up to start-up
> -               # Load and then save the whole entropy pool
> -               init_rng && save_random_seed;;
> -       stop)
> -               # Carry a random seed from shut-down to start-up
> -               # Save the whole entropy pool
> -               save_random_seed;;
> +       start|stop|restart|reload)
> +               # Never fail, as this isn't worth making a fuss
> +               # over if it doesn't go as planned.
> +               args=""
> +               [ -n "$seed_dir" ] && args="$args --seed-dir=$seed_dir"
> +               [ "$skip_credit" = "true" ] && args="$args --skip-credit"
> +               seedrng $args || true;;
>         *)
>                 echo "Usage: $0 {start|stop|restart|reload}"
>                 exit 1
> --
> 2.35.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
