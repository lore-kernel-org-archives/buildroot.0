Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D94C54798
	for <buildroot@archiver.kernel.org>; Tue,  5 Mar 2024 15:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C20C81604;
	Tue,  5 Mar 2024 15:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktZp1jVTG0j8; Tue,  5 Mar 2024 15:15:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48593813AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48593813AD;
	Tue,  5 Mar 2024 15:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB2BA1BF2C9
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D599D814AB
 for <buildroot@lists.busybox.net>; Tue,  5 Mar 2024 15:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RAzXtGhk8zj8 for <buildroot@lists.busybox.net>;
 Tue,  5 Mar 2024 15:15:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07C52813E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C52813E7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07C52813E7
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 15:15:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7026660006
 for <buildroot@buildroot.org>; Tue,  5 Mar 2024 15:15:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhWVY-000S3Z-2Q
 for buildroot@buildroot.org; Tue, 05 Mar 2024 16:15:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 05 Mar 2024 16:15:08 +0100
Message-ID: <87msrczp4z.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02 released
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

Hi,

Buildroot 2024.02 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2024.02.tar.gz

or

http://buildroot.net/downloads/buildroot-2024.02.tar.xz

Or get it from Git:

git://git.buildroot.net/buildroot

Please give it a spin and report any problems to the mailing list or
bug tracker.

Again a fairly active development cycle with more than 1300 changes and
contributions from 106 unique contributors!

Of noteworthy new features/changes we have:

- Toolchain:

  - GDB: Add version 14.1, default to 13.2.

  - uClibc-ng updated to 1.0.45

  - Bootlin external toolchains updated to 2023.11-1, moving the stable
    toolchains to GCC 12.3 / binutils 2.40 / GDB 13.2 / glibc 2.38 /
    musl 1.2.4 / uClibc-ng 1.0.45

  - Add support for building a bare metal toolchain suitable for
    building firmware for certain (co-)processors, possibly using a
    different CPU architecture than the main Buildroot configuration.

- Default optimization level changed from optimize for size (-Os) to
  optimize for speed (-O2).

- Support: Use the Fraunhofer FKIE JSON files for CVE matching now that
  NVD is about to deprecate its feeds.

- A large number of new runtime tests

- New defconfigs: AMD Zynqmp kria kd240 and kr260, zcu104, Avnet RZBoard
  V2L, Mangopi MQ1RDW2, NXP i.MX 93 11x11 EVK, QEMU Riscv64 virt-efi, TI
  AM574x Industrial Development Kit

- New packages: binutils-bare-metal, dmenu-wayland, fcft, foot,
  firmware-ele-imx, ivi-homescreen, libjwt, libtraceevent, libtracefs,
  libutempter, lua-ansicolors, lua-argparse, lua-conciseserialization,
  lua-ubjson, minisign, newlib-bare-metal, python-aiosqlite,
  python-annotated-types, python-anyio, python-asyncssh,
  python-bitarray, python-cachetools, python-contourpy, python-decouple,
  python-fastapi-sessions, python-fastapi, python-google-api-core,
  python-google-auth, python-googleapis-common-protos,
  python-grpc-requests, python-grpcio-reflection, python-grpcio,
  python-httpcore, python-httpx, python-matplotlib-inline,
  python-ml-dtypes, python-multipart, python-pydantic-core,
  python-pypng, python-starlette, python-tcolorpy, python-trafaret,
  python-urwid-readline, python-uvicorn, rlwrap, tllist

And the usual package version updates and bug fixes. See the CHANGES
file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2024.02

Upgrading from 2023.02.x:

In addition to these changes, for people upgrading from 2023.02.x the
most noteworthy changes since that release can be seen in the
announcements for 2023.05, 2023.08 and 2023.11:

2023.05: https://lore.kernel.org/buildroot/87r0qn2c77.fsf@48ers.dk/T/#u
2023.08: https://lore.kernel.org/buildroot/878r9jghcb.fsf@48ers.dk/T/#u
2023.11: https://lore.kernel.org/buildroot/87sf4itlxw.fsf@48ers.dk/

Future:

This release will be become our new long term support releases, which
means it will be supported with security and other important fixes until
2025.02 is out. The previous 2023.02.x LTS release will see atleast one
more update before it becomes EOL in April, so start migration to
2024.02 soon.

The next release will be 2024.05. Expect the first release candidate
in early May and the final release at the end of the month.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
