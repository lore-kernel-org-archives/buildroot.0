Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B90BC55838
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 12:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B27C605E3;
	Tue,  4 Aug 2026 12:55:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqPYW3TWUNvl; Tue,  4 Aug 2026 12:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19365605FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785848122;
	bh=/KeaKFQmpswUDtr9o4fE0FJfN4I97o7FTupLK8gSVyg=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GkANfCwVzQGVvKhfK79JO2cn0dpxvoLI2RBOp5L74wO/dDaY2gBq4wysadrGg2zFg
	 7nF1ibmnE/qwDcWU7t6/RfvkOk+r2v5mcV8kVVs64aUIq96lVQqkiJgb7nqk+jQDQg
	 tTkCaCeSIdeSqWOlrA0ZFWvMD4o8EOAjx4pZu4VuxuB7oYp7N/uu891GOF2sHu00Wx
	 rZ+98nSoWUjJfDAQVsTQ/P+V3WCGWcdjGJ9H1gBD+GLGCdTmhe8B8Q5d6MzMMI1e3A
	 olYm6s7Ebfw1wlT6AAAgRIZ7z1wpKakQYVrMkhQ1MOP4hvIYgWU5wDSKMjaLVmnkon
	 2jP4wmU5oz7Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19365605FA;
	Tue,  4 Aug 2026 12:55:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24A832AA
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B56680AE3
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:55:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9yMicp6b1BxT for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 12:55:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80ED180AA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80ED180AA3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80ED180AA3
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 12:55:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1wvPds0EqW-00uR41; Tue, 04
 Aug 2026 14:55:16 +0200
Message-ID: <7735e0e3-c2ff-4ee4-b554-f00341bfa3e0@gmx.de>
Date: Tue, 4 Aug 2026 14:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alsey Coleman Miller <alseycmiller@gmail.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260804104730.433500-1-alseycmiller@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260804104730.433500-1-alseycmiller@gmail.com>
X-Provags-ID: V03:K1:RvtanCCFpPQqEyIBBs7OVFBPNrMmbCkVeQrTnmnns6WJ+YJf6e4
 qsg0xBIasUI6B4Bsz5ZQThkSus1R99FzaMNudMTUSnoCOtx+9ez33VPvNwAPz265bWS0pA2
 08lZmnVh30gbs2zGW9KQo3oVNlqbTCphGsmI6FLx1aNekfBttbOGZbVT4MYuX5zH3YI7eIe
 u2yiwkM7C+ecjBwNyeFVQ==
