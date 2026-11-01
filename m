Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1902606A329
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZE3Xd5OC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8B6380CF1;
	Sun,  1 Nov 2026 17:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q78rM-fy4soE; Sun,  1 Nov 2026 17:07:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F27FA80D5E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552859;
	b=Uh6SCcm9iIXFq6FUdTlcvAhJT4iM0HMx4zcMHA7kyGcd6/Xx839Rn2X5nrojc8k3D0mE
	 YCJmkW83E12Us54eoLqwoFDg9Qk0L6f2DSpMBQwdh+6sf23wIomcuk0DKZEQs+GoJ8Ufa
	 kbb+QL9gXy2HuUqBVLgHcgPQnWYSO5zg4dbiDOh9po4Q5RC1y1WfyDI1uWNJ0/I6xTnlE
	 ZvriCxwdbJu/nXaWJAMTRNEXOh/iYZ7JdvXg7TaA+Zck1SKswEN/jcndCvJma9owwVCfs
	 yBFD/UfY3IzTdwsBQC1HzMmmew395v+qB9QUNGHOPYdcSLyUyK73MHcDMxjL2Lfrljw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552859;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XjzVVd/6Dk2xKSNuckD7v6eWnhPnp4Ox/TILrAy35hY=;
	b=I1+aeiC+jbh6jTyfY96mWseSAqDGgp892aovx5dpgOJnMCEK4hgXk6K7oS1P0J3Z4xXZ
	 xZ0RFjRHX0FoeNRVhLXGY4zwauhKzQaTjNQlSRtc7qeHxZ32H4GIbnzjL3y6dKOHzg4yh
	 cx+hR7UKLuRPhjCRbwbqMB3KGBuzTNral5hYT6y2ZgHSA08abOkYd1Vo2CwgJLd9Rq97K
	 2O+ULd6DWmezV8xN24p40DBDMipL16XDN6aKhtdqCsMEKA4Tddd5Mt/rqY4eRKAFG0tbf
	 TByqgMj5bOsYm/gG7YHkcW4V3WQFRemrEEm7Xhpe7d/AQiMIOm42W+VcB5Fwo4vd3UA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552859;
	bh=XjzVVd/6Dk2xKSNuckD7v6eWnhPnp4Ox/TILrAy35hY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZE3Xd5OClLhcAiyN90AZG6rabobQ33STp8BIT/B/1vOovUuHc5j0FIkZShFiCKnKz
	 /FwBm6LhiEIC1SGYykAUYzurB8Izjx2Lc3UCaHLXxPYplW9vYouYr8jFZtxDAF1c59
	 xxSDtktTB6YxuZBpxajgfYuCkxskFjCjgWN8zIL3LXJs37oxVUONrFUb8kdWpB3VAF
	 x2KmkmgvI0cOS6s4xyOUNob8bkNZX7ZHVvNTrbZqVnDZu0jtyyfFNSaFUXhBbheqh8
	 rptvnjc8IwkJ+C2hT6i/t2Fy1afeOzMZgkhGwJbC/yPbApAl7qoIyuZ852DL4aUlHF
	 2vzuNJYgpNj3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F27FA80D5E;
	Sun,  1 Nov 2026 17:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE80380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE38D80C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fnig-vAz7zEV for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D273F80D43
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552837;
 b=K8V7GWRgf0V3FvhXLcbfTCKmnXJo40d9eHvplAAttHg1hY2kK8Q3obzMxXeAKKP5xsQX
 L+pRmjJDO5rMJ6fd1ECaP+Ssfl8YVtts8Y6HE83VTfMHANJySP30GHZ5QoaK9ginHil/f
 2Az1sCLwwG+KbKKz602MxuFPq29Cd2Q+phw47Zcoee/Y/GcRRGOhf69hzjl+Qthu6jfEi
 5uoDsie1jlKUEc43TqI9MplDKNO5dlQPjMQRAamSSaYC+tMdz/kJ3JbMAThr5rdImlXrj
 JEUypoYsp7qbPswXyENLd/tMXPdxzZBtyzs8pYVPVPByVxLYQBwEzN+ni/+CYp3bikQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552837;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wvrVMG6TLoKCkCbG7P1ycPbHUTxzF5i7DIvs9WeR04I=;
 b=UrsziZ71Stp7zwVs8AsugJK5q/XIpk8BnCuI47M5dcNn9rt2tri3Z93RmBMFmnvpDHMt
 YjO+hfwSbyMa5rZ20Y2Jfv9u5JII2gOcqP7TKjoyNwES+APZmXfQr6EGU+HAq1Q616qK4
 xoAhe6NdBeK3gWnyxqdRLfzxSqqIf0xBEJvboyR3fAZg3zmuLSFmJoTN2j6a2pe/XN7YC
 ggsabv5n918Gj+moitnvjXJJIrAKrROQ4T6WxmVrGfafRzrgG479Cp7+2BzZ86x7tMByp
 WK4/rdcDLumVGGstUeJFL5q2tOCJj9GQhL/HPboFOnpnOPcr2/pBkpH5IrjJ78jWfvg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D273F80D43
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FC769D4FC; Sun,  1 Nov 2026 17:05:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c3a69d1e09b6b7035ea5d529288cb01e61d4fd4
X-Git-Newrev: c9743540ed950b9ebf172d611f27d3fb4288650f
X-Patchwork-Hint: ignore
Message-Id: <20261101170548.9FC769D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-msgpack: bump to version
 1.2.4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c9743540ed950b9ebf172d611f27d3fb4288650f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 1669af796d..90b0c28a90 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  80009973366d78b6dff0e03ca0a6dfc2  msgpack-1.2.3.tar.gz
-sha256  32edb81a2b5eb7cd7c9d941b2bfbbb082fd2cd09e0e725930316af6b708db186  msgpack-1.2.3.tar.gz
+md5  210cba728d84b9681f277a8ede152c7f  msgpack-1.2.4.tar.gz
+sha256  475c44e12f2a5de766a8448783f149c9b33f3f49b88953c6cd739a77d93c732c  msgpack-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 92e7cf3b17..1ca2448949 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.2.3
+PYTHON_MSGPACK_VERSION = 1.2.4
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/0a/e7/bb605a7bab2d8425a64b3fa762b39dc1bf1c7e3f11ba6fb5413d6db0ff8c
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/cc/52/1ec7ead2c7528bf3d1db73e886fa4df10f9e6f0eb7854a448b7090cfcef7
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
