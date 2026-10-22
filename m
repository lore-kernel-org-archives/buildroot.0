Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9136E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SSw+l25n
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69FDB81584;
	Fri, 23 Oct 2026 12:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvKvzMzy5obp; Fri, 23 Oct 2026 12:24:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4477381545
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758290;
	b=Q+1aOR7qqVwSukHFlE5o/+CRjWEOeuOmLGbaga34SOOvV0bPuXzeBdu35kDspSxsaErZ
	 NVdVPbZ0mH6EXwgc+3PHZAmfqeqONCIFbGv6bWtdvIlhHg92xJv8tbHyDcewxb/7lGP51
	 5ZBE68wdD0zotXbdmUAEh11EoBwdquRPrMVS/Htz8cGlpn/mpeZJSyAKYDvCDP/5+bqpb
	 ntLv5uLsXAT1q8wii66ISTyU7hNeoB270GMvOcnOSMqVzRo0LZXjyFxGo+Kgl0pncD0Ly
	 DPIgbsUefxIcBUaUFwpX8ftVQsoOgS6RWWC7IH9kyir5oRoDPpJ4aALQLqU2+De76Gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758290;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=g+h7VNSrajxlkrIg/cv2DN4IjQUyH2BWmaWM7dVMSkU=;
	b=DxkqsLQOoz4JitTPQElbakBn3peRyQOUaRRWakW3J/3qnEXRED2lW/+BlJg2h3VdVX2c
	 9OMbDcT/wxY4oUUxrRajYLyh3WemFSSqPFKxjxQYGingVwmBRbKdRciRo9NHksOGQ+JMG
	 e4PYhx07t04ZI8K2HjyBUhYN0jaRgkyQh+y3J7U5UJhbl/WTTkyeHsLqKZcLjrjqnuAB5
	 EO6CNfwq++pP1N9AQYuHRTxFnHvitfMn6BFaXQVVb44UlNB1ft4epR6Nf2SEQx+idUmOI
	 3AGyXJJO0Dov6VqnVoVmnrsVAGUNm3uxJbg4YsdAi23KIdjxhXqYlzavl4VWIpgk/aw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758290;
	bh=g+h7VNSrajxlkrIg/cv2DN4IjQUyH2BWmaWM7dVMSkU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SSw+l25nyeCKVD3X5AOWbbBD5SSIaCgZFYJNWil7KyiwmIlzn/9+THeO8eAMWLgWq
	 zearjJSlJ3nwaAqazZlcQ9dKecUtBAy0Pu0SI4AGjgg5dPCNeURTgGvjRC2mM8yayE
	 9d44aDZ9dLWqJDzyca85s8P9RIErVQu0uCilsk6vKiMBo0DKvoEpZCd+KVFXbnq9fx
	 gnB5SR+5BM33XbXV7wH9qd0rl+ucSdaem0+mGCWQBKYJ/bpQebXcP0xiNOtgM96jgG
	 qgQ76XbYPnCxEmjBaIeWHwpZ6gAFlMmdyOMDl8nZ75LSoZqDuAeZ4wavJOHtlfwn9G
	 7P1sLKh0bS0eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4477381545;
	Fri, 23 Oct 2026 12:24:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 338FC12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24EEF40810
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XV9VQg-E8kOo for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7E6F54072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758280;
 b=XHWkgkmEIkFVRIsvk+EDT0S9zXpTC54dJwCmm/7laTQw4OeZWSbbAFpsGZmbNLwznym6
 hUOsOkDhhG/jBtXuj3zR3xL0sft/dIbsl+TjwmTNaihQ9mVotWkWbEs7BYzJe7jSxEgnI
 rohH2HrCV5XGoKoqh2lbOhUg+S1ICbFQ+fh4vXauDRtaVFFL/dKTYuyerX29wGyD1eV0p
 Xtvd5Bw5q/S3G47A1psfiUJQVMFVjlPbyNwmOW1H8ryPNjBEutEKpU5BrUJ6dc4yJM6lf
 qOx2bsiej7E6pU1ekAAKmxyXvGWQ9sWnvejjVLrZwuj6FiGg+mIgaZtbyHkNLew8+vw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758280;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SnV/5bdYhR/h98Ml8wt2EXMia8O2frsrNCYhkam9JvM=;
 b=otk4qeorYc2z1ij6M7sawtmRJsFrIBaR+0sWSmOjrvTJWxay/yKb6EhLlf+YM0g5Ls0u
 HFhzDKItv6gp6gkNbusrnx2SNgtPWi+n2NHVM6lvVzZcycCZe97yoon99dUn9Jb738x3V
 CFY4YI97J/H1Z5poj/gUUnd08JU2FQLZBgobwxSrPDd1B/rxu12ziZthTygghapljfpNx
 z3R3eiW6lYk2V4x2Pg+HS60joFf9nHylnE9rxJHAHwwusZyBYlwHUCd6tQVC2XmpStycW
 sGdYgV1z2/aV3mOVySZpNM7TML0L/eWwv2uuCGgcdtopf6h8cDoJtlhDBhbexEcVdqw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E6F54072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 012269C66A; Fri, 23 Oct 2026 12:23:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6bb1dbbd38652c9dd76247d4d6f9053f25e86366
X-Git-Newrev: 479cd63564c23a1c81ea5e1290e5bac66aea60d0
X-Patchwork-Hint: ignore
Message-Id: <20261023122316.012269C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Yegor
 Yefremov for libmicrohttpd and libwebsockets
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
Content-Type: multipart/mixed; boundary="===============5779221689575824356=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5779221689575824356==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/479cd63564c23a1c81ea5e1290e5bac66aea60d0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ea4388b3b09ab34513582d01ddd6a524212a971e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e6ed115011..e769cab975 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3401,6 +3401,7 @@ F:	package/kmod/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
+F:	package/libmicrohttpd/
 F:	package/libndp/
 F:	package/libnftnl/
 F:	package/libqmi/
@@ -3409,6 +3410,7 @@ F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
+F:	package/libwebsockets/
 F:	package/libxmlb/
 F:	package/libxmlrpc/
 F:	package/linux-firmware/

--===============5779221689575824356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5779221689575824356==--
