Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6C0606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=f+bU6yL/
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A400E60F17;
	Sun, 25 Oct 2026 11:56:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5vOYYViSjBj; Sun, 25 Oct 2026 11:56:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 21D4860F0C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929392;
	b=CSAxzxr3hiRnK4E1dWtAGOQ57rOZ9ggjNmI8GHiDn7X2Szb85M5DfVM9ZN8XB41RcEgp
	 I3H0LybOwKyuX+lybHs6wrl1jFiQlXNG+h9TcHrYBgL8O4vJphElidfjyQfCkvduLWMO9
	 MYnyiwMbsnI2blQCE9Bnj1TIzfiUb2e5WQGWPG5fGz2jdpHGy0c56Kb0DicjBOtnDZNdR
	 TxZNVDXpXbIdt/fm72ql2l6S+2KEshd44DVVHAoTWAkN0oItwhVw+b+1EorDEaqffJdxA
	 Flt5Az7jHKzRIc3NXjZajFRylRJSKmSN2i0ACJqOWu7qJbyNM/q5KDdk/zljTcxl5zA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XpuSC6TaZo7T4pBBTEG1E2Gk+e4Sz/GlwInYq64nvHw=;
	b=TmrB7JBSxLq1OkVcp62p/B4B7HJWOv4TWBEjn0v9c9686KmbwiNMqrvvqSjB8Ks40nfn
	 JuB5SWzJp8LUPYb+6YUCF6YMpmNDnERUPlGWR/ZLrUpGuFS5T8fisUcvWAN0lPiqrCfsd
	 /ykaEGzH9aYk7n+PgC9GOYI/zIDdaNUsdzKvfqUhKs2fdh1M8MgxvclbUQ6bqqygswM8R
	 XRx5eyoSQJW24Z3ucJAe7OuYCennK92EXQnMq511tKiSrAOk37180eTlU8PwRn5OqyqLO
	 7I1d/Tl1ytb/WIxqt3H4Ec11xSSYqCidFMxX5v0sJhbWODLu0Vkg4xfJbKE9YmZdr+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929392;
	bh=XpuSC6TaZo7T4pBBTEG1E2Gk+e4Sz/GlwInYq64nvHw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f+bU6yL/AIXobJPXt1hh+63RNSaV63uUwW8N5FSEdHHDu/fe0iaWwMi81Im5pygnR
	 AK0FLPH3BPPyZPc7J/S1w1EvirU92bxjXZhhlQmpPDsY9wnFMHAhwqIFSGxEEs611T
	 5ft5MBGMFKrPFQ4W0MC2NEtVgexbjTPSfBMeVGxhaIc9LWS+ULl8oVd6mjAhmxHdTA
	 dvZHKNN7mpZN/JzEHgJHH7Q3Z9yhWi5BJUReP9DEOh9ln1ctdkaHud26UoJKngFgNb
	 DsWrjyFjayX14LeMDDE8SFgJuF4Q+B2wUr0O0BijzzNigkTGvu5m6cF1Ks/Ly+b8X2
	 MM6kI175zLjag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21D4860F0C;
	Sun, 25 Oct 2026 11:56:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E386643
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C995C406E0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIUTWSArqU9z for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F4A9406CE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929387;
 b=JmQrDubTDVGJsmUuYPwvDi7zrw8Hd1eR7kWJqZYQYfdTZruxxHHH2kfuCJY4Npc2Z9xe
 QNwZoNEu2m3ZETXDUxetzeLrFa7Y9NZApSkDoBmI7jynv5ZpXp6QlyDVtw81BTkUz0pAS
 4akDoOTysHe29dWyPNvPfsPQVKBJRXJV2i5WVYgJILzturJe0XputGrAwBNgbaLpYVY51
 NAOggbCijxqWZ724bXtKpHXXl5BNAvWcxsYHtQnNGxaE2VYG8DrJ00gH2CquT3ZK/0IvT
 z+XFqg31lcdDiThfjTYucqfY85opgmvWMVkuyf9I4qPOVID3NX/0IpNyw6TNlcZSmbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929387;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Vmr+XItY7mC5GgjuEENIkSoCthSYHIkVMLEPiWiBCFk=;
 b=VYUsyLBk4Gt2QIkQjN9fb2mQc/sgVrDvYyZuLuCgnN+rPEp5G+Gu38fzcFD8Or+ZNU4a
 zXKG+hqX4jwEM+8d3xudQAi7Cf6x+LmpAQTIIaObbNfV57Kk6mFP4XB7GNWuIvoDBOoIT
 wJ06VruWRMsadLKrVHhuAp2UYZeiMx42L9bVqXRzmA73DmAmLzaOfCoPEqeXo7AY9kFBi
 3FV65h8VuoYvMuqpWSOkhX5m21SE/BEMtaASv9T8vllkriAkrkxZDFpA8fuqoBRg4+pmm
 XDZnJ153+02hDBzHI//xG8D72R1DzlTsp1GJkUyfTmRueAK3nVsOF1XJBh+e3fkGczg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4A9406CE
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 11:56:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9238C9CE83; Sun, 25 Oct 2026 11:55:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 12:02:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0f834c984ab86e821b0426eb592ea30c48166d8
X-Git-Newrev: 7aee04077400f4cf59bb9febb633b95eecc884d9
X-Patchwork-Hint: ignore
Message-Id: <20261025115501.9238C9CE83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multidict: bump to version
 7.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7aee04077400f4cf59bb9febb633b95eecc884d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index f444ad438f..f6e2ef09b5 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5  014816498e1cc303f03b9e552bd68153  multidict-7.1.0.tar.gz
-sha256  61a4e5d81b8d4e4ad61964b230129e7a2b914793d96289029078fc9009f074ec  multidict-7.1.0.tar.gz
+md5  fd85b7ce516e9f58c6b3029ea1c8b392  multidict-7.2.0.tar.gz
+sha256  f4110a13e264858eb00697751785cb2c58ee96707d8ded5ddb8239530d3b9ba4  multidict-7.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2e4be5fc6c4c72a466fcb665d726e049a6891981fe536c4f04b6366749461d23  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 8e33c341a6..2004fb01bd 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 7.1.0
+PYTHON_MULTIDICT_VERSION = 7.2.0
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/f9/79/84ddb5ba16c4eb2c69c71db76ae3c579fe546e511f7170c7e27eedbab7c1
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/9b/18/0127fdb8aa54b1d29d5b8f752af088ad6aa47abe13adaa519377b0b331ab
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
