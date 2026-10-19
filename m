Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22077606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nv/fLNWG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5B9080E44;
	Mon, 19 Oct 2026 16:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0YQWWeXjVFW; Mon, 19 Oct 2026 16:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0696180E45
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792429074;
	b=ZMw1ym9Q3a0YW5xHZTEvkibmjw5v9ppA9LjqwznQObZtWFsvrdkzmYz5zMqE415Dv3dA
	 bWNj5V58ii7jIZsZRHUZczGHUb5BUl22x4tR4R+nvgWqQXxmD5X7MnSxhAyDoJfb7qzoa
	 DFUdGvAIBl4LrOb5nI2fLhBtbZSqcujuCJqjpeXDg6y5VuPzatqGz2Iz2vm9f7p7r1WxQ
	 SBwYspRMryX/SuJRVXNjSFdTPgoT/d154VTM19VH1IQ2t63rhxKOW0dhTtED7mMvBZt2E
	 IVdVv2Ozwj56rcWWI0MRowXVdl2s0QnBeEnJN7fe795rQ53eGsXglnlcUMvZbl6018A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792429074;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Sk6DWFCSf4JXxLg4QIMkQ9LDdOXZmLfPsdMXAsnZi/I=;
	b=jB/P3agAxogdAyCjoieQmV9Xw04F8a0CmJZBEbf93vi36lEReXpmUBd+BqoZrs/9UCLx
	 2TpgrYfYR/uqlZddmZyxhwSEBfStH3N5ef5M25ZvzNBCg/LjG/NCYViOY+ahK+cyyOuac
	 sBR5MANJflfsk21QxhbFAmyQ9taaDH+IDzyM7CGNxzFjnPfRypyVi74XHJqgHKiFT2925
	 WVhH2BwLTKeMmrkJeJ6pHgNFQi4DSvC6404TPFAy47ybF7HmkP92ZxrSwthsCNJEzzyCQ
	 kVRNNjJ0wIvONpPGZ82MnmJ7BIlm2Ici1jWVeYyeY0PeVyuE23lsvdyqFbXIyZt9WKw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792429074;
	bh=Sk6DWFCSf4JXxLg4QIMkQ9LDdOXZmLfPsdMXAsnZi/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nv/fLNWGRNU63qzCCdhKI9O1v4ydOE5XCXoOa3bbmTjfPwiaIu1PqyKiComh2ES6x
	 9Y+37gOsXftsh4RWm9LlJmV2XXvxCozXvFKOOJGwHz9NdqlYTjN4q7l1vdgPqupQ7A
	 IBZFcXCzcR6ZIeKa2PZj6u2NG+OdecAGcUDY+RnF46LF3njLUPv+Q5bihlKWWh9zz9
	 bMpYZpxBcgkn85dlEhfNuuuvdbUVg9shUEUYXhjbCxgBRryv4ZiSt+Q9oZ3CmaIzyp
	 AoBBh9kzOKB7LqdmCjD9BpCUwQ0phGmKsuQ7him2XzssQxDJaCp1PJ4u4OAqsPMM2Q
	 WB2aeRL1xhdRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0696180E45;
	Mon, 19 Oct 2026 16:57:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9893623A
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E23B80E45
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFXILfFXSY9B for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 16:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C822980E44
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792429071;
 b=mtVTWlsJzHdF/jXS7fbyPXNsOUTZCoI366h+otnmVDkRqyU4HanHc3SZ3H4KXru3+L01
 JM83DbvuPfy27CWKPuwI/gMovVf69CoyI2voGGIUw+SO/KdETW4E9FXjQSgAk8FgHzddx
 3XRSYtUSCV7Lw4ArlzWwrZvWnIIrOO0DTrir1mkrVMHYqA63MMJ1M6Y0oV4bRvozOm3l0
 smCfS0k5a7XDO7msBJxOmEYcsXRAlPiUFDrMjuMqrt5bEoKK/003/hXOXJn5p04F8w8Aa
 eyt8nOsKz3noFhyb7VQzzXPK5as6/Ydd4ABpdlL+ErVkHc7tzeRvpjJcny3f0q6elIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792429071;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Uff442OyWqg6KdnbFliQK8BclFHYK8eK8/kJD5IwCKM=;
 b=Ck7KcK+90yjVhZbupbhIdAyjC12BNCPkjj8kr2zFCDBdKyf8FNW7G0EZvDUyh3t0hmf+
 m3SCEjaLsnD8R9EIf2grCqPPSKQGgsVpwUYBhzihzApUZGinVNj7pcK2NeOWUCD4s3uUA
 o4wsJHZq3DyAwKFJcvIRwOjRSe6NCgXGkVc1C5IqrF2RXh1ZDxuRPoXH9NZSBHBE9Y8cO
 4oMgAXwCB0QegCx6R8D90975rzwxrKwB/puD5o0So9sIeZLDKKkpQqHga35pNzZHx3ips
 BtoAIoV3U0ywmnuxK+qvrHzFFDNM4+/fpI3MYQyO7DkKJyVc9qV0VPvoywghvB7raYQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C822980E44
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 16:57:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2375B9871C; Mon, 19 Oct 2026 16:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 18:57:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c65582cfd29a1c12457fb506014673bee727e9b8
X-Git-Newrev: 89d584b8e2c8cda252c768dafac020f79d739691
X-Patchwork-Hint: ignore
Message-Id: <20261019165629.2375B9871C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ffmpeg: fix hash for LGPLv2.1
 license
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89d584b8e2c8cda252c768dafac020f79d739691
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The LGPL v2.1 license file was edit in upstream commit 4225417da2 [1],
which is included in ffmpeg 7.0, and Buildroot commit b68bde5643 [2]
bumped to that version, which made ffmpeg-legal-info fail.

Fixes: b68bde564339e96397929b45c04d137bb65df43e

[1] 4225417da2 ("all: apply linter fixes")
    https://github.com/FFmpeg/FFmpeg/commit/4225417da25e45ec807d44430fd8cc004402df02
[2] b68bde5643 ("package/ffmpeg: bump version to 7.0.3")
    https://gitlab.com/buildroot.org/buildroot/-/commit/b68bde564339e96397929b45c04d137bb65df43e

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.hash b/package/ffmpeg/ffmpeg.hash
index 429b11c3d0..481fddcf61 100644
--- a/package/ffmpeg/ffmpeg.hash
+++ b/package/ffmpeg/ffmpeg.hash
@@ -1,5 +1,5 @@
 # Locally calculated
 sha256  bbb18f3cc5c1c34b21cf176c0168c4d9aa97697542a97f60d491a58a814dea65  ffmpeg-7.0.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
-sha256  246041b6ecf9bc32d718a62c57877c78b5eb397b6467e74ed7ae2626ab189c30  COPYING.LGPLv2.1
+sha256  b634ab5640e258563c536e658cad87080553df6f34f62269a21d554844e58bfe  COPYING.LGPLv2.1
 sha256  cb48bf09a11f5fb576cddb0431c8f5ed0a60157a9ec942adffc13907cbe083f2  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
