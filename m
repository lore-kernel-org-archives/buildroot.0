Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46149606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aDR6daTJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DED060B53;
	Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAFU-roxeZ_c; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2DDE760AFF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369890;
	b=mK8r5KlFNN2sCs+paiCK956wl76unUhDASuCDnnyTNhepshbq9lwbA5QqTWL5u7jzh1i
	 j8csU30saESkVGeS4rOB9oEBqiJrVxeFe08WIzXPff2luPv2vh0iECfv6o5eEjJR9XKac
	 JpC9Aj70/3kISuW0ITuTzRlIq5drykUalhYMKIEDT9RmQ8CSWnGkERwddc8cr+mX+sAXc
	 WVqWIzU9KBkHjv0Tqdpkga2jY9XavnERFM1zOu90yrysOpjMF0/nx2OFNcAPpKUz5a6C7
	 6xCL4p5sMiuVhZDc7sbnBkDrO/UmmJbDL+24KV91W5UjxnTlYoXn8LP+hmZUcTyjNVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369890;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rgdNH1c4E1tb568w3HfO1VaUeLpo2dz87Lwf6eteRWI=;
	b=ByGSEawkmtRSRQ7rqu7EuuHeIU8vsTweI9VeJMh5LxNXu3MMEi5pdgd/X0kZT57ZKGTS
	 ffGF8J1zX7tLyp5DQ6S09kw+ctAbnqx36E3g2LhrctsMR3PKi0kBRqmEi57/8s4c2syAo
	 bcDjCQxBGxZxv6f8z36xK6H2qY5jSdMcjIgCtSgz5EWqJQmtf4WLL5n8EJV6owHrYZWji
	 O9UhrGBVAoWG6nkSvOHPbXm6H2xf0bHBJAFAQ+sn2IMwQDmxlZ7RpvhP0+XCled3/D+Y1
	 rM4bxQOFD5EuCNEhz6cThPAS1KZWULDXRuMwt740TRBFBK5A4xevAKf782CRUQijOag==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369890;
	bh=rgdNH1c4E1tb568w3HfO1VaUeLpo2dz87Lwf6eteRWI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aDR6daTJzjuPDXokZp2hVRusdqkVqNTXWBhCsS9/ILkgSVHKPtOjapPO+fVocsipg
	 JhwoiOk9T5189eQIHikKW8mICVaNwqXstO3MYDPz3HnItPiyVjpmGAcN1Zk+0VeT3h
	 FFqeVBqSld+IDYswWY9OHefBwybq5D1sRAyghPFO4iKHHvRXCcchOO2Wb6qObKDcco
	 vR/c2w+W6ovoYL+TbkjbUVVH9/HNDhf5N6/zMqeIHQZ9wchSWAHebOpPTKtRndO0uM
	 wRpt3uA2K+F1TNB7atuijvjxg9jv2S10VwnVgpijtypyetJOhkELdFNW3EKmBvqCJU
	 gy/5RQIKJNfCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DDE760AFF;
	Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA99362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5469C812C8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCOlE-VZ66bP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A6FA1812B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369883;
 b=M9CSIwvohcrnaxqyUkRK3CqqERedqkzsqHHXhb/NLkjXkAeadzVG4uSnEMrckYF0Dci1
 5K9gJoEOS0hKrGoQrFjPvT/hCqSPDSKQjrTXr+hVGvloP23u7a3i06TlsXeGkPVPVwKjb
 YZfUCLDYS5MP1uou9oqB/Iq0UVm49dqsRFxi4mZPRb81g65NjFbOtnn/G6qG0kNvw28dV
 liLJMDYS5zu2QQLlHuHQXESUOFcmE8x9ARHMYY9JqF2leOngPh0Ckf8n0lZwbklYSsnOK
 oFo2/w0uVm2/uM1k0V1rTGOQ0L/hoZETa3c4FbopdCVaL2mfHqi3DnbDE+3Pck5cWbw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369883;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=YAni+OJr7rZJjnRvfZ0MidM4GTZ5vvNGx4gFfz9HspU=;
 b=G6V+l4uGrzZLikr2k08gu7/7/QpK8s4B3WxbqunutsY124m8b475UfBfIVYRmVmNb2Jl
 V8EzGh/YVyPNGHAEFo0tlx2+pDINbxydDlFyil+Vz2xP4/NKEFe+mkMqF1HlFIcGaDXdF
 NrLPi23LgGugAdCFnhIFAmT5C+gEAOxS+GnhAD7TVzD6HygFxBr7Wx1lJUy0kei3g29ID
 sfbd81bo021qLLF2lSTPb9E13nDtiu/iTqxhri89zoe/wUElEzPbezwOq3AJRgAxZzLPV
 KHnL7kVnAjWqTu3z25zJz2BAaBaFRlCRdEwg68tV/vAE0Sp8vHjAcsaIDo0rf+3tXBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6FA1812B1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3FFE9D388; Fri, 30 Oct 2026 14:16:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:03 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 32bc11c9bcb2c2c5474b678f35b584bf56e79908
X-Git-Newrev: cbdf080d4c2316cff4985f00a75729ca8d4de9e5
X-Patchwork-Hint: ignore
Message-Id: <20261030141635.A3FFE9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/testing: use host
 entropy for ARMv7 emulation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8061825628554969659=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8061825628554969659==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cbdf080d4c2316cff4985f00a75729ca8d4de9e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

When running tests depending on entropy pool being ready on armv7 (eg:
test_openscap.py, which runs the 'oscap' binary, which tries to get
random bytes, even with simple commands), the test may fail on timeout
due to the entropy pool not being ready; this is confirmed by the test
being blocked until "crng init done" line appears in the kernel logs.

A solution could be to just increase the test timeout to a value large
enough to make sure that the entropy pool will be ready in most cases,
but it may be hard to find a value that fits all use cases, and all
tests depending on entropy being ready would deserve the same fix.

Another solution is to replicate what commit 7acb32dabb80
("support/testing: add builtin armv5 kernel 4.19 with entropy") did: it
added the virtio-rng-pci argument to allow the guest machine to use host
entropy. The armv7 kernel used for testing seems to be built with the
relevant virtio configuration to allow a similar pass-through, so pass
virtio-rng-device to armv7 kernel when running tests.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b53c724eb25c32ba73e68e61219fc53f601b18f4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 support/testing/infra/emulator.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 3702ee2d48..d690949120 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -98,6 +98,7 @@ class Emulator(object):
                                          "vexpress-v2p-ca9-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
+                    qemu_cmd += ["-device", "virtio-rng-device"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
                                             "kernel-versatile-5.10.202")

--===============8061825628554969659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8061825628554969659==--
