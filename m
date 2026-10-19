Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B9606A31A
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KNI/uEk4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5640480D66;
	Mon, 19 Oct 2026 16:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aV39YiHt5qJx; Mon, 19 Oct 2026 16:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6AB9280D48
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429151;
	b=PawW6xpYsbCF3pcgA85QraJ1qRu5mCX6lajjC/xQQcvuxf5y+OJVtvfhveW3yTH0m2sx
	 pN44gQrQPsx/WRNzbGA5RBJz//Y+6kzqtx/owp3o7fwtzOHKywcxARxXye0nTu6ac6rRO
	 9HDJIsEGwOTjp5VDgRr3x1/C6s6UAlSaC5PGkIYPl1cNG2aM3T+JVdrtaVyGJ8Yd+sMLd
	 Ifg6yFQOpjlyVmih7+V2jEmixSSzkKWvNxcvx8b1Cq4A+X3wPL/jBNEHuIZaQ0QgxLQIe
	 NSMH5U7wfBrYGoBilpB/ql/0hceWuLU6E3VAorPIBP0hBqb0TBOtcZo+vnCXrHxa9Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=t4Wtbsypm0nMQVCl+rlSN8sW42edj5jjHWSWbBCz88c=;
	b=dI3+BpfIxtnKrAa/bnL9K/NJy1Szb+ULxh8NMToP/g1sw3bbwJH0cI/esB44U6oKhEhR
	 tfmZ17oO2e3IXTVg5aQNgtP2Nq31tIdOZ2/uia5dptBgLX6I4srLLVNkxEL+MQBWVuVt6
	 s5zb0XSThctO96VOFR8yFWLFLaPRei/wsjrviP7plZFkGGYNGGr9qD2pB5aO963URLHxx
	 RzZ4vDJZbO//TeXN3B0abH8fgwUgcnIT08ZclNXFuZOsRNoRky/nn4GhsZDysnUuJmmfv
	 3ZqIEwBWdaYajM/c1hmu3HCNUWZJQewPFXQ+PhJBWHgvX439twGzQiVv4MAUURO3L/A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429151;
	bh=t4Wtbsypm0nMQVCl+rlSN8sW42edj5jjHWSWbBCz88c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KNI/uEk4HDLD4UYu8QGQhauUkVRpeMA02jgfiDQu/bC/DnjMZpVQ5eth1vkKXt1Jo
	 KTAaf2QL4Y4S7WQsBrM2ITY55YaEeH0a42sFAVHSXroptvw+Wtw7aqzdkDMvrnLhNc
	 AG52wO8NZ0BqigQLAsSqCDVS6DOuvxSrZnw7zhhJEnAblrwNbGsuqZI/cjTOQJf6yG
	 W71KSkVlayIBG6Btpk/eOwyNMQA5nB1CBlCMw7Az7XNFkkjve+IVCZXIV1FYjyvF8v
	 k9ua0Ns3sRdwf+JeTeNpFNShKRuM+zQ5oB4qOnj+93bakWnjrS9Zt4zqBm1veGMyCf
	 Uaq/oAz+PLzjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AB9280D48;
	Mon, 19 Oct 2026 16:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A96D23A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C6254017C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mIcQKTRglZoD for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:59:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5B52540179
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429149;
 b=O0aIfbNkdtAi1OxYebXRFNqiy1sKZFgtAbq8XhbPzvOZWLMEpn5+u2q4x3oGMG/ZYJi/
 RIXfqGPy9Yoly9YtE+u6x/Y6WsZxF0h3OUn/Bh9crJZq3z33ZqGFjneecSd/20zeiGZR0
 2EkE2mLXeuHw1U5jIfwVGb0ikVHIsw6AUqAAHSEGwVMEBwpYBJrpHf5km/Ib8ZH2RK3Ll
 Wo2aiksPQI/FKMbKeEQvslZgT6qrCguf4wBr5x5hlpz/1ZrZ0PG6cYEsl6RBZka0Ohwbe
 Bcnok7Y1eojwQ2XZcKpiTBO16dS2Qi3JJ1v6lb8FXzCafgEMx2Bk0aMw1w0BPUoapaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429149;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ppr/ToD9RDExaUxF4VMewjk32uuqcMtyz5wVEvrvRDE=;
 b=r4pQPuLTa36yY6erBC2cRyivdY0KQ7qjwCHr24qyuQd00NEVJF9mS6RgOdoj2G+nUuZJ
 itTXFxo1jChkBGO/o18V8SinjOehVWLpNv7BH9pU2X/qyFFip+i3eHlr3LrdglfCEp8H7
 pUDNPmppHrvr9VWTOQ0QjkylzXP2F4o/9dAl4LTj7Az4HEE9idemLWNuabaCWkBCbdqxE
 bJY2JW0l/U9WLrDvXmt3eg2NbjiYHs2+FrJZi8oiw2+qCgKpBAGqAhO230057nBTzP07w
 Y5yE5C+RUg1r1aBONMUE2GVP47UFf7+Jenn2InM8cR44CrBbfSHWwGqBU0+yG/UBVCA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B52540179
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:59:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADBD89875A; Mon, 19 Oct 2026 16:57:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 18:58:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34dc16e77e362bc8b05a92ea97432ef89ca51ece
X-Git-Newrev: b53c724eb25c32ba73e68e61219fc53f601b18f4
X-Patchwork-Hint: ignore
Message-Id: <20261019165746.ADBD89875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: use host entropy for
 ARMv7 emulation
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4374390527741117401=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4374390527741117401==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b53c724eb25c32ba73e68e61219fc53f601b18f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============4374390527741117401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4374390527741117401==--
