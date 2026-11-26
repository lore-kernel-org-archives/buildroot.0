Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB252606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sc9c4YZN
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D20811E4;
	Thu, 26 Nov 2026 19:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE8ggyyCu01o; Thu, 26 Nov 2026 19:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEE6281208
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721120;
	b=JNH3tLrLbTWm+Za4ZEPv3wUppg8IIK7VLDy7rTSRfO/P/OMjSY7FPNIJ6AhCPu4z1YIr
	 WMVyyLGNAsssrcgJdyDXmFgIGy1e91h6IxSTqMPTyLPQs9Re5/M4CoayuG1jFC5T61E0n
	 ac0knKFuYjDr+fpsc/PrxfNcE8mx7eFTzfnT9b8J4UVjqZ1AxAgP5Ch8myTMq5ETDWfpx
	 YW0wJe7R3pNsluhsIIVpnFJxiZDNQiMmNB86cxx85lyQ2pICwX03QEAi4nJ6EKnhneiii
	 qjMRorQ1sKa4EmWqdXoLQqjq8mVNV92z6HwckPyn+rYroF2f6+PnT+GAPdttY6MS4cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=qkqMFUY3pi4Gowg0sT+RQ9/9wJNWT+ReGmijVOrx44c=;
	b=ZSookDx8haiMmPM0M12aw7AmZEWueXnE6ytszgxzmy1vHza92ybg6vPsrJvzNK4/89PZ
	 sV3iHcNRAigwauImjnopwXDWOI3sjV7YSoLuMDtPMblxLBXIdxQBxfVNVzoDP0ZkHmWo0
	 zzfdok4tW8qW79W/dUFPTq9734uS/utEKj2hoHl5rke/iUpGDOe7p4cEQ/sRP7e2IdeEF
	 zQvyx825hq4I04I+SqykevFg3mG7UgiZ/VM5W8sgOkdeeuzDEQALGstvkr7sdefKc9E0S
	 bpqqQZzsdVCe5d4YSJ0pDceVj4AqGJithEbCCTJki3OcqSbQxVa9IKcAxJDv1ddZO5g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721119;
	bh=qkqMFUY3pi4Gowg0sT+RQ9/9wJNWT+ReGmijVOrx44c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sc9c4YZNAZ0OkwaHqpYnR11SFQ/6YDDO8ri3+JqqCIQpYYy7pzVrPVw9uHX2kKvbg
	 lVCaGpZrZAnwLxFt8YAgmG4iptPWd+fllKPip9wDMm0hEXBlxOHsgOrOB0rSKb6nKZ
	 xcJpR2ybluHeBzZJKdMSJOK4vBLpmuN57OjJfBBkofXfiLckdsR0rZPiDe7OtCiZLM
	 qEateGP+xa+f3M3hjAecyyFDYWiDDaR4TziqnMiiTzrrt1Vf6zzEoAw8LiHqTmI92Y
	 vJGTjnbRKtCFkuLz6Y9jSodFAht4Fb0sCi6ZRYJ28bPAaQSlOIHBZDxkWl1ZnzkrVd
	 q2UYsKmPZvrsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE6281208;
	Thu, 26 Nov 2026 19:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8832B260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79AE440540
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oPf7XtMbeWP for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2D55F400E6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D55F400E6
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:11 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721110; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:Rwtzsn0VfDYmGgDESgCzDWrPP8ox
 nxriuXWqqTwfh8rhAWaq/bIlWK1SrO2+ZaZd0IyG0snF+ChSaa6xBLDK1RyxflThIBG94tbrwAn
 jvUGYd4D4nC1d1g4mwneauEUu3VUqBse57VqYVtIksoUnJih8fP29ucI0agZISlEmkneMI4kJdj
 mGZCWCijLCgDnhlhdZJXNygirLAk05Uu22ZCj7jiksTqCHAUCPPnY2Gg81YQBmrXg7uol/Fpmw8
 hpEP+X1U2+jd4FovQ9vCEAvn+gDZF4UjuqkCqEGw+Qz557JRdMTIsFCj0OhawMgY6MLn7WclLQG
 ZOew5dzuexAoBw==;
