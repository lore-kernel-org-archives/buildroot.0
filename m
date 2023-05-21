Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940E1C77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F2482BC0;
	Sun, 21 May 2023 15:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F2482BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5g5vAKK7NieW; Sun, 21 May 2023 15:10:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1C482871;
	Sun, 21 May 2023 15:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F1C482871
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4541BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13CCF82871
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13CCF82871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98mG7VvUaz9g for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B21682333
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B21682333
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:10:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2C29FB00572;
 Sun, 21 May 2023 17:10:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:10:38 +0200
Date: Sun, 21 May 2023 17:10:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230521151038.GA171618@scaer>
References: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520210153.3944842-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684681842;
 bh=QEfbRsXyOhgBmoYa8kjzsW8hoDkGq6hM8qnWC55Cd3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aejrUu/q64HOVMeVLd0UkUgjDSgF0Sh/Hxlng5F8YGR2fCdipTPGmKxsIcmb9noyH
 xeRq3tODY0n3JTdsCaVY5kRgcclvlJ9j8yQVUdPTjCiNh6UvW0gKVqI3H/z05BLNJe
 JakVa3Ru4ESftWthYvLbJDi++Tz2mKQN1DZj+XQl8ftIEWVV04d7ef/UI70Z4xSKK/
 ft34kpQsfv0Kh2BpMhlj35K7Ng+aKyMtRomNnZEMHfUp/hMJRwR3HLISA6NvQ0jVmo
 uVsJejrOQV8cFdhv2MEJwS/S8MiWKTF/9SXmmqNkC+zuSGczdL2J6agvaNlXkp+AsU
 41on5L8XiTrRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aejrUu/q
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-05-20 23:01 +0200, Dario Binacchi spake thusly:
> The added patch is an adaptation of the one submitted to the libmnl
> project.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b/
> - http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e/

Those failures are due to improper dependency on kernel headers:

  - IFLA_CAN_TERMINATION        -> introduced in 4.11
  - CAN_CTRLMODE_FD             -> introduced before that
  - CAN_CTRLMODE_FD_NON_ISO     -> introduced before that
  - CAN_CTRLMODE_PRESUME_ACK    -> introduced before that

So libmnl needs to gain a dependency on kernel headers at least 4.11;

    depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11

