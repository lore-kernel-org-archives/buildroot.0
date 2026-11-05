Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F2606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=adbPF7db
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B423F8111D;
	Fri,  6 Nov 2026 15:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWlV0m1qNRZr; Fri,  6 Nov 2026 15:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DAAAA81188
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980721;
	b=fjhToAIF/UKOmeFcFJNKKtF3LHLDr3hefKVEFPgcwREsItjTs3KBvmCl0Gwx3tm54IX6
	 pWhTc+8+uvQxZ8GVbz6nW6TZyY4LVjhOGZ3l9B0FMiaSlZe/8b+cVkwBNOJIEkqkMP5MI
	 BR3Fn3fUOozn7I/vOAnKswXmlrp+V3Kv5PV9utO6X/ACJOw9yEPis+yx/ThYSQGzGYMg1
	 224KHb7087XvCwS2q8/Iu2zwQ04DHEv2g+DFONtJmlI1xFFnq83khwpA4X8+ZsVUAw88+
	 La09q2OjIA60qF/Goe015vE+SMSkakMNDwrdWNIhFyXwb9xYkiN0OFaZHPQbb8kl8+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cRknuoradaTQPmYgVDvHazUvO5SDDbHylyu9Y7JvkrM=;
	b=eIVetu6CLX8gj4e0l3lNglZTqsDTTn4v1TvQfC3tsoMQLRrbXJjhBWiLAhcLo/DzXmht
	 cAz+6UvZI5hscUk8I2W7mp2mWii3m+zpHkv0Jy0Q+6tLZeS2hLXYOwFYJM4xaYqx9JCxx
	 ssvigs7u5Wjm6w7Vv9vcFyDw8PUUDAmcm+O4V5FlLrF2CP4SUlTFOD8iurAOz8kekJtQA
	 kTJXr6ukp9jZy/rxadD7bDpTdU5yDJkffMR7/7EAT8Ul4TRp5DQL5QV2FXzMvwINtyQkv
	 ZpEVr6hTes/nofkabrgHdlZPK7l05g3z/u5jHiEIRQYKBhYghe4B2nEZCcvUuxjLNyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980721;
	bh=cRknuoradaTQPmYgVDvHazUvO5SDDbHylyu9Y7JvkrM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=adbPF7dbWdT1ZWA6ErdNZ63EGYLGGuOsLt0CG7NTcYPi7FkEtJTZTvAODlr0+o59x
	 ZTUn9Mb4PX1qEdQSAzfpwqA6SBUSXSNYxznLph7x4emPXj8bWCEGY2xKyYayVKbax0
	 aFlwzobFagcHo+YznXXol0kBoZev7XgfbXvupnZdpG/gHeTAfPtor+dH3B+AvPjnkv
	 8xqYoFbfZ5+fm7if7nKQcfOr/jzILT5k+trRFla2ThQ4XFoow5WyopYogr48ERuYEC
	 1IF4LMj5WxsZMZ00/9g4O06EjFoDlVTOqbXABtCSdmgEjeplBlqglK2TSqTKYoxXAu
	 IqvqJXCclRiuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAAAA81188;
	Fri,  6 Nov 2026 15:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB13C32A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89A944093B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xo3WakhiSPvf for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2933E40906
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2933E40906
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60C879E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 10:15:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b8aa60d499c9be0ef2d3e34862f81f5be84f49ff
X-Git-Newrev: c97b40377f135288efb1068792dcd6f17ed2609f
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.60C879E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/suricata:
 security bump version to 8.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c97b40377f135288efb1068792dcd6f17ed2609f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Suricata 6.x is EOL since August 1st, 2024:
https://forum.suricata.io/t/suricata-6-is-now-end-of-life-eol/4790

Version 6.0.20, used by buildroot, was the last release on the 6.x
branch. We bump to the newest available release, a backport to the LTS
branches should be considered.

The last common release of 6.0.20 with a 7.x version was with version
7.0.6 which fixed several CVEs in both versions back then:
https://forum.suricata.io/t/suricata-7-0-6-and-6-0-20-released/4728

New release notes following EOL of 6.x:

