Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE3606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 01:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qdYJAwhj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ACvtYebi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B7D940355;
	Tue, 27 Oct 2026 01:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK_-nKAWh6Xx; Tue, 27 Oct 2026 01:58:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A40C4037D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793066326;
	b=pS9nAvHbqeCQ07uVa3TFF+Rb5luTDJqaNAlByur+SgLTrSgZvisuFYRncd3Eqy9Js4E0
	 wE0MQdRf5BF2sBLAmwF7FMB39HEGq/+sub2cAe43C7r3QrQF65s+dd3vlpo9Kwd/Yb1Ry
	 mNnzvlwG+jLH7RyO+NXp6GaHcdMZ4gX3Lq/APQILu6J0/7dHQbIzKQ5PKz9zJwae0CM1T
	 BSYrPn+85TnYZoLG5E/j0qwYQQxd4rMvzqGxWnDJoMdeADnhGtepoyqPnM/w279o5gLsb
	 LF07kTUJNBgdJfuCjooZDodZBDlO+fd2VIMa6m6qPLDMyvCFYN4/Pf3g6B8VpDvA2hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793066326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QxhR9B7+ZLM+XtzT2CoXv/gpzyffNbeGWolLDzWUWjg=;
	b=ADTncHlilyvGuJIbH8lxjpXecFJNouCEccNJ3CQ7iD93dRgEPyQtB90CZ4L3JtQHaDHS
	 nqPuU1LoW78kXcA0ePVxouMBqfUhwLnNlgogo/L77VTyjb7Khn678UEDAJpF6R0er+Tl2
	 VnBLnIzAtyx8DccJBZaytbp30mC8BzQF25BYKparBDB4FSjKzluGoxdOAN8QBUb98ZnDB
	 eAVKzYmr3Ly0flk5MjXmuxwyTXxaKQsGaX3Ymj2XDsjzOqAUy0peI1xfTM3Ap0qx+MvCZ
	 UDtbIEXKiuMot9WeF3HcBK86g9flcKRc8EpwqtNHq2mjVbYimHPgvg/z/8FLOT2bQOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793066326;
	bh=QxhR9B7+ZLM+XtzT2CoXv/gpzyffNbeGWolLDzWUWjg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qdYJAwhjxiUlVISZtWKYJcPsIbNuB8FvXgSDvKi3qpMRm0tKt24xxNwZ8dlsUTUot
	 EAwkPUskMe2kJVOiAfV0uW39JsX9Wsiw2TgQEwZiRrQqe8zngPtvASfufpFXHBtJCt
	 COqOjHnz3eyaCfrMVOHRRfI7IARH2RkKC37JDr7Z4lBBNWGO2UcmQhw5cuVpVb4D7A
	 SgVM4a8vUFtwSOP5w+xnFZgX+Qc0/z76PGpwAmkuf3yShJoVNjKaF/TsD/9nYFpuIm
	 JgH1NUy6luD4wmva0PcLFfh4CKrJg3IE1Zs8I906xn0c2nD4BIpQxVzgqk0q5lqnHB
	 MVdC2Arqm7qKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A40C4037D;
	Tue, 27 Oct 2026 01:58:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5058B2AC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 01:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41E494023D
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 01:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI8UC_hrbnNO for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 01:58:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2DF4840062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793066323;
 b=IzsD3kI99eg/g8A1iXS8IIHg0aYsyM8+nW7Bg7docrVIfEvlYBQmkmizQGZLIIFwc6Aa
 4xOR2WNnr+JKT1Be9day3M5/f0NJ+vAgqcl3i62spuxMtfpMzKCjr8JkIo7MvgRTn7ijF
 k2yxNKKWOcaaAbvbWeX79D1cf089dSMtLl7OCDjdSXF+gCE4EPfsPeEmHbdk3tTDZBNsj
 6vieIFGKeG/HXsNyxRAG1qeZD5Mu3oj58Hg8rz84paKh6kWhxAGSeLDXSUYQpN88MKZPm
 NqlVpEZ/Eu0UxBO37UGsn0fgBnlGPUXaaYhiHSQEzxaiztRi2v+JrU2kxq+JkBsGOPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793066323;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=KAuNaXAknAX4R6EB9oGuy4o076KR3tcEDwjXPzea6Q0=;
 b=gAJryjXD7zBlY8S0/xRunDH1hHo18GjPQwTALSot80fvgmYwHtu1EtuDoPZnV3nH8e2o
 WpoSK7vUOsMT5iIixx0sX6wvt2FnWHGw2zPMVZjL/RHQbFBWx6C2Vi80iuM+qJxAdrTh2
 CPPtbidmkOI9URvefNlX6RALJ6Hs+X2hbIrBuPHmEJ2h6HhuRXlVnXuWGLlwjWK8ZeMzw
 P+5yZknYTbBWsqS8ikGlRF0nyRbyzvaQ+H+b7UIIct/L4BYaXDJR2EET+xl1iVfJ5zOSM
 /XHvEWkFYycJYFYGJk2Rfjg2JnDSZHulOKTA28MbXFnneCqKz+8DXINhLXxvS/s4osQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ACvtYebi; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::233"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ACvtYebi
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DF4840062
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 01:58:42 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-55651e7de9bso1928015b6e.0
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 18:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793066322; x=1793671122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KAuNaXAknAX4R6EB9oGuy4o076KR3tcEDwjXPzea6Q0=;
 b=ACvtYebitXzX1S9ZunI+WESI+5TjOmG5zTBZxcCF1FNmgFuGN81M27ptJUu8eFba04
 bkFA2rbOX09Z4myaL0UwZw63nFPl3OWFfn0IzyZ2AIlE1LUY2hLyR1IRmnzL/5AZpukh
 5ZW0ObVa66Wa0PuANWV2yLsoR4sAgQHy9CKXN+E8VPvSHXUNyvB7phOQw8TsXkZy0e6K
 71js14geNojqJn0JFu/6PNHBz+/aR7WHoT0HLrDHKRRivxrsoCXAa3dro7J8RMlAcpVi
 /XtX2jJ7VCC9GXnFuUcWMsL2CDTEvTMrfA71lSSwMfASkN0y18o2pdcr3RcVIqmHIceQ
 5Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793066322; x=1793671122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KAuNaXAknAX4R6EB9oGuy4o076KR3tcEDwjXPzea6Q0=;
 b=w/zFQ3SSIPebc1++C9Ylppp+P4QG3hbSgzLq6B3w0mN2wsU+WEQAut8R6SzwtcQ3GA
 z9PyugukFM6XSQXzJl+facpsW2s8NS0GrNzIC/QIr9ZVwKW0AyPn0l1O1icu7KhUlPE/
 Fqxp884ve+4h58NYHis1cCY0sGSpW7iuq1P3Rg2IFuI8yaSKQYIhlDT4SX2OfYBxy/eV
 AOIEk6B+0QFIFqk/8jR+7FQNrvjjRT7M3RD5J6FbyBLZdnlZUfhi1HEGlOSj0qDXuM0x
 qwr2LQiNnNwpfCGTH06fAPXHDYWgq+fG5TBcMAmaczjFzbgGBNUpMWhsm/4/hRgL0DH4
 pKMw==