and that needs to be recursively propagated to all the reverse
dependencies of libmnl (some may already have q more stringent
dependency already):

    $ git grep -l 'select BR2_PACKAGE_LIBMNL'
    package/cfm/Config.in
    package/collectd/Config.in
    package/connman/Config.in
    package/fastd/Config.in
    package/ipset/Config.in
    package/iptables/Config.in
    package/libnetfilter_acct/Config.in
    package/libnetfilter_conntrack/Config.in
    package/libnetfilter_cthelper/Config.in
    package/libnetfilter_cttimeout/Config.in
    package/libnetfilter_log/Config.in
    package/libnetfilter_queue/Config.in
    package/libnftnl/Config.in
    package/mdio-tools/Config.in
    package/mrp/Config.in
    package/nftables/Config.in
    package/ulogd/Config.in

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  ...ache-copy-of-can.h-and-can-netlink.h.patch | 548 ++++++++++++++++++
>  package/libmnl/libmnl.mk                      |   1 +
>  2 files changed, 549 insertions(+)
>  create mode 100644 package/libmnl/0002-include-cache-copy-of-can.h-and-can-netlink.h.patch
> 
> diff --git a/package/libmnl/0002-include-cache-copy-of-can.h-and-can-netlink.h.patch b/package/libmnl/0002-include-cache-copy-of-can.h-and-can-netlink.h.patch
> new file mode 100644
> index 000000000000..f58463678e20
> --- /dev/null
> +++ b/package/libmnl/0002-include-cache-copy-of-can.h-and-can-netlink.h.patch
> @@ -0,0 +1,548 @@
> +From 46e6d487f9406001318e97d0349bcda07f923908 Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sat, 20 May 2023 10:22:52 +0200
> +Subject: [PATCH] include: cache copy of can.h and can/netlink.h
> +
> +Ensure that rtnl-link-can example compiles in any installation. These
> +headers are not installed in the system.
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Upstream: https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230520174435.3925314-1-dario.binacchi@amarulasolutions.com/
> +---
> + configure.ac                  |   2 +-
> + include/linux/Makefile.am     |   4 +-
> + include/linux/can.h           | 298 ++++++++++++++++++++++++++++++++++
> + include/linux/can/Makefile.am |   1 +
> + include/linux/can/netlink.h   | 185 +++++++++++++++++++++
> + 5 files changed, 487 insertions(+), 3 deletions(-)
> + create mode 100644 include/linux/can.h
> + create mode 100644 include/linux/can/Makefile.am
> + create mode 100644 include/linux/can/netlink.h
> +
> +diff --git a/configure.ac b/configure.ac
> +index 314481dae87e..c8a56c6d0550 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -27,7 +27,7 @@ regular_CFLAGS="-Wall -Waggregate-return -Wmissing-declarations \
> + 	-Wformat=2 -pipe"
> + AC_SUBST([regular_CPPFLAGS])
> + AC_SUBST([regular_CFLAGS])
> +-AC_CONFIG_FILES([Makefile src/Makefile include/Makefile include/libmnl/Makefile include/linux/Makefile include/linux/netfilter/Makefile examples/Makefile examples/genl/Makefile examples/kobject/Makefile examples/netfilter/Makefile examples/rtnl/Makefile libmnl.pc doxygen.cfg doxygen/Makefile])
> ++AC_CONFIG_FILES([Makefile src/Makefile include/Makefile include/libmnl/Makefile include/linux/Makefile include/linux/can/Makefile include/linux/netfilter/Makefile examples/Makefile examples/genl/Makefile examples/kobject/Makefile examples/netfilter/Makefile examples/rtnl/Makefile libmnl.pc doxygen.cfg doxygen/Makefile])
> + 
> + AC_ARG_WITH([doxygen], [AS_HELP_STRING([--with-doxygen],
> + 	    [create doxygen documentation])],
> +diff --git a/include/linux/Makefile.am b/include/linux/Makefile.am
> +index 08c600b5fa42..ee0993dae186 100644
> +--- a/include/linux/Makefile.am
> ++++ b/include/linux/Makefile.am
> +@@ -1,2 +1,2 @@
> +-SUBDIRS = netfilter
> +-noinst_HEADERS = netlink.h socket.h
> ++SUBDIRS = can netfilter
> ++noinst_HEADERS = can.h netlink.h socket.h
> +diff --git a/include/linux/can.h b/include/linux/can.h
> +new file mode 100644
> +index 000000000000..2c6a3ee7d32d
> +--- /dev/null
> ++++ b/include/linux/can.h
> +@@ -0,0 +1,298 @@
> ++/* SPDX-License-Identifier: ((GPL-2.0-only WITH Linux-syscall-note) OR BSD-3-Clause) */
> ++/*
> ++ * linux/can.h
> ++ *
> ++ * Definitions for CAN network layer (socket addr / CAN frame / CAN filter)
> ++ *
> ++ * Authors: Oliver Hartkopp <oliver.hartkopp@volkswagen.de>
> ++ *          Urs Thuermann   <urs.thuermann@volkswagen.de>
> ++ * Copyright (c) 2002-2007 Volkswagen Group Electronic Research
> ++ * All rights reserved.
> ++ *
> ++ * Redistribution and use in source and binary forms, with or without
> ++ * modification, are permitted provided that the following conditions
> ++ * are met:
> ++ * 1. Redistributions of source code must retain the above copyright
> ++ *    notice, this list of conditions and the following disclaimer.
> ++ * 2. Redistributions in binary form must reproduce the above copyright
> ++ *    notice, this list of conditions and the following disclaimer in the
> ++ *    documentation and/or other materials provided with the distribution.
> ++ * 3. Neither the name of Volkswagen nor the names of its contributors
> ++ *    may be used to endorse or promote products derived from this software
> ++ *    without specific prior written permission.
> ++ *
> ++ * Alternatively, provided that this notice is retained in full, this
> ++ * software may be distributed under the terms of the GNU General
> ++ * Public License ("GPL") version 2, in which case the provisions of the
> ++ * GPL apply INSTEAD OF those given above.
> ++ *
> ++ * The provided data structures and external interfaces from this code
> ++ * are not restricted to be used by modules with a GPL compatible license.
> ++ *
> ++ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> ++ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> ++ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> ++ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> ++ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> ++ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> ++ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> ++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> ++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> ++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> ++ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> ++ * DAMAGE.
> ++ */
> ++
> ++#ifndef _UAPI_CAN_H
> ++#define _UAPI_CAN_H
> ++
> ++#include <linux/types.h>
> ++#include <linux/socket.h>
> ++#include <linux/stddef.h> /* for offsetof */
> ++
> ++/* controller area network (CAN) kernel definitions */
> ++
> ++/* special address description flags for the CAN_ID */
> ++#define CAN_EFF_FLAG 0x80000000U /* EFF/SFF is set in the MSB */
> ++#define CAN_RTR_FLAG 0x40000000U /* remote transmission request */
> ++#define CAN_ERR_FLAG 0x20000000U /* error message frame */
> ++
> ++/* valid bits in CAN ID for frame formats */
> ++#define CAN_SFF_MASK 0x000007FFU /* standard frame format (SFF) */
> ++#define CAN_EFF_MASK 0x1FFFFFFFU /* extended frame format (EFF) */
> ++#define CAN_ERR_MASK 0x1FFFFFFFU /* omit EFF, RTR, ERR flags */
> ++#define CANXL_PRIO_MASK CAN_SFF_MASK /* 11 bit priority mask */
> ++
> ++/*
> ++ * Controller Area Network Identifier structure
> ++ *
> ++ * bit 0-28	: CAN identifier (11/29 bit)
> ++ * bit 29	: error message frame flag (0 = data frame, 1 = error message)
> ++ * bit 30	: remote transmission request flag (1 = rtr frame)
> ++ * bit 31	: frame format flag (0 = standard 11 bit, 1 = extended 29 bit)
> ++ */
> ++typedef __u32 canid_t;
> ++
> ++#define CAN_SFF_ID_BITS		11
> ++#define CAN_EFF_ID_BITS		29
> ++#define CANXL_PRIO_BITS		CAN_SFF_ID_BITS
> ++
> ++/*
> ++ * Controller Area Network Error Message Frame Mask structure
> ++ *
> ++ * bit 0-28	: error class mask (see include/uapi/linux/can/error.h)
> ++ * bit 29-31	: set to zero
> ++ */
> ++typedef __u32 can_err_mask_t;
> ++
> ++/* CAN payload length and DLC definitions according to ISO 11898-1 */
> ++#define CAN_MAX_DLC 8
> ++#define CAN_MAX_RAW_DLC 15
> ++#define CAN_MAX_DLEN 8
> ++
> ++/* CAN FD payload length and DLC definitions according to ISO 11898-7 */
> ++#define CANFD_MAX_DLC 15
> ++#define CANFD_MAX_DLEN 64
> ++
> ++/*
> ++ * CAN XL payload length and DLC definitions according to ISO 11898-1
> ++ * CAN XL DLC ranges from 0 .. 2047 => data length from 1 .. 2048 byte
> ++ */
> ++#define CANXL_MIN_DLC 0
> ++#define CANXL_MAX_DLC 2047
> ++#define CANXL_MAX_DLC_MASK 0x07FF
> ++#define CANXL_MIN_DLEN 1
> ++#define CANXL_MAX_DLEN 2048
> ++
> ++/**
> ++ * struct can_frame - Classical CAN frame structure (aka CAN 2.0B)
> ++ * @can_id:   CAN ID of the frame and CAN_*_FLAG flags, see canid_t definition
> ++ * @len:      CAN frame payload length in byte (0 .. 8)
> ++ * @can_dlc:  deprecated name for CAN frame payload length in byte (0 .. 8)
> ++ * @__pad:    padding
> ++ * @__res0:   reserved / padding
> ++ * @len8_dlc: optional DLC value (9 .. 15) at 8 byte payload length
> ++ *            len8_dlc contains values from 9 .. 15 when the payload length is
> ++ *            8 bytes but the DLC value (see ISO 11898-1) is greater then 8.
> ++ *            CAN_CTRLMODE_CC_LEN8_DLC flag has to be enabled in CAN driver.
> ++ * @data:     CAN frame payload (up to 8 byte)
> ++ */
> ++struct can_frame {
> ++	canid_t can_id;  /* 32 bit CAN_ID + EFF/RTR/ERR flags */
> ++	union {
> ++		/* CAN frame payload length in byte (0 .. CAN_MAX_DLEN)
> ++		 * was previously named can_dlc so we need to carry that
> ++		 * name for legacy support
> ++		 */
> ++		__u8 len;
> ++		__u8 can_dlc; /* deprecated */
> ++	} __attribute__((packed)); /* disable padding added in some ABIs */
> ++	__u8 __pad; /* padding */
> ++	__u8 __res0; /* reserved / padding */
> ++	__u8 len8_dlc; /* optional DLC for 8 byte payload length (9 .. 15) */
> ++	__u8 data[CAN_MAX_DLEN] __attribute__((aligned(8)));
> ++};
> ++
> ++/*
> ++ * defined bits for canfd_frame.flags
> ++ *
> ++ * The use of struct canfd_frame implies the FD Frame (FDF) bit to
> ++ * be set in the CAN frame bitstream on the wire. The FDF bit switch turns
> ++ * the CAN controllers bitstream processor into the CAN FD mode which creates
> ++ * two new options within the CAN FD frame specification:
> ++ *
> ++ * Bit Rate Switch - to indicate a second bitrate is/was used for the payload
> ++ * Error State Indicator - represents the error state of the transmitting node
> ++ *
> ++ * As the CANFD_ESI bit is internally generated by the transmitting CAN
> ++ * controller only the CANFD_BRS bit is relevant for real CAN controllers when
> ++ * building a CAN FD frame for transmission. Setting the CANFD_ESI bit can make
> ++ * sense for virtual CAN interfaces to test applications with echoed frames.
> ++ *
> ++ * The struct can_frame and struct canfd_frame intentionally share the same
> ++ * layout to be able to write CAN frame content into a CAN FD frame structure.
> ++ * When this is done the former differentiation via CAN_MTU / CANFD_MTU gets
> ++ * lost. CANFD_FDF allows programmers to mark CAN FD frames in the case of
> ++ * using struct canfd_frame for mixed CAN / CAN FD content (dual use).
> ++ * Since the introduction of CAN XL the CANFD_FDF flag is set in all CAN FD
> ++ * frame structures provided by the CAN subsystem of the Linux kernel.
> ++ */
> ++#define CANFD_BRS 0x01 /* bit rate switch (second bitrate for payload data) */
> ++#define CANFD_ESI 0x02 /* error state indicator of the transmitting node */
> ++#define CANFD_FDF 0x04 /* mark CAN FD for dual use of struct canfd_frame */
> ++
> ++/**
> ++ * struct canfd_frame - CAN flexible data rate frame structure
> ++ * @can_id: CAN ID of the frame and CAN_*_FLAG flags, see canid_t definition
> ++ * @len:    frame payload length in byte (0 .. CANFD_MAX_DLEN)
> ++ * @flags:  additional flags for CAN FD
> ++ * @__res0: reserved / padding
> ++ * @__res1: reserved / padding
> ++ * @data:   CAN FD frame payload (up to CANFD_MAX_DLEN byte)
> ++ */
> ++struct canfd_frame {
> ++	canid_t can_id;  /* 32 bit CAN_ID + EFF/RTR/ERR flags */
> ++	__u8    len;     /* frame payload length in byte */
> ++	__u8    flags;   /* additional flags for CAN FD */
> ++	__u8    __res0;  /* reserved / padding */
> ++	__u8    __res1;  /* reserved / padding */
> ++	__u8    data[CANFD_MAX_DLEN] __attribute__((aligned(8)));
> ++};
> ++
> ++/*
> ++ * defined bits for canxl_frame.flags
> ++ *
> ++ * The canxl_frame.flags element contains two bits CANXL_XLF and CANXL_SEC
> ++ * and shares the relative position of the struct can[fd]_frame.len element.
> ++ * The CANXL_XLF bit ALWAYS needs to be set to indicate a valid CAN XL frame.
> ++ * As a side effect setting this bit intentionally breaks the length checks
> ++ * for Classical CAN and CAN FD frames.
> ++ *
> ++ * Undefined bits in canxl_frame.flags are reserved and shall be set to zero.
> ++ */
> ++#define CANXL_XLF 0x80 /* mandatory CAN XL frame flag (must always be set!) */
> ++#define CANXL_SEC 0x01 /* Simple Extended Content (security/segmentation) */
> ++
> ++/**
> ++ * struct canxl_frame - CAN with e'X'tended frame 'L'ength frame structure
> ++ * @prio:  11 bit arbitration priority with zero'ed CAN_*_FLAG flags
> ++ * @flags: additional flags for CAN XL
> ++ * @sdt:   SDU (service data unit) type
> ++ * @len:   frame payload length in byte (CANXL_MIN_DLEN .. CANXL_MAX_DLEN)
> ++ * @af:    acceptance field
> ++ * @data:  CAN XL frame payload (CANXL_MIN_DLEN .. CANXL_MAX_DLEN byte)
> ++ *
> ++ * @prio shares the same position as @can_id from struct can[fd]_frame.
> ++ */
> ++struct canxl_frame {
> ++	canid_t prio;  /* 11 bit priority for arbitration (canid_t) */
> ++	__u8    flags; /* additional flags for CAN XL */
> ++	__u8    sdt;   /* SDU (service data unit) type */
> ++	__u16   len;   /* frame payload length in byte */
> ++	__u32   af;    /* acceptance field */
> ++	__u8    data[CANXL_MAX_DLEN];
> ++};
> ++
> ++#define CAN_MTU		(sizeof(struct can_frame))
> ++#define CANFD_MTU	(sizeof(struct canfd_frame))
> ++#define CANXL_MTU	(sizeof(struct canxl_frame))
> ++#define CANXL_HDR_SIZE	(offsetof(struct canxl_frame, data))
> ++#define CANXL_MIN_MTU	(CANXL_HDR_SIZE + 64)
> ++#define CANXL_MAX_MTU	CANXL_MTU
> ++
> ++/* particular protocols of the protocol family PF_CAN */
> ++#define CAN_RAW		1 /* RAW sockets */
> ++#define CAN_BCM		2 /* Broadcast Manager */
> ++#define CAN_TP16	3 /* VAG Transport Protocol v1.6 */
> ++#define CAN_TP20	4 /* VAG Transport Protocol v2.0 */
> ++#define CAN_MCNET	5 /* Bosch MCNet */
> ++#define CAN_ISOTP	6 /* ISO 15765-2 Transport Protocol */
> ++#define CAN_J1939	7 /* SAE J1939 */
> ++#define CAN_NPROTO	8
> ++
> ++#define SOL_CAN_BASE 100
> ++
> ++/*
> ++ * This typedef was introduced in Linux v3.1-rc2
> ++ * (commit 6602a4b net: Make userland include of netlink.h more sane)
> ++ * in <linux/socket.h>. It must be duplicated here to make the CAN
> ++ * headers self-contained.
> ++ */
> ++typedef unsigned short __kernel_sa_family_t;
> ++
> ++/**
> ++ * struct sockaddr_can - the sockaddr structure for CAN sockets
> ++ * @can_family:  address family number AF_CAN.
> ++ * @can_ifindex: CAN network interface index.
> ++ * @can_addr:    protocol specific address information
> ++ */
> ++struct sockaddr_can {
> ++	__kernel_sa_family_t can_family;
> ++	int         can_ifindex;
> ++	union {
> ++		/* transport protocol class address information (e.g. ISOTP) */
> ++		struct { canid_t rx_id, tx_id; } tp;
> ++
> ++		/* J1939 address information */
> ++		struct {
> ++			/* 8 byte name when using dynamic addressing */
> ++			__u64 name;
> ++
> ++			/* pgn:
> ++			 * 8 bit: PS in PDU2 case, else 0
> ++			 * 8 bit: PF
> ++			 * 1 bit: DP
> ++			 * 1 bit: reserved
> ++			 */
> ++			__u32 pgn;
> ++
> ++			/* 1 byte address */
> ++			__u8 addr;
> ++		} j1939;
> ++
> ++		/* reserved for future CAN protocols address information */
> ++	} can_addr;
> ++};
> ++
> ++/**
> ++ * struct can_filter - CAN ID based filter in can_register().
> ++ * @can_id:   relevant bits of CAN ID which are not masked out.
> ++ * @can_mask: CAN mask (see description)
> ++ *
> ++ * Description:
> ++ * A filter matches, when
> ++ *
> ++ *          <received_can_id> & mask == can_id & mask
> ++ *
> ++ * The filter can be inverted (CAN_INV_FILTER bit set in can_id) or it can
> ++ * filter for error message frames (CAN_ERR_FLAG bit set in mask).
> ++ */
> ++struct can_filter {
> ++	canid_t can_id;
> ++	canid_t can_mask;
> ++};
> ++
> ++#define CAN_INV_FILTER 0x20000000U /* to be set in can_filter.can_id */
> ++#define CAN_RAW_FILTER_MAX 512 /* maximum number of can_filter set via setsockopt() */
> ++
> ++#endif /* !_UAPI_CAN_H */
> +diff --git a/include/linux/can/Makefile.am b/include/linux/can/Makefile.am
> +new file mode 100644
> +index 000000000000..2d0288766894
> +--- /dev/null
> ++++ b/include/linux/can/Makefile.am
> +@@ -0,0 +1 @@
> ++noinst_HEADERS = netlink.h
> +diff --git a/include/linux/can/netlink.h b/include/linux/can/netlink.h
> +new file mode 100644
> +index 000000000000..02ec32d69474
> +--- /dev/null
> ++++ b/include/linux/can/netlink.h
> +@@ -0,0 +1,185 @@
> ++/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> ++/*
> ++ * linux/can/netlink.h
> ++ *
> ++ * Definitions for the CAN netlink interface
> ++ *
> ++ * Copyright (c) 2009 Wolfgang Grandegger <wg@grandegger.com>
> ++ *
> ++ * This program is free software; you can redistribute it and/or modify
> ++ * it under the terms of the version 2 of the GNU General Public License
> ++ * as published by the Free Software Foundation
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> ++ * GNU General Public License for more details.
> ++ */
> ++
> ++#ifndef _UAPI_CAN_NETLINK_H
> ++#define _UAPI_CAN_NETLINK_H
> ++
> ++#include <linux/types.h>
> ++
> ++/*
> ++ * CAN bit-timing parameters
> ++ *
> ++ * For further information, please read chapter "8 BIT TIMING
> ++ * REQUIREMENTS" of the "Bosch CAN Specification version 2.0"
> ++ * at http://www.semiconductors.bosch.de/pdf/can2spec.pdf.
> ++ */
> ++struct can_bittiming {
> ++	__u32 bitrate;		/* Bit-rate in bits/second */
> ++	__u32 sample_point;	/* Sample point in one-tenth of a percent */
> ++	__u32 tq;		/* Time quanta (TQ) in nanoseconds */
> ++	__u32 prop_seg;		/* Propagation segment in TQs */
> ++	__u32 phase_seg1;	/* Phase buffer segment 1 in TQs */
> ++	__u32 phase_seg2;	/* Phase buffer segment 2 in TQs */
> ++	__u32 sjw;		/* Synchronisation jump width in TQs */
> ++	__u32 brp;		/* Bit-rate prescaler */
> ++};
> ++
> ++/*
> ++ * CAN hardware-dependent bit-timing constant
> ++ *
> ++ * Used for calculating and checking bit-timing parameters
> ++ */
> ++struct can_bittiming_const {
> ++	char name[16];		/* Name of the CAN controller hardware */
> ++	__u32 tseg1_min;	/* Time segment 1 = prop_seg + phase_seg1 */
> ++	__u32 tseg1_max;
> ++	__u32 tseg2_min;	/* Time segment 2 = phase_seg2 */
> ++	__u32 tseg2_max;
> ++	__u32 sjw_max;		/* Synchronisation jump width */
> ++	__u32 brp_min;		/* Bit-rate prescaler */
> ++	__u32 brp_max;
> ++	__u32 brp_inc;
> ++};
> ++
> ++/*
> ++ * CAN clock parameters
> ++ */
> ++struct can_clock {
> ++	__u32 freq;		/* CAN system clock frequency in Hz */
> ++};
> ++
> ++/*
> ++ * CAN operational and error states
> ++ */
> ++enum can_state {
> ++	CAN_STATE_ERROR_ACTIVE = 0,	/* RX/TX error count < 96 */
> ++	CAN_STATE_ERROR_WARNING,	/* RX/TX error count < 128 */
> ++	CAN_STATE_ERROR_PASSIVE,	/* RX/TX error count < 256 */
> ++	CAN_STATE_BUS_OFF,		/* RX/TX error count >= 256 */
> ++	CAN_STATE_STOPPED,		/* Device is stopped */
> ++	CAN_STATE_SLEEPING,		/* Device is sleeping */
> ++	CAN_STATE_MAX
> ++};
> ++
> ++/*
> ++ * CAN bus error counters
> ++ */
> ++struct can_berr_counter {
> ++	__u16 txerr;
> ++	__u16 rxerr;
> ++};
> ++
> ++/*
> ++ * CAN controller mode
> ++ */
> ++struct can_ctrlmode {
> ++	__u32 mask;
> ++	__u32 flags;
> ++};
> ++
> ++#define CAN_CTRLMODE_LOOPBACK		0x01	/* Loopback mode */
> ++#define CAN_CTRLMODE_LISTENONLY		0x02	/* Listen-only mode */
> ++#define CAN_CTRLMODE_3_SAMPLES		0x04	/* Triple sampling mode */
> ++#define CAN_CTRLMODE_ONE_SHOT		0x08	/* One-Shot mode */
> ++#define CAN_CTRLMODE_BERR_REPORTING	0x10	/* Bus-error reporting */
> ++#define CAN_CTRLMODE_FD			0x20	/* CAN FD mode */
> ++#define CAN_CTRLMODE_PRESUME_ACK	0x40	/* Ignore missing CAN ACKs */
> ++#define CAN_CTRLMODE_FD_NON_ISO		0x80	/* CAN FD in non-ISO mode */
> ++#define CAN_CTRLMODE_CC_LEN8_DLC	0x100	/* Classic CAN DLC option */
> ++#define CAN_CTRLMODE_TDC_AUTO		0x200	/* CAN transiver automatically calculates TDCV */
> ++#define CAN_CTRLMODE_TDC_MANUAL		0x400	/* TDCV is manually set up by user */
> ++
> ++/*
> ++ * CAN device statistics
> ++ */
> ++struct can_device_stats {
> ++	__u32 bus_error;	/* Bus errors */
> ++	__u32 error_warning;	/* Changes to error warning state */
> ++	__u32 error_passive;	/* Changes to error passive state */
> ++	__u32 bus_off;		/* Changes to bus off state */
> ++	__u32 arbitration_lost; /* Arbitration lost errors */
> ++	__u32 restarts;		/* CAN controller re-starts */
> ++};
> ++
> ++/*
> ++ * CAN netlink interface
> ++ */
> ++enum {
> ++	IFLA_CAN_UNSPEC,
> ++	IFLA_CAN_BITTIMING,
> ++	IFLA_CAN_BITTIMING_CONST,
> ++	IFLA_CAN_CLOCK,
> ++	IFLA_CAN_STATE,
> ++	IFLA_CAN_CTRLMODE,
> ++	IFLA_CAN_RESTART_MS,
> ++	IFLA_CAN_RESTART,
> ++	IFLA_CAN_BERR_COUNTER,
> ++	IFLA_CAN_DATA_BITTIMING,
> ++	IFLA_CAN_DATA_BITTIMING_CONST,
> ++	IFLA_CAN_TERMINATION,
> ++	IFLA_CAN_TERMINATION_CONST,
> ++	IFLA_CAN_BITRATE_CONST,
> ++	IFLA_CAN_DATA_BITRATE_CONST,
> ++	IFLA_CAN_BITRATE_MAX,
> ++	IFLA_CAN_TDC,
> ++	IFLA_CAN_CTRLMODE_EXT,
> ++
> ++	/* add new constants above here */
> ++	__IFLA_CAN_MAX,
> ++	IFLA_CAN_MAX = __IFLA_CAN_MAX - 1
> ++};
> ++
> ++/*
> ++ * CAN FD Transmitter Delay Compensation (TDC)
> ++ *
> ++ * Please refer to struct can_tdc_const and can_tdc in
> ++ * include/linux/can/bittiming.h for further details.
> ++ */
> ++enum {
> ++	IFLA_CAN_TDC_UNSPEC,
> ++	IFLA_CAN_TDC_TDCV_MIN,	/* u32 */
> ++	IFLA_CAN_TDC_TDCV_MAX,	/* u32 */
> ++	IFLA_CAN_TDC_TDCO_MIN,	/* u32 */
> ++	IFLA_CAN_TDC_TDCO_MAX,	/* u32 */
> ++	IFLA_CAN_TDC_TDCF_MIN,	/* u32 */
> ++	IFLA_CAN_TDC_TDCF_MAX,	/* u32 */
> ++	IFLA_CAN_TDC_TDCV,	/* u32 */
> ++	IFLA_CAN_TDC_TDCO,	/* u32 */
> ++	IFLA_CAN_TDC_TDCF,	/* u32 */
> ++
> ++	/* add new constants above here */
> ++	__IFLA_CAN_TDC,
> ++	IFLA_CAN_TDC_MAX = __IFLA_CAN_TDC - 1
> ++};
> ++
> ++/*
> ++ * IFLA_CAN_CTRLMODE_EXT nest: controller mode extended parameters
> ++ */
> ++enum {
> ++	IFLA_CAN_CTRLMODE_UNSPEC,
> ++	IFLA_CAN_CTRLMODE_SUPPORTED,	/* u32 */
> ++
> ++	/* add new constants above here */
> ++	__IFLA_CAN_CTRLMODE,
> ++	IFLA_CAN_CTRLMODE_MAX = __IFLA_CAN_CTRLMODE - 1
> ++};
> ++
> ++/* u16 termination range: 1..65535 Ohms */
> ++#define CAN_TERMINATION_DISABLED 0
> ++
> ++#endif /* !_UAPI_CAN_NETLINK_H */
> +-- 
> +2.32.0
> +
> diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
> index cea528422ea8..08eebbaed9a8 100644
> --- a/package/libmnl/libmnl.mk
> +++ b/package/libmnl/libmnl.mk
> @@ -12,6 +12,7 @@ LIBMNL_LICENSE = LGPL-2.1+
>  LIBMNL_LICENSE_FILES = COPYING
>  LIBMNL_CPE_ID_VENDOR = netfilter
>  # 0001-examples-add-rtnl-link-can.patch patches Makefile.am
> +# 0002-include-cache-copy-of-can.h-and-can-netlink.h.patch patches configure.ac
>  LIBMNL_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_LIBMNL_EXAMPLES),y)
> -- 
> 2.32.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