UI-OutboundReport: notjunk:1;M01:P0:u8d58ptsvoc=;98NeumUemuYmsTyU7/MnH2cZaVg
 fH+VyHb3lPi+XOpHcGQLqgHwCSwUMeu+McVdoFUhrgTt3hgFNi5z9erHwaZBrA9ju2tqbf7QI
 WMzktSHmHXSFVUhSVd605vv5aBOrposhnOM624UX2OIpg6Z9hzGeiEevd7cnRC+QMhitNrjMu
 IV/2uXlTxNj3MfBgw2emR+PPLa/88QIy02RbfA1JsCJmR8Dmv+kVX6pH0PZ3TfgBFV9Ua6ye+
 E2CwzcJDbZyLdhSw0QDbYaRSQt3UElKRVu95ik58rJ8oZmS0f1mS2MMo3q04y+v4kZMPq1Ke2
 vLlKXKOiMuc8j0srSb2WoovClK6nGZZpt/bTUAxVYTaQQxET605ujISIrEMpb7HN0wRRiZXj/
 d0t8ryFnQPRpQhBn5PLmNZU61/xeI+xAy2WELPQ2hA5JwHM2hPK5eCepsE78r6fdyQpTi+04d
 TDJNLtqEF0oWllwzlnyu9O6TRTI1Nd7yGkrefWEBV6WukCQ2YdoqYUuIHTiijwCE/doWclR4K
 62jxWlDnWmADXOsKPk2PvEStN2jS+uJWMdJVfdHcUivxQcg/PpwuC2002wflAevp5/uhjpl6V
 myvOaSkGHeNUxY2tllStRA0pBIJFxZ3r/tl+kSjrdZ9lu+IxmfdiKJxCpOKF0ehueTWmyEvBB
 bossZ/b0YCA9IufI4VQXijF5L5A6IjS7Oskrdx8RXQPt5F6R8ljfsbpqmc6u0VCB1eP13yYxT
 GGm2nDaPh/M0+3n9q151RRDCBMErr90uPyo65evU9jiu4bPgU8MP7iVNdgNWJ/8xtTnepXDvW
 matZEjhfiHguXb9VqkLaqcLxHgYXxVjAWzNSsFtpUS0xe6UzQezQlTLKa0n4JabpCEpJVc4wi
 VEcmX3O9dnpEyRw9hvnhfLuhMi3432hwCBeCFm0bkacsYX/sLNgBYfX7oWI9QH11gq3iCsxTo
 dG46NgZAUeaxUf1MUlfEmJl5En2hz+fovoFsZsKpy0W5H63c3Jx/bKt2k88B5EKvvpSOmU6GB
 s7TtstWhMKtDpU6dE80NvFxSxHfep4QTt6zJx3Xl80zx5/YC+7q+IGycRhNDBi4u58DJmPgxC
 nQ7PbzkjDJbFwdMqTJKLBQcpB9OAUnb7OPcapYQr6HjKjaevqgSJg5eHzJ2e+gjDia7lyZ5Ty
 rjLl9M0NlZIH81YuW7YmG2BJUFIZHEcw+P/f2yFLHht873xoZupafZ+slgdcqHsL4a20O0b1M
 BL6w+iQNAGNlYLxELdFWZgxYRI/WTsdGjxE3FQe/aqi1HH8wdCzvD9nYFPs03gRHMULUs6YbS
 KuTFp+RWi5p0HGDo+mN6rL1NOeOXcyPhxgpbx+kJ6LbMuCULLhKyW+dofxdIxtsn5JdUWQfMj
 JzOChuwFhYssBlOIf7PNG2bX4RN3rHhco8214wgZN2Wwy0SYUWkipmqfgSZ8PFoQiW6SxEokc
 9l9/ytDtwfqOLye4gNT1O5ct8//rsCUvSMXU8iQxPPr1iHCPRKsvLeywU2onuRyRtQGAIpsO5
 Zllt872ENQy+lFtIjMCP1QgyKdyb6o3zJX22G2H8lZQpAlxOYoQhD+INbPBreVAxyZCft0XL3
 9EgVzDNHl+E9bm7bAD/E+k/eSNGBztGIXfOw6eppwP3cKcSa5c+AuERYWBERq9RsHC+LcCw5R
 5toE3tlD81xQRQayZVADJ5pxS1BW8GnnrOHc65gfb+l0dCI/uybmGqL1Slff2MljWS6xO4B9y
 ScFLRm5oytxZ4xhLTCFQbvhwY39W+3BBDRvH5kLhfZcgHb5BKvct2mSuKP04Pi33ofZCpEz3U
 Huu0h/pCRPQ+8DO83jRd5ZtJyBvlUQXSOuaUjo3JQgDv1mZNco5CauGYx3v3faKRyuDvdIPIp
 R1xkAmQJyR5CU5KQXKCm6KM0nD3Tbz27uqaPm+TFG/UFNdAklaipm8pdqJ5zgPgHKDPxL8mOf
 6h6C1PlGtTJNVnaaPNRNVKBEbZany+bMeSBRgiHJq1HowvjOuGo4U1tp4NQjwOhAVd7oia1ab
 5/Du5TezZqEniLAoG9ZlD5iCa9LpQ9sxJ/auZgcQQmmk8OHWN0FitRO/zbM1BoDr6BsHtClzv
 +hiezOZBH3t/YHMWvg2h1t4ZEx+IB1pvqYGuBayppJu4u5xm+rBeq2sCgHYOM/hq+TZDygiIq
 GYBLokBYsh/8BVlAV+Ldw76dUxlAiWwqbFFiBfWm4Q88R6NC+wTS7/Lkz9zGLBrvMGtv3tTis
 0tLR6FhcG32FcWhJvvla5BAzHXlAn7ihTiCnpOxtwB4ggtyJZhDfMcMtD29Yk11Hum8gXDHLO
 iGjO9N7RV388H8qU8lPda4zY3bHm52GWeYI+r2GM+o46GlxpR7jbMEAFl634rzkVbgAQoM8KR
 OAyfypDQZYhiam1xE0Faqkh6Tb7ZRb9oDDYEqlZiygIzz5WQ4+e6ho8uGePGBBppEy46FDqzt
 lTFq/aZQuB+ANzffHe2g7+REslSyuhgoh0UeobU8iaUumSNih+RJibYCIHfU1hyiMQxMkxtLq
 73PEcjp6ArsZed0Y5J+2ZwbLHKmaJ2kkvvkePUufNb0P9XHiFozGbPgxGS3+pM5/Tz1RRYsQg
 fSsdBwXpNNm00ZQwyYmPxNkLKtSW6/58BX4e0sl3D/b/DRkLJz9fYVzwsUpFiRW43uv1xTyfu
 k8FB4HxGLrvkPpy6vrvbCs7KQ1jVZoc408Mm/9avLv4VUeAmgdHGkTyMnj5k294zs9WFqOhjm
 0dZJ+ULdiooDmX8N4c8LyD6oHrqzfidjTp0KCdZJpJCdLqBkFyAwywPM+jF7r+0lU2CJzAUxT
 65TkXiFZs5B/jIL1d6CiHyFyvMVOdrEd1pu+rsWUkEZWRUXU/GTQ2QlMA6yKBsgTLLtGWhPKa
 78e/OMc4bFUQbx72o4S7cvVrcoI0Nuridb8xkmfNI1c8xk0lAFgKPmzJKVWP9FAs3xXKdMI6N
 rtIEV0edk0c7eRleATUFJWYTMdoRYoJtRuYVaoByM3HxttUtRVd5aRvh3yObyvwd2lFw99SlI
 wmsZPyilzeYIoUWuxDUsCRmFNPpQAmFH5v7CHTkYUkxiXwWQdVi5UbCFFZ2ZjyEGOrW5+tc50
 kF5+/Zy0+AtGE0BjrmqkF6SjTzDT0H+Gh8rlwSOZxMxOpPve6l3KEdWi8SEfr0YuzA6tnpz9p
 tN6r3NBABCxzKD+cr0Zl7jrzQTpjXSdW/G+/wZe8kpXP7xdz7u/Iq8RqlGmWJ9lVWaqBCUfjb
 +6HsjDXtfx3UfQzROGD3IH0H9J5kVZWcj2upZhADIoyLH0cu6RMbpEsDJ58bxv3EkCPwFms/n
 QIT2+joNqYaFxSIGE0/oIO/Nyzqxtyc4sWJ9jpx/87lc6YqqorMxFmr6xnwkRWS6KyyxestKI
 NEz6jPXPWFnI7XkcbWwaek6aDdKsqwAZwuNk3Ra74CuGUwzoe8sVCaJLyHo/FYdIqiJFhfUn9
 tHGPiSojQq0B2MtjLexc4D6SC943mJU9FLCFhEt4ZoflMU7HuhyKO68mqthawhMf0sc1aCLVw
 z9wInqjvEi+h7tkksJwpuXJDAkYJ5JoOCI6rlYVevhDtQHD/+lkIIJkFggzv6hSx5eI+K+Rvw
 not0Rae2F4SnEM45idTkGc3cXMAkUbODWt2nBZQLhlKo+Jo+W/q94jOewxkulV/0/5PdLpkSB
 IQuRL5so5/3Sgx3krEYAYP7NxqTsH+7NrYTp2umbWsG/BvKc0ek+ACjiGho3AN4yVy1SHoJv/
 L8vNaLsypVCSXFs97B/ycSwh8xpfqSWmJwnesKB/HkPrEfzzOSk0aNumwEJ3cyHH5Qj7RBXai
 Spm+CLQHmFDkMlJTGQYtNnEc/UL4wPG+8fRAZu/CdWGxyubelFDjvKUm7RlWvC/lAPmwnQPmD
 wVhL6r0TvdRVYu0vN+26L/TcvpedeWYNEksirGzK8rcVR8t0KOhhWE3RwwTFtk4c3YwhgysMy
 97WZV3lG/mRPTU0Tb0qBGqBJXE1mR3Sx3RyNVuvpTq/6wPU9oVcwvdOSyDlEXoeUOn12Jh/UO
 xB8u2SInflfnUhCBbx43Ww6LHNuLU5bXPnaCRpefJOsX4q81pnvXHMzV+BlptGa7kVnbDTbPU
 iYn2eC04aMZ0hyzWZsU+yqTp3WBWveY1dnu9xbEWfHOhPmi5cer1zquQTgUH+86SlZUsdHBty
 rCRYDrDgZ+qESlloSlOrcqH5esw3hCriDAj+wSbwTFK+XvQOGfa21YPSvcRqSBLR7X6gIzGJ9
 V3VwyBQYKo3K46tnr8C29cOYBaUhQ2aDCEEVQnC/w2+iJb/PaPm4Q68h7BT0xRh/z7StjIWFF
 nj39BV8demCZj61XoojRIRnN4/6rwZDZfl/ApuVBpmAuUrTvV1oQC7KBidlcXDwK4nhgSuJyf
 WYF6oPBap3wtWgXLe5CEYuYIYB0/Zt5v86+yqbOjlmezV93hR61Wo9FJ4PNOr0Ixu+Leg+GfM
 lBvkqDSBLvn6QXJ1iMOiK99VqLnlNNDTFpqbtnVg73cDqdn+8saVWuuP5mNpl3Noq25FIwzlL
 O74RdeTycHEQJ4nqaKeAUTtm3L6bd7UCs2CzbQzPcKTK+9KtGq5jc1T2Z/oa+syaAVhsaiFxi
 j+VHhn5oKy+lzRE7Gf1YvUatRygxepea2tF9aPG7Ceql/2BA5/ZtF9Y1xNbJKNedvnHMR13qZ
 cCdc2+PYCXMn6eyBX/c6GMWSx1iRivc1Mlg0DvS/DvZ0UH3W83DAPHy9b9XCdP2pKgAWYgNzl
 8EyyOlqUzaNOqzzAoYk8Ip8mxyVauCzs+gX8df7mE5r1UuEKEWiaoTjgy8mrP5gsMnHQxmKTk
 eMcgOlM6ZCkv1RZhNhYTJfJfh9rjo7Z+y5JWusuLmU7hvv0EBACeTqMpAmfPd+7vhgS15YrBm
 Zjx43Ye9si8a1vOca4pB8sWRK7hzLFHNcEdzeb6HOpiG02jMIT7FeEtLdjwfkoqge+KWLh9JO
 7gFKPQyTTrS0g+l/QBaOYWVOWgArjxwfS/ggI6SdIebRZmjMo+uVrHfxRBbpZ5HYn92kn5qeI
 sdj12vEO6JOEUqDuExf3J1QOmLLIWizkVTPkznrTQ9x2qCsRpSdQ8eMgzPiVMzcPMvTeBzRhw
 T/g05q2257yf1672GYI/OBrm7o7Q0gtWfmi3WiOSd2XV8rdM3pa6btOlCnW9EyvEvrbWo4nX6
 aUepFk/3B38PNGUp7qG+p0OSrTaled6npBRgxHLCJxIZBJuBA0Aj/lZGMvaiIrTepm4beDzG7
 RtUJmEOPHme5res3CTcoNyB/SOffxpC8elP5CBoHn+1swLgxVZs7/wQ81D5kopon+AZRpU911
 bE74V20C6bwut9NPylKBY/WZOvUwnxM26cdXkjwqjFwu/4+wz1h201XJn+b7b6q7QosgBMnpM
 kZMT8d0YkovCUdSQ3PAZnP4Q8n68cWH19Pa1WB/NRg7HRnx2QE+xQdi+bbnI+oZgsm55SgGPw
 uUnkfawWJAf5JhunObYi+MwINOxOL/1/fygml+lO4CNdB/aE9PcJK3XbryaBoWcRuJAuvyJDu
 T0xZ07S9IES8DjOLY4R5PceQcbqhkGnlzJNVYzuPbjVzvTRk20hUnUxq1BYmQzjxwYvwAEtXV
 nOekx4EXS1hjPyQ1kcRGCK+A6mfbxg7RgD4+cenRklWr0rifetv9huj9mTOUn1GGVoHAGb7GX
 tFas9FqUc3cAgZhhOcn0Yq6Chub9N/LZ0OS16PvbzU0RSCMvikBp/gpD9tyuDoeWv1Gqoektg
 ZwSV9ceJgiEAUEBodayge0377ivHVVJF6aoI8wz49tO9mCc2E+fz4EOKIvlUG+piSU7OWSc1p
 QKT0UG737JprEMJeETuZi4x8XNFyQ1STjLr8PANNyLFJHYsQgvkgtIko4aQjA5oUsM57nN4Wi
 yv8YgQOnz8cpc7oYQYLpMB5bofYJg8KLJxlSaKVupl81vcvc2Wy+Ye1PGSKFKluIu3tpU9pfK
 zAPLQuMFqGkD9g3mVYQRvL4bmLt7bEsMrnwIXAQSvwYESeJmA6a1qz0eFZa71xiJMizmJnlx0
 WkWGOqllA+8juUtfVEQZzl3M2ji5dWj4brEy3LXmQsHATi8ezhCxLYNdeuOnjuJQ6a2EuTA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785848116; x=1786452916; i=fiona.klute@gmx.de;
 bh=la+8irLJnlOiUiM7j3AY+2wV53basSODQFH5GrQbeA0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=S+I720F/MqTVY3IacBsa/RARd9K0eo6zNDllayZPkCEUvT/w3fSWbzQvN+Qg/baa
 /Jp2kQKAgkzw75vr3vvZVhimwzjulLKKKjOXdZvczJJmo91U23ONpGv5VaV9NV7wV
 e59h1K/OcypMj4KpUVwf8LuO1KyqzM7Lm3Hc6UQzkMBZGxr/MHD8tv7nFUDQZMzqk
 JaLYFGExQkSB3L9pdz3VueuFUVjTZ9eh9RpViRPozHaPU/nG7b1har4leO7OZf2gQ
 LOT52kzFDSzeKMTnSsaGr1KVABublMxQ/nyulIQ95aobOoXg2JZudoqzkBr10RU+o
 aL8nHZtN4H+3Qa9m8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=S+I720F/
