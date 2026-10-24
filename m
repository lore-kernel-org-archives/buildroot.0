Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC27606A31F
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BuOjOiQk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rHlBz1mZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13CA160A7E;
	Sat, 24 Oct 2026 09:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nnup8WYZ7RrX; Sat, 24 Oct 2026 09:02:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8B5CA60A41
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792832555;
	b=sU7oGzXmg+TZhgZXNP7Ik5y8yh8QgE/HiF27CZV7Z5MpCZyxt245/yU1TEomtoQ5yyXX
	 y+Ts/i1g6MtH7CRLAC85nufBjJFODLr4Z60KD67IVKbVKtoc+L82v3vLoxPoEZBzJ9ITD
	 vHuMEkGee0jzDKs03EAFZ/Ff7n4P5UmNrnVzEbxalOCCBeCIBAPdAqtXrgQB6SG2xTx+Q
	 Dm0aGMRv0oWhesam7m51Gt3RyRwftyoEfnutMdzFIzU1v3u2MnC+/HHCU7IBXIxkOxgc8
	 09Fr+31w1g5QzC2XSIULkyFdWMICUcGHm1Iipyqt7FjNjRv2z3U0pdOemZRjlK3Jucw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792832555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sNI5F9UYzmjnByai5qit2cGAeYG9I3AdDcRxMSEMxzY=;
	b=NYqMpg+j0MaaRbj3sOsA0/0MEXcFmFd3mZ6jtJuz0ISl3HQUlv0uVERGCLTjN+otoN57
	 5TdwcFivNDHVNe9H0QXFzbqPgqb4X2TE5JpmstFKC68WoNVxSRWiNFzWn3Y7k4L6I/KbX
	 /b24nA5FZT9p0+m+wZCL5EfsuPPKAs6GU2glao6cqi2VbuDgzPpi590F9cEVqyUPkbk+L
	 TcZ1+YiQfm+nbBwfSA7BGOcovs7M4UVIgtpaN3SsWmuj/OjCyI8brfllCzgkdyxc/O2ze
	 MBlQ7a/3QNtCqrT5/1kurDBdSLCSuOSSuuUnbQUe9LLegd99EQVOkXeUJ/aXVi7zZxA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792832555;
	bh=sNI5F9UYzmjnByai5qit2cGAeYG9I3AdDcRxMSEMxzY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BuOjOiQkHxPEq2olRi3mxT9GHohdPrYfi+ScwVc10KLpJg/rgS2Ls6uvEDd2+uzjv
	 sQRhm++AamBDeMmWMFgy3hs883nVGNuNkx2rLF9o8kBrVR1G4a8wl6NN3grGZy2EAh
	 OhjA9Mnxk+3K5oAZgIgq3l4WoWA+TTdQWaEzOx15pMpGZQPJIxobWZVaOl7VU/USEu
	 WvdnhDO1NDMIeiOEK0HW7Dtnz2UFAKQEqrRQANOxJCc4wKEQmBMo0agY5lwBYlPYAx
	 /w0LtjVtZdQWuUGa+JqAVQbFhnnrxZ+DSD2+G7MTDtdkZ3fueK92KBjiV8hctXAdh3
	 qiSg6YiQMa1pQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5CA60A41;
	Sat, 24 Oct 2026 09:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B76FF79F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 09:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C92740AC0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 09:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JRIBX6PmN1z for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 09:02:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4531440A16
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792832552;
 b=QdNKCECLGu6++rPpRjxrgSmf9YestvliKgT8RjGL+1ZTp0S/vKXE1Uw3wfnULnsf6COy
 8M3Zkh2jyyC3ORmDyQOOJ21oju00EXDSsXDMnlzHMR278yRdsq21kBIJesSjBtMwqafWs
 MbgykgbzbHc9n8RdiqKEvUxPrfQtpoCH19bKffaklJ6t/ddWeNkMYHkMGPS/y+OaHO4g/
 jXMY6zn8Zm4iwYn2SHqISXPDSYdTTdpVAtlLYxMORZ02HdxQfdPRYzYPKVud0bSaEVoDJ
 xq2r8UDAALhhP2yZdvSSN1J/0XbrdFlrH3QzIvjcsjGrmQQtKhTxd2wm0kOL1Zt48rw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792832552;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=AUpY04AyucqBPCkNAbfi8lWXGuGBBLJSP+TXV5aZJtM=;
 b=M5fEfg3yWdALWVf9Z5EwxG9M91/u36C1GseTWU+2oNEXcJ4Mcd2zob7HP6wNUHXUXDek
 H6SOv896yYLYN5UBzeZhNihdQA10C9reRf0aBiv1Kl7HZ6NuqNjAfcEGQgNMZlW4ppUbO
 cYrwLAfnxrvqpIWYjjEj6dQDgovJSf9oWVJUVwXtbNAlFjPxqozdKQrRd2hmVdhhyq8DH
 mMCnKgx/2HDcPObRQ/ku4VtTW+QkZ2+g804/so5IES5+jc94+4/QEJ8RIVOqcB4RHZIsH
 AgQK1+YmUwQQGd/3W0nyVyeCcCyWjgMpITXJKS2zpEozWBdXyW2h4X21dYDlohp8HVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rHlBz1mZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rHlBz1mZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4531440A16
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792832546;
 bh=AUpY04AyucqBPCkNAbfi8lWXGuGBBLJSP+TXV5aZJtM=;
 h=From:To:Subject:Date:From;
 b=rHlBz1mZVkHJ68XfWh2JaXe5I2TeP6kyRI/e0p01Pfr8owwx6EoxYfAp5qiyWoK2z
 Wamsd+8HBPNyOUVcnmH5ExX7ASYM7inDu5ajdzVwsxDEIhvolievlX6RJU3fLPU+mK
 9SYnCv+0D/tShwzfsx03xSnrNZJnz6IXcD8UyucWVsDYEKnMOIEdFo+wtn51BvDU22
 DSi84+x1eqs/2cgITmIwfzgCTBr+Ov7GXXCjS5O6z9P+UAFQE0ee1ZcSQRcisaa1mQ
 br5U/e63yyqePwna83U6Nr/rxJnTUR/WhBinvqfQi3cabdfqtUOcdg7lMeMMmoMlKd
 9lFB03VrelyXA==
