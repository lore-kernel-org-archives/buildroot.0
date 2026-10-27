Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B77606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AaWBXSvw;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Varna9O5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93FF7605EA;
	Tue, 27 Oct 2026 15:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6p1lwyXqGZJZ; Tue, 27 Oct 2026 15:18:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11D76607BC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793114299;
	b=WqUIQeguPwh7C8AS2TL8Pxz17RZ4ps8mY+jN/LCWyKI62cWIQLZ/WEUctyzlg4+aMgia
	 pdS3tLEH0JIE6KnaAdY1toM7Kn7r8GxYjbeor+3mcNwdul3Zxg/sUvYn42Sqi87WHX8Ag
	 CSXvNYqv56wuMHvle0roAe89E2W5wE32Kg3wmDK8HMOrcZsQUBlsra0HQ1X9+4kYjvOI1
	 62Qe1tZ6HeSMGBy73pkAkISo/PLjC6DalesuGQt3zZLesGMCWl5T2hMko34gqkLC6Kcz8
	 kgWQ9dFHhubdVGs4kL6xyI7rm47gWeN2LEjQ/wJZU/cOZ2oORqib6NUXmJjBju4KZig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793114299;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5N5ClecCA/g927VyInICISHR5XUIRIvsFZezqaPJ674=;
	b=rYWCIJU91kkeoue4Sj/sF8yN0Y4VXkAYFk6ijVbGAystkU89BieftM/2LpFWsIMwlzvr
	 ufIetgIE47t8tHh/HywTolK/wT7Bf7trTfYkgU3Jc0eEjIZXKRPxVaBYiDHtWg9KfXYCL
	 RTWWsL2Vk/dTggGA/J2HA8g8hx+2VxQiJAB/O3JnPjNdiMiRGovKP09CUWW3L/9wCAQkQ
	 9iUPNP17RTtjMIevgSQFHJTlrDYBFw+K8x1YGyc5xMcgujmhTTDZO17dgYrNw4F1/JPVj
	 k8W0uoJCm8z+2+dwfvi44hYUzQVR6U9Pi7Zbuyy2yv/Kpqiv8pdPO5aRa/Bg8pbE7ZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Varna9O5;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793114299;
	bh=5N5ClecCA/g927VyInICISHR5XUIRIvsFZezqaPJ674=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AaWBXSvwCnHAgEda4k8gl/A74Ce+3QdX7ruxSP9eItf9FpQrhD7PFOUoLIXVXH+uZ
	 V5eG+eEVCF6VlYcQB1nbr1KRPFK2sJpyG0ucHL2nirKwVG9EL1S7LlwrXgF2aibfTO
	 3hjidMeEDrS4PnyAhCh0ionW+ucjtKFMOOF5bffqnODxCH8e9BUv1pHopX8vB4/9Sb
	 +6mWSrwsnvdOsJM2Yk0elRUdBXag5LM45AIRgjV/ob+QB6OuR+Mu+dkQlkQIT+XWrk
	 b4/rba1tlxyZWVp5NShTkmP1PI2DDy7x9EZPJkhQJQFc26r+dASlH2eNUJ1g4NVzJE
	 JFVl53z7Ow9Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D76607BC;
	Tue, 27 Oct 2026 15:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0814279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91B30607BC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0rAtjeuOSJA for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 15:18:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0612605EA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793114296;
 b=nd4ny1+9WqLAHHa428QQme1Q0ErU3bq66xGW3WmYmO/JcB2dNWWLmWadMwJu4vEaRVrN
 Ef/haH91mpK7NcK5Gm0UqubBGFEALS/34jNDNpBXkhc2dlfIYQWD2TBtufgRiJOs+jSj4
 Tc0UYAzljyHdeynZkhW0QTGEf0TJLKZ5r/euVuTUz4G/zNFeyZzN8Xh+rupvey9Jv364l
 1/1g6RRfs7JoNGMFRW/NFokC8DSUbtIlH6M7EnvP6LC7m1xC8brBmslZcvDzWu19NDeWE
 3ltKPbIGbV9saB9A8H/GjzDBZ2Vt9/jSdDxppfQlFRqGC0jO2k5pYcBID7VAUoVQ9AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793114296;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=vbbvEmB7gcoc9igBFCn1vn50+DXAGz6hKOCYmQDvCgE=;
 b=C5P2qyPTTd0WFWfhBciWyFRPgwiMnQsqjvMpEyQLFLAKqxXyBV1bVuXH6jlEd79F5kuq
 78wc4S8nforsYuABW4i0aYaSAJcngkr9eC8WUKvw67CEacxoMeRCFSPp2RVtQC7nDop2Y
 F4WW/xn6f8sp4J/vqMQWJfEeYl/+FDKbeg/VmAvsF+o3WQWvu7KU1aHnbkZ1LHANnHjXm
 KLHF8i2FohcgATiBqBo+C94VQ56wEQEaxLrDqzhQscCW0HNMWLPbMlOCEvk1uHwgWMTHV
 zog9lNiUy+UU4xiUbyB3tPIUuh1oADUtIl+K9bgmulu8vzFdLVAWItqic2BxY5uponA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=amarulasolutions.com;
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Varna9O5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Varna9O5
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0612605EA
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 15:18:14 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4a5720b0a57so6676585e9.0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1793114293; x=1793719093;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vbbvEmB7gcoc9igBFCn1vn50+DXAGz6hKOCYmQDvCgE=;
 b=Varna9O5IyeT9EeZhcJBW4zBdQ6NmnYEPcYXl7Gn3n3As6aFc4O9AeGZzDlCZFDNyU
 wxWtKuDV2QCpeDdU8WEiFgHc+qgMazQz/9u1Bc/aOXCeANI7swes7NqvY8O2AMS/I0Km
 UV+TSE/Jq7bwcspk5q8phl+npALjFl2Zxr0sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793114293; x=1793719093;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vbbvEmB7gcoc9igBFCn1vn50+DXAGz6hKOCYmQDvCgE=;
 b=ZTzlHnAkb0KfRTLr4zeu0kdKaEsVJN3ubwzONChIeukphx08YwQMJAmnb81d7p6NO4
 uNMsaHp+v5Efl7zeZBGHvJ68fOu8Zd4XvyGfobGUml2Xq1b1v1VOAm0KseW8ocLjiM3p
 ugTNm43Yl5Kbxl15SM0+86agCCCugEfi0E1vRFIvEYJtBq5vNjTxEyEVSXpzyrC4SBGI
 VkECcVTAWeOjc+ayN/plER/bB2fP+wIZ2KlfCSK6Wk3ZeisoQnDQHsrd/sLkpzBb+CgC
 oHJl0KGUPpGNIB8oHn1SFQ4dBoPeMVnKAGRqJHoE5i5PmuqXvWyG0qoetWJLXgo5IpHe
 0T7A==
