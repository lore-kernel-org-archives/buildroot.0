Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2EFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 12:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A30783EBD;
	Mon, 11 Apr 2022 12:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hhoyrK8v0xtI; Mon, 11 Apr 2022 12:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6751A83E2C;
	Mon, 11 Apr 2022 12:29:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58F5A1BF591
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 12:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4738A40A05
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 12:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9e8cN-fLqJK1 for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 12:28:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout-b-203.mailbox.org (mout-b-203.mailbox.org [195.10.208.52])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3ECC0408EF
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 12:28:57 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-203.mailbox.org (Postfix) with ESMTPS id 4KcSny6nyGz9sdH
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 14:28:54 +0200 (CEST)
Message-ID: <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1649680133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eHKgDG4ib8a4y1+5vYIRWHifId4T7Lfxq1IXADeXisA=;
 b=UCWDix/rVWsFtM8EXEUY7dAgZFLNYblFsQD6rpv71gDa2HfqKTcbovLAlPbb7O/mBOoWWB
 kYh1+FO5QI5h22mXFYGnP2ZHGMUxfRvpU7/2VN76tqHHR8WhZurZYRwO9uy105G7EvrzX3
 bI5fmDY7ZGRNoaV389lD3ul4R/rvomAIhCRWM8hMrdmquEt3JjZuTHxSAtLquM5RCq3wBZ
 bFseuSvHAqX08mmjxgJbi54tm5OJltVzxCuOO6vNDCDcBROfGPJI4x7O1OM5Rt4rhQRYA9
 Hv/NKGWRaFmsemPGlhVnaav4APhyW/5TXwh2Gm9kKtaBxumPEzsbwuDtVdfvsg==
Date: Mon, 11 Apr 2022 14:28:51 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220405185320.319C18361B@busybox.osuosl.org>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220405185320.319C18361B@busybox.osuosl.org>
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 05.04.22 19:28, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=2642edb0af08f04fb98f4cb5f88895faded4b325
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes the following security issues:
> 
> - CVE-2022-23648: containerd CRI plugin: Insecure handling of image volumes
>    https://github.com/containerd/containerd/security/advisories/GHSA-crp2-qrr5-8pq7
> 
> - CVE-2022-24769: Default inheritable capabilities for linux container
>    should be empty
>    https://github.com/containerd/containerd/security/advisories/GHSA-c9cp-9c75-9v8c
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/containerd/containerd.hash | 2 +-
>   package/containerd/containerd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
> index d5aafe2e70..23dacded88 100644
> --- a/package/containerd/containerd.hash
> +++ b/package/containerd/containerd.hash
> @@ -1,3 +1,3 @@
>   # Computed locally
> -sha256  40c9767af3e87f2c36adf2f563f0a8374e80b30bd2b7aa80058c85912406cef4  containerd-1.5.9.tar.gz
> +sha256  6a289406c1c0583763e5a9754e31a1eced55cd5f162a7bc2a3a315d5eb05c7a1  containerd-1.5.11.tar.gz

I get a different hash for this download, both within buildroot as well 
as downloading the file manually from github:

ERROR: containerd-1.5.11.tar.gz has wrong sha256 hash:
ERROR: expected: 
6a289406c1c0583763e5a9754e31a1eced55cd5f162a7bc2a3a315d5eb05c7a1
ERROR: got     : 
02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6
ERROR: Incomplete download, or man-in-the-middle (MITM) attack


Did the file change in the meantime or did something else go wrong here?

Should send a patch changing the hash to 
02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6?

 > [...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
