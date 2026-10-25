Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C0606A326
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GhnuCPoW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A418F80D5E;
	Sun, 25 Oct 2026 20:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipAuuUA7xxci; Sun, 25 Oct 2026 20:32:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 745C480D63
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792960374;
	b=nQQ7DqoF+g30x/eYlSWlI3sP08qDOvxMm0sqL9bWkoIhp3DZcGo9pXMZHd77KPNJ5+CD
	 +SdDt2YNXnYR7+//Xmg28HY83huCzgUrkYwfT+d8kwtdGP3O7AAR9il0XAPKCuItpcJJE
	 1lDSu2WGCqFypg3nFczfAXeX/C6ySdVsVXQGSvHGl+N4nJAHnemb7jNbtCwWHCKKWhaG7
	 EoNCo65PhDUbAMF8M0fwtfCjzkSnwmOCnAp7MKK4FEuB/zHw/auE8roQNqhk7yEgozpBx
	 xlA4htIDz21YSW4/2aUAOZuVtPlmOph9pZxhzcVa8XYiE8fHddWp2x1bla4eeR8i1yw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792960374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FqPrWbctlJSspOxcA1hYKXTF8V/jII+yxldvWiyjBSU=;
	b=E1pJK2Oc95+f5Z0XfGgRQW2qFPgi4SZZEtqdU8CQ7foKCNc70aIjwxK5QFU2T20qTHPo
	 YkaVb6iMn/yDdiZ1rPQ494aiclVvAfcJBap1zDipjM6Gg1n7VEFJnAk5puYvlfjK3rlZv
	 erCsJf/FtxgkYcwu1punRZAzotEoQJ60ARXeJBnK0kd5YFKsW7K2TrlsBPl/DGgjfDijd
	 vRAsy7v9sm5/FiN92IiSr+Lrk+i3+Zp2R821s27hwwBtM3FwLW/LmnHxuYC07bOKhoyrO
	 /V04yP+qhsGMkn2KcuBZMGb4GxgH3kjNuHUFYHCoDGHCW8h6UdWl0QjZ5pKAJj02xYA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792960374;
	bh=FqPrWbctlJSspOxcA1hYKXTF8V/jII+yxldvWiyjBSU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GhnuCPoWD8J1vKXRTOkht9VD3PvgtGOvrTjN8gDy3R6vaqWJGRlEWE7oK1OTm0ttK
	 HFDgsYleFeKuRLL6yXd89F+/AQcWklGVCO7Bt3gaYWj8TGjuesiZfUOYRbSrik0cSe
	 fa+POkcrUXeGnotZR3pjQS/7j+n76nsoO7BRSumsl//F0t61ZBPj0bJGjcmROkrGE2
	 KuuBz/lrrpVtycfSeH40GmbffyC5HYaBfdIIJflF8eXmn3X+vVS0LCl3sdgzjKNnt8
	 730sEW9aqOm7HLZmYVi3jQrUvnDiQLU8wikn3g6RHHcF2cp9MeYg9GpacOWjy58giy
	 n54imDa+8BdZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 745C480D63;
	Sun, 25 Oct 2026 20:32:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01A6E3D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC79480D5E
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNOozNs8EnWX for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:32:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 629A980D59
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792960371;
 b=ORMOP90pobEnfFetdu376ZfAfuNX/hyoYqvIswpw+oKxo0iBxv/lLT8EvpQJFkbiIlQP
 G4wEbDVVdbA1LdDyD6W+Rv+5lGH7DfgDBdNc/H762zOne1qB0vmZbw5piEp8ekNFhDCdS
 v8NzLm0zMiTMd1nVlTaFWNpbcvBVOrT+kS0YsKNdFjhs27g02O7mfNIgDjrEzqWnmtHUl
 RJtcbUfnN2kQXl+MsqMeIHSKsmPCsNnGcUIlx63l63jomfmnk3WJVwz7VkDCXYRI5W28Y
 1pV332sLim53NcXsGKP5k8rGwzVdPadcc4R2qM12dx9XSv8tbbXVybkO/ZJvpboXCKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792960371;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=JmMYGlk4Q/WphetZw+5DoUVDbD5vtdmnA1R3gPXanGI=;
 b=gw79WGDdcq+YRMrW18ToaHxx+YA9jk8yuW3WMped3i7BdqN53Zs/a7PnhK5M2hgAnnBm
 bXCPP4OeZQHZDBBH6NX07OvE4Zu2OkN+mT9pCcVTpHr3JHwMWBxZx4FSp1wZ0Gvp20Lkp
 5B2BuMHJiFvUfndzO0AieIioxVTlwbXpu5mYk6o1QbBXq4daA1LkRdRZrKGvT+jiQo72E
 m8KlimEmTAQWhxuTBy8BH3/mNs/N6PtoL8KDZo5JNPtZ7J6rPcrS23ps3zzRbLX2xXYzJ
 yJrf1ApdYKzxAroj9k706emDReYvVuvbvWkroypFtpCC3MqyxWT8BLWlL3DNfwzup1A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=a6JprPL7; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 629A980D59
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 20:32:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BBD30C51477
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 20:33:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CD78960740;
 Sun, 25 Oct 2026 20:32:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A818310328E76; Sun, 25 Oct 2026 21:32:43 +0100 (CET)
