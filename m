Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60219606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Dvp6DETT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=EjXdWn0R
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7A980E6D;
	Wed, 25 Nov 2026 10:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhecyKXbEJIW; Wed, 25 Nov 2026 10:17:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5727280E8E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795601834;
	b=aRBNbK9Iws4iNoqmLfRH1HBBmEYLk6ipvBgAzYLQtdeQO3mEM8GPamEGovOIPnnwDyBO
	 pOReHJC0Yqj/HpFbipkVdQAJ+OYxLb2SJZ47PWjDXO6s0XbY1FarWChsPmxA7bzxbxcbl
	 TO5KxMM7+08QjVk41OqOzcDgcPRRTM6Ink3GVqStYC4k4b3Err7sDAiwLqDiInmlCe8Av
	 j1NSz1dNxIUry9p1SF26WfRFdwti/NGjC3JGdOUAznlXONpqPGF/yzdj05BhGJnl7tFNC
	 WZ8kFxiz2L2F636GWZJuYFpS6Qp/nQLKhlgchNykGUdbElg1mkbh5kMkj9C5qpJp9EQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795601834;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=mCdotDX+XQeMEIEqNTSth2U2UpveGQW8Cw3yUdEIOWk=;
	b=adQ35jGJ7mrxEUxF90/jlFBuZ6OUdEq5ukPgsgdGVG1QLyyyxfxOjGAQM9gdtdRWLIqF
	 qewr2Pfyih10+y0yb/ke5JLTRzCOXb+TItb1xuzS/ynzfr3pB5NJ638yn+LSRIQHKFC4n
	 SLG6OpAaD8lFoYLwjaawiMSje7rJ1G552TC+HBvBFsNd83GrvEEfIE2pp8HsrHh7y/+I+
	 MxUGehXPZbsgdx2xkCObemCaPAvKfVEJTV0+jqa4cg0AJfnnND37NmhMK3gqVzTiL9xee
	 4c6J9JdcvqOVopv7/utKTo156OEO2fllekFdu8WcKBaEV/gzCtn4xuBefjwpOQHaW5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795601834;
	bh=mCdotDX+XQeMEIEqNTSth2U2UpveGQW8Cw3yUdEIOWk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dvp6DETT+Texyj5pLOH+K4Kar7woHd0fCSSGy93Eci1gpYSRcTZY5/xOuN5CEnQUp
	 ubQVocHukbsX1eYs6zopGcR0tYkQ8iX5F9OpVoK7NNKqSr1xk8u9CxsHUNDHqXgCGx
	 ImGstdg/R+Gqu4p++w7imHTuEWBYD5+fZK1lq0ItWQeeoVClddcdB1/tXea66cuk70
	 N6NIAfDNhRy7zjg8HkoqoIYFYnmGB/Ia/9d/QWXOMaN1x3SWc5CCmztE7g8Ute2wYZ
	 198XhyrH68avxh3TO+p19LLYNcs7uq/AMHRYfvWe55w9DE/XR9MEQW0BFIJQbxr56o
	 osO80OOQuIiAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5727280E8E;
	Wed, 25 Nov 2026 10:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D03E2F5
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8242E6070F
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7xQiXZm51Qm for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 10:17:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1FC62605E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.217
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EjXdWn0R
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FC62605E8
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:17:08 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id WA3mxCgYyGZvgWA3mxv1K5; Wed, 25 Nov 2026 11:17:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795601826; bh=A5ker7ELCphMdZaWTLYKmei+L88B96b/RuEpvEp+0vI=;
 h=From:To:Subject:Date:MIME-Version;
 b=EjXdWn0RH/g0JXPgiotMLWPUQmC1EQ5kT/h0s1qvRVkJGdX+aBRqqeRZEn5uusiH0
 FQjrJNaax21VPWr0Xk6B4EYJNYh4B9fc5iamVQJ62IPGBP1O5quhrxgNohCzCNEGUz
 NuRGJfHoBPC/sbyVOfiPhxNgl8pk3l5VapT9wjdyaexsjQKrmnrShGqNywn1Jq9AdG
 b+ye5JzA7AKRcWpDnb5kZb1VsLKrlYcF/VSib+FcWZpq6Zc9fks1/s4VvLk9N7s/aO
 2mokWKwlTZ2zh82yCqvc3XKc0PEUGXHdL3QVouYN77OsSi3dRQquI5entsp1H0w9bf
 kbZiVXO/Evgag==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Wed, 25 Nov 2026 11:17:06 +0100
Message-ID: <20261125101706.12014-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBX1Va9GO0BVBRd7HVBKKLAxClTtmCd6hu53GjkRsoar4uDvN1c8DnfcYPCz3Gry/Bm9gvbvbWG5cbwEdBK2v5e5JIxyd+LSxr04YV4CQxhcYnLcjWfg
 uakVQ28Jtsrw1QoJdMCIjNTtk4+o8EB1HCcMAr+1/Fvn2wycdeMWH3PGg1SVrTY7F8Mn4gaPZQYmfaazd9LE1VF6mZW2QyJmnAj0CnsT4GpxJYQJDqqiLKfw
 qZjq6gvAgLabyDocfG21hNmbgtzdffO8xVJNMflArgun1pK/v92+VRP3OTk252E1evkt3M2VmdrFWQbsO+gfJagXZ4sDqDZYBZTgtSp8i4ibMftSO3ui7CsS
 Lc+5dY97xbWy5RIAT0sRBs59Q+UASGHekdv8am4sLk5iX3A+plY=
Subject: [Buildroot] [PATCH v2] package/ibm-sw-tpm2: disable -Werror
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Upstream builds with -Werror and with BR2_OPTIMIZE_G gcc spots a false
positive -Wmaybe-uninitialized, so the build fails with:

Unmarshal.c:4248:43: error: 'startSize' may be used uninitialized [-Werror=maybe-uninitialized]

Since upstream appends CFLAGS after its own flags, let's pass
-Wno-error through CFLAGS to avoid this kind of build failure.

Fixes:
https://autobuild.buildroot.org/results/ff4/ff4d551f62bdfcb5b828f8b1d910e8cc348da36d/
https://autobuild.buildroot.org/results/777/777bb0433d1a5529235162f301be2c32e377e957/

Fixes: 43162eaaa1bf9b95d9756626fc81a5aa5f82918a ("package/ibm-sw-tpm2: new package")
Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* added Fixes: tag pointing to the commit that introduced the issue as
  suggested by Thomas Petazzoni

 package/ibm-sw-tpm2/ibm-sw-tpm2.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
index 1f23bf7d83..abf2bd24ad 100644
--- a/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
+++ b/package/ibm-sw-tpm2/ibm-sw-tpm2.mk
@@ -11,12 +11,16 @@ IBM_SW_TPM2_LICENSE = BSD-3-Clause
 IBM_SW_TPM2_LICENSE_FILES = LICENSE
 IBM_SW_TPM2_DEPENDENCIES = openssl
 
+IBM_SW_TPM2_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS) -Wno-error"
+
 define IBM_SW_TPM2_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(IBM_SW_TPM2_MAKE_OPTS)
 endef
 
 define IBM_SW_TPM2_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(TARGET_CONFIGURE_OPTS) install \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src $(IBM_SW_TPM2_MAKE_OPTS) install \
 		DESTDIR=$(TARGET_DIR)
 endef
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