X-Gm-Message-State: AFq9FYLdxJbcQI1mMCv5IKZHhbKToDe7Z+CfL+OFJCfxgohE8LO0gogO
 9wblVDN06BDXj1sDDhvLoJezPxN0hqZVW9xYF5zgLct5WkE65ySjUhPwmkBYHNyG
X-Gm-Gg: AYBFou3YojYrSWFY+Ju3JNM6gkRJGJhbwKJwzgTXehtZRZ1HSzYSHXGN6OjdjQ4AHzo
 6UulVbHLOB/8/TQEaO7zStq9D6ij+b9eDNm07Jf5XcV9OYHQ3TgakaCc6Yxb3YusQTigLKA8anm
 UtJRx3yEirSuhPqfnap7A5ngYLnah48jBkECmp7cxVZT4s4nOeTHXJTLKzkE6/gqMUwhMSnM9W/
 fZ1DWi+3sorM9T3dOGOrjbiR0Cp+iMjzCw/1RkcLz8VtFdJmrXU1kWT6kqb7C2XjvxHgiL4zA3t
 ihNc779FMprb4Jw0oVvY4NTzlR7zJ+Gf0a4xJBJ+2fAUWWpQbnLpUIzpDCOprrQ5UDcqf1DbUlW
 FFqxlp4dHSnjQ40OQLTWQg8CG5QoPljf+q5g4YTpEV0UH61WnEqVvMGTtkxPsOc/udn7pLul64t
 mlREA5B0+zMo+AK6BLZ/90koPKjgLcW6NU9Ay+wyS/FTk9PAwt8p+nwxgrdzA9E5Xc2WpfJ32+g
 dQee9aOaB02CrUq93R7atTcID+rI2UNAwdWEM7N6YgFc5GuDMb9bdn/Hf0w+fejhkUltj+8kP01
 uAi2yqiw3T+TKdALJifptlcJyQRSVe/RXm2isGEwygLD0iSpupvdgautq3j+FFmUsK5hD91CiRu
 57q1c5Xq1nRFEDhzGLD9nw91yiUCFSjzhrJQR4tOMef4URZRWjQJcEfsFb/EZ8iVAEdg6HTu2VV
 zpMWRMl6Io23PeaWraPB8tuRcF
X-Received: by 2002:a05:6808:470c:b0:4d5:27da:a494 with SMTP id
 5614622812f47-55c00347d28mr6221804b6e.46.1793066321908; 
 Mon, 26 Oct 2026 18:58:41 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-55c043115bcsm6615324b6e.15.2026.10.26.18.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 18:58:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 19:58:36 -0600