7.0.7: https://forum.suricata.io/t/suricata-7-0-7-released/4877
Contains these security fixes:
CVE-2024-45797: CRITICAL
CVE-2024-47187: CRITICAL
CVE-2024-47188: CRITICAL
CVE-2024-47522: HIGH
CVE-2024-45795: HIGH
CVE-2024-45796: HIGH

7.0.8: https://forum.suricata.io/t/suricata-7-0-8-released/5137
Contains these security fixes:
CVE-2024-55627: CRITICAL
CVE-2024-55605: CRITICAL
CVE-2024-55629: HIGH
CVE-2024-55628: HIGH
CVE-2024-55626: LOW

7.0.9: https://forum.suricata.io/t/suricata-7-0-9-released/5495
Contains these security fixes:
CVE-2025-29915: HIGH
CVE-2025-29917: HIGH
CVE-2025-29918: HIGH
CVE-2025-29916: Moderate

7.0.10: https://forum.suricata.io/t/suricata-7-0-10-released/5522
Contains no security fixes.

7.0.11: https://forum.suricata.io/t/suricata-7-0-11-released/5851
Contains these security fixes:
CVE-2025-53537: HIGH
CVE-2025-53538: HIGH

8.0 (released together with 7.0.11):
https://forum.suricata.io/t/suricata-8-0-0-released/5854

8.0.1: https://forum.suricata.io/t/suricata-8-0-1-and-7-0-12-released/6018
Contains these security fixes:
CVE-2025-59147: HIGH (7.0.x and 8.0.x)
CVE-2025-59148: HIGH (8.0.x only)
CVE-2025-59149: MODERATE (8.0.x only)
CVE-2025-59150: HIGH (8.0.x only)

8.0.2: https://forum.suricata.io/t/suricata-8-0-2-and-7-0-13-released/6100
Contains these security fixes:
CVE-2025-64344: HIGH (7.0.x and 8.0.x)
CVE-2025-64333: HIGH (7.0.x and 8.0.x)
CVE-2025-64332: HIGH (7.0.x and 8.0.x)
CVE-2025-64331: HIGH (7.0.x and 8.0.x)
CVE-2025-64330: HIGH (7.0.x and 8.0.x)
CVE-2025-64335: HIGH (8.0.x only)
CVE-2025-64334: HIGH (8.0.x only)

8.0.3: https://forum.suricata.io/t/suricata-8-0-3-and-7-0-14-released/6161
Contains these security fixes:
CVE-2026-22260
CVE-2026-22263
CVE-2026-22258
CVE-2026-22259
CVE-2026-22261
CVE-2026-22262
CVE-2026-22264

8.0.4: https://forum.suricata.io/t/suricata-8-0-4-and-7-0-15-released/6218
Contains these security fixes:
CVE-2026-31935
CVE-2026-31934
CVE-2026-31931
CVE-2026-31933
CVE-2026-31932
CVE-2026-31937

Rebased patches.

Upstream switched from pcre to pcre2 in version 7.0.0:
https://github.com/OISF/suricata/commit/bce3c46874cfad9228d2f32b01c9aa5b9091fee6

Updated project URL, the old URL is not reachable anymore.

Added a cargo variable to _MAKE_ENV to fix build error introduced by the
bump to 8.x:
https://lists.buildroot.org/pipermail/buildroot/2025-September/786602.html
"The library suricata-htp appeared in suricata 8."

