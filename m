Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9E5606A321
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cavT4xxQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=bhMTK74d
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CF480E64;
	Tue, 24 Nov 2026 17:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhxonVKUu2i7; Tue, 24 Nov 2026 17:24:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 70F2580F5F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795541062;
	b=dbfSVTYWcxSv45cx9M4blJoSMGUZMXG8ugczdmR7MW8Yo6RhVWRIBIy/TJzjnRFh7DDZ
	 A15avUAA0mGUsCzQU3KV1P3VpyG+gg58I/zixeB/8Mv2oAPPTDe5bgY3v+gofyulNyHvI
	 wpWUAhTMisWvPBT1jqZY4OE5YTbEx0NWmNrapdtkUtUEzUvblARM7D5lNA+foHq3yh223
	 6eSvEi4U757XWTTjoFUaEmBvVvpViXDequwa4Q5mAt70/ELrbhe+b3m3H0chz8B5vBT1i
	 tE0QabF2WFzVzj3d91j2YO+tL97hpwKKnXx4z8xQkTx7o8JInLS0yM3JUi0l9+snKog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795541062;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=D6cU4Z/a1YqTG1r1wpn1ncEwRBhLdA1vggI3HKDQ1mw=;
	b=Ln7J9Bf54h1u1i+AzMzoai1fdakZvPvgHrb4+zj/pziE1vZA1LOlq28sb1CbDB1MY3tB
	 8S+7XVHFydM+hQjyrgax0PoJzt77m50kfta9k8TufDp19Q0YiWTkcWaSgBo0Eh5ZbWkeJ
	 40TWcaqumr4Qx4V64A1OowD9aLOdxOvEp3CF9AB3CiqAwmK37gIn/8ECWCACkxy6DyEUK
	 +8lvqp8fpmYAlP1EV/U7NoByG9FXaXedqGA+M16uIqIf29GN+wKpo7D8I1L2u37IuMm9u
	 xJcA2ztIaPdgFhtEyfE8GMyasB1n0X+GxlGNiNuy870OBMXAqcX4coI4G/YGPmE6oOA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795541062;
	bh=D6cU4Z/a1YqTG1r1wpn1ncEwRBhLdA1vggI3HKDQ1mw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cavT4xxQxspdioMcncIK6H9NtABxwQur0QdEpV8XBPr9l5fSCzXUYZcGTPHJR7FRg
	 p5wERBWhy9riMcUVA6jk/DlO1jGEu6oTL45hNneAYFfauFTssfdmzvTayjiTAthvAJ
	 oHQbY6YI5ewaLjojLBW2PrgbAYd6d+y057VnH0iNfB+k9BFpJsT5uDSDk031XvB2GT
	 7W+VuJ28OsldRO49Yq9ZLybFb2nyumlpRo04YyLB24hwaI/4cBLKT+/CT6l6MYP55I
	 8oMXjVPGQR/ThrdJCPjJdt0/dCI7o3cW1EdrB+x/N9jJG9KPmy4K6FdDtpwuoh1kwS
	 VS7vBQ32KHGsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F2580F5F;
	Tue, 24 Nov 2026 17:24:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60739FBB
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50404405A7
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id plbPfymc0la4 for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 17:24:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD56B4057D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.117
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=bhMTK74d
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD56B4057D
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 17:24:12 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VuFWxuCuSmlDxVuFWxzVMf; Tue, 24 Nov 2026 18:24:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795541050; bh=AGKKdRf+I1GC3JRq57BYchuxUfvVknkG0rWl8pr3VOQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bhMTK74dMpPlISr9wtCTxbsArKspmAgi+KLX7ypPIjEddQB+wiBGh7B1RgnC3jHKL
 tw4K6+3pVv2GiZ+OQzkK9PrqdA/4n3p+xGXTpKw79EF75FWlDd4bdQSsGyZTBYsrDo
 4AtjwLUuCcqmjwcaaghb0AVtuJ5V8XAm3G9NlcgpjDOj3BnA3YJRGbXJHTYbxNIHm/
 X6/DdyaByo+Mpi+6yT0Ovql1RgV/hLHwaugRRtG1RZUX52aNKy+mY4hf62uGXQApqz
 QxKfv9szFi/8ZJPXZaPB4Gdo+9Gc0nTLs70Ki45H1OVkWmIFG863h4WcgegTx1SyM3
 cAfsRRVOJZXyw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Philippe Reynes <philippe.reynes@softathome.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 24 Nov 2026 18:24:10 +0100
Message-ID: <20261124172410.1613810-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfO/4WU6izzGnY0TfljlUIrHhjZqxt8CmUlVXHJaOSMbMPq8ZxclGHdkLcYBKEI0iRD6m4XmZC1zF6KIGYUoJg3T+d8E7TD6q6vsXXy7cvX9mVlQj8/dM
 uHCizfVmfF8HVYfzDoJBqAhm1J/VmP2JayhXNUySefHqP3xFQI5sIfYB/g+x8Vvuv58laZuAc6syQ82dgoooHCsnRjZ+RPbIsATPFp7BbVbGJ3DiC0N0oISk
 R5l51GsyPtPT/tKRAS3uOY1YDA/wgKFK3f20DdhsXtVmBUOgX5+j6gv4/HCp2PI/yMveP83QKa7vIQPPMhJdw9yPETKuPpFYijmW2Uuj7k8=
Subject: [Buildroot] [PATCH] package/ibm-sw-tpm2: disable -Werror
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

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
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