X-Gm-Message-State: AFq9FYJ0M2KrVJ99KDD4yC+K1DIFZLwV61oSTzRdU5iONe+njX7SnMSd
 neKHsuNkvxrg1y6hdG0/Wtzs8O4ogQYbvvfpq88vDSqcWOttEHEwv1CcE1CerOrlxoU660tVoH4
 qL1vV
X-Gm-Gg: AYBFou2H2bu8wlLQ12r9bzXKeXt+vAcvTQD9Lze/MMFNJVTn+VIyYKMCh3UJfhczHX5
 wAY+h+ho8TYx8pwTiz1zTvGqo6icisspSh5P/GE/8pUYFgYCoVcwU69Zmei+I/SfT3fQFb+s4UC
 20p9xu0foKSeZirGgwf8PlSbn5Axg/ad5dmD+uNeBHpAXmDUrJsMFC33fKnQ79nd7RizGnoPI3E
 JLsTeauzYi3qqrOnR5pIaWxLUvVpW+MHY1fWetZ/KN1h7MbCfkZWnaImyOAUXD9N+e0uokCX+qu
 zE8iP5RghUCm9xzAoY+lDSRjOvxi55DDfZY9jAlMeXbY9e0/S6KRNaRc/rKZnOhW+30CADJrW+q
 gMHSvkNMHqBx/g8tkd+frDartc1Ep8MT2yP6cInBUO/VqJsGctCUKbPGbg70fMMxhbZcoVz5+yE
 UgiAsFP2slR1onRGPbPKV9/nAYZHpz0uwT3XF4X1AZzvObzUNe2XNIMmaZYhmkjjMGEHBaW5QEl
 Cgpe1FBs1Pr9KIsc4BiHDNn2RYe3dBP9kd9jCsImQ881wNwMLjdc9C13o5BwlpQ7bWOdinCT8vj
 0lfwiC5D934x0nxG8uLZ5G8rcvVzF5mf2leaF2jElRVZi7AHB5FRUms/FQkc9QdDHLjnvVrrIFK
 w+VIWFHASCePvOmJrySjuesaMcpbNcHJJVTiF+Q6avb25l4Ufv05s
