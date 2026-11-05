Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D53606A32C
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fNHw733F
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB3581188;
	Fri,  6 Nov 2026 15:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXHYIkEsar3i; Fri,  6 Nov 2026 15:59:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1EF698129E
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980742;
	b=hRd/hUjrAHrfnNIueYilBHS+VhBToiy7EoO40wj4Ga+uRQZ+YDgbx/kcxuYRJhSvsBY2
	 1TdpVodV29uX80EehyO9QPoTnETOfkqrayK0eDBLpdQT03gz7Rqai/cvjrEo4cH4UqFMS
	 dNUWbkiGB2AkvG2GwTpnaqD8BXbVKUoKxuf0CWKD+PNHKk0FDIlSwB/1szmnxkcpN9KiM
	 NY9cb3chYzlM3AOzRF5Fz5vG3MIW7tajiyAosEnu116cKwbkCEMqiYr9hxmV8g+qAW+4i
	 EGjiCu2uZ12OxnHWp9DpAaZkQul70JJS2sE/w7lqwavFPdJbZCcqebdJSam920Odvig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IiaX7Vq1KlBOpiNdrPiL6E9F9v3slwJ5zSBY3L621s4=;
	b=c3L+FFY71FMZU4d19Sc12umXuB8bbhA8q68sCEv5/+E1QW+aSE7VU92Ln4UgSyi2d50B
	 RP7eafHJpKMsTOsurbefwWlke5fb+1rLAjbAf4UbDiJ67xA8gFEamtKgcS1lXNpTQPh5O
	 zQFH1vBfGYOjXwYAlN2pH8YNCdKsEcUPGRaww6GkCJPjpdYXZHuVyoJtw/EpMtFKY4H5X
	 60jOKDINr+cARkyjHUOUoPiAegklGF9xEuBo8PmcMKZ9BB4ur60BcAgAS/rgVwKsicRjN
	 ksnWPfEwFo726LmA8ONOT30hpTQDY3n70wk69+vjU37/fNmKDuq4jRvdHcHyxR3RsQg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980742;
	bh=IiaX7Vq1KlBOpiNdrPiL6E9F9v3slwJ5zSBY3L621s4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fNHw733FEoJMIEtuZgFY6ccaE8c6zlDyC/x8QwP9luNYjQKAOhadjjqHW+/v09vSx
	 X6zw/cXlK+xKFQ+xzjgmX22rO6Si4ndxTGdFdvJmOKq2P+xeetqCukKX5tdeAAy/RS
	 Dt9mXQt++zrpoYSH+YQt/q1zOfSOUDUIEnqcdDnX4jgvxCzg9FktovJuT4rxSvraKv
	 +/IDBXLEyeW7FayYvwtmQGPGTp1+WXCmBDkOHQp/T9zyHZgeiS24dWDmJ5+apVhFYn
	 3ec0NQlASrC8ZxRfrjmfCV5s4/d6aa7Xallowtcg7KA4ddqDghOV4u1SZCEXeBzH0d
	 q1t2vDo5qs2fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF698129E;
	Fri,  6 Nov 2026 15:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 554A34B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46841403DF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X8UJADAkERDY for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 84E1C403E0
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84E1C403E0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC85D9E09B; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 13:29:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8c1e897d568391f8082354f47ddc78c430615a7e
X-Git-Newrev: de0ca461f408cc12a9b153caa25ff7fefc2a24bd
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.BC85D9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-twisted:
 security bump to version 26.10.0
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
Content-Type: multipart/mixed; boundary="===============7413484200158983884=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7413484200158983884==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de0ca461f408cc12a9b153caa25ff7fefc2a24bd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
CVE-2026-115776.

https://github.com/twisted/twisted/releases/tag/twisted-26.10.0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8828cca1d64615cc8b74f24aef8add8e3d3d5572)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index beb1c7f3b5..f65e733411 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  931ac3e39a52c490f85d36bcb4c77369  twisted-26.4.0.tar.gz
-sha256  dbfd0fe1ee409d0243fdd7a6a6ff14f4948cec1fd78e0376291f805e1501fae9  twisted-26.4.0.tar.gz
+md5  02a15261bc2c23036399954941d951f4  twisted-26.10.0.tar.gz
+sha256  5f0355403e507fc23ceea85e9dbb4bc59335aabde41dd324e8b8cea180dd38de  twisted-26.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d7a2f74fe5c2b3f610052b75b5a131728c49823b28088893dacacf8d58849a4d  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 09198d2afc..d45d2fef0f 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 26.4.0
+PYTHON_TWISTED_VERSION = 26.10.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/db/97/6e9beb1e78247ae6dc34114f27d538cf2cb183c4afcd3609dfdf2b0439c8
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/fe/31/a5f99ae7f1550914b0702b8f78118d95a79da20525d26fbc1b2ab42bc8ae
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE

--===============7413484200158983884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7413484200158983884==--
