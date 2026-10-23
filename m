Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45516606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EUUlo4FW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E20460652;
	Fri, 23 Oct 2026 20:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzSRbajPe6FP; Fri, 23 Oct 2026 20:27:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 31EDD60A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787244;
	b=R4CybAdbSqs6bw21YpRjLwhx6mTV/a3aFCm8+1+dMYIP2mWxOH1gjk6NtHuf8X7xHTJ7
	 eGUWXh3KHkcanK/ufjwXQStEi78c//DK0mn4kIf1o/YThG5QS1UWdc7LnJ39ozZQOPbIN
	 26CTZ+/ZCcYrIjS4rDh5EL+qQ1iJ+o+tHi84jOyDhm2hGePKUrfUViYqdqE7rE1wiztgD
	 LVTlWelSzLMtTNALmxXAo1pTRWDoKrrL+jqfiaXdzxoSyDEazMttSH7SetzxjowTe7GbS
	 JdRPPyx5UdBTFqmRilosF/7r+Zmgw16k0Mlb4k68EXRsua+zwFDfV85XcRHm2AfCyEg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787244;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BKhPcdJ6qHOMY0z92+i+7muGXMGmVfEicE3gKgnwdfI=;
	b=fpS0Rq0KL26FZlQCAc4B9a2Jm9/veXk2fe7tuAUN2QgXUF0viPlng1RUErwTZs2m7Gxb
	 034PdSBU38hVm3NneIt9zbCKnVLC34fjwCvFBJKG0p2TWF8W+m+JhC4SOeXPJ89FQnvY0
	 BgrRLe7A9LGMn+tTKxY5FfGw2s55PIuDxKWa1OtI/ph2TZMes2el9b6fIQ/VNehg1Jnmq
	 VqNzR9aRSxd4J49gg4U5Zy5UMYsBLAXMDeFqngoESaZSeGXJxAuRaPSizwV8xpmo7gZbU
	 altaxtq1LV53XgulfAM+tPzU43hGIb0hCe6c8MJ6prXL9kdct9s1OzorqELQ4NFq7rA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787244;
	bh=BKhPcdJ6qHOMY0z92+i+7muGXMGmVfEicE3gKgnwdfI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EUUlo4FW/CTyJr3Vj+dONmFLGS05vJMNR4yW6YK6BZQoU3qItvUU4g9fk14Oy8pVz
	 rpLMKl0XfwkWFTlYgGFwdABZbYh/2sBOf4+aHB8A2r2uOySphLuDM3Z1nftU87o36d
	 fnWcORKBHVgdWNONVrOc1BMvLmXk2gn2VNLj8O+vS3IEhDV4AzyP8lAYHIua/jsRn5
	 4mum8eWRUdYz7d4WQCcBfzjdr/Qr3rbcUnHTzqpVubvFKr8y+jSJcq5o+fTal/bcrU
	 jwdJW2v9A5YXV8nQPb1EaxGpmERL89DhMos7XHJ2yHA6DQXWa66oh2sAAB0bCG/m6i
	 9utzc8A8vmzOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31EDD60A59;
	Fri, 23 Oct 2026 20:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31C2F356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2330140479
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vYN7IPXRl0C for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 676D940474
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787242;
 b=SfFVGjJQBOx0rtbXPcjbF7HOaULVhkeIRXIo0PcdGvhHOUsoZR88V15ci+f7l+1Vfp1e
 Qruu1Kvu/oDo1Xl/f4gsNxzOheHcFm6sjYl1j5IB3cecNXuNs4NhJfhxS/PV36KTioOCU
 luAJBF1BjuzEv5ihwEqi5fTskvkR4+ljO37L+qMvNjC7mq7/0NXk20JqBpt/xYeQjnGXL
 VAv4OOODcbxng8JSzsvJuJgMo8SpKTcc7Mi9doYD+u6bWdhoJWwL73IQltdastEPE6zON
 LG1I9TMQeqMJixRHOj9Qe8VwGpdiWIRhzfFFLI4eZDLqsb6a4Q9k63zOyXbTOH5HBHA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787242;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Rs4Hs1FaWjhUH+jmeuNWigDmTjDgPCECbeQEGf2i4LE=;
 b=cDXiXaFu7oL5l/N07AVBuaCuHoyI/oLCsTuMYgI81Rj+zc5pGVId/Lr6bLtYC9y1soqX
 izVBtptM4gK5RM34a4kED6E8NtH4SnSvVtBVKwSo0VvdwpuoFon9VQTebmvIoEbbjnXPH
 48ClpKMhaNPWSRlja63GvxK7SdawpAFfGfH/Ku8ncOO9If7zLA7+ZZBjySkigW7L8S2cC
 NCasKoBfqUkS1yElvJM8CDU8iQQMb0Tx91AGDDe3GF1vy86Ci3GEy7kXUtGFGYjupjVW4
 LOYzBhx/pXy/PTNob6qW1S4QwTN1tOLOk+8VU7h8b3cHTUDZwH6Ygsla+qCTaGRaSPA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676D940474
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B780F9C674; Fri, 23 Oct 2026 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:53:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe6dab82913805738d32894a5efd134d4ae13db6
X-Git-Newrev: 5aa2345da4f70588a22c1b8aef676abfa12b9968
X-Patchwork-Hint: ignore
Message-Id: <20261023202557.B780F9C674@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 26.10.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5aa2345da4f70588a22c1b8aef676abfa12b9968
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 724045a52e..50cac991bf 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  2958a002f07a91d6ac8c0ce3ac50764e  autobahn-26.10.1.tar.gz
-sha256  0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a  autobahn-26.10.1.tar.gz
+md5  cca33159d2dca5f56c7210a3f7a98200  autobahn-26.10.2.tar.gz
+sha256  6c69fca89106567060941c5568e67a5369738813d883db4e3d62b76f0a2c497e  autobahn-26.10.2.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 97ec7b1b0e..4ef83e33bd 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.10.1
+PYTHON_AUTOBAHN_VERSION = 26.10.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/df/e0/f0a9218a299f0d79feaaf62042812629bb7fa0c1fd6d044a6068ee7f5c79
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/e5/84/8ea0607facb3c97a3beae3c767213fc716f9ab2f157570dc5aeba1174730
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