Subject: Re: [Buildroot] [PATCH 1/1] package/libgtk4: enable introspection
 when gobject-introspection is enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.08.26 um 12:47 schrieb Alsey Coleman Miller:
> libgtk4 passes -Dintrospection=disabled unconditionally, so Gtk-4.0.gir is
> never installed. webkitgtk depends on gobject-introspection and generates
> WebKit-6.0.gir, which includes Gtk-4.0.gir, so building both fails:
> 
>    FAILED: WebKit-6.0.gir
>    Couldn't find include 'Gtk-4.0.gir' (search path:
>    '['.../usr/share/gir-1.0', ...]')
> 
> Tie the option to BR2_PACKAGE_GOBJECT_INTROSPECTION and add the dependency,
> the way package/libgtk3 already does. Systems without introspection keep the
> previous behaviour.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>

Applied to master, thank you!

@Fabrice, while testing this patch with utils/test-pkg I noticed 
package/librsvg (pulled in as dependency of libgtk4) fails to build 
using bootlin-x86-64-musl toolchain with introspection enabled. Maybe 
you could look into that?

Command:
./utils/test-pkg -T bootlin-x86-64-musl -c libgtk4.config

libgtk4.config:
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_GOBJECT_INTROSPECTION=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_LIBGLVND=y
BR2_PACKAGE_LIBGLVND_DISPATCH_EGL=y
BR2_PACKAGE_LIBGTK4=y

