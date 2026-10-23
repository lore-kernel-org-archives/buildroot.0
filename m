Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86AB606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 20:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gkr9ndWj
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8349B8168D;
	Fri, 23 Oct 2026 20:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JlQq_O_vFBq; Fri, 23 Oct 2026 20:27:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C88381685
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792787245;
	b=a6CxLdKH9pg9vLAOsuNGjV6kT43XbxB105DLMU5rEvKGeTQnVi0pNNUuqAWbgNisQ94d
	 ipq3Z5ExMhXOkZv1Cc0RIfz3wSE42yFfNkUIxG2FOfD5QBw9WQGXn5lCyo/p0wIJgwnAE
	 qok8u/v4JdEjZSYrqGht4WNGb8FEwSl3yuAeYJr0YVmN/W6yeWJy+Q/C4r0kL7q15hfq1
	 IGAQcpVbvuxTo6pzdCuOtxzTn4P4f99NltjGIO5mxGAzXrcgvax9jl0hjfY6Ev/rry4R9
	 wIyjPD0JSoV77T3+NP3JWj6NGAgbwXoa3QPj8NooTKoSWmbe56kUJ+PEOohBWJ/q3+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792787245;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZNFXmrFkmlPKh7YAw5CmjT8cc0Esg2iYxg0ztRPar5Q=;
	b=lrNb6AdWq9jrBWZ/XE76egml7NG6GF5LV3g8lZYhXhP8b/zJM2PhgvFQPbhiEJgqIrMU
	 X+UoUgIhtM4DlBM4k3rDRHqgH6fqCAOIoUtFNJ3Yv3jK4G6r1j8JZ8cYw4emdjcBmPToQ
	 cJ4dC9yI1jZcxtgcgTyLfqV/c8iURfwy/VWoiI7un8holuzWXkHMeT2+GX44jjNP/6glA
	 SUdW0sYRswuUOqAhkZ1332RxTt+MXHoxTzncAphGy4dGftCQXrU6N0wfpBFGVPXaKxaRq
	 3Wqk22wqnwfKLeCOb82sv+EKuY4KGvkKs/vI8ozfF7dbsOnqKrSj8GUeozOJcgK1O3A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792787245;
	bh=ZNFXmrFkmlPKh7YAw5CmjT8cc0Esg2iYxg0ztRPar5Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gkr9ndWj5zbQC12Diu/2o+WhvoS8Db5sGIqgFLrQELTu+wb6XeX3O6r3ZfhGEnJ4a
	 6npMlPgAppzamZ8oIc0lH+3ZYQmKCpM+eAxM2k5J2/raXvVP9mxy8Fx/Od/5xUErRN
	 P/AoCF2527JFJjWsQeXF9L6Y0aTb2XPE8YCiN8zILQjJ2bR03DPIyl7RdU+kcfutHt
	 CVEGwyvu63UX8ZShiI2QVeVkQhCBL7Twy2gBz9SmQQ17rkuuz+YHv2w0KVTY9aFWvI
	 BlLSCx7zP+zyYCIe8PSoYYuwB0cqrv7z+7WAiDfGY1VgWt2xDRg+flA7AiHYYCTmxE
	 s8pPBecHm/AoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C88381685;
	Fri, 23 Oct 2026 20:27:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DD52356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E4F840A72
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqXehHfhze7D for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D0D740A58
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792787242;
 b=GpNb5+h1FatAel7FUQyo2wynlSFwDiAKia+y64zdfNGguUaWhcziuRH7cMdT9E7VXS+R
 1ew3rmD5uC5Gg5QFquVU9P+ucz0qhN8mLYoVaVuuSG2vJCmrE8zdCQ3Rf6vBdi0UqmKly
 lnH/N+C1BOkzyi4IicTtns+4tlM8I7ZmGr/52SeNKgO8cLSELQG1BwPT4pwn9ukRDQ1bE
 GBWrwjqrvaSTeVkIezKMc4F5zrDfimIPrFEq1SyfB8HPX78PCBy0CjaU+1/YHdghT1qtE
 Qs9UFwCz20ushZU6wH1b0xi3Iwb6QbhMK6NG7mP2khIEDc90Y9uTPq2olqfK/cq48dQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792787242;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IjV7dG8NyOlgAK13J6MBeSv0LQZsr8xvUy+QPJgPEes=;
 b=rN5Z+rSmxwNCS6Ghaiq15/IoH9n7TjorWCMwblQhJqj2jF1CH5VF/IgwsGviSraajdQO
 c6MlwNGdMS5wE9C1PPxxBC/k/SaktMGHsBuugFOrY1SeUo8R0XV0rWsDuKnH6WzaGHEx+
 de5KtNDiB020/89O+oGdcXhc0T6vPmGlgkREziHRSxDE0N9s1GB7X1hi7PBBYXtjLBbrB
 bHcA/TWlYCiikaEH/XLfaORqekpXK23NqKMT7KPjLTlUVrbU2LYD2mCZgFOQFsbj7kR99
 vvDFisw8pCSvqJaINg1jV+ex+mIF3Ytbp/IxLU5a1mDVHnQTgP05uZwbYVsZfqVzlEA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D0D740A58
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 20:27:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0F629C6A9; Fri, 23 Oct 2026 20:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 21:51:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b82efddfa96363264a67f8fbfb97e9095d4bddc5
X-Git-Newrev: 31840be2b92c023c3d0b3bdec990c8a42b065868
X-Patchwork-Hint: ignore
Message-Id: <20261023202557.A0F629C6A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-alembic: bump to version
 1.20.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/31840be2b92c023c3d0b3bdec990c8a42b065868
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-alembic/python-alembic.hash | 4 ++--
 package/python-alembic/python-alembic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-alembic/python-alembic.hash b/package/python-alembic/python-alembic.hash
index 2f886103c1..9287447bac 100644
--- a/package/python-alembic/python-alembic.hash
+++ b/package/python-alembic/python-alembic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/alembic/json
-md5  d221e130339edc326f8333cc315e8c32  alembic-1.20.0.tar.gz
-sha256  db505480647bc60386c5369402f4a57a506b7539c9e9ef5e270d45cbbe4939bf  alembic-1.20.0.tar.gz
+md5  bb84aa125492dfc16d26003dcd181311  alembic-1.20.1.tar.gz
+sha256  83490def1f723413db5096591f7609ac52544805be93849170088ed04f5a2e0b  alembic-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6e68d94a03a0e3e327ddf3e86d1ebedc14eece3922022618fc246a36296fd0cc  LICENSE
diff --git a/package/python-alembic/python-alembic.mk b/package/python-alembic/python-alembic.mk
index a940e14eeb..6f189c977b 100644
--- a/package/python-alembic/python-alembic.mk
+++ b/package/python-alembic/python-alembic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALEMBIC_VERSION = 1.20.0
+PYTHON_ALEMBIC_VERSION = 1.20.1
 PYTHON_ALEMBIC_SOURCE = alembic-$(PYTHON_ALEMBIC_VERSION).tar.gz
-PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/ed/aa/02910bdb8e2f1444f6654d5b296cd827d126f82209050ee7b1000f92ac4b
+PYTHON_ALEMBIC_SITE = https://files.pythonhosted.org/packages/93/1c/00909e0fbebad2121d916fdcab044cae988146680e9ee4387ba25fef8747
 PYTHON_ALEMBIC_SETUP_TYPE = setuptools
 PYTHON_ALEMBIC_LICENSE = MIT
 PYTHON_ALEMBIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