Message-ID: <20261027015836.3555198-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netbird: new package
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                            |  1 +
 package/Config.in                     |  1 +
 package/netbird/Config.in             | 10 +++++
 package/netbird/netbird-networkd.conf |  4 ++
 package/netbird/netbird-tmpfiles.conf |  1 +
 package/netbird/netbird.hash          |  3 ++
 package/netbird/netbird.mk            | 58 +++++++++++++++++++++++++++
 package/netbird/netbird.service       | 17 ++++++++
 8 files changed, 95 insertions(+)
 create mode 100644 package/netbird/Config.in
 create mode 100644 package/netbird/netbird-networkd.conf
 create mode 100644 package/netbird/netbird-tmpfiles.conf
 create mode 100644 package/netbird/netbird.hash
 create mode 100644 package/netbird/netbird.mk
 create mode 100644 package/netbird/netbird.service

diff --git a/DEVELOPERS b/DEVELOPERS
index b4ada4e1f9..02834f1438 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1560,6 +1560,7 @@ F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
+F:	package/netbird/
 F:	package/pipewire/
 F:	package/python*
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index 796c4f1ad6..933b072ae0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2572,6 +2572,7 @@ endif
 	source "package/net-tools/Config.in"
 	source "package/netatalk/Config.in"
 	source "package/netavark/Config.in"
+	source "package/netbird/Config.in"
 	source "package/netcalc/Config.in"
 	source "package/netcat/Config.in"
 	source "package/netcat-openbsd/Config.in"
diff --git a/package/netbird/Config.in b/package/netbird/Config.in
new file mode 100644
index 0000000000..b2e1eb6fd5
--- /dev/null
+++ b/package/netbird/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETBIRD
+	bool "netbird"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  Connect your devices into a secure WireGuard-based
+	  overlay network with SSO, MFA and granular access
+	  controls.
+
+	  https://github.com/netbirdio/netbird
diff --git a/package/netbird/netbird-networkd.conf b/package/netbird/netbird-networkd.conf
new file mode 100644
index 0000000000..e6cb4edc94
--- /dev/null
+++ b/package/netbird/netbird-networkd.conf
@@ -0,0 +1,4 @@
+# Preserve routes and policy rules managed by NetBird.
+[Network]
+ManageForeignRoutes=no
+ManageForeignRoutingPolicyRules=no
diff --git a/package/netbird/netbird-tmpfiles.conf b/package/netbird/netbird-tmpfiles.conf
new file mode 100644
index 0000000000..c13afb0c9d
--- /dev/null
+++ b/package/netbird/netbird-tmpfiles.conf
@@ -0,0 +1 @@
+d /var/lib/netbird 0750 root root -
diff --git a/package/netbird/netbird.hash b/package/netbird/netbird.hash
new file mode 100644
index 0000000000..c4ad00b989
--- /dev/null
+++ b/package/netbird/netbird.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  114286d923290df13fbcec88b5f9b7762f5e573d268af80a6b221ec825e128bd  netbird-0.81.5-go2.tar.gz
+sha256  8343fe949e32a30e2261c4f0967365271d08c4644e879dec5b998d1af666fdb3  LICENSE
diff --git a/package/netbird/netbird.mk b/package/netbird/netbird.mk
new file mode 100644
index 0000000000..e0925ed11c
--- /dev/null
+++ b/package/netbird/netbird.mk
@@ -0,0 +1,58 @@
+################################################################################
+#
+# netbird
+#
+################################################################################
+
+NETBIRD_VERSION = 0.81.5
+NETBIRD_SITE = $(call github,netbirdio,netbird,v$(NETBIRD_VERSION))
+NETBIRD_LICENSE = BSD-3-Clause
+NETBIRD_LICENSE_FILES = LICENSE
+NETBIRD_BUILD_TARGETS = client
+NETBIRD_BIN_NAME = netbird
+NETBIRD_LDFLAGS = \
+	-X github.com/netbirdio/netbird/version.version=$(NETBIRD_VERSION)
+
+define NETBIRD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/netbird.service
+	$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird-tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/netbird.conf
+	$(if $(BR2_PACKAGE_SYSTEMD_NETWORKD), \
+		$(INSTALL) -D -m 0644 $(NETBIRD_PKGDIR)/netbird-networkd.conf \
+			$(TARGET_DIR)/usr/lib/systemd/networkd.conf.d/99-netbird.conf)
+endef
+
+define NETBIRD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_ADVANCED_ROUTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IP_MULTIPLE_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_COUNTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_CT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV4)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_FIB_IPV6)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_MASQ)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NFT_NAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_EVENTS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CT_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NF_TABLES_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PACKET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_SYSCTL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TTY)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_UNIX98_PTYS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIREGUARD)
+endef
+
+$(eval $(golang-package))
diff --git a/package/netbird/netbird.service b/package/netbird/netbird.service
new file mode 100644
index 0000000000..4542e0210e
--- /dev/null
+++ b/package/netbird/netbird.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=NetBird mesh network client
+ConditionFileIsExecutable=/usr/bin/netbird
+After=network.target syslog.target
+
+[Service]
+StartLimitInterval=5
+StartLimitBurst=10
+ExecStart=/usr/bin/netbird service run --log-file console
+StandardOutput=journal
+StandardError=journal
+Restart=always
+RestartSec=120
+EnvironmentFile=-/etc/sysconfig/netbird
+
+[Install]
+WantedBy=multi-user.target
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
