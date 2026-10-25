Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11BB606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KM7KrZ3T;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=cqWmxynt
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B6280CAB;
	Sun, 25 Oct 2026 22:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daQKz5win51s; Sun, 25 Oct 2026 22:07:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 814A480C97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966070;
	b=ilGOuz+ZTjeDVMGGjEU6C/tPIcvMkW0tsmIrjNDlq5plIsHvmdms3itwTfn5XPkXEA5s
	 +v+ESHJv0DG7qhlBNRCl+XNcwjAK1qsvtUJGCHJnMX2JdZQOW0ADSpM4wGe0i+0cjOvGj
	 CtuzUC1CxN26uPsU2/gmgvI9V8A7LJkJzbe8/gRMRZ3RoF6g7Sbg8Z9fZFWxNGwBmC5BP
	 15PaU4cbQ2m0V3zWxDdn5faVhTSbhNWWc/q9vqJYAPT3AmNXOvoDbwLi9Y53bAkgmkFdM
	 iAunSKNqXhI8WAWr48AlKJuWMWBI2poiyxbMlQYc5vk2789WIj7OdTMp5432mN0SEtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966070;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nSPmOr4faB84CMTKkkHZf/f/at9d4Dc8jts0ELdEOTo=;
	b=YbLLYlEdlIE6jrZ3j41eaxIdiwKmhzF+5a3DLhrrM8/sI1YnnBQC8p6M9Sn7pD+ouqhm
	 TCEVgFJKlOwn4Uu+YwwUNY08nls2pwxuEAk/Ag9VyoLnnqhJOuo9qt5BDzDP50MlI6o7h
	 e9Z/wFZDRpjXEoIbM3D+HYUIrnxsnkqmTYZcEaqEgwKju58N0fIyBIRql5zybRDtXjYJ0
	 5mjFBrnJLCYq4L1ApWVO/tNbd9RuTd8mM0+LxOjKPQ89j6bApxiqjI45r0DyjEwBLDGWT
	 NpxePFu0xqTh1RsRjZrU12Y8WFp1HS3G/dYMET/ftLbmo5WgwMBH8z4zFh1604WikNg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966070;
	bh=nSPmOr4faB84CMTKkkHZf/f/at9d4Dc8jts0ELdEOTo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KM7KrZ3TWDKRTnoiYpXBJg6KMEOlvZuM8wCtL4GWx5qRHFPdIF62PDAXt0aUBN9Qj
	 kqK759eCV4TTtt60bHgFDOkgHAWBiuFHGcfOQY6Z+yBKtBBoEccNk1mS5RkvgXAY7i
	 asRxV977PBHSB5UtlJURW24cU1VCbZBFfycKfJxbJYB1nFR7jnBWsSdF8n4F0lpZEl
	 dK4ZN2+T00GgupJk8enQ+6ZWcXgquMs4lWVhGW/NmplIhQ0DIfN9zrBq/DhIom9ZQK
	 DwwLKcUC8CWo9P9blYiwt65sEBYxN0sCMlMOcZNI5TNE79F4BR5221lZWqeY65VDC4
	 rN2V2ljTOB88Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814A480C97;
	Sun, 25 Oct 2026 22:07:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC2B7356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2ADF40057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkOunyNz-PXg for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:07:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 066F840050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966065;
 b=krv8/PTmxff6k2Veb5ymy9Ywz5At8EaAjMGHxPfPNspGOvlKDhU0DyOq4ONDhatQ2aqd
 RSFP2bp0TBd6rO+hjflna0/l1EKRwL0NdcBD5bD9zf2Q4mB1wkAbMMR6EWMdTMPiNATe3
 yEOOtAoALHkj3f2WfV2iJm321Ukuij7/brqEojrU3BGgaggYohLDzGTj/FJbPS+Z3B75n
 MsN9y3sQVek/DQwRxRvV/0hiFOKf+pNU0fnagUqJplQSjZ2n2Xz2wAc8ojAz2P74m2l4R
 /nnKjObIG/Nlf2+EfnBclS721d/wiA6pny2agbMW4iVzLmJmixg0VLFODnuQOLmbsYQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966065;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iJRNR8H+mcaRS+uULrExV8EMKgfN1khjMb2sdjZrtJw=;
 b=UMwCYLSH1m6J8kvJYDYbLcpHrbDT//rvy8DrKYEt8Jd0JMqyHYJRqZbkFan5/RWXe65/
 IqKCxPfwQxaOV54nneEu3Wf/OD8vrlGEg+q+FzY+yCmyh/ALjSrbTHoNMIA8snJ9HyeVZ
 FnXD1H5/5Ed2sg4TmEveRU+Q1e6c1IFXkM9ErRHI2C7WfzfApJSlnY5U3SUiweEL+pPHA
 N11/EMzAm1wLzdU43twjZ1ZM7n8NldkkfDC/5tH40DVOdSP7Z/tB0l6G6k+xJeD7YcCQS
 1tS667fXDCSlV4y5cukaBTkMKzsl/yBNVBXSH8JyiArdGOxhn0QwOn+vEr+lGyJ0vXQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cqWmxynt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cqWmxynt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 066F840050
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966047;
 bh=iJRNR8H+mcaRS+uULrExV8EMKgfN1khjMb2sdjZrtJw=;
 h=From:To:Cc:Subject:Date:From;
 b=cqWmxyntIS6gQqheQ5/AtUMHCK+GmpHffuPfLm7I0JcmBQhaRCpZE4sje3nwPLTnz
 dmwERlAMofI6uGggzrjdd/u8nsA/FonQn3i4d85PpHM0fPY3lVt7ToNKW0RvaMcbKO
 fA8L6iM51E1utA5OSts8T9YQTSf2dwRhlSEY8l7ESfv6Dd3UYdTNsDZ2Kuha8jR1L0
 KbZGW7j9bNrMPkA+qluvS6AudL77SAqyiT9YrxBRb9BnNXw5g/NTNC2HDFQ+z9iI3o
 OlSBvlq/8wbRbTgghYmw1E7qV8QxvN9yKcbixjs6ilS6rGaZTESy6/A1ZfihLIgHGD
 mWT1EPuwOZw5A==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 PSr1d+z0hMY0dYND2CS0VI5a62G1MDweUOauQfO5VFbeTt67EL6ZK50RpbJTtD5qcIAj6jOMvWE
 FPEwOBlXVzATtnfqYM5Eu2bwel2p4mTDKSltgZgce+XPPYjVK2dM1zDQSlaoKSkOX4EEafNm6oq
 w6v86jVGzc9POnBmlp2xDmcwqi/2g79SmJZH1TlfQ+d8J4Xf2ZkaAbLAGvBm6cKNV4h0gfEEu28
 ZiaTFW+0b3hCisiwdn36G8Yg617drjdtJhYSciYZzofqRgASC8SRkNZAT4DFYGGO8IObrwheWSe
 PUOkdqmLeSlBGw5jZlXxy5owQSqxWjHQ3essFkFm+ZUhD8ubZ0EIympBzJybiSHKz+PX9GgzqZx
 Mzdib0FuVb0Y9fyfBB85WvSwj91dFTnT9Yo78TRaZExB/dSwWGqP55ucUo+qCsEY5Gg/geqk2wW
 ussQOT9nKxx+kBNQXM/dMIP9weiqRuE667N+oTT0fW3d2ekQ7Ky2KsMnRsMjisuP5IWkubRFqnH
 8VqkqJW9X2F8ZAPCtClAAJPDPJRc061XNH1CNmqhRLMOsu4OgwxEyZz0n05WZ3Ym6JTfUd0ag==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD585A4C691A;
 Sun, 25 Oct 2026 23:07:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6NC-000000001fP-3Cnh;
 Sun, 25 Oct 2026 22:07:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:49 +0100
