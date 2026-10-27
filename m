Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E794606A31F
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=db9xH5bI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=WtSPCR4s
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CBFC6061D;
	Tue, 27 Oct 2026 05:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yl_uxuW11SRQ; Tue, 27 Oct 2026 05:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C9AC360687
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079643;
	b=hcmxqzADgUpxO4NWsVUhqb1XN3ZsI7fXUNvrlaDJCv5jcGC+NO4irF6OIbXOTMVsMjUh
	 CqnBvW6ezG6AmcsGi3l+jgkbeNimUg5xOVQEElkLQlRSaUml22eU0HXrLg6JTA04968/Y
	 a9p7p2M8SDzyvlNg5SrSX2FmaF8ayh7uelYHFoKkyqzmsqsDXXn0n7OkpD4yLUUIpyN6o
	 Ijp20vtyCtp5C/dWvUWC50dh5wUBCdljgVtXa0wdiE0r8O0IQZq5wgWj5WraSxQfUdwk8
	 U54d1SGe9EMC66jeGqJenimhVUK7hznRRLFKJxA9vwr3ZIp+hoE7YSTJo3ATb/vHnew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lmkSu4/U51JPrhzTNpGze9iqgQSdda4Gnciev83wL6o=;
	b=NkMEpt8wcBNoR19QzgdWJaug5oqvKGWkZs5Y56XUxCDLiNo47NyNpxAmCdxK87vDAF9n
	 02zQktDLxObMu3NXEBWcmcfheLQS5y5lQdNvhn22hoV65EJ4ahSdKGSITjOo5BKva10hb
	 +jgQ+0TrBG+ofW11UpkqQQJMTwV7ikf+88QHJCVuiyp1WX4dB0NCCUJPS1fAH7ICVEaFF
	 uQYwKM9x0n9HxZEl5jiS4UYvvfP1vUgzBGsWrf74x5h6zy745rFWYSzax9JwkqE5B8z/V
	 L1bxCjDknDBmiKeWpEWzrUmB+tLcz2/jsws3Pbs7rq01Ia73QI9RDwIK5/SgT88lxgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079643;
	bh=lmkSu4/U51JPrhzTNpGze9iqgQSdda4Gnciev83wL6o=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=db9xH5bIJ8ROpym0okECUHyY7CXoeCKMpP3sUvB7nMqgAQ/UyZkOWKXEIqBhFeDp2
	 x0Hfk4f484SLSeam+HKwa+MEC8Op0XNH0kxsYvrYfX3ALXOKY/x/II16MHu/GmwyKo
	 83mWx7UcfGEVDLdvut2vKwVFMcfu6AEGLY7TsDcGswA3s0lVv19ngavHGYeJ8SYUnj
	 bcgHcizdRHU9eOcNDVnMluHVdS+aCDYF0yDyjtQxfgt8kcIsZFGHi0ofPyhgMaMAse
	 PrIOYzN+VykYGghebypnv6zyaz1OSy1890aES2KwIYVZdfmwS3R5E5b2myiFQScH40
	 TKcrq1LnMzd3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9AC360687;
	Tue, 27 Oct 2026 05:40:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8EC279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7145440572
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaFq4AyvVbjF for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:40:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF6174050C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079641;
 b=jFmiTIveC0XFvw0V4cN1hX4CFKeySgsvjDTlno3hUKYcQSe1yPkezQ0K71zIfIRlVSHv
 BqaR5Ru95IMVrVRy9EFoLmjSUot/hpsi37Mpv1qSozz3pceyNdd2LzlfTv9QJg7At3nCs
 5eV6MdMlNMrDC3jZbzkqdib8HMfLj42AZht4S9C6ddc1Of2gwDKVxFlNivE5Vcjyo8kjt
 Jg69OsAeHtVbwGPqxNUw0RyaVxt+qJ49WYLLLHYzuSQ7AupO4YP3rf/V7hK7Gq3MpRdBt
 pWuU6rFQGni6gyKMiANIWJB94uDJrM7+dzHat3W2tHmroNtZ/lcbDCYfsWhTyuekuqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079641;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=V2tSZNRP64Pqpyq5oGGo1owJ3uEjLpZaJzLgIeXLSHA=;
 b=Lu4Yo3DgF3UipujwglXbFB7/rwPEMwfthfR1BdOND9GcRS4PNRyTDmUuxVpRSkL2zE1v
 L5YrRFAZYHLx9/T78ersu2GqE6vdmfIa7z4/Q2szcL+iwgRkjlsOEn7ADGtD+ehXkI+8n
 UNeMg/wmUtaFNidaiWoy9dD9uFEPfTJWLEkAq2MvQorbu6T+K4a0F2f3u13WDS9C7nRIy
 0pvuyT+9wKwTqrXiMwyiyQD7zxmRbPdI0lrcpdUduGHjHN/zXWz1OCbsirheoK9ARKEnn
 /h03YyqYyEVYJJar0B6IoLtX9+F7FI3B2m4/0rq9VLyLwjXwAw0HP3vsrRy7j4ujKIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WtSPCR4s; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WtSPCR4s
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF6174050C
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079636;
 bh=V2tSZNRP64Pqpyq5oGGo1owJ3uEjLpZaJzLgIeXLSHA=;
 h=From:To:Cc:Subject:Date:From;
 b=WtSPCR4sDrNdMx0Ca0Xd+IujdgdFO6rAHywOva8Hyk9nS+zgpSxLoXZ8cM3KIceOe
 +NsIfPkYmLX7uT//rNQYItj44RPPNWgsoVj01Dq8497vYHZCJlDIcQHtjCh4jzBspx
 AkNP7Q4t3Uh11nUxJeLBVMovzoMvMaI0cFfVEq/icw5QIs12lkmqL0impKNIoAhA2r
 PwmSvhPH9TMzYqdH3zaEOJmhAsefGCdsQNboE+fbIQScH6pNLUuaYr9rVqW4n6r6N2
 FN27jQFwFhZlbLhFZ1zCQKiXEHEG074sxRsU6h7fu5gJMjv3oBlpj2k8qAa38pcH4M
 2B+kO/lyHdKsw==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 Y2pSa+3kXZYsqW5RX0Hz18kxkzdfbAARUdiJl2AqZD8KQmzd1SQxDhZmAeiiEoy2cLBpmPpjqQj
 tXtjHMYUHOwQqMO6rEogICrQJ/X3lJUe8tQ60S9m+jdCk8vEQiJJEnEDhzaqsoYwodSWf7CR7/e
 mQ04retdXJfSsff7OkhXjBKU5D6D7bX1xDrH7jtBbCAfe/YoaqgKbvEBFt0OAkM7T/Rq1bSDkPZ
 wDRQn8+sLbf0chvleWaUb5j1Yr2h4ZIpajnsHj1fRZbUXF2w6RAypQ5utKXxNPjZvwfJGsx4W5Z
 PBOhH9jW2LjhTnSq1yhqh9o4vKZ5EE9En0dvBzSV7SbQXGirKcQq4rJCWabFIyBfSufG7kM0goC
 w/C/jiHK0YoVx9beSo1ifu8GZZZOBuFkThU+/5xKWk+3ltiPClj54w6lRoaxd+H4TBzRKd12gWI
 JJpcJUtkRmKNsrfmdRYnHVkRbkSHfYbLtjLCkQ95n9WKMjIvOc04CcYSRrap2vaqKBrNZABHilJ
 CeUFo1ou2hi/d2qd49Z1NeSS3TUDwYGKkiS+ZH0eotPv76e
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E0EFA4C6DE1;
 Tue, 27 Oct 2026 06:40:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvH-0000000078y-3ZSO;
 Tue, 27 Oct 2026 05:40:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, Stefan Agner <stefan@agner.ch>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Tue, 27 Oct 2026 06:40:28 +0100
