Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDA8606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k+7nURij
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C025812F9;
	Fri, 23 Oct 2026 12:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG7jfz0MImLE; Fri, 23 Oct 2026 12:25:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E2262815DC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758300;
	b=BWbjayh5pHmhFCucRJw721Or2/shdFIGUIsD9vYe6KALEBrWUZVlLrdXww/h/8cnl1Xi
	 uttf0rSGUJSq6Q0JQlNvWZfQ/ZQKk1w6AWZ4vzDPTXWYyuaDehFtKnjkMir6X02dPAkkn
	 fTxGJjhtWZ3j2LzFbqyO3sGVIQbRM/jn90+HRPzeLaWcPNYQRNPZcsBV+2TwjR90fpMvZ
	 1dUiwhU+p5ODhtAUUu/dDzXKo498I1zdlnrOowqNH4nOe+OB0t1b1O0wGgcwOAkR3GdSK
	 t1Mm0THjTJ3Ar2Fv9bTFM/TN5q2oBlWA0rLnJQhSaXyzDuMIbhymTWukNtSu6WuuWRg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Upc3OghqY2KL0PXOpBnQNQCKruMBFiu+sEFeNjX+IXI=;
	b=CvJ5V8lJWJfgqmNv+s7Oxo6s9olqLObTEugwkhOTTkgFDVIZ9NCMFC4hQeGsCRzB/6e6
	 FsNutTFRuQIYqECAnt//rjb64IBU4crT3od5btoWPAlej+GPP2Jl3vWy7YGOy2KD4hTFK
	 YUduwxyjj1zSXdymcrT4cWFiU+x/ONMguy7veOdVz9QnHeH01hnTyua7AM0DmJWwERVZw
	 XydPnHsT/Wo+VRoqewDQ0Fq9SJ4mcstfm41yFVRG6Ho+HfyovDbOSainkB5Tx9D/RALAx
	 vGnNi++iFiAaH1lf29+4eYeIY5o769jyLZZUVw1HubGIlfbPqZtuRD3Mu0sRIdIXU2g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758300;
	bh=Upc3OghqY2KL0PXOpBnQNQCKruMBFiu+sEFeNjX+IXI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k+7nURijXC34S2GVQ0BKrRcnjuU54UTPfdS0I2vqbUfQP+oGps1NscISB6uhAt9ax
	 bzbVD2QsOt0LuVhJAlTKPc9l+Bs7U6ZSr5Ebf/Exup52eHB4lY5D9qFzQAwhNrmo2n
	 SgIlDClqCS+Fn1Mbhrstx2X3/tAGvhb/rSxLcAeE7q2jvMb94vZ2to4QLI50CD0Umf
	 ZUMBUxEgoRTWUbRkMI4XOplkovnK7dSiRfr+46g5BwE0aA8JIBrPbzY3UZBA0oqVt5
	 tU981d0fkMpq6pON89g8tlNQuISMrt7PUujcwUgTejrjoskuiolF8BIGs+2mW5CxyO
	 5RsngdEhfQS8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2262815DC;
	Fri, 23 Oct 2026 12:24:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A125B12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C626063E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F85ccSnF-5gq for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 64D8960633
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758280;
 b=D3DflD/r0+ZqODCUy91jtYV8Aos++2D/rj3b9pucwwEvXVm7JC/Wnql9rx4W3yeEQNqk
 uWrM1i7gnTHwM1A3e+6LHKeX2ijRlQ3Kgc89hneC5nQ9roIrPz3TkDWkvz1BsolbehGum
 7f1UKGBRQ04z1W8nC7ZAsylKA5xHVbbJEoXAQDjsE9dGw27mmIAdTfS/Rd4/+8LkVL8ZE
 bGGYq4UdTJQ+ErdltQ0vYrW4L37b5hFEx7BHC1S0ixB5BR+kAD0vHuWJ3JUdTq1hYnVRg
 3bW/4n3Nz/0rcsFAXSScKeJPu1zqLS6CWjpKUfn815PdfxuexClbT0CX+/GBM7VrC0g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758280;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GLLt/c7IL+P3JYSVb43NcvwPY2Y0qIWOZwvLyaUQsMQ=;
 b=KqL9aa8j8nfI5I/rRRjv4HtKBpC2GpFfQb29oXTI9zcFvLiLv+0tLX9cqsN6vIiGTjW+
 Uc6/cnm0YViJqRTI3+v6ihip4z1r1e0BeL/LvwdbjcE/hg6A4dcZSM21RNTqotXdlw7yL
 ZEZ9IVV4UEhRIZ4gp6ykFAZwKlj0ZrGGtcojreHOrY4mIcGc6sIIcn+jVhgUwdLL4TOq5
 DcfFI1tGFHUgz1aZUDw4yeH5qQ3u9fAaADV5wN7uj1/ClIidYnw4m85tKLeDJHxnq8oGq
 0RzxMG7FGTdCfdC3btsDx7Te94ZQtHt8jLOcWxlHboT/MEGuC2RKBarRaS9WMm9eWIQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D8960633
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CECF69C669; Fri, 23 Oct 2026 12:23:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c13a5feeaf1cea3e233af2f6adfe3df23f912a0e
X-Git-Newrev: 6bb1dbbd38652c9dd76247d4d6f9053f25e86366
X-Patchwork-Hint: ignore
Message-Id: <20261023122315.CECF69C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/p11-kit: security
 bump to version 0.26.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7677779023687109901=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7677779023687109901==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bb1dbbd38652c9dd76247d4d6f9053f25e86366
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Security fixes by versions:

0.26.5
* CVE-2026-18938: rpc: guard against overflow when decoding nested
  attributes
  https://github.com/advisories/GHSA-6x8p-h5fj-5ppr

0.26.3
* CVE-2026-13757: server: fixed stack exhaustion via unbounded
  recursion in RPC attribute parsing by enforcing a recursion depth
  limit
  https://github.com/advisories/GHSA-p2wm-69qx-x25w
* various memory management fixes (including memory leaks) without
  CVE or details on possible security impact

Full upstream changelog:
https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f432a9e625cd1dabc7722e894909d7ae23e5e488)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 943ad9c22f..ca76eddae6 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
-sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
+sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index c5ba392594..0afb21daf0 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.26.2
+P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES

--===============7677779023687109901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7677779023687109901==--