Message-ID: <20261025220723.1332924-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 00/34] Bump docker packages
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgp0aGlzIHNlcmllcyBjb25zaXN0cyBtb3N0bHkgb2YgY2hlcnJ5LXBpY2tzIHRha2VuIGZy
b20gaG9tZS1hc3Npc3RhbnQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9ob21lLWFzc2lzdGFudC9idWls
ZHJvb3QvY29tbWl0cy9kb2NrZXItMjkuOC4xLwoKSXQgd2FzIHJlYmFzZWQgYW5kIHVwZGF0ZWQg
dG8gdGhlIG1vc3QgcmVjZW50IHZlcnNpb25zLgoKR2l0bGFiIHBpcGVsaW5lcyBpbmNsdWRpbmcg
cnVudGltZSB0ZXN0cyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290
Ly0vY29tbWl0cy9kNzNkYTMyYzQxZDVkOTcwMjI3MDY0ZTQ1NTNhNzdkNGZlYzMyMGIwCgpSZWdh
cmRzLCBCZXJuZAoKQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgpDYzogSmFuIMSM
ZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKCkJlcm5kIEt1aGxzICg0KToKICBwYWNrYWdlL2Rv
Y2tlci1jbGk6IGJ1bXAgdmVyc2lvbiB0byAyOS45LjIKICBwYWNrYWdlL2RvY2tlci1lbmdpbmU6
IGJ1bXAgdmVyc2lvbiB0byAyOS45LjIKICBwYWNrYWdlL2NvbnRhaW5lcmQ6IGJ1bXAgdmVyc2lv
biB0byAyLjMuNwogIHBhY2thZ2UvcnVuYzogYnVtcCB2ZXJzaW9uIHRvIDEuNS4yCgpKYW4gxIxl
cm3DoWsgKDI0KToKICBwYWNrYWdlL2NvbnRhaW5lcmQ6IGJ1bXAgdmVyc2lvbiB0byB2Mi4xLjQK
ICBwYWNrYWdlL2NvbnRhaW5lcmQ6IGJ1bXAgdmVyc2lvbiB0byB2Mi4xLjUKICBwYWNrYWdlL2Nv
bnRhaW5lcmQ6IGJ1bXAgdmVyc2lvbiB0byB2Mi4yLjAKICBwYWNrYWdlL2RvY2tlci1jbGk6IGJ1
bXAgdmVyc2lvbiB0byB2MjkuMS4yCiAgcGFja2FnZS9kb2NrZXItZW5naW5lOiBidW1wIHZlcnNp
b24gdG8gdjI5LjEuMgogIHBhY2thZ2UvZG9ja2VyLWNsaTogYnVtcCB2ZXJzaW9uIHRvIHYyOS4x
LjMKICBwYWNrYWdlL2RvY2tlci1lbmdpbmU6IGJ1bXAgdmVyc2lvbiB0byB2MjkuMS4zCiAgcGFj
a2FnZS9jb250YWluZXJkOiBidW1wIHZlcnNpb24gdG8gdjIuMi4xCiAgcGFja2FnZS9kb2NrZXIt
Y2xpOiBidW1wIHZlcnNpb24gdG8gdjI5LjIuMQogIHBhY2thZ2UvZG9ja2VyLWVuZ2luZTogYnVt
cCB2ZXJzaW9uIHRvIHYyOS4yLjEKICBwYWNrYWdlL2NvbnRhaW5lcmQ6IGJ1bXAgdmVyc2lvbiB0
byB2Mi4yLjIKICBwYWNrYWdlL2RvY2tlci1jbGk6IGJ1bXAgdmVyc2lvbiB0byB2MjkuMy4xCiAg
cGFja2FnZS9kb2NrZXItZW5naW5lOiBidW1wIHZlcnNpb24gdG8gdjI5LjMuMQogIHBhY2thZ2Uv
Y29udGFpbmVyZDogYnVtcCB2ZXJzaW9uIHRvIHYyLjIuNAogIHBhY2thZ2UvZG9ja2VyLWNsaTog
YnVtcCB2ZXJzaW9uIHRvIHYyOS41LjIKICBwYWNrYWdlL2RvY2tlci1lbmdpbmU6IGJ1bXAgdmVy
c2lvbiB0byB2MjkuNS4yCiAgcGFja2FnZS9kb2NrZXItY2xpOiBidW1wIHZlcnNpb24gdG8gdjI5
LjUuMwogIHBhY2thZ2UvZG9ja2VyLWVuZ2luZTogYnVtcCB2ZXJzaW9uIHRvIHYyOS41LjMKICBw
YWNrYWdlL2NvbnRhaW5lcmQ6IGJ1bXAgdmVyc2lvbiB0byB2Mi4zLjMKICBwYWNrYWdlL2RvY2tl
ci1jbGk6IGJ1bXAgdmVyc2lvbiB0byB2MjkuNy4yCiAgcGFja2FnZS9kb2NrZXItZW5naW5lOiBi
dW1wIHZlcnNpb24gdG8gdjI5LjcuMgogIHBhY2thZ2UvY29udGFpbmVyZDogYnVtcCB0byB2Mi4z
LjYKICBwYWNrYWdlL2RvY2tlci1jbGk6IGJ1bXAgdmVyc2lvbiB0byB2MjkuOC4xCiAgcGFja2Fn
ZS9kb2NrZXItZW5naW5lOiBidW1wIHZlcnNpb24gdG8gdjI5LjguMQoKU3RlZmFuIEFnbmVyICg2
KToKICBwYWNrYWdlL2RvY2tlci1lbmdpbmU6IEZpeCBnbyBtb2R1bGUgdmVyc2lvbiBpbmZvcm1h
dGlvbgogIHBhY2thZ2UvZG9ja2VyLWNsaTogRml4IGdvIG1vZHVsZSB2ZXJzaW9uIGluZm9ybWF0
aW9uCiAgcGFja2FnZS9jb250YWluZXJkOiBidW1wIHZlcnNpb24gdG8gdjIuMS4zCiAgcGFja2Fn
ZS9jb250YWluZXJkOiBidW1wIHZlcnNpb24gdG8gdjIuMi42CiAgcGFja2FnZS9kb2NrZXItY2xp
OiBidW1wIHZlcnNpb24gdG8gdjI5LjYuMgogIHBhY2thZ2UvZG9ja2VyLWVuZ2luZTogYnVtcCB2
ZXJzaW9uIHRvIHYyOS42LjIKCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5oYXNoICAg
ICAgICAgICAgfCAgIDIgKy0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLm1rICAgICAg
ICAgICAgICB8ICAgMiArLQogcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCAgICAg
ICAgICAgIHwgICAyICstCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayAgICAgICAg
ICAgICAgfCAgMTIgKy0KIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9Db25maWcuaW4gICAgICAgICAg
ICAgICB8ICAgMSArCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5oYXNoICAg
ICAgfCAgIDIgKy0KIHBhY2thZ2UvZG9ja2VyLWVuZ2luZS9kb2NrZXItZW5naW5lLm1rICAgICAg
ICB8ICAxNyArLQogLi4ucm9yLWNoZWNraW5nLWZ1bmN0aW9ucy13aXRoLXRoZWlyLWVyLnBhdGNo
IHwgMzc1IC0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9ydW5jL3J1bmMuaGFzaCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAyICstCiBwYWNrYWdlL3J1bmMvcnVuYy5tayAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KIDEwIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMo
KyksIDQwNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3J1bmMvMDAw
MS1SZXBsYWNlLW9zLklzLWVycm9yLWNoZWNraW5nLWZ1bmN0aW9ucy13aXRoLXRoZWlyLWVyLnBh
dGNoCgotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
