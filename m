Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FE6606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cQtQv1+w
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B31160AB0;
	Sat, 24 Oct 2026 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms8AoL7L9R2A; Sat, 24 Oct 2026 11:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 605FE6073E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792842842;
	b=c0iMzDt+RL70jID69573SJ6A+dt0PJ7l3FKQVDKOEpatZdwSqtSSO/g7Z4OEY4Wl1XRM
	 /jRmLeiANH/nIBLKhWnRH1jrnkNi3Wh0+aX2rNRJdMFO6TnK3JpB09tl9sC1/7KS110dK
	 9GPYLMFdkZ124eFhUxzmEBZiWYTG9+TngaFCQ9z/1+XcBh8gbFodb8dgle5OI//X0aegI
	 ytFLM9C8xYOje66xuPOabrRf1U0s4jJjy2jB4RB6Z9cedswppapPpMZ7gRlP4XeTQeVKf
	 nBZVbOIuXqL1HmpD8jmdBHGpWoSrzMsuBF8SG4CVvXjH2aEA4OUvkR/QEWbvzhQ6kvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792842842;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Pp8hhkp3UJo+KeBAN5oB/W54TqxunSfj/d7694FNiDE=;
	b=M3Q1PkFiKOonujB2cH/ntOkexWY/iAIkcyzXySyu1/aCMzGd/eXIectv5LNIcsZbv++D
	 nZ3f/QVazE6b6pO/vGgKJz7uBJ+sJRcMb5V8tqVVcon2aiNvgtr9iUwnQ2oEbdCFzKT4Z
	 1dRofM0FerX9LkTBs9pbBXInCG4qi3EHtAb6qJWfVhKK0/Td19a3WJisuYgR/ltINzyn3
	 zJbIY50G0YW1gfHw4suH0cumhd5CK4U/UntNBASsf/vKFKdbdvTf0WykQknHWF67eAu4Y
	 s/+aGUFzNin7986DBBC0u+f/2T1O47g7zOVRF5nxodp9C5Dbu0+RrZJ7udrdB/CBhxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792842842;
	bh=Pp8hhkp3UJo+KeBAN5oB/W54TqxunSfj/d7694FNiDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cQtQv1+wVjpnVV+K6Cwyu7RnPQyUij2OXz//v51goPkR8iuI5I91eUZNwYjDfAtNR
	 GkHKvSdfOs9LGyaRGxWlanq4xMVJjweiO/TWL9UmqDsr0/KY8dkIqwRoS6gzR8a07q
	 Tqw+aUzW7kfG4h8WrritVQ2x2lRF7yI4lKOXh9x0H2W7QKe+6bLa/6O2fSmeIf+nN2
	 200wE5MQyDHWBlYxytyaPcWOX/Tlo+PJReilTqCJWTZHALF2on4ha0X09ioWeHyiNA
	 upbWak1PScp6P0CA9j4/0hSgF1pczAvAk2zxA+aYciKnnxx/vjq9voxdyKddYdKWro
	 B3Yumcq9GtuVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605FE6073E;
	Sat, 24 Oct 2026 11:54:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E68F6D32
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4BEA60739
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbD0-aVDavjm for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 044D760657
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792842832;
 b=nYyPXHtJTJ8ceP9DmlTswGEoOsgABu3mtfGMsHwkfMpjc1U6IGyulpPSWeP6fCO3TZb0
 AIFvmN37ZHJX9WYP/71lls5A8WHJg3CL+2V0D55RUBBGXxHGluICQAPKPVgah+wxnUNfx
 wh+1+cdruw8FlNUM/1qsxvalqVbJMQbB8VZM6h6CfgcZxvqXPryyp5OyXFbMLFHXPxK1G
 uDv31k09L9km5IgckrGPDwSuj/fdu9BcmIf8drhu8BdXCfuinb/Lyysu9ab93yMsfRtWS
 iQaonRaS6KKt63T81O/kfR5hXulxp2pniFuCOfqbGUBj0jvQyX15v7B7pyLjlEJLGYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792842832;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6hXes+NhXX5L+3MomL/4X+0p8Mb9oFrZ1SPwwfSWyN0=;
 b=ldSwtK7zBgPoZ7Sqg9iBP9f2Klxai4Cx2OCthIlTs6ZtfAZs3TzxJUsEjLq4r4vdfy5p
 dO2lSgZH9GT7uCpajKr+T5VjLFCKdlpWr9o8UHn7DofzdC6/X/57P/89t7cdHZUeynuxg
 cWNNaTHZ+h6AZNyrh2qhRTGLb5lgVlsx8afO/+mInk6zoz5T8SxLs1xMYWoITEZYDL7nC
 PrA/yOf4AzVs+VvG/ybdg2EvKlWb19aEAvRxWxvwEXnuQ0rRb7pNMxdK2ChLk5UAv0zFr
 26tDOqFRRvaS580AmFlWwdiGByMEkS+j7YkZXyKtYaU8kbZXJbgYJab7envKzhzFRfg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 044D760657
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F059598327; Sat, 24 Oct 2026 11:52:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:03:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a179b121b9985f9575365c8abfcc514172ad0f8
X-Git-Newrev: 768584286558af3f450e5843e49d47d86ab17be2
X-Patchwork-Hint: ignore
Message-Id: <20261024115226.F059598327@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 3.0.4
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/768584286558af3f450e5843e49d47d86ab17be2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index 443885b389..24c412bd20 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  85e7244b0b5d685ccff8ae034bdb6909  soupsieve-3.0.3.tar.gz
-sha256  7dcf6022eed0399eb9934a75e020148f7a2024c37b7dfcd3cf2c5505d69c364e  soupsieve-3.0.3.tar.gz
+md5  af3ecc3a57f935be504f942c52d6040b  soupsieve-3.0.4.tar.gz
+sha256  924fab84ae21604c19e175e1f39815eb6fa83ba23836e09e9de180925e5bc4c0  soupsieve-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index c29fb74c52..e99770925d 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 3.0.3
+PYTHON_SOUPSIEVE_VERSION = 3.0.4
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/5e/77/2dcfa996b01702ab8fd0763d84098f6a640d6162a328f1c04c2697579a1a
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/19/63/0b6bae54546aed98d72f12d09df57b19a287f01c84d22047fa2e23772ab9
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
