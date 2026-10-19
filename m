Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844EA606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rVY15Gjk
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55E58605D9;
	Mon, 19 Oct 2026 17:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XjJ_3985a5a; Mon, 19 Oct 2026 17:32:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 814B4606E1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792431157;
	b=WMYYO6oLlLcSJmT+Nur5zL4kAuWvzd2XbfWf74UFzV2QNa9TZIA1uSCjM4SC8MRdPJa1
	 7p/5oIMkY8JBxrwWveespt6sZV6NgQG8yZ4fxdVCNLmkZRN5AWi0IdRUtI8jBNu18dz+p
	 HJPH4Hj8dCltqXk8kP5VEbeT7hIljddoqO+Z0DyeSoyYaQwDzBJhFSwmJAR4fFQkOuGUB
	 bRQI+xAMdKWTRH91+8yhdfRiEYzmMPX07CrpXSAAnAt0sFXKfSTzWeua7IDCzpLVjEeGX
	 Jl3TNZBFlWXSNyBn9hPv58xOrbXrFK5eZRc7Q67ZnTdEfmjDWe7kTZg/+1G7FJpp6tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792431157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=orhiCwPfUtynIn2egNKD4H5DwaoyQgWHgMbqu/mA05Q=;
	b=XJ7CZzSslJCtZIwf7hoxrgkR87ujyn+zPYmiXzR+4sDGcfYZX+zeN5Y3FVCX7EQV3djZ
	 EmQ0ZukwhEVjBBRl3dx7rFoxKV5SKL8xQ2fZOlgJcOwfoypu6mBE7cHQbXlV6E1QfB82e
	 KEdUcbja6L+gZLO8DZ9Cjj/5PFebOe4MQwTivLDHdf1zFPW+3IjnP7Ixyv26681T16hNQ
	 bELednaD/4sf0zlnfM7hZKZsK9dDgf/jWNK13G4gDltp2kFooiTZ6Zve7wz82HkDAYJim
	 U97+hMkwRCBuOLqHhZWf6YXENqRU+lXGnrRsoc3L3xLNYvm5QqEhYGDnHQEGMdXQ2dA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792431157;
	bh=orhiCwPfUtynIn2egNKD4H5DwaoyQgWHgMbqu/mA05Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rVY15GjkNxjHfuHFe0F2XKB6vH2en/djbWxsMvm5IalKB5z0oEtcq8vNemEtS+4Yd
	 Yb3VnEpLKf0nvmqYWmwhXkDgeA8kfvK6B5JGEcmhx0JwJ0eb4qtZ8nEy77rlCdhDHJ
	 I2Ac5p+789YVjRAww4J90QCCbTq7Kv1zhl0mSTKYw80x7kGNfJoslLGkKOnyYCdms/
	 r7CsSr9rMi6fY18eEvSyzfQQ9NnIzmhwiy9elLMc8PcwkAQ65H82KFXToarDQioxli
	 r8MnBhKiORA1Jf2p8DW6yU0/ONZYICsp9efpkv2RSbLW9y7/d5VIzzbMQMjZ+EV1xD
	 juAeescoKsRUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 814B4606E1;
	Mon, 19 Oct 2026 17:32:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FA031AB
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50D3E80EA2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3joTK_6KuMY0 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 930EB80E34
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792431155;
 b=WX2k1W8hL3NE9942ySNiqbhYpN5h567uPqiRktCNUMBkP2ybO6PSNSCvoVZL5OYcXV6d
 ex9pdXgz6bwbflSUzefrdkge7FygryyAbswF6ehHr36t1+sveAVryzKtXvDh0mM7YbVoM
 IN2mtimbJRBRL3aZUtvNgW9NLYuSQb4B8Qx4Wj7OQCmTxeleWFc5ONUNvtrxbM5eUjGpa
 XufLHVsWflQwVhWKlKmBcWIXZ8Eeixe45SwwWMcapi6hzIO4cSxwmoYHJibkxM4LHn97d
 28lOwbs2QMHRAnsEdVZOYpjqVU85Ocq4Ivnp+Q3geCiH3GkWQK/ad0qjIrraBDevh9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792431155;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GPrEQwOWbx/GALHwhJhkBzmqkGDSEgsLEr3ja+Ct4KA=;
 b=rDaRj9zx/2zMRZhLWGJp0LBYMsHrzwN0cL61R2s7GWTlG8qIqVdEKBWGF6VuShLpQgDj
 PNyrDlPWscL/RzZN5dDlJ9CzNWgzjZLvbr/Y/XfY6gIc29cWIb+1KBePN9rEGh0LW5z1c
 QkuXoTrGLIGHVcdwEvRJX2fLdLtNeHU+BJGSZcumYbq4fe/EuHRAojORDLjUKXE0eYM0Y
 1wTQsBGI/8UK4l+ZJGWOeofyN1ZNK7a5W1mX2eBFz4F/8qu/meKQrRbZtD89nRlS+G3AB
 IZDdnfwOfsm/Um6AnBSzJ05dy3cU1g/6tnMzquqCPvVHZFJ++gd81l7hlR3VnQU7ZZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 930EB80E34
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0D91984B2; Mon, 19 Oct 2026 17:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:31:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d3102a8b313302d7a451ddde4a35dc914e1397b
X-Git-Newrev: 807096866b2c8902afea3e497dd99bdb43e0cb4f
X-Patchwork-Hint: ignore
Message-Id: <20261019173112.E0D91984B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autobahn: bump to version
 26.10.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/807096866b2c8902afea3e497dd99bdb43e0cb4f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-autobahn/python-autobahn.hash | 4 ++--
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 64715ff622..724045a52e 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  d6e43b49c77a11d5b36ac8a2da415d0f  autobahn-26.7.1.tar.gz
-sha256  c6949a2c6eb95fb1c218837dbda0a59abbbebafb8b11098551c01a7061dfd245  autobahn-26.7.1.tar.gz
+md5  2958a002f07a91d6ac8c0ce3ac50764e  autobahn-26.10.1.tar.gz
+sha256  0acc00895d4d3b06b55e4c945592d426033062c989ca2910749777a855faa27a  autobahn-26.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  ff61657bfe1984c96d932fc0423268097b4b588bc57d47c26e8d680250d6c76d  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index bb411033fe..97ec7b1b0e 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 26.7.1
+PYTHON_AUTOBAHN_VERSION = 26.10.1
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/de/73/f109f563c27e048e45d135d81af19e6ca391e24905550b06bd1c9d674c57
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/df/e0/f0a9218a299f0d79feaaf62042812629bb7fa0c1fd6d044a6068ee7f5c79
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