Message-Instance: m=1; h=sha256: qp4OP+EtnMF/e1bu08Sh4Njj/Qfs9OZskh5Rq3dqHZo=:
 EBI6uGvCWmEkkttLNFwRQRIoRb/dyOl+YlisijavdkQ=, sha512:
 I7yJqQY1eYVhikY5mOVNLdCIhJ54IhSu+A3MHtvG4tR2nMYFt21sMrV9omxXBbrtz2naj2GujRYL187q5xicVw==:
 2wNw1rlBHEAoTyCTmnHNEQTHsFUVdyu8KDuMFUdlNZJJsqrzovwch8J/fwd8yMsHR+41LP9tUrc0gXHyPAlr0Q==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV63g-1xyo6008so-00MXjy; Thu, 26
 Nov 2026 20:24:58 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:30 +0100
Message-ID: <20261126192435.1826415-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:0uqrqa+DQoHZwcdZMf+w9qjc+WZ4BskcJ51ZW/p/9lzFquR0XL/
 FabHPFn6GKRBJEH3ffCUm0giMPZzJgVJ6wOsUOXmaPKfewb60i5ANZ/meN/9MekwxR0NLzb
 ZKx+8NpDdvXbaxQIRvC/hJ0MWnfSwGkPLUyb8hX0ZeXGG1mCPa1EwVUcMPwUnJdj0zbN/T1
 Ab1eQkDcZ6ePkOf+h42Rw==
