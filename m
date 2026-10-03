Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF2ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345D840FA7;
	Sat,  3 Oct 2026 10:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvoFF6SQt365; Sat,  3 Oct 2026 10:13:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4946340FB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022387;
	b=kuttGbunI7MOkceGYDGBCyBLpay0p3/JWUxf7SQkYYeZXGSEanDCXAmpSFTvp1zg+L8b
	 qQ1gnAsf8QiPv/2BoPx4anR7jDYi7WqSQvKsgJzRn0tCoFADLyc+Var9O7LmpSZ3eeqqi
	 TGZ6PQBS45Fy7dzoSf4/gpi3GPuC/pDBdcDdcM2x6fqyjS0IqWVENPPEJQJKdO2C0gLLK
	 GASyScmCWFXFsPGHh/SllUACm7yBnYUgxJUH77wjTAOpwp62ehU63U0ZkzDJ0fH/ilGi3
	 JvpJ4EZHIAg+8uW0xXAEvvyeir83/rWfN3jd46lxrRHQBzYrR6x+FDuWw9trQSAnhhA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022387;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w03mSYWYAw3xsIrEQyyAM4pFUbXygQlK+b3Lje/G2mc=;
	b=DCFlpVhYlMDidOpV88L0BwUHfqeE0NFiaSRYJfIN2tFDdSCtnufoTPxQL6YHUSWsU6Hn
	 vN19+rHf3DlexMPJXQHtnHEMgl1D8dFam8Fg7w54zuXsxe+C0b8Nvm/Aje44lyg5gdx87
	 aWAuuPZQCQ/bUPmwZVFuLx21URZ8w5m8hdqlhd7d1GnnGffgJC3iqHeHQT9CpNLrnb3Bm
	 pRCE7I8iNII/4nureIlxWODEM7u2wUTxVVrHljZIwdbs9PX/16qySgxS2tClqkCOHZ5TE
	 rdPblp3SLYWi4x2yS2fu685ji4PbyV3aDlbgQNgBCq5YjRcYQfBbewfLddgEv+1fsVw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022387;
	bh=w03mSYWYAw3xsIrEQyyAM4pFUbXygQlK+b3Lje/G2mc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JVSYnGFgJ/sNIj5oBJywf7FUWSTIQFgY4+7Bya2CQj11COa0fD1fZb+UdO8XzJFvi
	 d9ywyyTMJN03S731o5/f92EW1PVH+JKnH/9LtrSMJU/FMbYh8Ne4jaSb4Yfec9dCKH
	 3YcNTkPo28fZmdC8Pyi0YeYvLCTMRfpKDS3XioFAtJsjxqkAk/xFFlYvheZ721jt/e
	 s1LSmSTZnpWuhVIhAt0eiP+xACIQJlmM1qDxz4BbbQNiLTx2S9MSVRf8Udh3kygopm
	 fhrKjAEeGtI3yF4nXuyQJ66qwxcGXLt9qzmrSr4cknfDTPRwlB58lOf6DZP9VgLsT8
	 n57J7M5NOMrTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4946340FB8;
	Sat,  3 Oct 2026 10:13:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 995AC9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6366B400F9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ciETjrF-nQS for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3B6274007C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022383;
 b=jhI0O5dE8/Sct9wbqwbAE/M/y9aB/45VF+ZICAIPQLDZa464eKwL5jTv8/DnXKufgt7a
 V+9CvsECkYNJsyF0G1j8712lWteE2jucyjNWgYA/r9b0+GmpJ3Wc571BS6wf4Hp6kA4e2
 Rh6RzQ5z1emDmcCfytKcdnD7vfJxepB76gk6z2QF3aQ4K5qNYYogwocz8zZSGF+zj5YkB
 fIEpC/+8dnHHiTGrXhJWZs7fBXPw/lNsj5OY4TBeRIKLIr1zWoyQkzb/jkT6QFE6Hpdif
 yJKJHW9UtXnnt5K2//5b/8fpof8Xqja2AuOOAecha9ueYWxsBLRu+7dn1aixNM+a8Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022383;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zwqv+17U6FRfysV9wRcK0Wq8anExOejzkjeTtOxh6i0=;
 b=hV5li7BDBFSdGVucRYJVJupAVhT3xOqRVI90ZhJH39k6ai56dKBlOwQsioqFrVjt4TeZ
 ZNeYdNQxwdQMLdKHvI5Hl5+9FHe4KikqbMjPzO6xgatbrrYsDlFzUKA08M3l6ws9Cqzir
 UpIdpYC9yDRomEWP+ZGeV8eKPoKG0O3S9e0LLRPmFnfuga0Lyuu6jvk/+bhw8ic1VXfCr
 qLWRV1ckPP6WT5TU6mIaaRLbxtr3ppaWBa4+/ivRu5RFvqgOuFnzVt2J1Tr6fpRspRhJT
 i7Hvop+daTHAnVhS9ZtgoDP21QxwJaAVTTxFlRCboCZId74fEbMfVWTDB5+8HtQs35w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B6274007C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8997788EF9; Sat,  3 Oct 2026 10:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:11:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46cc356b6ad90627b1d47747a5450aa0922cd577
X-Git-Newrev: 55dbc49ec0132143e8aca89ea1e46586af3438cf
X-Patchwork-Hint: ignore
Message-Id: <20261003101148.8997788EF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-extensions: bump to
 version 4.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/55dbc49ec0132143e8aca89ea1e46586af3438cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-typing-extensions/python-typing-extensions.hash | 4 ++--
 package/python-typing-extensions/python-typing-extensions.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-extensions/python-typing-extensions.hash b/package/python-typing-extensions/python-typing-extensions.hash
index c86b6716a8..61c3c92e63 100644
--- a/package/python-typing-extensions/python-typing-extensions.hash
+++ b/package/python-typing-extensions/python-typing-extensions.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-extensions/json
-md5  079e529d0b271647f3ec2720aee8fc65  typing_extensions-4.15.0.tar.gz
-sha256  0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466  typing_extensions-4.15.0.tar.gz
+md5  7758284b826ec6ca6b722e7891bbd10d  typing_extensions-4.16.0.tar.gz
+sha256  dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5  typing_extensions-4.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-typing-extensions/python-typing-extensions.mk b/package/python-typing-extensions/python-typing-extensions.mk
index d181b973a5..d1c0c4f694 100644
--- a/package/python-typing-extensions/python-typing-extensions.mk
+++ b/package/python-typing-extensions/python-typing-extensions.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_EXTENSIONS_VERSION = 4.15.0
+PYTHON_TYPING_EXTENSIONS_VERSION = 4.16.0
 PYTHON_TYPING_EXTENSIONS_SOURCE = typing_extensions-$(PYTHON_TYPING_EXTENSIONS_VERSION).tar.gz
-PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f
+PYTHON_TYPING_EXTENSIONS_SITE = https://files.pythonhosted.org/packages/f6/cc/6253133b5bb138fc3306cebfbda2c520f545d36b5be2c7255cc528bb45d6
 PYTHON_TYPING_EXTENSIONS_SETUP_TYPE = flit
 PYTHON_TYPING_EXTENSIONS_LICENSE = Python-2.0
 PYTHON_TYPING_EXTENSIONS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
