Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7BE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 31 Oct 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Se4a+GQ7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL1wj+6c
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06254406A0;
	Sat, 31 Oct 2026 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et_BD2Bvttb8; Sat, 31 Oct 2026 20:19:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 175AD4069F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793477983;
	b=SLBj60HF9dw/+s41xTtQFC6Qs0Ynytxnzhu6H4cc2SZGznokkhUNzmxSTwm4J2D4oXnf
	 cLCaWqoMv4j7+lKXnJbDUSevDESDcwoMUhzj1uvMambNpK8PRNZuaHbW/ygT1u+MScX5S
	 Kyqf9xQHny1091d5IxD0LK3nOx6unw0iF9N7nbOcsQoZDSt7EIAXxsYuhm7pfZ+3gxCZT
	 9TodUSrrEJ3wd/SsZF5vMc7GByD3sB99+gBeET/3SRKpRKWMQvSN4NaWsAMrIUwx08HnQ
	 3kVbdgPvHzRGzJH+UH2sslZxhC1EIS0wnRgsuRo9jLEXsZcOZP5UjYq0aVR4VILySGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793477983;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=s6SPU0EEmKa+1ioZBG7kjuzsBYUMui5l4RijCZfe0hM=;
	b=lTtBHb8Ov4DltIGT1WF5wU8lsi9C5Qm+ay25A/0Ydk9476ZsetEc4jsc9gTSaCrJKy4m
	 JLukVtQ2u5cOtksZs7D/bGg8fXEXm8JGlmwazm8XsMR2sivkYfMZsyFd/fAqbFDX73gm0
	 5yhsTuEu/w/LFkwNVqy/yj5h80e9MimDa+mCIEtzinm8CIVMEBDBTLpN/s4M8eyBI3Owk
	 sx6qCYEMcpcJ9GqbTBNe8rLuLx05MPGxD5tKfzZ6dq8lO5FTZti5lyh+gxd4nyUwg5je5
	 m6E/MQiI3pipTLmhqrkLRWIB5BjOWWa9LPL5dljFzACerg+OiXHl63U9bp/qOM+aGuA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pL1wj+6c;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793477983;
	bh=s6SPU0EEmKa+1ioZBG7kjuzsBYUMui5l4RijCZfe0hM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Se4a+GQ7WCVkf1OSxuSCx7k40e+ew1ccW2yLgJLOiDaB7sF8Hq6CVOdzSyLCBrGwi
	 Yi35IMVcJ/ObHUzcNf2O3aENlo8o9E62I52hwqxe6U2E2sobhGvLivU59BWkkgzrRP
	 d3GlQtn6vCTt+yRMHzpQzKYGJNF56H1mxZoqjO0SrMGXeB1lqVRDcg6tP+6lSqgcsQ
	 XMexDORu+5Nm2TIKl7azYDrNmZCadKwHSaSNzXm+5GXAKFjuDdcdqolDiqXQemC75H
	 MkCIlNpvUn9oKe7VamO4OPvt5O+srsxhSsXGdyeKojiq9f6M6uXUWJj943eyfoCWzF
	 KW8Mwuod5jYrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175AD4069F;
	Sat, 31 Oct 2026 20:19:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46D9A411
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36F6E4064B
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLztCc2KAtyr for <buildroot@buildroot.org>;
 Sat, 31 Oct 2026 20:19:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 460054069F
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793477977;
 b=oPDOFNqfCJnfxowXwu6msySPc6cYcm5xVP2VuhnP+1SicUQbQRGwoT4Oq4uIctdwqwUG
 mCOAKc+GfZlwLlI65bLUUzL8NI5eksXpvk1nUENaxdmpcA1bcvuFRfNV3D7ttpmmQE9Qp
 A3fNEvKSXAO6LlNrBy9/HWHSR2/DTADO5NcZsJs2FTtbSYNoUFV110H1M07H3NDNxICZl
 IHqik+xqRiFphPOkst8s9sGEMhbTZ7D8CPjCMQsDylOzw9xlxeUprvERLXrcPomfWYZRt
 2cEWyySPnGEynEhFIHqj3bzd0fUE0tPoDuHBg//vVBQjkddfHxH2+Yg4CbVGFJFKA8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793477977;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=rgdegS7rmlUNPrF2Xkot19ohMUkVNUQ++7wRfGZlbMA=;
 b=gQWEoU9pxD2lS6DpUN8dwbZ6Arvq2Bb8C1iMvWm+XjY+d4aYe4wgP41++o/ThrogTHLN
 9v/koeCcoAZtbaAxlf1Ebtpi5QaCUirNpQ2OCIPcQNqNAjGaw9FvJqv6vap+9sbYsqV7n
 AEwBIi3mCmb0UGBXn87ClWEQadESihHrDjdrJwKzpItOX5XvGxj3RK2vqwSxtfT3bGiPH
 ALdz0KLLbbgbPv/BZg4FRtla78WMBiRQurHreT/mXVMw+BIYhicH8SJxaxjU4DtO2iVyg
 ggq/L9r6zROLrgyq8WOpZgqZi0B6wvIxgvY0spAz89E92I0fLBO8U88fvqgWApZ8tYQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=pL1wj+6c; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=pL1wj+6c
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 460054069F
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 20:19:36 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-6aa9606ddadso1459119eaf.0
 for <buildroot@buildroot.org>; Sat, 31 Oct 2026 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793477976; x=1794082776; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=rgdegS7rmlUNPrF2Xkot19ohMUkVNUQ++7wRfGZlbMA=;
 b=pL1wj+6cCktFI8I75RxhzPhw+pQbSyOaF/uCtt4PclByB5srSSrH3MOP46lzIV/+0U
 XpkdnJUBhcqcai3GvHU/3Zaas4GE1+GIudOgx9xKaY8P86xgU6DxaIkB3SZjMWSzS1jH
 lyKJWbyPR9EV1JyZPDW9FUBmZ2PpMOOZEJmv6bAnW81yR5Zt1UiNMB1h0AXhwef1Cktk
 GM02YFkav1kkjYzVQLOMsaibVhSOTgj3fNdtON88sCBkcjI6pNfhuambJyCJ/vVTrslm
 dMI68XUx5g23ch5Vb71Uv9ooahrZUJg9W11Jq9WmKvRRBO0nlbgW89nniT4DuekqN8Ju
 ckUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793477976; x=1794082776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rgdegS7rmlUNPrF2Xkot19ohMUkVNUQ++7wRfGZlbMA=;
 b=S5MqHeWeTjjSLZTTOoPJ06da//VyAtel8yIrNhjNQZrsxwwiDjhyDEqp2UUemK48H6
 yuTPFhW2pakwSRn0eQ/7DbXtsDTD75HAeTbqwTQm4+XzRAaDRr9Hgik6H45n4P6TnvzW
 XkXDFImbhz6/BBLzeYY8CLOKTik9r/miCUN2knJ1MXm87sKiKjpTjYvTR0uUxwjG7z97
 OYKVKAQ4jSkEI5147VOK0+S9QOvUFwGBOuzfudx1Xwl+DCzRMLT2QV4Wnu+EWnrpAqeb
 m9LqstcD+QCWYeElcn0lro6rzz935utd/huSyl8GNXd1RHtfeV8tERSa5oh7ysfHB5Nf
 ORFg==