UI-OutboundReport: notjunk:1;M01:P0:8bUZLjqK7L8=;PDOjwhvM7AWhOtdjOuygzKXM5Bq
 twpW2KoPj5JZEPxARU+ZnNDRZDg84kCY0xnpLXYgM1kcAYGhhLOsG1M36i76RYIT/OmVDf8/0
 f+WD7EJG4AfAmwkUf5AWyoiUu7oe4e0yllnTVO8aCFIRQDnUWKvqiGy44o7feXbbkNUgTGn83
 PNa9Kdys1jCL2I6PkGWjv9fTe0NLzF/s/EO82WzJYSZF1B6CxKbjj94L6/N7E5LFg7F9J7GpH
 M1uL3RWWLQTZU2qBAUXhC5fIlFOKK1OXIGERFxeIn60PfGO5ToVttugKUSBZQdGpkLbTBGzBZ
 NPuafxYwcNChKHtgrXZHEsI6Cj0plr6zzSelX7VcxbN7DT6jJbJnt6INvMV8lzNEd286oJwkB
 f5vKcBMTF3Y+woRH1+dGrWmr/Fylk1IrRHoaP9Qn9GCb2We944EpHCIcNc/mdzE3TwTYtg8Nr
 L8T6q+jc4hKZ6PLwyomYOTGlAOcj+O60xb5VEBJIjRA0FV38DNoyy8DISAyWhEduICXNt9R1j
 zXA0pUIZaBuLHZa3mmhk3RtBKWqjumaMc/91te+cdDWYO/0TvQpWwPL5R7mIyqt7QO7dDtv/w
 EdGF1fB9cjOlr9MevXnwqqkgERnOoG5RMeizxJR1mw5tnhgrHWr1jx/7aylqG4F0IblIxeDQG
 h/+F5jsTQRXxQdtKTVqHepp1GJW4AJDlyth0GU95g61xPSaFGykf8QQ9QRJxDKeLUXw0otCJT
 +TLZVGg+/J2Qlx4YYGF09GwznowZTGjLSVGWcu31EzreB9Bf1wL8KbILn1cIzat0vDZUcZsHn
 v+HznZPKH0CaPqcQpK9mU4frV9wruEs4futLALcMoB19IfFzdgJKrwElTF73HxAGfP6OOQqZI
 sDe9BAPgzIhi+ypJv94TvTZXsue3Fda+/u3jwyYkAjK0Cc1LMGSQd1qiS8eexaMA9Upx1fcF4
 BNaoyXAvBqWbpWTL6ONk9IhKO5nVqbULkmTSVmcuM6NFySfrn7FmrhyXIuNMaXjHfnz/sNQUi
 4QNf6o9CpttSS7yArtRoeyM7V2GgyUSzUo9xHw3ORRMd4Xwa6Vt/y0VkPJa8eJEH6TPLj1uNC
 Jv5vVKicqL1wtEuktYCNiVVD2MDhYULG/Akd7pyxFXMIKFYzKZ5KhYSoyRDDeL4miIhvFcJ2g
 DwORYwjakIRXN/ALyjm/O79Fo/eR5B1wnk4mQACHeJZ+6LeO8eUdQ6Z04u3zSj2JSChSN6hZi
 5tfqG7un/GAXCT/v/xUwl2DAzFegB89orMYUrV5/NZXA11evM5ffsTCA0nzMVQQ6T7m3q3wjy
 YwObHDICIRcWs0Nw1G0B8TFa3mX7HJLpAGejP55f6HyJ34puZkbedTKopqrUcrnpE8FFE2MbC
 m9KipeG5Ih+jmRBdXzD4xdXi3VxodaFaY141ntI8Q4RXx3QFaw1K4LbuGRXIxoCtPh/e85yY/
 kWvjTuTLwsdoCpFooI4rZdVQ6TUlvFUderh4l8rUJ94xDLoE7FYH/UQ9pqqixsObGOUXL5GXZ
 030LJixrsz9zH8wkWVNQvSKAZkuSMZcyOFO6DiSyaoJiZz3xbhPUxPJRuWeWD+c6uJE6iRa2+
 2hAR03H5/86+Dh+OeH8hcXKPBCr82Dq5nHd7xphGKqz5dtewEENm7sVUKZ98o//8Rq8HcTWUE
 u/tj/7vKP12zpKXfGaD14aglGW7QYop1Lq+btCbbrKuiZEV/g4+6gQrU+rJXvJ9gxFoJ2CH04
 K8JYBKqWPZjL6U18nDBGPTOskqDRrjafTOshOsfJMLhYj1aV6GTT1Sbds9lCDf+WvO0tufbTZ
 bkCEq14Ylu0TJdixhq5tdnX5/fcm2W78s1HMwOP7XtlMhy/G9mCeefaA8zCtbqBebSmj80wR0
 FYvFU/yqE9Wrg/r59pwQK6l3D5njiynJunBuSUGaw4WSjCNNrAUA2XntEgs+ut4IkyJOk6Vkq
 0zw+ZjNa+ZFwcn7WMULnJghzyQn8UCZELWkezTfhTi37+7sWzXIqTSKc+6sRG8/CeMRFaDBSU
 +u7nyOQgPKXqQuY2y8NcPpCBkbxJMpCqKGD5dfSh6l0p7oYOpAuWKAJwcpZHGauh04MZIHiZX
 sUrblTDrZmNOY1bfuqZAHOSjBLnyfhAZM96nrCIlbHKPcxLcdXAxm8Sdp7rFu1c9r8+Pzhxwz
 R95VuI7ZmUhze6z0KwdM3Mson/O9MtVG/gTZTbwCdDMBk3XLi2Zv7hQedQyCm2ZAzZn4TLKdU
 qwt4ZMpUAYPC+q9l4GHGacFkAPJ9jzyHu+TGCUsXt2ajzTfyfVIE70pMMqD2ptcOofsvRcfKk
 Q1xETG6DTQOR5ay9IyScY5af1f427GsteYGYVgGKKJyPTKWUevc8DOcxxAaHytsY5PQdyMET+
 1hACAiMn3dj1fNqAU7KZ+meuwHYci4i1oaAmbLFV/RwU3qSKXWg4Fp1b6JMvBD9t3FykKnYZc
 N1oG1N2nfbs0GUdpyvGD7IqYEQNFGLM4WoA4QpZqaULSWil+/Hev37MWQ6p4DkH10xd40Aouy
 shVTOm2KVHlz+UExtflZ1vcnOY+q5BCVXrmi7SXXi3vC+fuptSwcawvF7fkfFm6mO/CGl6NV9
 hIE9YLfp7qjgSkdi3Hrrhq6n4a2J9iKEo9uiss205HA3tOuEXuTSZzTsnddrbfTzdXasKL0IY
 iNxfDYDg9Zv560mtEn5GbLL/qkXhsC8OLKcpw9FkrPe2CMuBYvAvbUV9USnKsfCNCioYMLagb
 HzHAlRLwo+ik4EaDcsgBw/K6NSY1yB5NXHW1lvDZLgVxlM7wvDHlJZz9WFWuYPjBWBVsL8g84
 ZomF/pYTjCXacOtow2CUnoSInRvmG10df2ORRcHMZNodNr8uFJhTFUcz1T+mo8QtVg4JFbCp1
 AZ9fW0gPBkdn2BgMJwaxIDrvqde8Q9vO3UQLzwcgpmdEJ752IPFbEdtnVz5bGOLbIwmZZty8x
 XJ2aoP8WW3epCNRi1jz67wULD5YxAoUIiHrCkh9OV3itNgmS1G/4MX8D6lpW93HQNt60qv5uc
 eos2IP+d4o6xKKeJl62mxS95jBGsQpRTv5tEhL5PBAdT4X+VNWPVUXJV6wcNs6B1gCCqDKTut
 sb+0V4FndbWcdGm5RIzbCeWmUj7f9Xk+Xu8t5OLaf5NtQQ8wqEP8smpbLmGYsh/Y7INzHLIhk
 Q2u0x4OlUnxiENhM9DRhIFTfHZzwQWzaqDxggJueqvT8LCkT51VevnK5GYtK1AtifQnJ+6sM7
 QjgJBbfDrfKBpRK7C7v0xrBa9/BoCEmcbkoRXDf0mIPqQPJpm35IoS1bFObB1oEsrxGQUUSFa
 Ck5QIXuWLTEI4s+JBn16NQ/zLVVD8wZcOvK2aI+YD8SkOyMt7zqKfMoUPhU+IolzWKb4ICMiA
 rwx+KbYAc8z1DGmSvIYb3OagODqIkws9YA2NtBAtkHXyEATAdrmVr0GikC/U0rTUYtc+hY3zm
 k6xjsuD+D+KQMtHkGCPI1xTBkAUnf/bX4kB9eQteutlAy/fbyXYCRJEbzycm/Cz4iekY1Pbo6
 oeMV+RwMRl6bZiy5BwwPW3WOyre1f4AESBwqR8DY103laceWcVd2LsK3y8IkrMKZaWHUjiecz
 2Bg6OeYBMy2e6R26XSt7rCuS8hl2UUpdcTAqNKQejYmH/xGjNAqUb0SdaxfMwam6ttLQEedzG
 aQqmGYyA2kOPxD6TkVoImLkD35guMkogKyuyWxx1mYAgNdaCmXzUIkf+GORrTGTJr0yoArty0
 43XCMuQhk2j8kfKifoe8V6whjvpn4ohIjm/LsW9qG/pUSXvVfSSiDhaEQAxFkc9/ZXcrhUmHZ
 1lA3ecLeGaWSUgEeXD8pquTti0egQjLajMfjEaomYzJt3Nf3+4HObJJ9T0MXVmGBZrtIwPGPX
 kR7mxKORZbHkvv+sllGs2EQL60yoOQhsD8bESj27aSfQiK0L2slyMJLl1vz1wcfHlEbKDgJ/y
 1mCIN1kkL6TbOGt0ifr2ks9ulPXKegyVRFBTKZRAACKMe6RX6Gum/FY9Pq7iR+uAQQyAG3/Rq
 L2UxcHVnf6emC3/k7XGsHQLz3oGGIer8WmNrNNOufCW7cNuHCfVa3wqd9m1Uvd6qgJTfzOi2V
 HbURltIAoG3TyL3LR3CqKaJP3/7u7Xiab7tH+z+VA5AuRWjgi2MUtNAF7imNDxMMbZRonwIzb
 Cm7LwmryV/z774VTfVCEjS2iEr9IgwjVDvF1aPRx1bzLzepiFRMh3olDWyJrr7+rO3Q96sY+z
 2MOw+9MI/wqDEaetKleK/5dD0W8ROmJlFM6QlIjMBdw3BJGOgINb7K+ZnDjAIeNX0aL83SM8d
 BvtVeeqai7tfymPMx79oWFvVllKNjyzLguTM73bipJhveO0CMTVLz0rNAYg5My822p2SbXVjS
 t6M8FxGbBXpF9ottZ4pYxh38wdNRloUw5Y2vnqc3IZVpYjboesVlm17VyzbZdQKtIK+4CysvV
 RBiReEhqUdPM17WhGZN6QzmzFx2cOECJntNH3fiiEAkasOzBqdpHYKgHmSwv+AiyNJ+Qkt1PP
 LhSI3EYFeQoGofjDT1h2Pbl2QWarg7EipSBmb8jgE0EZftfeJiopjKBYs0rGMmXXAoRca/DO7
 o55FLiHvQFQxKwuIUsqIl0XcQ6Sda7Rkgwigapcj2v7B9zMGfFYeR5u38bFh8zFX2WJRB3wJ8
 GZfL5OdV9GCriu1RreJvVg05nXqPijlbjBvy8bd7YmyQsBKikkkfm5hQt9Z74rGLKF3hK3Jgc
 YUKGMENmVD4LnY7LJPcIWN655iVt4wcl1bOrh9C8tXxMgBVwG0UKkrkhL2v+5eVKC2vDhqjIL
 clbDlTGXfwfK038DdnAh7DWQxPj9eE487vsTbEZ9sWRz2ttFfAZS/NH4yjNpDuEtZc1g9oe8W
 iV533qSbDCja7toyv+kR+DSRj5vQ+p4SexXg+M5HbRXwD73iJvnse2ksQYa+j/BXtPUs9tR6l
 V2pXZnSlINhbaq5nxTtkeojgJdMtk4PN/aMPWGt+JMWfs+TLglRYfjR5s8FcuhCyq9EcJdtJb
 asspWW71QZpdyXvCwVaMmpPk1zG0X9zGOBZcTj83WCkTYe/PUut6SuqxCdHkQBpzrC2xPZTa/
 IfM6wL8sA4MiDZofGAm33NGVRBgmf+53Ht+Ij1dSfmwGkGUZoN+4T2ju5sWMDrvI9jNfniK1Z
 4ZAQbNxKNrr+Dq6iZQymn5HYgEZtV3mV7LTh9NjE5ZU1ebJjA900IpznTHUrki9eRnKLvy6Jx
 gaebg9IbjTSyD8iLUbjbIqUuN9bIP/UoDRuVIuN/sf8pORd3jihj89MArNgB3TCamIrpTXImP
 d2EREOLIKMhDMfbAuxSQN+OdTO1Sp+ElmUHyvF1/KCFroh1+saTIwSS8gFlT/Zd+HfVZruWxj
 O5XX2SWW1WXqoycawDv/udBNBPlW1eT7+KJQ+glFp0D0M5GbWPcW9T9vswhfnMQmFNl2/GXGX
 ZoaE5ExWgXQlhOtAOCbmz9e3aCettrxerBFkmnzYecje91F1t5TfG7lWUDPfW88Zv1qO9lTAN
 NF5Wz/McKADLP32KmtDLKHvHgBy8endsH1l7t/wv0oIu4l4hrJBDPGEX48CgYJL5FnGzjWJ1R
 v03Tx0QPHz9tD5ZK/wGg/fzMfi5dRs4aZ8flc0mB6DhVyiN73G0Fj/9CsMMCd0OegnayjwZY/
 F+Ti+5OkbaxteGmYCQXtUMf2sUGEcc3rQ3ULApLF1iEq1LToDMATIuG8M4GpQYYskSm4GAZB5
 sQBYh8V8V99CgDN9epGANeOgWIbd7CFTKbPI6+1krFFkN6YHRLul7ayZs8c6tlM6y6U9ogzth
 bbxxiRXIaVGN59gViRw1v97OeR3uPKsUawOWE8NvlaYalxmS0dr5uZtLV0YVbEuuqSlYwTU+u
 U215XNjfTsq02NQcXqJAs9jslGvRlx5xzE62p2J89Sj1Gl+cuLa5gG4Bn+MwZTyRfxp9xtHjX
 aEmb5RrVRal1JoCN2DAyNw7+jTTcDdivAMiBXoTgOITN22nSZbpVd/3bAbtWBE0PxUwjq81MB
 jqa8h0drQIpR2rhebY/kg/i98sCZBC1LcFtj6Y+uwsfxYbQQyHs7sjaZdpHeCQ4KagMF8POu6
 NSDXcn4rQc/P4EOZI7fIiex6FkVh+4Afq+TB7P85Ct7XRpZuwVgk0URo+x21N44YvpEgN+V6p
 PmRrjhR/mFTQ7w1cLzicUjbOASMJF3rUmZcVDDxZGYmD/yORbBmZBBPB32aBIktX1D3EBLg/o
 GvXcQP0A8Qfgz2pZeTjMpTIotBtM5t4FI8e5kda1m4S0xk1d2/QemgR6Ev5u8QYPkw+/DOgmp
 18E3uK/VphlpQpjNiyJr4RK03z+irlhpjyNb4hz+m8XAym0KHoiaNInL1jYuYrm6Wt+6qjITP
 fD1zNoz0+V1biiyjjaqVcSyFaszVdm+N78yW1fnk1oI0RCawTDiy/WN0LUxhxv1p5ybeTtHMM
 CT3S6EJwoZgoD9wU6fbNpSglDWSR/CVh7jr+QG6gsrx8m6dm+p3gxlsvGSfBb5rDy0rtmlRW6
 ZMVh70ZiHTxX8gTWb/yp7aNpfx0qpOjpok37Go/0PfSCQkhKygf8DSfWNoPQvuhzzyMZ7QQWd
 MGaRrrayoyF5IBys06BJmxmvGeOZzIPHhqPj0SoAPiCu6meG9lQ6mPQ6OKmWlFJjmNga7FBbK
 zxYxGgpUcfS3nwuQ288AqEwmL3rQYNFlehqKPZZhXz7TByddf+V830vTxF2M4sGIuZEza1xLX
 VXPbuBwkjxH4L6phB7u94fa4nWzb/r3gFOEjGaO9OPWiiQo0d4KF4zDtbZeQyTf+3fk0HfJl4
 C609Fjp7MhBW5MuT4Hd6KVrL1VoPY7FcqUSyWKbg9nz2djUrzT6VZBqrq411dBIZ0KsiKmLIv
 9DjM2Ze4kcY6DZMEdyznsqtH2CA2+mqAhifc0zzUjox5x7d9vsshDlOgP3/jZip3F4KR7u0V/
 BVPFCqyWVs97ji8jJAuhGhSwFvgr7WhwytoA4qOuJWu//eohFhCIoTnJ7lXasnGo+3ea8KlWZ
 wMNUEkifwLtWV3nRzjY6YPCFLA7TiOjXjz2LTTM3qHikdBwOIOD1311bexX4SvO1/D9O7J+L+
 JAHLxT1CSO6mOKUabPGciZRoIPoHcv0ScWOJDtCtJMKekHIz/6+4PoGF/M32ETFf9ZFMHSNMz
 N+v+RNx2tFss=