X-KAS-Sym: v3:f51bdf72230551df:b3Jgz0mvt5YPg2TnKCrn5shMmAMqXJrInCAn+G/KnQsu4
 1Iy9TMrD2JsLPVjmsH8IfReHnlyhOW5mJQVK9UU96rqA1MBQgLVFfaHHzeWph7ut3WdV322iDll
 m35dKL821rsZgMFtJOCCjpPN9ucogHHA5MwwOzE3RQmY+y0T7Qpf4a1aBLgnO412KWBC6fpH0+0
 Id1V1nnnLJZm7OZLU+GrGebMuqkxP2lIeGxhkkiWiCnh5zS1SCwcM/Uma8G81FoNp6rdwbEhRQh
 6dx4h+eKVItG/BNCopZqzEmofXx/CmM20Ktnk/NCxwscJZDYv8oCaDPDYLsYQRMzm0qhoVNw==:
 pQWO0yAVyZ0UVTMFSbo9qJIM3vZYYbe8ZcQCI5m5p8dbkH18x42qS4bXrmhkRmAxBGIMa7SuDTQ
 C/JxkDcxGim7ueZWJM4WvIN5/zEjIh3UFMgF3HJKzzB5rJrY/tLu9f22x2UutY4CnpjhIrqNTQF
 kXGcKGDQ9u62+JEcFwJi1rAl2zyUK43/OYiXnJkM43iGrbxIgayGwCfCeiizNtU9XattcwKfVOk
 JL6OAFQI/rcUdWzn+1pj5cm8fgxFz4iwBi4WAWQpjfhEYNwktvW6eBJ5/MgHLx5FM+OfEFujrxq
 O54ulvWyKibpY0POdUd9RMZMGi3qrGwIx+1PIMXgZ+pwvHY7aC4XbbQA6Q/v0NgxbLVsB2h0WBR
 ISAmEQdh/H0Tq1v++Dwz5SnwEctH5ssgD1RX7mtpVyhBvIBjz5lLjbOvjdEothWDVYy2022HNoR
 eo3FHQnAY/bib1NNfKHST2nLfOPZiayHXili78XcIKN6Ai6ZiDCgrTqmzXswi5h7+xU7sUBn5/s
 azZPEz02GnHUHaiuH05/lDGLbVo0aybpYU4xLDWOQkXn1b0YHA=
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5417AA4C511A
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 11:02:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48228)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xKXdx-000000005Fb-3OVK
 for buildroot@buildroot.org; Sat, 24 Oct 2026 09:02:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 11:02:24 +0200
