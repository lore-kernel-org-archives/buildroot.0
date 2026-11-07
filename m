Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC16606A32F
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YxRvYUXv
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CE1740785;
	Sat,  7 Nov 2026 10:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KHQHQLuuqueD; Sat,  7 Nov 2026 10:30:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B43764078D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794047402;
	b=rWBZYDS0aYV+PrFoSQKHhuN8FfR4Oe7L5cOPYnPgKOq8xLAFVstkyaKubGab608cYDCI
	 Jn/UtisFco/Tb7Il0KCfrTa87qFYxfzPx2zTUNLpaUKZa7FJcUfsvFs/y1Asn/dWXcX84
	 W/1nnNhnfuso5nxndztekmwKPeH6807OUwez5obKMbbZyDAQ9SQYBSssxRZvjN1m3Jbde
	 a/QEcEm6JOD8LPqY85JtFKG8s1kPO9QcpeE2opjWsmw0HOfDKhmrGGe4pP+ktU2fploN+
	 bVZ846BtPN2/J7n0AJQVdN9txjFNF69dqvxXZr5xGU4Qw9HGlyQN/H/2pjKP46VC32w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794047402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HpHfDgUwrchj8BwHBnbpKd21wYSWuxByO9/G7opQ+N4=;
	b=HuMk2z62uFJ8/Tazgn+0FpQEnUHf8kLcDP6APljwG1Zq0PBxzCcCk6zfoS24gDPn8BMo
	 wj/xpgJL+ZgfVMgoKZKwOku4FTs8VGuytIU3ANtERufqB6I/vFbBozZV1fRSEmvp1M8MT
	 YZu/rMDkZAsLJnmVoolJ9h8fpI1JmsFNsXdyyMHuzhGntc2iQicEqb71Q5d+6c+c8NhcQ
	 1bM5XinN4Ic/CA3Wll+nvIksej30BAzdqqBuRr5aSB6ltxj36noaUoHZFuJhR/KIRl7pT
	 Q32Mxiqz+H75C8QxKzMneSbb/1w9FOy8KD7xVm4ElZcLEEy9BwAhLYxtUsr5MSyAqsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794047402;
	bh=HpHfDgUwrchj8BwHBnbpKd21wYSWuxByO9/G7opQ+N4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YxRvYUXvxNXeWEx5wZbEqu/1kutOvRDQNQ+DlmZ94VgQ1+hk7vkJmPj3DiOkxYWfg
	 zt9TprT09Er10vVUjITueh07nCKp1hJRdv7LbHxFRhCWCxLVhn08yEUh8SLR/WZEAr
	 SSR1Vi3XbFWBLifX+4ZEJegXKRAQ3oLXptG/o8KuUigCpDngR+ECOjGGrHTqoH+Wph
	 R6VhEhlxwRf3m0F9gnRdsynbA8UdLo3dZxxeo2olqyjZcJLjrNwBIDNW9Zg6cPmU6H
	 RsjP91NA9d9PubvlyP+o7xfXTXI/odiNvQ0Cw1jd/TzKXqsiFWhD34pZHsMbeUYxEc
	 KBPEh2gY/D3+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43764078D;
	Sat,  7 Nov 2026 10:30:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71D4C32A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63B0F400BB
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhfkSNhZYPgV for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 69E1D4008C
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69E1D4008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F1F8398C; Sat,  7 Nov 2026 10:28:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Nov 2026 11:14:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d53d927df5036416d5f6d0dafe18646093efde02
X-Git-Newrev: 848f077b5c38ced42fd5925bc30169ec6468a9be
X-Patchwork-Hint: ignore
Message-Id: <20261107102827.36F1F8398C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: bump to version
 1.16.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/848f077b5c38ced42fd5925bc30169ec6468a9be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 45e8492bf0..678456ca4a 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  df0b5d46b6a70ec13b5610de795e055c34b8cc898640c918b14e22fdbc92c9d0  python-maturin-1.15.0-cargo6.tar.gz
+sha256  ad246fc2309b2c0a5479872929db5ff001fcc6670b78eb2d5ee376deb345513f  python-maturin-1.16.0-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 5cab6697bf..062d734cde 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.15.0
+PYTHON_MATURIN_VERSION = 1.16.0
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/b9/c8/22e5e21b2679c9bce6415ca578034ca2cc9316be0642ae21e051a2d5198c
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/bd/71/eb078174335ff30bde1be2ad54fb6256db4b160eb3efa81163fa30f8c814
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
