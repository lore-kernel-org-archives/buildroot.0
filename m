Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287D606A326
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NfcFl0Y7
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A0CA60705;
	Sun,  1 Nov 2026 17:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHtA01x_jU58; Sun,  1 Nov 2026 17:07:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAD496061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552874;
	b=l5L7Cz4HX9BZUi5iMmqtUEm4fGb84ZkntGmHCFfq1GgIiiFeW4cO+zZA8+ViD0Sq8RpI
	 Nj7nBihTfg0P/7JgM8TKwHfvpn9NrCodoTM6ok6ktZPDa9FtSsrtcqHWUenO5S+9jgJXK
	 j7FFUz3dghXvLAK2Rs3iLxZqpr5Vhb6Flk0+bD/3aZsXJpgfmQ1mOLlJxbtFVihjimRzT
	 0NowCE4Do8bxRwiK0PcDjmbUmF2dKNxOEohkA7fiXh6g6cuD4gbYvyPqD1Qg/cUG/IyA9
	 ne+lID6Xe5ezlUF53ujRVsv466hXimyRmftuLlhUXyUIVhjYjNjA3wZ31NE1xfFdBCQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K6qdLdNOfyzVZuXc6zvVkNUkrv9hg0vL6gNyOmUbZao=;
	b=LHOKa9h6bkiNu4+eSBBNwP5qGAx9fu01zaczBzcQEiCGNCiNP5PUdV2Z2WWKhe1GWm5C
	 VZkMGGEE/vMoCfMuxWMie+jlMvlmfesl6G4VIaGU0TWbYj1qVg1awpbyj3Nib6/MRaLMy
	 UZV3lLP2dK1Z+WWBzSbdwkqmCFqWqM7zi695vVwdm32IOC8byBDB8eZJGHLZnVWHDbWr6
	 B3ldwpndO8p3keGg6yv2n2/hivtA9Ot3Cz5Jgjs6Df5WSptvsR2diQzk/eDdlUTJKZFe3
	 d+PXTaT8U0IGRFO9phIN0RXN/yyYVT2KAexDyH91oC0Z3eMd4/JJxMltFWImf25sihg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552874;
	bh=K6qdLdNOfyzVZuXc6zvVkNUkrv9hg0vL6gNyOmUbZao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NfcFl0Y7OubGpp4ZRc2l4szATe6LK6IAb7umRFUbG+TvGh7/tc5InwZ/3kdlKkXK4
	 Q7tsF7WnBWErM+fO09i7j95yf2QmQTQktzhsVn31weHw1zm9XEnLd2h9ed/y1AgSg3
	 ArEU8Us1JlBvn1B+ChJpazKTBulLUq/OikPIBBO7Q09z41G9Lmd/HYhfqade2C5jaW
	 tybeBOoyIyZ5QxrOHS/++WN/0f/3/Ic4BakPGvHZUJvy1S9Ery90aSqqeYWyZ9Bn0I
	 zkrNR4IGrruojMiwb7dne1iaREOhHLuaiS83X2YJS0SVaFjt4CNKcL1NyMyDyQMe3K
	 Ygbl1c4XO0tsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAD496061B;
	Sun,  1 Nov 2026 17:07:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFD27EF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E119980C97
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iVYeb-8xIlvJ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1BE1980D1E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552839;
 b=W40DjtCqU89jR4LQF6KLiiVQweznfLFwzH7gncmkQv7zdTPVKLeqcrtTxM+sDTCcaRb6
 HaKdVCGcQrvSJ35L3uMQInb+SWxdyIon4YzE0UFDYS7dtW00CkfJ5g9HkjE9hAUhucOUW
 z2V/sgJR0ZLN98FNgouFPpSJfFfZ9Z3V1DQZxexfsPzqV5DZNTlcnd+f9R03A6T0jDn6G
 FzzOg4/kFULlYtzVOtuxtPSjaHw821pbHPMtuomh4iptOVjv8Ybs8PtWaYRNu1O9Ji1Lk
 DiqjABRTxChvWVRN9pDUO0yjLsrQvm64V4D/drpgPnEHgLQEKPERnEWFK2a+YaiWVpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552839;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aV9PRO+FBSBqp9ZIUe0pTNyRysXyMGhVeedN2YIV0vY=;
 b=JsvUEJ4I2FxK0LxWFVX8YQbd2DDgzmifTSCS7Zbong2jTTCYXWqOCgwvvDmI1zKCCpAS
 oS1oe9KQ/LgKWtJt8iDigP+2aNY+uOFO96m+yOFMuyeKuOwJvHWjRP6uboYZHaoA6BpBc
 yVlJretV/5DkPMAsvf3ftFKrAgaj+UtOkdTAXaGmkehZksuZxrEUPUhoYxVY77qv2Bd4R
 LZyKCMXC/sc37eiUQ185BsC5CaRU+1yb8SXS5TwAqdlrJG/o/hZ1XfF+hLYTg0fS3kC+y
 TWX/9VZNHG48/qq42vnYg1VDT0c3mQKDtBpNUWcVvFqtza4ay/bhweL2apzJNSBmHHQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BE1980D1E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DD3479D4FC; Sun,  1 Nov 2026 17:05:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 18:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40e868115df43899b0537417a0afa3f34f0e671f
X-Git-Newrev: 9c178676f05eed58132199c3efb7c2c260360fc4
X-Patchwork-Hint: ignore
Message-Id: <20261101170549.DD3479D4FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-python-dateutil: bump
 to version 2.9.0.20261029
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9c178676f05eed58132199c3efb7c2c260360fc4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-types-python-dateutil/python-types-python-dateutil.hash    | 4 ++--
 package/python-types-python-dateutil/python-types-python-dateutil.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.hash b/package/python-types-python-dateutil/python-types-python-dateutil.hash
index dfe2101fab..3f070237df 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.hash
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-python-dateutil/json
-md5  4f25106ead8ee6917e5015036cfd170a  types_python_dateutil-2.9.0.20261021.tar.gz
-sha256  62d66fcdd293e38745eae644e5da4cb399b98799c0ae61f03a54896fb51b3140  types_python_dateutil-2.9.0.20261021.tar.gz
+md5  244541b7e8735556c5994511bedad8af  types_python_dateutil-2.9.0.20261029.tar.gz
+sha256  3258b491686c441d8074cfc8712308741900c9ff128a06421baec3767c503511  types_python_dateutil-2.9.0.20261029.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-python-dateutil/python-types-python-dateutil.mk b/package/python-types-python-dateutil/python-types-python-dateutil.mk
index dfa8661a5b..352ec00472 100644
--- a/package/python-types-python-dateutil/python-types-python-dateutil.mk
+++ b/package/python-types-python-dateutil/python-types-python-dateutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261021
+PYTHON_TYPES_PYTHON_DATEUTIL_VERSION = 2.9.0.20261029
 PYTHON_TYPES_PYTHON_DATEUTIL_SOURCE = types_python_dateutil-$(PYTHON_TYPES_PYTHON_DATEUTIL_VERSION).tar.gz
-PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/65/66/4783d826afabb22f29f47b22514298efaedee4718eac0a76c37bea381a07
+PYTHON_TYPES_PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/3f/1c/1ffbe325ab57b36f134f6c9b1074bfa36ed2a169e530ff7a70fafd5c3bb4
 PYTHON_TYPES_PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