Subject: [Buildroot] [PATCH 05/10] fs/cpio: configure Busybox applets if
 using Dracut
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Dracut versions before v113 tried to call "busybox --list" to detect
the links to install, which fails with a cross-compiled Busybox
(unless Qemu user emulation or similar is set up with binfmt). Since
v113 the list can be provided in the DRACUT_MODULE_BUSYBOX_LINKS
environment variable instead [1].

[1] https://github.com/dracut-ng/dracut/commit/ead7b349c37d4943cfa16e5e119e362a2af71940

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index a87d4d7f9e..ce39e47d93 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -85,6 +85,7 @@ define ROOTFS_CPIO_CMD
 	)
 	export DRACUT_ARCH="$(ARCH)"
 	export DRACUT_INSTALL_PATH=$(BR2_SYSTEM_DEFAULT_PATH)
+	$(if $(BR2_PACKAGE_BUSYBOX),export DRACUT_MODULE_BUSYBOX_LINKS="$$(cat $(BUSYBOX_DIR)/busybox.links)")
 	$(if $(BR2_PACKAGE_NETWORK_MANAGER),export NM_VERSION="$(NETWORK_MANAGER_VERSION)")
 	$(HOST_DIR)/bin/dracut \
 		$(ROOTFS_CPIO_OPTS) \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
