Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E76606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZYM1S3SC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D258E80D81;
	Wed,  4 Nov 2026 17:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOeZpW88BVzt; Wed,  4 Nov 2026 17:26:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E285980DB0
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813179;
	b=VGOR3WIxf11sXwO3XUmSTUMtygEmG0NCoDga/pGNM/alO+jtwQ0iEapcAk28Zgd8F6u9
	 yj7nWORsgKEz8IY27A5mej60jf6pa3mzCr0Jt03jc6oA8bIBIni1oOi4SroKzngrw0BAo
	 tJgy5Y1lsMjHv/7ZUKsOXvm5MBzklsZRxVUoZ2DW2Ko81rg1LzrsWgjzlZ2MH7hbX4rll
	 jsnDM6VggszdE9yEu7StITXbhY13JufEC9QMUpsmysHXsE9/I+9UXtMzwoiRpBBjyyHsq
	 FDe9tYelnmfVSsAOqAGsoHz4f1rP29aimnPC5kNjRo2wE8VxYZXbRtyENV+QE5DCgsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XT4j5KDrN0gWEvmiExw7Gp2vlk7MlbWOHWlktTMOyj8=;
	b=cEAYzHIkZDPY5cpr9x+cuYqQ6N7m5fokAVBArA5W0LRQaL8XWu6KH89KulLefcUxOuQa
	 2cgBmJEU96LKtxSmqhFLS165TjpyZ8F3VzP5JuPCHYVRRctxGSi1Q7Cu0DwpVMvmpkxP3
	 NxqzXdGhxMU7MhWWvzlLeabeZRwtXQ/izCQUdHLxwcpeJQLGnb+BsktegyRX4Ch/E/Cs/
	 rP1KYMpN37kwi+rsRWRmXgmcCRycttUYKndzUUp9/3JBLXSxo6NtLx3xqbqF1Z5AdBUXD
	 VbTOqtUDKKyPV9mqaZpDhlBXRMI5jqCOAwQnHXQhwzWvdACiFsrFIb3mJRe0Xqi8Ecg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813179;
	bh=XT4j5KDrN0gWEvmiExw7Gp2vlk7MlbWOHWlktTMOyj8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZYM1S3SCM4J+yPVrQlMsqkhN4rFRpyzoeMq6D+Pybfq7NxP7cTVgxbcsYdPOHe/xZ
	 /yMorgkEqRoOBouZhWbjHOgQiaHvzgcnXr9gJSqnfwbrMDZhUbHiwx15W5SRa3uE5e
	 SxbqZxHIp1gnk5MTK8wd8bVKuMxqMacGSbsc81a5g/ZUMJdOzbKnln8dmGOK8ENPvA
	 lZpgZ6sa8OsvJ4ovyfYtgB3MAf9fVjLBrL/I4nIM5Eh25qnRKjo530/s4pgExfQvIX
	 oKXFrsqM1TnLSAmA5R11sXsrEYmhoPVGQ+9D80zuK5Qk3JbsjUan0yOE/ewHbPfK8w
	 srLbt9hxto3jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E285980DB0;
	Wed,  4 Nov 2026 17:26:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BF68D3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51C9840211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOchU4v9sWZH for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:26:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 613F540062
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613F540062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:26:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BD9A9DCF7; Wed,  4 Nov 2026 17:24:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 18:25:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ceb80c538d2ad047fcbda32642612f4df3bcb27
X-Git-Newrev: db1d0382f35893ac624b614b765ddecfbdd1bef5
X-Patchwork-Hint: ignore
Message-Id: <20261104172445.9BD9A9DCF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/composer: security bump to version
 2.11.1
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
Content-Type: multipart/mixed; boundary="===============8630651169250374761=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8630651169250374761==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db1d0382f35893ac624b614b765ddecfbdd1bef5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Composer 2.5.8 bundles composer/ca-bundle 1.3.5, which still contains
the emSign ECC Root CA - G3 and AAA Certificate Services roots to which
the compromised eMudhra intermediate CAs chain ([1]).

Composer 2.11.0 updates composer/ca-bundle to 1.6.0, which no longer
contains these roots, and also rejects TLS connections presenting the
compromised intermediates even when the system CA store still trusts
their roots [2]. 2.11.1 is the latest release.

This also includes the other security fixes released since 2.5.8 (see
the package's changelog for the complete list).

Composer 2.11.x requires PHP >= 7.2.5, which host-php satisfies.

Release notes: https://github.com/composer/composer/releases/tag/2.11.1
Changelog: https://github.com/composer/composer/blob/2.11.1/CHANGELOG.md

[1]: https://emudhra.we-have-a-problem.com/
[2]: https://github.com/composer/composer/pull/13146

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/composer/composer.hash | 2 +-
 package/composer/composer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/composer/composer.hash b/package/composer/composer.hash
index 123d6de1be..02002fa7a3 100644
--- a/package/composer/composer.hash
+++ b/package/composer/composer.hash
@@ -1,4 +1,4 @@
 # Hash from https://getcomposer.org/download/
-sha256  f07934fad44f9048c0dc875a506cca31cc2794d6aebfc1867f3b1fbf48dce2c5  composer-2.5.8.phar
+sha256  6f1b891e1d4927d62740276c540fb490e47689e19e102c49e8da849794882f8c  composer-2.11.1.phar
 # Locally calculated
 sha256  c8cce4b6b9729f264ffdf9296d505d63432497feeed1f586d1902b942197e024  LICENSE
diff --git a/package/composer/composer.mk b/package/composer/composer.mk
index 5ade9ccccf..d509dc617e 100644
--- a/package/composer/composer.mk
+++ b/package/composer/composer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COMPOSER_VERSION = 2.5.8
+COMPOSER_VERSION = 2.11.1
 COMPOSER_SOURCE = composer-$(COMPOSER_VERSION).phar
 # Here, we pass a dummy URL parameter in order to control the name the file
 # will have once downloaded.

--===============8630651169250374761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8630651169250374761==--