error: linking with `cc` failed: exit status: 1
  |
  = note: LC_ALL="C" PATH="/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/bin:/home/adymov/build_fw/binaries/vpnfw/host/bin:/home/adymov/build_fw/binaries/vpnfw/host/sbin:/home/adymov/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin" VSLANG="1033" "cc" "-Wl,--version-script=/tmp/rustcQjKpH4/list" "-Wl,--no-undefined-version" "-m64" "/tmp/rustcQjKpH4/symbols.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.00.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.01.rcgu.o" "/home/adymov/build_fw/binaries/vpnf
 w/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.02.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.03.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.04.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.05.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.06.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.07.rcgu.o" "/home/adymov/build_fw/binaries
 /vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.08.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.09.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.10.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.11.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.12.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.13.rcgu.o" "/home/adymov/build_fw/bin
 aries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.14.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.suricata_htp.26578ac6e8e15929-cgu.15.rcgu.o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/suricata_htp.9o2zvkk1iz7v62w1p151csbmg.rcgu.o" "-Wl,--as-needed" "-Wl,-Bstatic" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libflate2-c96dc52b792974fc.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libminiz_oxide-9a5e6c87bd0989fa.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libadler2-15e2a2214e20491a.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/targe
 t/x86_64-unknown-linux-gnu/release/deps/liblibz_sys-b9befbb3035c2fca.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcrc32fast-0a43d2846a4a9b36.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcfg_if-360ab3241b788fcb.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblzma_rs-9f468070623da4fd.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libcrc-bf45046f4b8356ef.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbyteorder-dfc24cad053c0b20.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblibc-ed317864a666eb97.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/targ
 et/x86_64-unknown-linux-gnu/release/deps/libbase64-a4f094197250161c.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liblazy_static-5ba27f73220e0e24.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libnom-4108c1713f94c8d7.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbrotli-98d4b766d2a5f84b.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbrotli_decompressor-59c8bf34b757d6b2.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liballoc_stdlib-703a31eff75062d1.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/liballoc_no_stdlib-5d20fd5d2a496308.rlib" "/home/adymov/build_fw/binaries/vpnfw/bui
 ld/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libtime-44b9873eb3882e39.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libitoa-416b9fe21b8f56dc.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libtime_core-eab4204f5d5ed516.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libnum_conv-f033d8bf2b8b56f6.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libderanged-bdda0d83f774c73b.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libpowerfmt-3c6a581bbf7aead2.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libbstr-346bfb9c2bf6a77a.rlib" "/home/adymov/build_fw/binaries/vpnfw/bui
 ld/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libregex_automata-b93a7f9635e4dd42.rlib" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/release/deps/libmemchr-a87a7ebd56a50ef2.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libstd-22be60875a4ac8d7.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libpanic_unwind-4b832a03827ff95e.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libobject-a25e7f31e2204719.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libmemchr-1f1858edbb50ccb5.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libaddr2line-1319b75889377807.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libgimli-c9972d847170eb93.rlib" "/home/adymov/build_fw/bina
 ries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_demangle-0868a75d0b80f801.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libstd_detect-f4254a923640cbea.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libhashbrown-f21de9b2e2c92770.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_alloc-cf868f78468d45dd.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libminiz_oxide-cce9a55233783113.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libadler-6ef1f692f91f321e.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libunwind-d2b4a3bc57672e2c.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcfg_if-9d8e4e6f4cb45592.rlib" "/home/adymov/build_fw/binaries/vp
 nfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/liblibc-858b7338441a56b6.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/liballoc-d182631d04e1eed2.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/librustc_std_workspace_core-7874c355ab5ed077.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcore-46b25da62cc69443.rlib" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib/libcompiler_builtins-c71612932829263c.rlib" "-Wl,-Bdynamic" "-lz" "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-Wl,--eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/home/adymov/build_fw/binaries/vpnfw/host/bin/../x86_64-tss-linux-gnu/sysroot/usr/lib" "-L" "/home/adymov/build_fw/binaries/vpnfw/host/lib64/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/home/adymov/build_fw/binaries/vpnfw/build/suricata-8.0.0/rust/target/x86_64-unknown-linux-gnu/relea
 se/deps/libsuricata_htp.so" "-Wl,--gc-sections" "-shared" "-Wl,-z,relro,-z,now" "-Wl,-O1" "-nodefaultlibs"
  = note: /usr/bin/ld: cannot find /lib64/libc.so.6: No such file or directory
          collect2: error: ld returned 1 exit status

error: could not compile `suricata-htp` (lib) due to 1 previous error

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a3374e49baa45679997c37a25accaf1574132c4a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...gure.ac-allow-the-user-to-override-RUST_TARGET.patch |  4 +++-
 .../suricata/0002-configure.ac-fix-static-build.patch   | 17 +++++++++--------
 package/suricata/Config.in                              |  4 ++--
 package/suricata/suricata.hash                          |  2 +-
 package/suricata/suricata.mk                            |  7 +++++--
 5 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
