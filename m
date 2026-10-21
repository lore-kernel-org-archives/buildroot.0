Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA603606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=prGuCA7F
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8096C4053E;
	Wed, 21 Oct 2026 21:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5Q7Dx6xP3jX; Wed, 21 Oct 2026 21:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A070D404A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792617526;
	b=GWwdGHn+iW6mddegF9QfKyKJl0dlm2ALbhrxr/JFRgPquvFqb1o84MGSbT2hd8rjbTIA
	 1x5LhCuqcqTu/jZcryVivDzPn61nnDy1famGqmQIzbDds7Us2sMI8iLTI6LnhJF49Qan8
	 AN6uQycjaudp6apgJs0efkVIUxS2UDRxsCy3sewZoILsifnZxhJrMU9gqjwITaKrbVUOY
	 KaTwMNPNuinH9mIhBl9+woMze6DfpJYCit4Blo8qE2DSeN8DUHc719gPCaJl24AgiyJst
	 edtR/j2jOw7F4nPMKStWLeOWm/UsfLlzzq43U77+4ZBeNOj6eqaNw9l224GIAIiJNew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792617526;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BVDAQEid6cNF3tg1wLl7qeC8tMucMi/pcz7jv1gLUmM=;
	b=PjQvfKMC27lwSzTK13YOj6/Ex+DQeMKl0lzuNXnaGXyNxj4LEhb8Xevqbtwtbf7Qx/46
	 gUnGgo9xzQacpSEbn/3osduUNG3hFGPGFRrNNPa70nVcEpL5lccspk1uK4sqRZ2HQhtxq
	 jUawSCGJtY+ueZzlZ6ogeXjLDivV90qwVH3AnT5d6wmDoi7pEmK+SCdtruVo8D9Ncqz5y
	 eJwcRcUUZ+BV7rBeRrV6ShGlEUAupHa81VDf/NQzU3yjycxC+qD3JcywjIAFgv/Fg2FeK
	 vGxhXK5lYNIJBU/xzkeECM67MKIaQNvAkwCJYd8EpOF0D3LCbXHxebVjqvjMOMfHavg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792617526;
	bh=BVDAQEid6cNF3tg1wLl7qeC8tMucMi/pcz7jv1gLUmM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=prGuCA7FH9za8hkPDArKcGaUxlZEyEuLTmFkh4Aba20k7bNpVEzlj5317Hspv5FKu
	 5S64gbquMSJLPSahrRPmTxPRpogU3yFIDUpIs9hVVVwJzAK/h/NbHYth+z/IB34aOr
	 GNJTV//AAQtWOaiR4ZxTOpMvXBFdHaVxRj6lEE/rxigLUbUZ4syhEKIgcPydvmyzMz
	 HM/JzcdX/KTLGMxkuJEcKb43XaC64zlmrRatBRUS946EsjILc/itbxVd65cMX0Mj72
	 jr0cnW+85T3j0RDFdGECHco8CYvAEKs1aZBmhfjgxeudG6IRWzs2RfDNP5gRWHcyBE
	 uTm3tqn0pFYxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A070D404A2;
	Wed, 21 Oct 2026 21:18:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EAD295C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB6CE60A3B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhuEYGIEc23B for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 21:18:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 15B2E6079B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792617523;
 b=IhI/u/2WJoi2534LjHsncSjht5HA2w1Q/uC0LxeDr2hhJKOLDzvBsYjYZLdv85nJpxR0
 Kwny9knlQ+RbOUhpm6mFZJAcia9ge53SjOwg1OyDu9aVwll8cy39NdPGCwbeF7kx6AC+G
 aVI5gHIOefsKpj5iEfOvQt+h7AWA0uiYdgS1hQ0nZ/MX5boKRPbZCvm4hsj4quLI0SqlJ
 nQM5aH//3K/Ky5MFQT5A+0wx6DjNQvrTFBesWd5rJt1YGylm4X6k5xQAvPIR7mrnxjdq+
 f7b1z7dvRbzl3rhpo0P5QGgnNTkT4KIzorN/BhBq8HqqEgpkG3bby5z2gnx/94wdOFA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792617523;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rJe654LPd4GKEHy6agNVslBECcERGAfxNNNOpK6z+eg=;
 b=YJw7/gNf5Ro5xS5GtbCVsfGB8fxb8jxgFE2pz2g3JCIeMVyTmrQtMHHYcK+QK2ptksSp
 jrv5gOJQN4lasG7b2MRcecW4AebON019PXRDXETDvVAgnT7X9W8issgEBf+sEpAnlMxGM
 ye9ERPzqfDg6cHvmhUI3jPgr2JzfbELtn1V6RIy8vq1HL4wMiVMyMEO8x3jnvuUpfVo2j
 1NTIuUq7YeojuCSJhW+DLXkSlORkkgXpoQsLiJLRqIT2lQDnDAfnhprpZuoCzCpPgeWHX
 D7J8kmtrBOaYW9ByqIl7HE+7b41QhVrjaFMKMkx6nuEV37Cl4j7OraXH/1nip2Z9jGw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B2E6079B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 21:18:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A3019ADA6; Wed, 21 Oct 2026 21:17:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 23:18:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2b1f95d4bc7a36f358136dd208ebd46973ac9cf
X-Git-Newrev: 59f5e16ffebacd111d5fb84f110e15554b9a209d
X-Patchwork-Hint: ignore
Message-Id: <20261021211719.5A3019ADA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/foot: prefer ncurses terminfo if
 ncurses is selected
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59f5e16ffebacd111d5fb84f110e15554b9a209d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

foot's INSTALL.md says to use the ncurses provided terminfo. [1]

If the ncurses package is being installed, disable generating the bundled
terminfo in favor of the ncurses one.

Note that the ncurses terminfo is smaller, meaning that some edge case
features may no longer work properly after this.

Link: https://codeberg.org/dnkl/foot/src/branch/master/INSTALL.md#other [1]
Signed-off-by: John Ernberg <j@j-ernberg.se>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/foot/foot.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 3e37d41557..b45a93a4a3 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -27,6 +27,12 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FOOT_DEPENDENCIES += systemd
 endif
 
+# As recommended by upstream foot, prefer ncurses terminfo if
+# available.
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+FOOT_CONF_OPTS += -Dterminfo=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
 FOOT_DEPENDENCIES += libutempter
 FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
