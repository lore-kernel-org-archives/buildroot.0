Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5168606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=tAnAQGbQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9FB060607;
	Mon, 26 Oct 2026 10:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuLiUC2z_lBU; Mon, 26 Oct 2026 10:55:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BFC3960615
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793012129;
	b=TG9ElkC+R7FhgIanBxfD7G3jh/kWunZCG8eg0hcJ5GP5H6F4WYPFRISf9UBD0I4DjDQz
	 /DG9zfDUnCi6nhZEqAgWAGyY0MIWzC4nkmAy+47Q/9trnQMMBGBcmpPwOxg8JJfFcM0PR
	 HY4EtqbXsaWT0K5ovrVfjXJREdGfMoiUbVy/vYsA6r03UD7kY0SOLTmvP6c/GBWp5wyo7
	 s1Of6i8cgIeSkarS4/DyUd/grS6quuwEAIAQoqUOl2Vpe/IsTg80jrjZ0LgzUMhxvkFkU
	 YftnGyyzVR+58QEeJTJNRyt3zclNopDJlh8+TeX6C00l/zXMlQfLLkDEdYCMidA31rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793012129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=d3S7a6eWELqkSxRno3i3BmdmIMGgQxDBwyPN5TAbSv4=;
	b=HghNRuAffRdgDN3XTPqRFxxMA8kvryBXDHlwuvDT+xuALWm9ckhn0qwZlSMPKLOfhhMo
	 6wuzruYgMb2jGwtmFnlc/PB2Q80Cm8CZ260ai5AldKAEWnq5L8AkXrOwFlA9rOFtYSoLH
	 T5HLvK1lz1P/NQFu4q+9TzFh+F11ZNkSEfIorPy4uRYOIBaf+8M5LjoG3/7obEv22ZCuU
	 Fo8jJ/hRHSpKZEkxTkiQ0zj/MT+eb91XLc163XJp6t6trTZ23IbsJf2STSrbIC0ZatHPi
	 8kGIwmL3i1sPt7KQS/Z44ZaIwLxtI+0ueFjQ3M1HsD9aEPlRHXHuN9s6prnKuayzl+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793012129;
	bh=d3S7a6eWELqkSxRno3i3BmdmIMGgQxDBwyPN5TAbSv4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAnAQGbQcPsMuyleUXOTXFgKoSClPDDN4D6mQjQcO21CCsOxjtAl4VS/dS0gfem9f
	 +jIPPwe9sAfGJyrukqB78aHfQWnWjH9fQeVHa6pEH74z/Ql40ztm6FKCDJOfOn1n5I
	 RHxiRaqLbV5ORcQ07v+eJcPURCkN1dxUwUhj60lKdqlhfxZ8JXW/MOozFksnkOpsfK
	 HG1ztOzP7Fookhz937zrpTJd4UkA+bfbSY4U1kquK4oB+QMc6QmHFJDA12SZQpImr5
	 M9pFA2duERXdKBxPYVUEmYtOkJ1zvlTJ4gszs9lLkybz7yoVCMhhC6XGAU9LGIFarT
	 2SIW/C0q5lvTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC3960615;
	Mon, 26 Oct 2026 10:55:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E4BD3B6
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 046B7400F8
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mLWmd5nOPbcv for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:55:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 567C040139
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793012127;
 b=GAZK7MnFwZwS/Gh3Xs+PQGa8HRXQowVYBLTxT2ML9z9A131EGzYjcJ6MVF3nuF6x2o1Q
 IM6AlNxMXwD2UZpWxkvt75Z6uFihEw3Hb8u+E6aMtEI1xVgtUpLRELY9hJbTegiXBnZTo
 7A6smKKNerGUP2bRS4DEUMJfDbD6GdkQ2oZat1/dqP3ooNtoX94xXruTlPrGBCMQsj1Dc
 8Km6LLP1eIoGuxP+mWBkHWAx0W8s7iNBDvCVKW1Uc6UwNBcvfHg9Qq8A0fjHX6Dby1bXz
 DonoDSsu/x/m8FinoWaiBHlZeKWVw6gsroRQsZoyL9pJToVxSyF+HswvshrES3X9XQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793012127;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AhZH9oK68yhKO+sJ6oduZ5sA7+Tu5JQ6uckeGhwuNOA=;
 b=A9hGBMV/XpuHEICFw+rzlt+iSDm/rDbzOoAvAKx8IxS+fi41BrQD/eRZgkkjXKvOQplX
 Cn/350KgxJDIaI3LJTh/Wu8+UNyQr/dhwwbJfkeEnsJT/rekdnT7Yis1nf0eYXQrKJ9oM
 Eo6aKhrL0bQRkzH7q1AMcoA53ihCSZWhGI9liBaFC78l1Rx9EnhJ8BA/F7Ak8UoxLehrh
 IIuWMiFy5XZ18F5EzwHx8JzPI74z58iREB3NrRc3KQOFeYxJ31bikJv7EiV+R1sYVbAcb
 B8D053fbUCA6mphZwM+nEhfjgDIakXW5tRhV0E6biJz09hZBO8G4DoKQIExX8Rpl7jQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 567C040139
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6925D9CF84; Mon, 26 Oct 2026 10:54:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 11:54:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 571a3c64f4abe1e433338bf83dfa8d6adb7633ae
X-Git-Newrev: dd9e6cec44ca44ab53909c12bada01621024925d
X-Patchwork-Hint: ignore
Message-Id: <20261026105401.6925D9CF84@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: skip
 dependency check
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd9e6cec44ca44ab53909c12bada01621024925d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream has set an upper bound for the setuptools version [1],
banning >=84.1, which had not even been released yet at the time
(setuptools 84.1.0 was released 2026-10-19). Because of this the build
fails since Buildroot commit 2027954db7f5f42ed976ea2f4655e0cd224c7ee7
("package/python-setuptools: bump to version 84.2.1"). Nonetheless the
package actually builds fine with python-setuptools 84.2.1, so disable
the dependency check.

[1] https://github.com/jawah/charset_normalizer/commit/a05917f87b5f71d6022d8abe2b0af239f65c1111

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-charset-normalizer/python-charset-normalizer.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index d8c69899a3..630db33043 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -12,6 +12,8 @@ PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
 PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-cython
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_CYTHON=1
+# as of 3.5.2 pyproject.toml bans setuptools >=84.1
+PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
