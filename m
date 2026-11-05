Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E167606A32F
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=q+FIJULZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AC0F608B1;
	Fri,  6 Nov 2026 15:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9k0yHxk53utO; Fri,  6 Nov 2026 15:59:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A2ED0608B9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980740;
	b=bk6ewK86ES9Yq2etT0bnVRaYhQZ+gxUDB+jDNflj/nUxtZBok+GD5FQiyLAXEhUU/KKa
	 SmkokBC7DJ+sEgLD//NwCWFeI19Vjwc8icUWHdSO6lyfp/+PRHThX0L14QJkyFp2MRMlE
	 Q+8QrGTo8mhHD0a0+Z5xbzSq6I4pmt+HS+C307oUQn5JfPE7f9Afh8lspIjZbAd/TADya
	 HOOI4EYGrYDYIgadFMNchLuX4YwatTPCJGeTqP8V9vSmG6WRgCNIW9DvHjzgo/IVxQ2/u
	 7HNOy9tgBGZ0TZuxnSZ5vxpi727fZu1XI9l7oySAv+eJMHxIfg3bBODbRzhS7vqw04w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980740;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=agENvXI+y5gYhQqoNCo2lBMxBjzGawnnW+ze4hkJsxU=;
	b=N+PF6Z4BXw9RiieeUY9RFiHOswwBPbXVja5Av1Wme+ALrIOOExFGfTgACu4jqs/ltchF
	 z9jUJYKLp10AuWK+97v2TM0hN2GFNevuQCYmBokE56GgViB3wSM6Lp6lVkF5BzhUGPO1t
	 WwZP4MWSOtzqYq9ybsOyZ4XjKwI5GsAy4GW4nC+Ds5IwgHKAbqA59aauOhSsLGfw4ZkgU
	 ITspCKHDvNDNlaMvS3duDfULCym/E3ctiNPf9iOdKKo3Otn3xzOcAFnIYtxrS1vGtxhXw
	 pf6ZAF/mMspruSKpf9dSuMz7NnAzL++txr7n3/l6p1XmsOML3DiPnG9UxBP6FIN5DhA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980740;
	bh=agENvXI+y5gYhQqoNCo2lBMxBjzGawnnW+ze4hkJsxU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=q+FIJULZ1nSfHwhSDfoEq7YSu9NI4KSxvcNU7rrLm+gWlLdK9AagsbmPvToql61Vf
	 88mFBuGsh5Jfv703oi3TrDqpm8UTAjjpHxby/boHQ8WE4wozV+FAXpolOI74Uq158l
	 OR5Q+FLZoMDoc7e4aXcSraDYSIYOwPvAi8SpfvVSrSS24DCpIf5fE+MZAbnIUXSUny
	 i82CBlow4ZfNdCWtZhNK1pbZJ8aVyCqdJjIhYRTNLVZQTR1Cdb9A6VF7YC0RUBljV0
	 UvCdL+ThvkX1DGrhzjU+X2XPWIx35/xebanAHbqaEunCOzm56ier4ejXD6wjY8LnbG
	 SWQ1wEEUZ6Aiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2ED0608B9;
	Fri,  6 Nov 2026 15:59:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46B69AFC
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42EE940949
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_2bNdxSpeVU for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4779E40921
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4779E40921
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 730EF9E09B; Fri,  6 Nov 2026 15:56:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:48:53 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9a4a1ef1e8ec5d973171fe39501138d55813788e
X-Git-Newrev: 559f363bc3de4c1e92c36d1ca5da180138162225
X-Patchwork-Hint: ignore
Message-Id: <20261106155656.730EF9E09B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/grpc: add
 security fix for eMudhra intermediate CAs
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
Content-Type: multipart/mixed; boundary="===============8643023823348815932=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8643023823348815932==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/559f363bc3de4c1e92c36d1ca5da180138162225
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

[1] https://github.com/grpc/grpc/commit/d6e310e699d44656167d7f9af8cc1f7208cbaf04
[2] https://emudhra.we-have-a-problem.com/

(alternative to commit 727b904c13bbc2a9a7a530b1f8e47d7d180c2768)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ....80.x-security-Update-gRPC-repo-roots.-43.patch | 13195 +++++++++++++++++++
 1 file changed, 13195 insertions(+)

Patch is too large, so refusing to show it

--===============8643023823348815932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8643023823348815932==--