Date: Sun, 25 Oct 2026 21:32:42 +0100
To: Francois Perrad <francois.perrad.86@gmail.com>
Cc: buildroot@busybox.net
Message-ID: <at5nUx-cQuwtBiq6@windsurf>
References: <20261025183349.195408-1-francois.perrad.86@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261025183349.195408-1-francois.perrad.86@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/luv: bump to version 1.53.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 25, 2026 at 07:33:49PM +0100, Francois Perrad wrote:

> diff --git a/package/luv/luv.hash b/package/luv/luv.hash
> index 779046e65..2e31e4d65 100644
> --- a/package/luv/luv.hash
> +++ b/package/luv/luv.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
> +sha256  ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea048f96e1  luv-1.53.0-0.tar.gz
>  sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt

Somehow, I don't see the same hash:

>>> luv 1.53.0-0 Downloading
wget -nd -t 3 --connect-timeout=10 -O '/home/thomas/projets/buildroot/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/output' 'https://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.gz' 
HTTP response 302  [https://github.com/luvit/luv/releases/download/1.53.0-0/luv-1.53.0-0.tar.gz]
Enqueuing https://release-assets.githubusercontent.com/github-production-release-asset/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-10-25T21%3A22%3A49Z&rscd=attachment%3B+filename%3Dluv-1.53.0-0.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-10-25T20%3A22%3A46Z&ske=2026-10-25T21%3A22%3A49Z&sks=b&skv=2018-11-09&sig=lotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUSaving '/home/thomas/projets/buildroot/output/build/.luv-1.53.0-0.tar.gz.kAkkmY/output'
HTTP response 200  [https://release-assets.githubusercontent.com/github-production-release-asset/6127999/7be72ad7-4095-4035-ae4d-d79da22dd34c?sp=r&sv=2018-11-09&sr=b&spr=https&se=2026-10-25T21%3A22%3A49Z&rscd=attachment%3B+filename%3Dluv-1.53.0-0.tar.gz&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2026-10-25T20%3A22%3A46Z&ske=2026-10-25T21%3A22%3A49Z&sks=b&skv=2018-11-09&sig=lotpmmBqnnjLIwii0KXbNOvmNsEsS%2Bm%2BM0cwAgXm1Dk%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc5Mjk2MDMyMSwibmJmIjoxNzkyOTYwMDIxLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ib/home/thomas/projets 100% [=================================================================================================>]    1.51M    3.92MB/sgz&response-content-type=ap[Files: 1  Bytes: 1.51M [1.19MB/s] Redirects: 1  Todo: 0  Errors: 0                 
                ]
ERROR: while checking hashes from package/luv/luv.hash
ERROR: luv-1.53.0-0.tar.gz has wrong sha256 hash:
ERROR: expected: ce6260efb974647e7687f54a54a6810bc5eb81cdc14b45b69868a5ea048f96e1
ERROR: got     : fccabc7bb37fcc3b84ab258a19a862c55f67abc2059af0a744a1ae64119dfc6c
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
wget -nd -t 3 --connect-timeout=10 -O '/home/thomas/projets/build

Any idea?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