index ec876a6852..9c8123f3f1 100644
--- a/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
+++ b/package/suricata/0001-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
@@ -8,6 +8,8 @@ When cross-compiling, RUST_TARGET is not always equal to host_triplet
 through RUST_TARGET environment variable
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Bernd: rebased for version 8.0.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
@@ -16,7 +18,7 @@ diff --git a/configure.ac b/configure.ac
 index 32c230209..7d7c9373f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2489,7 +2489,12 @@ fi
+@@ -2146,7 +2146,12 @@ fi
      have_rust_vendor="no"
  
      if test "x$cross_compiling" = "xyes"; then
diff --git a/package/suricata/0002-configure.ac-fix-static-build.patch b/package/suricata/0002-configure.ac-fix-static-build.patch
index fc5384a114..9e09aa3005 100644
--- a/package/suricata/0002-configure.ac-fix-static-build.patch
+++ b/package/suricata/0002-configure.ac-fix-static-build.patch
@@ -21,6 +21,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://redmine.openinfosecfoundation.org/issues/7008
+[Bernd: rebased for version 8.0.4]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
@@ -29,24 +31,23 @@ diff --git a/configure.ac b/configure.ac
 index 232ee9bed..6277cb9b6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1219,6 +1219,8 @@
+@ -1263,6 +1263,8 @@
          fi
      fi
  
-+    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
++    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}" with_pkgconfig_pcap=yes],[with_pkgconfig_pcap=no])
 +
      if test "$have_wpcap" != "yes"; then
          AC_CHECK_LIB(pcap, pcap_open_dead, [], [
              echo
-@@ -1234,8 +1236,6 @@
+@@ -1278,7 +1280,6 @@
          PCAP_LIB_NAME="pcap"
      fi
  
--    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}"],[:])
--
-     AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
-     if test "$HAVE_PCAP_CONFIG" = "no" -o "$cross_compiling" = "yes"; then
-         AC_MSG_RESULT(no pcap-config is use)
+-    PKG_CHECK_MODULES([PCAP],libpcap,[CPPFLAGS="${CPPFLAGS} ${PCAP_CFLAGS}" LIBS="${LIBS} ${PCAP_LIBS}" with_pkgconfig_pcap=yes],[with_pkgconfig_pcap=no])
+     if test "$with_pkgconfig_pcap" != "yes"; then
+         AC_PATH_PROG(HAVE_PCAP_CONFIG, pcap-config, "no")
+         if test "$HAVE_PCAP_CONFIG" = "no" -o "x$cross_compiling" = "xyes"; then
 -- 
 2.43.0
 
diff --git a/package/suricata/Config.in b/package/suricata/Config.in
index 5f7eb21da0..64069888d8 100644
--- a/package/suricata/Config.in
+++ b/package/suricata/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_SURICATA
 	select BR2_PACKAGE_LIBHTP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBYAML
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Suricata is a free and open source, mature, fast and robust
 	  network threat detection engine.
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SURICATA
 	  detection (IDS), inline intrusion prevention (IPS), network
 	  security monitoring (NSM) and offline pcap processing.
 
-	  https://suricata-ids.org
+	  https://suricata.io
 
 comment "suricata needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index ea5ba01dc0..15f7e666b3 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c1515754924b618914fcb3cb98873af49996b920f2389a1998f89604f227a807  suricata-6.0.20.tar.gz
+sha256  81cee7bae69848a9751b2ce0867620eefa52b192e79c20b5eac897600b28b191  suricata-8.0.4.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index 8840853054..0ee3752a21 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.20
+SURICATA_VERSION = 8.0.4
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
@@ -24,7 +24,7 @@ SURICATA_DEPENDENCIES = \
 	libpcap \
 	libyaml \
 	$(if $(BR2_PACKAGE_LZ4),lz4) \
-	pcre \
+	pcre2 \
 	$(if $(BR2_PACKAGE_XZ),xz)
 
 SURICATA_CONF_ENV = \
@@ -32,6 +32,9 @@ SURICATA_CONF_ENV = \
 	CARGO_HOME=$(BR_CARGO_HOME) \
 	RUST_TARGET=$(RUSTC_TARGET_NAME)
 
+SURICATA_MAKE_ENV = \
+	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(TARGET_CROSS)gcc
+
 SURICATA_CONF_OPTS = \
 	--disable-gccprotect \
 	--disable-pie \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
