Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C83606A319
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pMwE83lh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 271FC605D9;
	Mon, 19 Oct 2026 17:32:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5K3NsQcDNR1; Mon, 19 Oct 2026 17:32:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E9F1860773
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431162;
	b=H1rxo7BJGKt+WnNZj9XkdnX9LqLm5uk8sAye1VNzI/Rxbg+E2KnW5pdPH8slPl5Msdxa
	 p0WOBjSIudZWWd7keudCDErnskm8F7EfCKAmO6EDJ/ArjwhVCeFLwn8HcD/hAeGExRtFx
	 Ro1fOOHZRLjjjx+1Tq67DNQ24Mudy7SdQI48FtUFInSxDCPU93VhwgtqXXE4yF7KJNpUx
	 B8fEtIDIiNuUebSoH9ZJKBe+FKA+OASzt27vkvkphK5RpXE7wAXQzAcJ7O6ToEWP+3l1m
	 5h8mM2+sOacjlh2qs1xoLh0OPGR5C+KZGGhLvwPj36e++3LIOBgthbaQWWg/2r99YbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431162;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XdrjNp5+6/QXs988Q3qlylSmDHx/turjiNCggTk27QU=;
	b=gMbpo7N86tAm/zLsr4y382504zR2kNfsVydMuXXW7I5Ww4fot44j8RKz9Nx/fHW0Zapx
	 Ifgm3g/689/5nFRH/JNmLl2dFEGQpwzNG09lTp3niYNxigBSGIxgnJl9VqvhBOpzr/MbH
	 CA6UuLJJL3Lc0/5Oi9CFAXusPjLSGtgiWe0ctKsQHhykZFKuCjlTr49M82+Os+M6FImxq
	 vCPUoiWPyEOpjxGN+TgKWQGCnZ/izDsQxXC3wSq8rBnZwYP7zsBj4o9DjEoAErZT9mlQN
	 +D9J0hBB9PmfKwa/MkrnREKsaDdSWTHe7aSvOBEVMqvHaRyewSgBwDttHVurLHJsllA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431162;
	bh=XdrjNp5+6/QXs988Q3qlylSmDHx/turjiNCggTk27QU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pMwE83lhLUENRcef48DCpw9cTPxYzwDuacXAh+4+Qv9nFEJ9ufQRLfBGKYOHdNcX4
	 JP3qMShrwzBj6HT+FyJjvHuy8BHBHVFPSYB/cdxokHpmfL2v0q/IXWXz8wAByqzxi0
	 k7d6EiszyMQ1gSAR6/IN7Dxhfaau/EfpB7WUdQ7fJ2729mLfs1ZJ1J951vErDpiynu
	 cUFJJ/ayVb80J/42b3ct7zdN7LhYEBKVHK+573/BNb9uv2SCPj1nmBuCn112+6WBXu
	 eCtEYhAJKh9t0cv5aan45BE5tH9v9zXwNfN3uXrDQqKx5nXyjxMWsWL45z03nU8A8j
	 6rTZGd+395+qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9F1860773;
	Mon, 19 Oct 2026 17:32:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAF91AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A58780E34
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFQ1y7mcujMt for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B632F80E81
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=YaBDqJ6NE/6rcoOT6Px01nx/MipitwP9qPRAc3hqon2bP4wgQdk5Q7n8JK5vrgU6fnDg
 b2QmURdYGynpHaRsWEyeCSKZN5f1AbxQnoYU6VXGtYbnhzWzHQkyWmVcPiURwezOGr45E
 fMUnU3OyynK29SSEnTAG8CcSnmyan5nu/ooyTldgBzlKG3wam0DfOpv7dwSu77W6sUEcb
 jFpCQzJqTjM/KPPkglZGhb103uKFtyRPmtjs8Zs7PmK3JBLulGziZ4l+SY/2kn+wfofaS
 kL60vyEl9ec/b5aYTSqpdNb2/GPvyRe+TKnzUR139tLXu3SksQNMY5EPfMVJxhlAczA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=am8wJSXL8Bpni1gdQlALPqBeEkc+CNvAdmXVDyjPCbM=;
 b=frSUTdNOATgd5TVC/7bXJQ0uG1w1CfOm+XNSOvqYmVMnVUUsatXrTfOqLFMnf3WplNrY
 JYPZB9TWTQ3mZ74gAVDpB5A5bPGGPgFJ/Q8RnGXycuAEUsfHbiS2Mqv5IFAsR9MWDEroM
 OavcJ+w6RfLXFPmWRKEhG+4iSCl3C6VFTF3miCZSwAT6ybVSTWnQeGNsjtSfexTohldZE
 aBVpcfFjzKKlJ/eimE8zL17UgV4n0LS92guzu2mC9uTDeYA0sk8PNHIFpqfj+NLi+HyGD
 B+v4e/9GyzwqyzvXi0wqXwUN4eCWhj7JGI/Qz3BzSommD5tygR2ZU8PUnEL4UXlU7cw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B632F80E81
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E1B29875C; Mon, 19 Oct 2026 17:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b368f0d979ca288ab88c70de36fa73cb7da60bd8
X-Git-Newrev: 83e29e2d24067fd67331650c25106defea108ea3
X-Patchwork-Hint: ignore
Message-Id: <20261019173113.1E1B29875C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: bump to
 version 4.13.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/83e29e2d24067fd67331650c25106defea108ea3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-platformdirs/python-platformdirs.hash | 4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 4948b75cd2..641b1e62f9 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  528f5df1ebe17cd5fc2ba3ff1d11fb97  platformdirs-4.13.4.tar.gz
-sha256  dd96496961684a7f42041923f842ec7494e09f5e87aded99117e1109cd40570e  platformdirs-4.13.4.tar.gz
+md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
+sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 2e543d68f7..55aae1e1af 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.4
+PYTHON_PLATFORMDIRS_VERSION = 4.13.5
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/b7/89/dfd269de936e76319cf27787d9eaaca513491f635d49b0fbe7cdb6d3bf6f
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