X-Received: by 2002:a05:600c:3c98:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4a7c1c845a2mr67488075e9.16.1793114292645; 
 Tue, 27 Oct 2026 08:18:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a09434esm271074635e9.0.2026.10.27.08.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 08:18:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 27 Oct 2026 16:18:09 +0100
Message-ID: <20261027151809.1110228-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/drogon: fix CVE-2023-26137 and
 CVE-2023-26138
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All drogon releases, including 1.9.14, are affected by two CRLF
injection vulnerabilities, which upstream has fixed but not released
yet.

- CVE-2023-26137: HTTP response splitting when untrusted input is used
  to build header values in addHeader() and addCookie().
  https://www.cve.org/CVERecord?id=CVE-2023-26137
- CVE-2023-26138: CRLF injection when untrusted input is used to set
  request headers in addHeader().
  https://www.cve.org/CVERecord?id=CVE-2023-26138

Backport the upstream fix, which rejects CR and LF characters in header
and cookie values, both in responses and in requests sent by
HttpClient.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...01-Fix-CVE-2023-26137-CVE-2023-26138.patch | 357 ++++++++++++++++++
 package/drogon/drogon.mk                      |   3 +
 2 files changed, 360 insertions(+)
 create mode 100644 package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch

diff --git a/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
new file mode 100644
index 000000000000..0b8e93df8731
--- /dev/null
+++ b/package/drogon/0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
@@ -0,0 +1,357 @@
+From 3c068bd888c332b9a155ba45a102d5faba643211 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <45538935+passgat@users.noreply.github.com>
+Date: Tue, 27 Oct 2026 07:49:45 +0100
+Subject: [PATCH] Fix CVE 2023 26137 CVE 2023 26138 (#2630)
+
+CVE: CVE-2023-26137
+CVE: CVE-2023-26138
+Upstream: https://github.com/drogonframework/drogon/commit/3c068bd888c332b9a155ba45a102d5faba643211
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+---
+ lib/inc/drogon/HttpRequest.h          |  5 +++-
+ lib/inc/drogon/HttpResponse.h         |  8 +++--
+ lib/src/HttpRequestImpl.h             |  6 ++++
+ lib/src/HttpResponseImpl.h            | 10 +++++++
+ lib/src/HttpUtils.cc                  | 41 +++++++++++++++++++++++++
+ lib/src/HttpUtils.h                   | 15 ++++++++++
+ lib/tests/CMakeLists.txt              |  1 +
+ lib/tests/unittests/HttpHeaderTest.cc | 43 +++++++++++++++++++++++++++
+ lib/tests/unittests/HttpUtilsTest.cc  | 41 +++++++++++++++++++++++++
+ 9 files changed, 167 insertions(+), 3 deletions(-)
+ create mode 100644 lib/tests/unittests/HttpUtilsTest.cc
+
+diff --git a/lib/inc/drogon/HttpRequest.h b/lib/inc/drogon/HttpRequest.h
+index 2ffd4fc4b9b1..e27a0023a22f 100644
+--- a/lib/inc/drogon/HttpRequest.h
++++ b/lib/inc/drogon/HttpRequest.h
+@@ -148,6 +148,8 @@ class DROGON_EXPORT HttpRequest
+      * @param field The field parameter is transformed to lower case before
+      * storing.
+      * @param value The value of the header.
++     * @note The header is ignored if the field or the value contains CR or LF
++     * characters, to prevent CRLF injection.
+      */
+     virtual void addHeader(std::string field, const std::string &value) = 0;
+     virtual void addHeader(std::string field, std::string &&value) = 0;
+@@ -468,7 +470,8 @@ class DROGON_EXPORT HttpRequest
+     /// For example, "content-type: text/plain\r\n"
+     virtual void setCustomContentTypeString(const std::string &type) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
++    /// LF characters.
+     virtual void addCookie(std::string key, std::string value) = 0;
+ 
+     /**
+diff --git a/lib/inc/drogon/HttpResponse.h b/lib/inc/drogon/HttpResponse.h
+index f949bd0b033f..e0b1c1678b52 100644
+--- a/lib/inc/drogon/HttpResponse.h
++++ b/lib/inc/drogon/HttpResponse.h
+@@ -264,15 +264,19 @@ class DROGON_EXPORT HttpResponse
+      * @param field The field parameter is transformed to lower case before
+      * storing.
+      * @param value The value of the header.
++     * @note The header is ignored if the field or the value contains CR or LF
++     * characters, to prevent HTTP response splitting.
+      */
+     virtual void addHeader(std::string field, const std::string &value) = 0;
+     virtual void addHeader(std::string field, std::string &&value) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key or value contains CR or
++    /// LF characters.
+     virtual void addCookie(const std::string &key,
+                            const std::string &value) = 0;
+ 
+-    /// Add a cookie
++    /// Add a cookie. The cookie is ignored if its key, value, domain or path
++    /// contains CR or LF characters.
+     virtual void addCookie(const Cookie &cookie) = 0;
+     virtual void addCookie(Cookie &&cookie) = 0;
+ 
+diff --git a/lib/src/HttpRequestImpl.h b/lib/src/HttpRequestImpl.h
+index 1b397b7f12fc..39fb868739d4 100644
+--- a/lib/src/HttpRequestImpl.h
++++ b/lib/src/HttpRequestImpl.h
+@@ -462,6 +462,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addHeader(std::string field, const std::string &value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         transform(field.begin(),
+                   field.end(),
+                   field.begin(),
+@@ -471,6 +473,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addHeader(std::string field, std::string &&value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         transform(field.begin(),
+                   field.end(),
+                   field.begin(),
+@@ -480,6 +484,8 @@ class HttpRequestImpl : public HttpRequest
+ 
+     void addCookie(std::string key, std::string value) override
+     {
++        if (!isValidCookie(key, value))
++            return;
+         cookies_[std::move(key)] = std::move(value);
+     }
+ 
+diff --git a/lib/src/HttpResponseImpl.h b/lib/src/HttpResponseImpl.h
+index beebe7fa8db2..f28d43b338b9 100644
+--- a/lib/src/HttpResponseImpl.h
++++ b/lib/src/HttpResponseImpl.h
+@@ -193,6 +193,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addHeader(std::string field, const std::string &value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         fullHeaderString_.reset();
+         transform(field.begin(),
+                   field.end(),
+@@ -203,6 +205,8 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addHeader(std::string field, std::string &&value) override
+     {
++        if (!isValidHeader(field, value))
++            return;
+         fullHeaderString_.reset();
+         transform(field.begin(),
+                   field.end(),
+@@ -215,16 +219,22 @@ class DROGON_EXPORT HttpResponseImpl : public HttpResponse
+ 
+     void addCookie(const std::string &key, const std::string &value) override
+     {
++        if (!isValidCookie(key, value))
++            return;
+         cookies_[key] = Cookie(key, value);
+     }
+ 
+     void addCookie(const Cookie &cookie) override
+     {
++        if (!isValidCookie(cookie))
++            return;
+         cookies_[cookie.key()] = cookie;
+     }
+ 
+     void addCookie(Cookie &&cookie) override
+     {
++        if (!isValidCookie(cookie))
++            return;
+         cookies_[cookie.key()] = std::move(cookie);
+     }
+ 
+diff --git a/lib/src/HttpUtils.cc b/lib/src/HttpUtils.cc
+index 5cfcbb7d2566..cd33975c1df1 100644
+--- a/lib/src/HttpUtils.cc
++++ b/lib/src/HttpUtils.cc
+@@ -14,6 +14,7 @@
+ 
+ #include "HttpUtils.h"
+ #include <drogon/utils/Utilities.h>
++#include <drogon/Cookie.h>
+ #include <trantor/utils/Logger.h>
+ #include <map>
+ #include <unordered_map>
+@@ -740,4 +741,44 @@ const std::vector<std::string_view> &getFileExtensions(ContentType contentType)
+     return it->second;
+ }
+ 
++static bool containsCRLF(std::string_view str)
++{
++    return str.find_first_of("\r\n") != std::string_view::npos;
++}
++
++bool isValidHeader(std::string_view field, std::string_view value)
++{
++    if (containsCRLF(field) || containsCRLF(value))
++    {
++        LOG_ERROR << "Header '" << field
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
++bool isValidCookie(std::string_view key, std::string_view value)
++{
++    if (containsCRLF(key) || containsCRLF(value))
++    {
++        LOG_ERROR << "Cookie '" << key
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
++bool isValidCookie(const Cookie &cookie)
++{
++    if (!isValidCookie(cookie.key(), cookie.value()))
++        return false;
++    if (containsCRLF(cookie.domain()) || containsCRLF(cookie.path()))
++    {
++        LOG_ERROR << "Cookie '" << cookie.key()
++                  << "' contains CR or LF characters, ignored";
++        return false;
++    }
++    return true;
++}
++
+ }  // namespace drogon
+diff --git a/lib/src/HttpUtils.h b/lib/src/HttpUtils.h
+index 16a6c21732d2..53f2c13cff53 100644
+--- a/lib/src/HttpUtils.h
++++ b/lib/src/HttpUtils.h
+@@ -21,6 +21,8 @@
+ 
+ namespace drogon
+ {
++class Cookie;
++
+ const std::string_view &contentTypeToMime(ContentType contentType);
+ const std::string_view &statusCodeToString(int code);
+ ContentType getContentType(const std::string &fileName);
+@@ -43,6 +45,19 @@ inline std::string_view getFileExtension(const std::string &fileName)
+ 
+ const std::vector<std::string_view> &getFileExtensions(ContentType contentType);
+ 
++/// Return false (and log an error) if the header field or value contains a CR
++/// or LF character, which are not allowed in HTTP field names and values
++/// (RFC 9110, section 5.5).
++bool isValidHeader(std::string_view field, std::string_view value);
++
++/// Return false (and log an error) if the cookie key or value contains a CR or
++/// LF character.
++bool isValidCookie(std::string_view key, std::string_view value);
++
++/// Return false (and log an error) if the cookie key, value, domain or path
++/// contains a CR or LF character.
++bool isValidCookie(const Cookie &cookie);
++
+ inline const std::vector<std::string_view> &getFileExtensions(
+     const std::string_view &contentType)
+ {
+diff --git a/lib/tests/CMakeLists.txt b/lib/tests/CMakeLists.txt
+index 10f42ede1693..514e8692e74e 100644
+--- a/lib/tests/CMakeLists.txt
++++ b/lib/tests/CMakeLists.txt
+@@ -13,6 +13,7 @@ set(UNITTEST_SOURCES
+     unittests/ClassNameTest.cc
+     unittests/HttpDateTest.cc
+     unittests/HttpHeaderTest.cc
++    unittests/HttpUtilsTest.cc
+     unittests/HttpResponseSwapTest.cc
+     unittests/HttpClientTimeoutTest.cc
+     unittests/MD5Test.cc
+diff --git a/lib/tests/unittests/HttpHeaderTest.cc b/lib/tests/unittests/HttpHeaderTest.cc
+index d10c8887e5f1..940622989b07 100644
+--- a/lib/tests/unittests/HttpHeaderTest.cc
++++ b/lib/tests/unittests/HttpHeaderTest.cc
+@@ -16,6 +16,21 @@ DROGON_TEST(HttpHeaderRequest)
+     CHECK(req->getHeader("abc") == "");
+ }
+ 
++DROGON_TEST(HttpHeaderRequestCRLFInjection)
++{
++    auto req = HttpRequest::newHttpRequest();
++    req->addHeader("X-Test", "abc\r\nX-Injected: 1");
++    req->addHeader("X-Test\r\nX-Injected", "abc");
++    req->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
++    CHECK(req->getHeader("X-Test") == "");
++    CHECK(req->getHeader("X-Lf") == "");
++    CHECK(req->headers().empty());
++
++    req->addCookie("key", "value\r\nX-Injected: 1");
++    req->addCookie("key\nX-Injected: 1", "value");
++    CHECK(req->cookies().empty());
++}
++
+ DROGON_TEST(HttpHeaderResponse)
+ {
+     auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
+@@ -37,6 +52,34 @@ DROGON_TEST(HttpHeaderResponse)
+     CHECK(resp->getHeader("abc") == "");
+ }
+ 
++DROGON_TEST(HttpHeaderResponseCRLFInjection)
++{
++    auto resp = std::dynamic_pointer_cast<HttpResponseImpl>(
++        HttpResponse::newHttpResponse());
++    REQUIRE(resp != nullptr);
++    resp->addHeader("X-Test", "abc\r\nSet-Cookie: injected=1");
++    resp->addHeader("X-Test\r\nX-Injected", "abc");
++    resp->addHeader("X-Lf", std::string("abc\nX-Injected: 1"));
++    CHECK(resp->getHeader("X-Test") == "");
++    CHECK(resp->getHeader("X-Lf") == "");
++    CHECK(resp->headers().empty());
++
++    resp->addCookie("key", "value\r\nX-Injected: 1");
++    Cookie cookie("key", "value");
++    cookie.setPath("/\r\nX-Injected: 1");
++    resp->addCookie(cookie);
++    cookie.setPath("/");
++    cookie.setDomain("example.com\nX-Injected: 1");
++    resp->addCookie(std::move(cookie));
++    CHECK(resp->cookies().empty());
++
++    resp->makeHeaderString();
++    auto buffer = resp->renderToBuffer();
++    auto str = std::string{buffer->peek(), buffer->readableBytes()};
++    CHECK(str.find("injected") == std::string::npos);
++    CHECK(str.find("X-Injected") == std::string::npos);
++}
++
+ DROGON_TEST(ResponseSetCustomContentTypeString)
+ {
+     auto resp = HttpResponse::newHttpResponse();
+diff --git a/lib/tests/unittests/HttpUtilsTest.cc b/lib/tests/unittests/HttpUtilsTest.cc
+new file mode 100644
+index 000000000000..182b10000d61
+--- /dev/null
++++ b/lib/tests/unittests/HttpUtilsTest.cc
+@@ -0,0 +1,41 @@
++#include "../lib/src/HttpUtils.h"
++#include <drogon/Cookie.h>
++#include <drogon/drogon_test.h>
++using namespace drogon;
++
++DROGON_TEST(IsValidHeader)
++{
++    CHECK(isValidHeader("X-Test", "abc"));
++    CHECK(isValidHeader("X-Test", ""));
++    CHECK(isValidHeader("X-Test", "a: b; c=d"));
++    CHECK(!isValidHeader("X-Test", "abc\r\nX-Injected: 1"));
++    CHECK(!isValidHeader("X-Test", "abc\r"));
++    CHECK(!isValidHeader("X-Test", "abc\nX-Injected: 1"));
++    CHECK(!isValidHeader("X-Test\r\nX-Injected", "abc"));
++    CHECK(!isValidHeader("X-Test\n", "abc"));
++}
++
++DROGON_TEST(IsValidCookie)
++{
++    CHECK(isValidCookie("key", "value"));
++    CHECK(isValidCookie("key", ""));
++    CHECK(!isValidCookie("key", "value\r\nX-Injected: 1"));
++    CHECK(!isValidCookie("key", "value\n"));
++    CHECK(!isValidCookie("key\r", "value"));
++
++    Cookie cookie("key", "value");
++    cookie.setDomain("example.com");
++    cookie.setPath("/");
++    CHECK(isValidCookie(cookie));
++
++    cookie.setValue("value\r\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++
++    cookie.setValue("value");
++    cookie.setDomain("example.com\r\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++
++    cookie.setDomain("example.com");
++    cookie.setPath("/\nX-Injected: 1");
++    CHECK(!isValidCookie(cookie));
++}
diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 03cba45ceb34..7850d754dc6e 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -12,6 +12,9 @@ DROGON_LICENSE = MIT
 DROGON_LICENSE_FILES = LICENSE
 DROGON_INSTALL_STAGING = YES
 
+# 0001-Fix-CVE-2023-26137-CVE-2023-26138.patch
+DROGON_IGNORE_CVES += CVE-2023-26137 CVE-2023-26138
+
 DROGON_DEPENDENCIES = jsoncpp util-linux zlib
 HOST_DROGON_DEPENDENCIES = host-jsoncpp host-util-linux host-zlib
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