Message-ID: <20261024090225.3987962-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build errors with
 uClibc-ng
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dUNsaWJjLW5nIDEuMC41OCBpbmNsdWRlcyBjb21taXQKaHR0cHM6Ly9naXRodWIuY29tL3dieC1n
aXRodWIvdWNsaWJjLW5nL2NvbW1pdC80ODdhZjE0OTg4YzNjOTIzYWE2NjFmMjA0NjQyNTk3Y2Zm
MzU2YTgzCndoaWNoIHJlbW92ZXMgIiNkZWZpbmUgUEFHRV9TSVpFIiBjYXVzaW5nIGJ1aWxkIGVy
cm9ycyBkZXRlY3RlZCBieSB0aGUKR2l0bGFiIHBpcGVsaW5lcyBmb3IgYWxsIHVDbGliYy1uZyB0
b29sY2hhaW5zOgoKL2J1aWxkcy9ia3VobHMvYnVpbGRyb290L2JyLXRlc3QtcGtnL2Jvb3RsaW4t
cG93ZXJwYy1lNTAwbWMtdWNsaWJjL2J1aWxkL2tvZGktMjEuMy1PbWVnYS94Ym1jL3V0aWxzL1VE
TUFCdWZmZXJPYmplY3QuY3BwOjI2OjEyOgogZXJyb3I6IGV4cGVjdGVkIHVucXVhbGlmaWVkLWlk
IGJlZm9yZSBudW1lcmljIGNvbnN0YW50CgpQYXRjaCAwMDE1IGZpeGVzIHRoZSBwcm9ibGVtLgoK
QnVpbGRyb290IGNvbW1pdCBmODJmNWZlMTc3YjdmODg0ZDQyNGM3Y2UyMmFmZjY3MGVkMTNmMzU5
IGJ1bXBlZCB1Q2xpYmMKdG8gdmVyc2lvbiAxLjAuNTYgd2hpY2ggaW5jbHVkZXMgZ2V0dGlkKCkg
Y2F1c2luZyBhIGJ1aWxkIGVycm9yLiBQYXRjaAowMDE2IGZpeGVzIHRoZSBwcm9ibGVtLgoKU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCkdpdGxhYiBwaXBl
bGluZXMgcGFzc2VkOgpodHRwczovL2dpdGxhYi5jb20vYmt1aGxzL2J1aWxkcm9vdC8tL2NvbW1p
dHMvMzY5OTU5MDNkMjc4OWRlMGY1NDFiNTQzYzRjN2Y5ODkwYjI4ZjVkNgoKIC4uLi1Vc2Utc3lz
Y29uZi1fU0NfUEFHRVNJWkUtdG8tcmV0cmlldi5wYXRjaCB8IDQyICsrKysrKysrKysrKysrKysr
CiAuLi5kSW1wbExpbnV4LXVDbGliYy1uZy1wcm92aWRlcy1nZXR0aWQucGF0Y2ggfCA0NyArKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2tvZGkvMDAxNS1VRE1BQnVmZmVyT2JqZWN0LVVzZS1zeXNj
b25mLV9TQ19QQUdFU0laRS10by1yZXRyaWV2LnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9rb2RpLzAwMTYtQ1RocmVhZEltcGxMaW51eC11Q2xpYmMtbmctcHJvdmlkZXMtZ2V0dGlk
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9rb2RpLzAwMTUtVURNQUJ1ZmZlck9iamVjdC1V
c2Utc3lzY29uZi1fU0NfUEFHRVNJWkUtdG8tcmV0cmlldi5wYXRjaCBiL3BhY2thZ2Uva29kaS8w
MDE1LVVETUFCdWZmZXJPYmplY3QtVXNlLXN5c2NvbmYtX1NDX1BBR0VTSVpFLXRvLXJldHJpZXYu
cGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uM2I3ZTM1OTg0NAot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uva29kaS8wMDE1LVVETUFCdWZmZXJPYmplY3QtVXNl
LXN5c2NvbmYtX1NDX1BBR0VTSVpFLXRvLXJldHJpZXYucGF0Y2gKQEAgLTAsMCArMSw0MiBAQAor
RnJvbSBkYTg5ZGZjZTJkYTRjNjhlZjNhN2Y4OWE0ZmJhMWNkNmY4NjFlMzYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbTogZm9zc2RkIDxmb3NzZGRAcHduZWQubGlmZT4KK0RhdGU6IFNh
dCwgMjIgRmViIDIwMjUgMjI6NTI6MTEgKzAxMDAKK1N1YmplY3Q6IFtQQVRDSF0gW1VETUFCdWZm
ZXJPYmplY3RdIFVzZSBzeXNjb25mKF9TQ19QQUdFU0laRSkgdG8gcmV0cmlldmUgcGFnZQorIHNp
emUKKworZ2V0cGFnZXNpemUoKSBpcyBkZXByZWNhdGVkIGFuZCBsZWdhY3kgc2luY2UgUE9TSVgu
MS0yMDAxIGFuZCBpcyBub3QgYXZhaWxhYmxlCitvbiBhcmNoaXRlY3R1cmVzIHdoZXJlIFBBR0VT
SVpFIGlzIG5vdCBkZWZpbmVkLiBJbnN0ZWFkIHF1ZXJ5IHRoZQorY3VycmVudCBwYWdlIHNpemUg
YXQgcnVudGltZS4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS94Ym1jL3hibWMvY29t
bWl0L2RhODlkZmNlMmRhNGM2OGVmM2E3Zjg5YTRmYmExY2Q2Zjg2MWUzNjMKKworU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHhibWMvdXRpbHMvVURN
QUJ1ZmZlck9iamVjdC5jcHAgfCA0ICstLS0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS94Ym1jL3V0aWxzL1VETUFCdWZmZXJP
YmplY3QuY3BwIGIveGJtYy91dGlscy9VRE1BQnVmZmVyT2JqZWN0LmNwcAoraW5kZXggMmI4MzM2
YmNlYS4uZjZiYTgxYzE4ZiAxMDA2NDQKKy0tLSBhL3hibWMvdXRpbHMvVURNQUJ1ZmZlck9iamVj
dC5jcHAKKysrKyBiL3hibWMvdXRpbHMvVURNQUJ1ZmZlck9iamVjdC5jcHAKK0BAIC0yMyw4ICsy
Myw2IEBACisgbmFtZXNwYWNlCisgeworIAorLWNvbnN0IGF1dG8gUEFHRVNJWkUgPSBnZXRwYWdl
c2l6ZSgpOworLQorIGludCBSb3VuZFVwKGludCBudW0sIGludCBmYWN0b3IpCisgeworICAgcmV0
dXJuIG51bSArIGZhY3RvciAtIDEgLSAobnVtIC0gMSkgJSBmYWN0b3I7CitAQCAtOTMsNyArOTEs
NyBAQCBib29sIENVRE1BQnVmZmVyT2JqZWN0OjpDcmVhdGVCdWZmZXJPYmplY3QodWludDMyX3Qg
Zm9ybWF0LCB1aW50MzJfdCB3aWR0aCwgdWludAorIGJvb2wgQ1VETUFCdWZmZXJPYmplY3Q6OkNy
ZWF0ZUJ1ZmZlck9iamVjdCh1aW50NjRfdCBzaXplKQorIHsKKyAgIC8vIE11c3QgYmUgcm91bmRl
ZCB0byB0aGUgc3lzdGVtIHBhZ2Ugc2l6ZQorLSAgbV9zaXplID0gUm91bmRVcChzaXplLCBQQUdF
U0laRSk7CisrICBtX3NpemUgPSBSb3VuZFVwKHNpemUsIHN5c2NvbmYoX1NDX1BBR0VTSVpFKSk7
CisgCisgICBtX21lbWZkID0gbWVtZmRfY3JlYXRlKCJrb2RpIiwgTUZEX0NMT0VYRUMgfCBNRkRf
QUxMT1dfU0VBTElORyk7CisgICBpZiAobV9tZW1mZCA8IDApCistLSAKKzIuNDcuMworCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2tvZGkvMDAxNi1DVGhyZWFkSW1wbExpbnV4LXVDbGliYy1uZy1wcm92
aWRlcy1nZXR0aWQucGF0Y2ggYi9wYWNrYWdlL2tvZGkvMDAxNi1DVGhyZWFkSW1wbExpbnV4LXVD
bGliYy1uZy1wcm92aWRlcy1nZXR0aWQucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uODdjNzFhNTI1ZQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uva29kaS8w
MDE2LUNUaHJlYWRJbXBsTGludXgtdUNsaWJjLW5nLXByb3ZpZGVzLWdldHRpZC5wYXRjaApAQCAt
MCwwICsxLDQ3IEBACitGcm9tIDZiMmZkOGMwNjkxNDI2YmU5ZThkMzYyNzZlNWYzYTgxNTNmYTMy
NjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PgorRGF0ZTogRnJpLCAyMyBPY3QgMjAyNiAwODowMzoxOCArMDIwMAorU3ViamVjdDog
W1BBVENIXSBDVGhyZWFkSW1wbExpbnV4OiB1Q2xpYmMtbmcgcHJvdmlkZXMgZ2V0dGlkKCkKK01J
TUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
K0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworaHR0cHM6Ly9naXRodWIuY29tL3hi
bWMveGJtYy9jb21taXQvYjViMmJlNzEyMWY3NTBiNWYyN2QyMDVlMmIxMWNlMDE3OWIzODhjZgor
YWRkZWQgZ2V0dGlkKCkgYmFjayBpbiAyMDIyIGZvciBvbGRlciBnbGliYyBhbmQgYWxsIHVDbGli
YyB2ZXJzaW9ucy4KKwordUNsaWJjLW5nIGFkZGVkIGdldHRpZCgpIGluIHZlcnNpb24gMS4wLjU2
OgoraHR0cHM6Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2NvbW1pdC80N2MxNWRi
YjUwZjA3YmUxZWY1YTFmZmM5NTU5MjA1NTg0MDc4ZmJjCisKK2NhdXNpbmcgYSBidWlsZCBlcnJv
ciBub3c6CisKKy9idWlsZHMvYmt1aGxzL2J1aWxkcm9vdC9ici10ZXN0LXBrZy9ib290bGluLXg4
Ni02NC11Y2xpYmMvYnVpbGQva29kaS0yMi4wcmMxLVBpZXJzL3hibWMvcGxhdGZvcm0vbGludXgv
dGhyZWFkcy9UaHJlYWRJbXBsTGludXguY3BwOgorIEluIGNvbnN0cnVjdG9yIOKAmENUaHJlYWRJ
bXBsTGludXg6OkNUaHJlYWRJbXBsTGludXgoc3RkOjp0aHJlYWQ6Om5hdGl2ZV9oYW5kbGVfdHlw
ZSnigJk6CisvYnVpbGRzL2JrdWhscy9idWlsZHJvb3QvYnItdGVzdC1wa2cvYm9vdGxpbi14ODYt
NjQtdWNsaWJjL2J1aWxkL2tvZGktMjIuMHJjMS1QaWVycy94Ym1jL3BsYXRmb3JtL2xpbnV4L3Ro
cmVhZHMvVGhyZWFkSW1wbExpbnV4LmNwcDo3Njo0MzoKKyBlcnJvcjogY2FsbCBvZiBvdmVybG9h
ZGVkIOKAmGdldHRpZCgp4oCZIGlzIGFtYmlndW91cworCitUbyBmaXggdGhlIHByb2JsZW0gdGhl
IGtvZGkgaW1wbGVtZW50YXRpb24gb2YgZ2V0dGlkKCkgc2hvdWxkIG9ubHkgYmUKK3VzZWQgZm9y
IG9sZGVyIGdsaWJjIHZlcnNpb25zLgorCitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3hi
bWMveGJtYy9wdWxsLzMwMDU1CisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBr
dWhscy5uZXQ+CistLS0KKyB4Ym1jL3BsYXRmb3JtL2xpbnV4L3RocmVhZHMvVGhyZWFkSW1wbExp
bnV4LmNwcCB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKKworZGlmZiAtLWdpdCBhL3hibWMvcGxhdGZvcm0vbGludXgvdGhyZWFkcy9UaHJlYWRJ
bXBsTGludXguY3BwIGIveGJtYy9wbGF0Zm9ybS9saW51eC90aHJlYWRzL1RocmVhZEltcGxMaW51
eC5jcHAKK2luZGV4IDhjN2VkYmI1OTEuLmViZjRlYmU4MmIgMTAwNjQ0CistLS0gYS94Ym1jL3Bs
YXRmb3JtL2xpbnV4L3RocmVhZHMvVGhyZWFkSW1wbExpbnV4LmNwcAorKysrIGIveGJtYy9wbGF0
Zm9ybS9saW51eC90aHJlYWRzL1RocmVhZEltcGxMaW51eC5jcHAKK0BAIC01Miw3ICs1Miw3IEBA
IGNvbnN0ZXhwciBpbnQgVGhyZWFkUHJpb3JpdHlUb05hdGl2ZVByaW9yaXR5KGNvbnN0IFRocmVh
ZFByaW9yaXR5JiBwcmlvcml0eSkKKyAgIH0KKyB9CisgCistI2lmICFkZWZpbmVkKFRBUkdFVF9B
TkRST0lEKSAmJiAoZGVmaW5lZChfX0dMSUJDX18pIHx8IGRlZmluZWQoX19VQ0xJQkNfXykpCisr
I2lmICFkZWZpbmVkKFRBUkdFVF9BTkRST0lEKSAmJiBkZWZpbmVkKF9fR0xJQkNfXykgJiYgIWRl
ZmluZWQoX19VQ0xJQkNfXykKKyAjaWYgZGVmaW5lZChfX1VDTElCQ19fKSB8fCAhX19HTElCQ19Q
UkVSRVEoMiwgMzApCisgc3RhdGljIHBpZF90IGdldHRpZCgpCisgeworLS0gCisyLjQ3LjMKKwot
LSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
