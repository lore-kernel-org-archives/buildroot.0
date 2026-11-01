Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA744606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pUoIqXkC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A80D980E28;
	Sun,  1 Nov 2026 17:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcKzpFks8tgQ; Sun,  1 Nov 2026 17:08:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ACBA480E07
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552881;
	b=XxeAWhN5S4+brSJ9Q6fz7Z2VkM59sAgfu84rLbJS1AkrxVF86Rf6kpvFQIhrq5n0QiT3
	 EkvAW9AvA+7dT5bj0OhFDFjTPR5VPiLcawX2KyMxBwvafd4p448fawKvxA9gA2PT1p0qy
	 xfxewlTluTnDPDTg0YvAe7pmSqtzTpxRqBpKqlS11DeIOVSY5j2TbWzW1jtnCPor2IuvS
	 6vZWbEeH95gh6LkxTu3YEd8RkV4oxC/BI4cv5wrz03p15QCuWfAU3IACRaqj9uFSYyBep
	 TGFCAgiVrOMBtDh7ZtMN0R+ve5Ttrl71wn11FUmou47ByRmDLK+FX7bKYFWO0n9KjSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yKENa4cIp59UWY3ZJGzu7Ermrn9Yom955WsXjs3+JHM=;
	b=ehKcoYC0tYRa0DFne7/gg0yaQf2uH0NNzJyfaP526yvWyhKLRwoqJSFUXALAQXcRmmH/
	 hcqpzNQN0TPr2UNwBFqhPZxxempSdDblw/hRB9P3lHOGIbjW7b/OcmrUeT/lnMKPq3Y5F
	 PIpDeGiZeFlFvGu0fHbKt9XjZe+rrVR5c4YdQE+PX9Jk+qBDb5E2Rkc5npP0EOAqz8v5S
	 70fd1gxhXPHMG4lf6v6edM0XQbbJ3Vd+UywQ1AtgtkGgjpN5pFa1eKleR36TdFS3NCClF
	 3ctICjO20Q4iNyVRXtyVvClZsjUO3eRIg4z6adLlSN2NV47ng/Wn52Nhp1LQo6Lll9A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552881;
	bh=yKENa4cIp59UWY3ZJGzu7Ermrn9Yom955WsXjs3+JHM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pUoIqXkCuG9ylO01mwsRwLKBqz2+YWmy80g5KOCExP7tm6/SSDnN63nBBWBpfUIVv
	 Rvabq+pyHSQqWVEd5FA8xvRu1J587jsaYh0DLotkDNRStShC0p5gmtucWO4noqxaSB
	 JjShov6YeAJ85RfqplZyuBPRJak2+zuN5TRhVRzED8uQwvGYZgg+rstK0KLIrME1ue
	 F69+I8xuubpqzWcmiyfd/kP2LxBdPqdzP6KRzvY7Da9Q76blt5JJl4KG5pmN+HzIY2
	 TlNwIT/2il4Hj5bExpis3x1sQFDgWlDRIeyztg+TewoyzupWxiUQ2McnaC75KT0e+P
	 qzJ/xKgjn6EFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBA480E07;
	Sun,  1 Nov 2026 17:08:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68494EF6
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A53C80D3E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 03XcdQpcHGFV for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7549580D6F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=oFgntUFhcdSi2ouPcpdaRSt6w3W99U+IKdkb2qfhyPhcS56cjokdywVmvwqxFx8QxUQE
 1wRhUb3HjcmY6GrxoPBfqc6uDye3+/wzXP4KLcgCfrwWs0AEojQ4UAJKoiG7LMgl0Prdb
 e4IYCmkxXnHFx0et9ENDJgv50+Kzql/sHRKrjXGhJ4SbbkYNvH5x39+E+NHZgCLiEQTJV
 PQ8847IobWl+rIrGh/zKZxeRhKBdSZrFKTRMNQK/N12g43KCmNLw7ByV/otMhpUcpfM1x
 H6bOXflbs80KauxkzS8pN+r/PWvA/1xx4SDxh9CBuG0C+4iQPqjI+6dm6r0UzdeWcTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4MQx3Wl/wP6uaYsnzHNB+78WDSFCyQxtbhfVNLT7KQc=;
 b=oW7nbRF6Lh/MJ9bAUS54dRfROYISP3wljvPpe0t/zOOhFRY3Oeurd5tkM5Dg174o11ZJ
 vWEzQvRYkTjKOvjKwps1TXQIbh7Kvd0nmuPKaIbu7zMNo2iJDzgIjaCOgbkVhem4l/Lgy
 2O/7MgKzr4i85o+NFCTjtmqso/ry24liVMBkqWFIkaAUVNpb51TtFFZCnuYGMy+wyY73s
 m28NsSx0eNYJtcvgOiONKOONLMM0jmlOhaifJTDJiP5vklxzK8rr+DTnnLMYNOni10iiB
 7ZInuO9O2uwy3qwVnkx21yLP8j2pMN2uL7wRf0fnERVd8NXfQtmYItUA+CwKjqUS0SA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7549580D6F
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FBCE9D4FC; Sun,  1 Nov 2026 17:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8c29172a96924d8aa6a1a76b1b788620b9d763e
X-Git-Newrev: 27d507121ee4b1e6a9ba490b2c907e30742ddbc4
X-Patchwork-Hint: ignore
Message-Id: <20261101170550.3FBCE9D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: bump to version
 1.85.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/27d507121ee4b1e6a9ba490b2c907e30742ddbc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index c230f68918..dc3c9edf65 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  1c5d46ea8d18b15a69b59a4f9dcd70e9  grpcio-1.84.1.tar.gz
-sha256  446e7876b9b991fa124c1d414899fa7cf95f89a3e71237ea0161863dc0b2c09f  grpcio-1.84.1.tar.gz
+md5  377e93eb40a0f013f7a892f18a319710  grpcio-1.85.1.tar.gz
+sha256  5f530287d5de5f7f66089ead81de44f6787162944dab3922efa65dfdff108a1d  grpcio-1.85.1.tar.gz
 # Locally computed sha256 checksums
 sha256  58c86a3f2b5cca0ebdf9ed3e7f4e6dc38e3b38796d8c3dc92064c62a4e39d0dd  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index fcd6503199..9a2e1a2103 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.84.1
+PYTHON_GRPCIO_VERSION = 1.85.1
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/c0/3a/5c8e0eea2af3d30cb20d33ac325a98d9b799c069d63101ca4da20bcc776a
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/f0/03/f9e805772d4d01da2a1754a5f63c58601eacaf8f1e878729217188de7d16
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
