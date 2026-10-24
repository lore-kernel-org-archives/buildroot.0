Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A717606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SN3Hw1t0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1E881771;
	Sat, 24 Oct 2026 14:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATEGMuM6b2wb; Sat, 24 Oct 2026 14:27:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 24757817B1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792852055;
	b=XDj7H2W/inaiOpSSKaMu/kZnhWnWXHh0em3x/3KaY2GtiZC8/FhW498PwmozyV0Sp4d1
	 j2+nVcboLs7qN33KLagUdKlhSRoZmyq5dQ4UUC7s7yuNI4kXhPXRV+ZpGYKldXgWs5l7N
	 wHnOQRHXHarpYbmR03yWBqO0gq0P3K7kHoJhME02sRMGvomVI7+E63iLQT3rUPQzcJpIk
	 naOuWQOTAmbojtQWeVjAt7gkwv+LH/pEe/S9j/Uq0sIHebXwbq4DJfTQhqHN3G6mPXBhT
	 nAXHnizH5WGRhDlINp482oEPRvZEZsMdT5Jv5DTbyI/nh8xobvsTEzMN48yrPwhElQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792852055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RyTWox0Urxio7XIyVu86Bh8j4bqgsQcFZ6WtGhB+C08=;
	b=l7SD6jGSMS9IGcZ97qWhmmDitw9zfodDn6abrs58YqQLOMLlRlno81TyqSE9Q8M7tnUy
	 UzlgtFeyIsKbX1OBEyJAC1NXBrtYrvHaPfku5dpVCgk2aa29waoghFUwaA2mMorNbh2yg
	 Q1FFPELgQo6n9rDpAAD5iRu/e6zwHiu3xDCjrDUnvOSYGmqte4izTlzZdRvDiEKsTwezW
	 TSAIkyYahjiGySzx63m9i+2uI2QvLymXIsRJyM7dIphmsLDCoqs/Y5baTA07d09TMZS4v
	 pqUiqtMkwpBBEuFWz8saPk8fbEGpLal5wo/LdKLbFnyNUaUZDQJfZ0HieTEP70KWzLw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792852055;
	bh=RyTWox0Urxio7XIyVu86Bh8j4bqgsQcFZ6WtGhB+C08=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SN3Hw1t0wz7sb2noKOmH8DvsQ+AA5gabJTQRec2fNXwlC2gmENI+B+SGIm+clSj50
	 kTktIqiwseE2Az9GCih+PD+0Lq+xp+CrbVwijro1IyhAcnNc/1Fy4W2njpWqqgwhj0
	 aQFpaJtQ7GP4ptW9sfvAu+N+0YniMb8nOKeC7l0GtTc5I4e/BkkX1y93BznoR1R+mJ
	 Xo56M86V4r9dcFl4vi8WX5g/t2BebdqGnOuhcJ/eMLLM3ln5XLpgERzEf4J4Gn0noF
	 2U2TeYzg0bRT18M84NyF7SJBlfmVAO5DL4v8sbfeSlolK0hjgUmPwB0TvmFqb7dlRB
	 s5b5gTWhrOmmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24757817B1;
	Sat, 24 Oct 2026 14:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C037279
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D7A360644
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faBlIwRoD19L for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:27:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 803FC6061F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792852052;
 b=Nu/KHT3dTRsfaa5EyhiyDGM1QiOg5KqL2Y2JW8VZY3V4OjO/PVsrMy4BfGaytUvb7btU
 Gur1wXsvLIGL10RfVM8/UZw2NZDSwiDnNFLsIXD2HnlCQPTgJYA/K8SRgv/0Vl8+taEgM
 OIFldIHPZRqOfjhZBkb2LtQnnu1dkt/zaLwsh0SnB2Vw7nQAAk19ZPN8UJAzC+5Y1zjim
 QZTP4X8ZVQ/J+TnfnV5LKcAfP2CW5BneIPVScz03AZTkIB9PtGv+LFN1hGFDUPqXfgBEB
 79+cFdReYUy/DmwBsVRtJ6EMLgFAeKc2/kMGnnjKB1BNU/GSfdo+hPr/kXq5IQnjHiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792852052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MJFFouWMU0thqDLPg7RBBBUa6ZppaX+B7BV63V8dDwo=;
 b=U4R0lpdvVxcFsnys3Sqq6hDJjUQCvHzqJKsk5qELGxXCELZqI4ZiysEfu0zq/n8OwqXT
 v8QnvKI8H8cMl2pmKzb9fMFEWDTC0MG4opwRXYcgqu5m1uPFKt8YTJXN17mjFtDH3Gyu9
 lOnMMEnE2TFjizYcTsBn9sMDfkDFij/0oHS0X4joG/9ME4JWtFjtDStjKDTMIo1TqerAq
 bLch8tkfUusDQU1oJSIEirWT9rly8N5lzdJxFcR0c3zawJ9TFptZ6sFDqRGGlxxWBSYKQ
 saCFn9M3D6Uz6ToPQzRXJ+WASwzaUM4nfcgKl+h0TB67jX6EZw5PrICLQ19Txb1LsDA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 803FC6061F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:27:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83C069C7DB; Sat, 24 Oct 2026 14:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:18:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 000b15018a7bf328ba8b94c77b574dd1c72df6a7
X-Git-Newrev: c8b74ebfbfb1e9f6e1a3179e0a375611d39b3dd2
X-Patchwork-Hint: ignore
Message-Id: <20261024142607.83C069C7DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-boto3: bump to version
 1.43.118
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c8b74ebfbfb1e9f6e1a3179e0a375611d39b3dd2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/boto/boto3/blob/1.43.118/CHANGELOG.rst

Note: the change log mention a fix for the compromised eMudhra
intermediate CAs. This fix is included in the python-botocore
package bump in Buildroot commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/fd9c348c227e9560a45caaeaa2cb026a8cf8043d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add details in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index af7ebbfe74..61960a619f 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  9a5cb05d8aa6985ffff5be9c5f711bd9  boto3-1.43.114.tar.gz
-sha256  be704857751564a5cf69c5bbaadbfa01c22806409815c73563db42fbffe583a2  boto3-1.43.114.tar.gz
+md5  d4ef8a8162f55f930817bd9496801491  boto3-1.43.118.tar.gz
+sha256  c0620f799e0f0c222ba42c337b65cdbcd3da38a3121187f634d8926cbbb28a9c  boto3-1.43.118.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 7a8ea4b329..36ba647d2a 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.43.114
+PYTHON_BOTO3_VERSION = 1.43.118
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/e2/8c/f6f884dc947789317e73ed6fce85e18580d22e9f90e48d67c2367b02667e
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/96/8b/5694c8433b5202f34a82def4edee274f7df1eba2919c66d9d389d2202ec8
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