X-Gm-Message-State: AFq9FYIk/jk1oMuX5N8TUX2UX3KjGQbiJHeWV3MMNcr/bmHzvtSTm6Re
 ru0Pwz+NK8nQualegzFlyf7UzwyjWsKgTpUUqLs3DvTEFxw+fWlWq/RrkeGDuw==
X-Gm-Gg: AYBFou0uUrJIGWBIZZ808WhXF9ITtKl8dIj7i2rFVCxp5QwQHNbl2ZqyumkYGdcewOX
 IHGBIV1hlYU1r2UHMwWJW0jyRQvL3Bvaru/iDqoyilyIAx0G6KAl5kSyKiCGlaCe6BzwUbAnOgt
 d15wHiuQwN+feAFsdyPMWmK7s65xhLrbhcaK+x6sisCTIOBOVGoW/N/bM580mhbyA4h/byZonyz
 ZlvyIDHGGYscK2GaYKL+cP+XYKFyW2RcpektPr9ZfQIAbY4HI8fpPidXxlhV5v8f2u11RbNsLc4
 Ug/yacUH8hzK3XG1HnUOWGpoMgpw+bpWD5quqNgx2tDMr4KhffIMepB6+1GGGHyKFdZGsV4ptUG
 UZ0w6G1q264u1ErX2x8orQJMPI1UsI8dgn98q24AdsTRcqpJHKY44SypNPXrTQ1Bjywib9ACNJI
 bRCDremAxsMbB1ydiW9bFnKxKgnxlrbSPaTTd5VT8OW3m6/B2aNmGPZid/2JJahEGY1Ii02TzMf
 FyHFYyHMGGrsMfR/zRG1ZibPiG8SxF09YnEOSGOd64VU+06l+Zge1C/a5GTdXovf504E7sddN8F
 TXROT7vdMzfaKUd+vB9ye1E4UCTmf7REFnur6i8j5oH4oVTyGOurPN3hYk6K4AIARpYJsF0IcJb
 mv8AlK9V2Crlhnr6IxA9lKQW9FWO7B6wve6XsVcEGQrJepAA/pqhLvBvuhsu0NtO4dJ5BZ+VgaE
 9PUziwQztarKUKQO/CZ6wokmAt+YfcTArvzryphAyS+RvaEkWLswXWGxAdJwtDh8S/GSTXUMHgh
 g==