Error:
   CCLD     rsvg-convert
   GISCAN   Rsvg-2.0.gir
/home/fiona/br-test-pkg/bootlin-x86-64-musl/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/14.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: 
./.libs/librsvg-2.so: undefined reference to `open64'
collect2: error: ld returned 1 exit status

Best regards,
Fiona

> ---
>   package/libgtk4/libgtk4.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
> index 0d86835609..9a5ed651a8 100644
> --- a/package/libgtk4/libgtk4.mk
> +++ b/package/libgtk4/libgtk4.mk
> @@ -34,11 +34,17 @@ LIBGTK4_CONF_OPTS = \
>   	-Dsysprof=disabled \
>   	-Dtracker=disabled \
>   	-Dcolord=disabled \
> -	-Dintrospection=disabled \
>   	-Ddocumentation=false \
>   	-Dscreenshots=false \
>   	-Dman-pages=false
>   
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +LIBGTK4_CONF_OPTS += -Dintrospection=enabled
> +LIBGTK4_DEPENDENCIES += gobject-introspection
> +else
> +LIBGTK4_CONF_OPTS += -Dintrospection=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_LIBGTK4_X11),y)
>   LIBGTK4_DEPENDENCIES += xlib_libXcursor xlib_libXi xlib_libXinerama
>   LIBGTK4_CONF_OPTS += -Dx11-backend=true

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