Message-ID: <20261027054034.4556-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 0/6] Bump docker packages
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgp0aGlzIHNlcmllcyBjb25zaXN0cyBtb3N0bHkgb2YgY2hlcnJ5LXBpY2tzIHRha2VuIGZy
b20gaG9tZS1hc3Npc3RhbnQ6Cmh0dHBzOi8vZ2l0aHViLmNvbS9ob21lLWFzc2lzdGFudC9idWls
ZHJvb3QvY29tbWl0cy9kb2NrZXItMjkuOC4xLwoKSXQgd2FzIHJlYmFzZWQgYW5kIHVwZGF0ZWQg
dG8gdGhlIG1vc3QgcmVjZW50IHZlcnNpb25zLgoKR2l0bGFiIHBpcGVsaW5lcyBpbmNsdWRpbmcg
cnVudGltZSB0ZXN0cyBwYXNzZWQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9ia3VobHMvYnVpbGRyb290
Ly0vY29tbWl0cy9iNTA4NjMzMTY3NzY1ZjU5MzA4NDg0ODZkMDQ0NTUxY2ZlMzM3NWI5CgpSZWdh
cmRzLCBCZXJuZAoKQ2M6IFN0ZWZhbiBBZ25lciA8c3RlZmFuQGFnbmVyLmNoPgpDYzogSmFuIMSM
ZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKdjI6IHNxdWFzaGVkIHZlcnNpb24gYnVtcHMgKEp1
bGllbikKCkJlcm5kIEt1aGxzICgxKToKICBwYWNrYWdlL3J1bmM6IGJ1bXAgdmVyc2lvbiB0byAx
LjUuMgoKSmFuIMSMZXJtw6FrICgyKToKICBwYWNrYWdlL2RvY2tlci1jbGk6IGJ1bXAgdmVyc2lv
biB0byB2MjkuOS4yCiAgcGFja2FnZS9kb2NrZXItZW5naW5lOiBidW1wIHZlcnNpb24gdG8gdjI5
LjkuMgoKU3RlZmFuIEFnbmVyICgzKToKICBwYWNrYWdlL2RvY2tlci1lbmdpbmU6IEZpeCBnbyBt
b2R1bGUgdmVyc2lvbiBpbmZvcm1hdGlvbgogIHBhY2thZ2UvZG9ja2VyLWNsaTogRml4IGdvIG1v
ZHVsZSB2ZXJzaW9uIGluZm9ybWF0aW9uCiAgcGFja2FnZS9jb250YWluZXJkOiBidW1wIHZlcnNp
b24gdG8gdjIuMy43CgogcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQuaGFzaCAgICAgICAg
ICAgIHwgICAyICstCiBwYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayAgICAgICAgICAg
ICAgfCAgIDIgKy0KIHBhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2ggICAgICAgICAg
ICB8ICAgMiArLQogcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsgICAgICAgICAgICAg
IHwgIDEyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluICAgICAgICAgICAgICAg
fCAgIDEgKwogcGFja2FnZS9kb2NrZXItZW5naW5lL2RvY2tlci1lbmdpbmUuaGFzaCAgICAgIHwg
ICAyICstCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvZG9ja2VyLWVuZ2luZS5tayAgICAgICAgfCAg
MTcgKy0KIC4uLnJvci1jaGVja2luZy1mdW5jdGlvbnMtd2l0aC10aGVpci1lci5wYXRjaCB8IDM3
NSAtLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvcnVuYy9ydW5jLmhhc2ggICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiArLQogcGFja2FnZS9ydW5jL3J1bmMubWsgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCiAxMCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0
MDQgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9ydW5jLzAwMDEtUmVw
bGFjZS1vcy5Jcy1lcnJvci1jaGVja2luZy1mdW5jdGlvbnMtd2l0aC10aGVpci1lci5wYXRjaAoK
LS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