X-Received: by 2002:a05:6820:1614:b0:6f8:e2ac:ecd2 with SMTP id
 006d021491bc7-714f29bf3b4mr3522614eaf.33.1793477975809; 
 Sat, 31 Oct 2026 13:19:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a9218e97b0sm2998133fac.4.2026.10.31.13.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2026 13:19:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Oct 2026 14:19:10 -0600
Message-ID: <20261031201918.2850153-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-watchdog: bump to version 7.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the COPYING hash for the copyright year updates:
https://github.com/gorakhargosh/watchdog/commit/f3e78cd4d9500d287bd11ec5d08a1f351601028d
https://github.com/gorakhargosh/watchdog/commit/c556f8c26c73dcc411126d8878044897645b1878

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-watchdog/python-watchdog.hash | 6 +++---
 package/python-watchdog/python-watchdog.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-watchdog/python-watchdog.hash b/package/python-watchdog/python-watchdog.hash
index 508cf88b27..8026ead945 100644
--- a/package/python-watchdog/python-watchdog.hash
+++ b/package/python-watchdog/python-watchdog.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/watchdog/json
-md5  d3adf236e17e5747e397f7d0b93e05b4  watchdog-6.0.0.tar.gz
-sha256  9ddf7c82fda3ae8e24decda1338ede66e1c99883db93711d8fb941eaa2d8c282  watchdog-6.0.0.tar.gz
+md5  f557f9f886650d23ee3e5ba12ad54ad9  watchdog-7.0.0.tar.gz
+sha256  128583e0ffa0e5c0531f9f37e2e24be1e7b0503561f6aa8b0aac5a1d646e2bf2  watchdog-7.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  39f081828db6f94c70123fa4fb30c1bce3e215a8fdece53a49991fe076a69c08  COPYING
+sha256  8dfd87df299f156db7dd6387dd025f914568419b10db3e074d224e67d7621d2d  COPYING
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-watchdog/python-watchdog.mk b/package/python-watchdog/python-watchdog.mk
index 888cce6e1a..72d38e597f 100644
--- a/package/python-watchdog/python-watchdog.mk
+++ b/package/python-watchdog/python-watchdog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WATCHDOG_VERSION = 6.0.0
+PYTHON_WATCHDOG_VERSION = 7.0.0
 PYTHON_WATCHDOG_SOURCE = watchdog-$(PYTHON_WATCHDOG_VERSION).tar.gz
-PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/db/7d/7f3d619e951c88ed75c6037b246ddcf2d322812ee8ea189be89511721d54
+PYTHON_WATCHDOG_SITE = https://files.pythonhosted.org/packages/92/68/6477c65315fd5b58ea5c7fbfe871c3ca6e5ec951be6c48c2f5fe8ee5e34d
 PYTHON_WATCHDOG_SETUP_TYPE = setuptools
 PYTHON_WATCHDOG_LICENSE = Apache-2.0
 PYTHON_WATCHDOG_LICENSE_FILES = LICENSE COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
