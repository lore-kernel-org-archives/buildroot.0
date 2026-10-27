Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10BB606A320
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H7nATYbl
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9F280AA1;
	Tue, 27 Oct 2026 16:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMAXMZnpe6xh; Tue, 27 Oct 2026 16:26:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B89DF80BB7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793118384;
	b=bBnXCbOjdYwcsw2hrVEQs0U/faR+tpeeuOASEWMJI08PuDaVG9bczPkQxhiF5Tb5XK/2
	 +5jsGOooGUDSZqi+PUd1JCcCC+gwUsIo/VNILZtJ1yvFZedSPLMZ84zc0YbsOnhTT1t3j
	 rOIaq7xMI89fAjmo2QvKUB6DKOnpQS5o91/TrtLYKObVF7W9euudQioIbCT/B8k2l+r1S
	 /syKBJZVOAr955Jg09p4uS0cXTFfC9zihuYgzNYaIVm+FFdYNfe0wImTOQFaXSSXoUZuU
	 Xj3lbRxzs6i38N1vR/k+CVfPvN6BC57zpbXX1sgkvH4LYHs3M7MfcfRkJq+mCD3z6WA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793118384;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9deFpZUxlSdbFuhLiWn0G8YRKAigqeHReh55u153zPM=;
	b=j/OfaeqxSdIKK9LzWumSHTheA9YrKbO3A6pNMQG3SXzmPt5rbWBSUF1kTj/6ZccePmJo
	 Xrot1IWVHkWSAwQTKnchLgQgj51bOe7w3wxZkGX2oMf84qsIlEQXLszepq6BiF33t7aZT
	 J/oqn6ODK6YrcJd5WCVOl3dzq9KGt2FxjAATsL0hC3KoFPzeEgxNG3fnIfHeWVYM+30ej
	 imiBSZwm7gOi7TPJ2crlLP4kpBAZCWty8epFXT5gSDKzsqK28oRQ2f02urIYzfSAPX/n+
	 fAUm2tA8wr0R+SPN2oBIylVpeZAK4iDS7ewWYOJlwpwtqbdUBSsTCG6yjtVrSf5og/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793118384;
	bh=9deFpZUxlSdbFuhLiWn0G8YRKAigqeHReh55u153zPM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H7nATYblEdARqyx9yJi6it8SXI6Tsff/pmbX5Iaz/opSaQ+l+EIpOXyrcO3CDNR1r
	 DHKU1jPPW9CqyWT50jyD0hc0ztiSF8qvCR4/RLxxbslHySzPRbspqQ+XEASJh3OYXc
	 JJXH3CHeUTnF820xptyscTfRPx2/Dpqh7VCQ4GLK7vSzo8djNymJeXNo1OvnYVoj8X
	 DPSPw3UKEalpujRJKPmBcPtYyTNPg+3JmnaTS9QCyArm/AfsuW2JFyLWScZdq5gauP
	 XGNgNbZWbcjtrmTcGyCtYb/9VJBm81Xn3LklFHeQOwzisUPdSH7gFnsoGiJMSqcDef
	 oJQ8Ba/emakqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B89DF80BB7;
	Tue, 27 Oct 2026 16:26:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58D50A32
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB47400E9
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwBjgxr951Yu for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 16:26:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9628B40076
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793118382;
 b=BLScnnrHbJpt+xYwAL7RQllkvAW+y+Xqrx1Dx3v1LFg7HBMRjbVF7209BBaWeCVeCaXO
 yMMLswKq+l7Jco/jffhKJQRayFrskGv5a2aY7vCVXOSwnipvHFNaAsUdFvH2CI08SyrEj
 swezEKYE/MbbTNwchammlucomXNtgx7ykDbx76FJOwI5OBF+4qgkCiMihw8/uLVdAu+lp
 oa0JvZcLWwf25pc0/YQaJ9tssWlsumPKhHY0e4Q9RlFZY769fEv6floHA55VNbS2DnFYW
 cAt2/kqardRfFOsPE6743u5+fM+bvvamcEfcsu5jT6cL/ZE5AgPE2eWojCrOcLmHnjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793118382;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OaeujOs/6jaiRqma74/KZCGrYzUcTmqhyvW9m3/Jc6g=;
 b=LJLlEDShEITkZ5ZJMNbmlgVypzNCEoi6cWnB2Ikog3Ig7WYgANVNFnc+wAMvViQGnavD
 xTFz986JdBbD/u3aZwqBUHghmqBygF1QpW1IcYYEZRyxAFMFNpvi8T1+JbO0mNKNLcaNl
 TiXRcxXy5wXKwU//bDExCX/rFkRZt+9UERqXhuH4YRywXZq4QpdDldj8Ay31YNX1OXuG/
 sn17nG7d+6SsdenkM1ZDlcFXSG+EdRbBAz4CBiojOoPRoDb5rl+WRia7LBamGiq0jB4q3
 VZ2r5i0zsMXxY/o0Mr10R5MWuh/DEX4W4HwNwbx2LzyJrwfbB4JTveSdNKzEY3aJ1yg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9628B40076
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 16:26:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F7089D0C7; Tue, 27 Oct 2026 16:24:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 17:25:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f30941ab17c31bc088d4914f7b40996c596b2438
X-Git-Newrev: 1cfdb4efd539ad5917bc43ac806a95687e7f4b6b
X-Patchwork-Hint: ignore
Message-Id: <20261027162456.0F7089D0C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drogon: fix optional TLS dependency
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1cfdb4efd539ad5917bc43ac806a95687e7f4b6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The trantor library bundled in drogon looks for a TLS library at
configure time, and uses OpenSSL or Botan if it finds one. Since
drogon.mk does not declare any dependency on them, TLS support ends up
depending on whether OpenSSL or Botan happens to be built before
drogon.

Select the TLS library explicitly, following the same order as trantor,
so that OpenSSL is preferred over Botan.

host-drogon only provides drogon_ctl, which does not need TLS, so
disable it there to avoid picking up the TLS libraries of the build
machine.

Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/drogon/drogon.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/drogon/drogon.mk b/package/drogon/drogon.mk
index 03cba45ceb..8c51d16ac0 100644
--- a/package/drogon/drogon.mk
+++ b/package/drogon/drogon.mk
@@ -21,7 +21,8 @@ DROGON_CONF_OPTS = \
 HOST_DROGON_CONF_OPTS = \
 	-DBUILD_CTL=ON \
 	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_TESTS=OFF
+	-DBUILD_TESTS=OFF \
+	-DTRANTOR_USE_TLS=none
 
 ifeq ($(BR2_PACKAGE_DROGON_BROTLI),y)
 DROGON_DEPENDENCIES += brotli
@@ -57,6 +58,16 @@ else
 DROGON_CONF_OPTS += -DBUILD_ORM=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+DROGON_DEPENDENCIES += openssl
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=openssl
+else ifeq ($(BR2_PACKAGE_BOTAN),y)
+DROGON_DEPENDENCIES += botan
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=botan
+else
+DROGON_CONF_OPTS += -DTRANTOR_USE_TLS=none
+endif
+
 ifeq ($(BR2_PACKAGE_DROGON_YAML_CONFIG),y)
 DROGON_DEPENDENCIES += yaml-cpp
 DROGON_CONF_OPTS += -DBUILD_YAML_CONFIG=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
