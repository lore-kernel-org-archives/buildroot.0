Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC2606A31A
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 05:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g093FnQ2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jem+j9w3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAFF80BEA;
	Tue, 27 Oct 2026 05:41:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lAesiY3oEQ2q; Tue, 27 Oct 2026 05:41:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EC1AA80BDD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793079695;
	b=UfWRjTYIjQMCWZvPZP6ibaRmZguHWhAOJRBaeFz2lI/YW51ooIn9qyQ6qlsXsHvDhWur
	 Hdiz6LELnh0eZGccmF3dGKbYV+vdUcReYRU4lFD8Xn/xbXPvfNmzGRNQajllerxbBNg8I
	 czd/TIPgDw8S5apVc27h9G7tWVETajDsXjSzmYXS8H5yy369sxlqAMMt9i7qqdC9Q4BkW
	 +PpVjO4tlkJgqhAmhfRjOf8mw/RFc35QT3lDudM7XadSAUOi1MVO7KfcmyIvddfx5L3kF
	 9P2Nkm47sTQcS5J/0VooyMe5dyevt5ctF+FiqLMpSSDstBh7/87jsafi4EBgE7cxj1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793079695;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y4kWRK2FeqUMm9Fo6JTbT/DnzjJL5gLkMbhEvdPAGvc=;
	b=gtKMf+QW+htrn/ri68h2PzlJ5Cu8TV5VqjduqN9X2MNzt7SWNu85yD++nTxD8N+jyt8U
	 FmKSkEQXJkgN95/CXp+2xVCxSX3nnPGOTuNIAeNB5POgTpuZ/hoN+KeMECy1NL8K91t01
	 GNoI+djovircbZ+LQSgK+8YRpzQ7ZSRF6v3yf8OwB3fugpvlEcquuSUezDSURVXdTUkt9
	 2Z9ZY94kUOf/cqKgxHD8jBl7/71wrJjaEVOeySeXz20VOYJ3KvjWySCV6BX0EBU5Y5TAZ
	 B1Qm7kvy2utEC1t2DAo5hJGOcv5e2rwjdnS1thzUKnSSRhn2Q3Hn00TGp/rnn5n/4SA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=jem+j9w3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793079695;
	bh=y4kWRK2FeqUMm9Fo6JTbT/DnzjJL5gLkMbhEvdPAGvc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g093FnQ2+2VPXC/pGHIRANEVNvjR+Lsug21jwWMZhFsFxMTtBL0IZ6P6LmHoU96oN
	 aQFzz5wwclLrZcHWCIsRcwGWqS6fVkfuBXx71BbI+73LRvK6FfTyY/q6iwwQQOuQ/w
	 EI8XpX5LvvaTm/xysYlZJRjXi64JAhf0lJ0HL8fDChwWqa0716gcR+nA0Io6M09n5O
	 5f/qNk+U9+x3+yfcAu+7Hn7opryyYNHR40CWR+b2FI/dTrYRQZ7BHYeHG6Rk8PdX89
	 o3/fd6QFN5hI53ke0vqKq6aecIYp1wbck+LxuXGh8DTctMKl8eCVRWfvLUDUUBa5aN
	 wGOfvqpv+yTxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC1AA80BDD;
	Tue, 27 Oct 2026 05:41:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F472AC
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0F5380BDD
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRgLOs7Qlo_k for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 05:41:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EE6B180BD4
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793079693;
 b=EVewf5pDTVeAVPz9P9Oe3Thl6NC67COyetB4Smy6IjLUXDvuSLBXCETrAFpVMKhoOI8Z
 hLK2ekfTigwIVcsqKBis6dIktYfIBePZfOhcQzNMiWXZH8TGTWULuEbmQcxrC1jDFCfmN
 XD5gbOjhdNrJQBKHjhTXKin3FIbgsoZIgi1rF3rCWAi8jVBKFAI+VnjrYivlFhdlC46XO
 urVfWgDseRGt6StZMaAX//eJ2KyXWmBrAe9n4ihvYZKTD4k1VzYw3hG5h+OKsY2QP4/q9
 Pd4r4dHmsIBE5zzuXI64fP/EdLAZoJzMwo0fGlTC2LPxCpDLf8dVOVQ5Z6+BMKhe57A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793079693;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=6cW4gi5gNGDijN5x9rifKRm0MDdr0bwmMBpQsmBrGss=;
 b=CZaU+u3ERXrI/im2zbPOuPaB6q4Zfhvj4kfbnlp/25st61IW/nFkPL11rwl7PjkULsyC
 C6+3btSdy+bAryEer7FV7WRAblepQqfcOKX0YazWxe19dGLqb1MUx/f8+23Nxdi5V0Ikp
 nNqGPrxjl8z9/UWncgYteEFjP8jdZHHgRfGah8hICp+RFXfKQlI4+Jz/M9kL+fp8XbrA4
 TjaOesylyvS6yWW04VvOMhtsR2RvTjKFZVd5xF5AsdeS/IlYRlTxuVK1CbmJVEKCZKYS8
 8lKomWyeifz8qyGMQC9eekKJumhVlf5YbDkr7bPhEDxmnQVVck+b8G42QAEDgjRP09A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jem+j9w3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jem+j9w3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE6B180BD4
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 05:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793079661;
 bh=6cW4gi5gNGDijN5x9rifKRm0MDdr0bwmMBpQsmBrGss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jem+j9w3gwYq8UpHH01oJCcFyzK5DCNyZikCt7mfNQnhFeeeaKJtAI3ktvL238pBf
 JqwjzRCLeZ0k9FKK+JbBML7MXFQ1JWk/96L3yl6F9MKqSGa6qDEEOkE8YB0U996oCO
 Clm6VjGHiMZWVjCWDFSGc0ZwabZsR8LEWZoS4JN9NpDw+6sJMkg/If5rYA8zNHZzpI
 B8lnrfdtheX/p09kFqi703ui94ELBe36l4YVn639ZjzPSRswQke0yxX6ytzZLd264Q
 pQEoumvhwiHzjv4sfTdUzmjqq+T116qqonJFZB8Rqd+leiwPDccOVLFbiRllOitola
 ye7qRRkiMPaqQ==
X-KAS-Sym: v3:f51bdf72230551df:idzSaPYQcOBEH3hN4ZWiwbOHktskG+Lrl0WEmAPz82oXA
 x9P0/DSJSXHsBWmUzjiYMlh4U2urOhQ6sNljK8Gg7MUrxk8NhWOS9gYGjyTLmLTvxg2NKYUqByQ
 7dOze/4JqSp46jsj9L2tZUUSPbxlImbpe+S1mid1JN+qG66oTpCOTj1jlmVx/uGnE8oLEisteQO
 220IDjhE7LPI2/8krbJ6GWVtTSVIBXMsNW+YemgzoLXfXrDGJiuW5ibak2NOeYDxYtm86VKzdDg
 vV4lQXuTdRQvbxp9s8WBa4zvXHqyKccFXVLeX7n3rkcdm+Y0yAZCPbCts49bgEGlLRgD5MQQ==:
 MQkgT5FIUxI2+jUtAUYib860Q7XE+4ioQl1zs+WmpQmYMZ62ETSZ3Gz9Y/cCi0WU5caQgN5Zu3X
 EhKAmyd6QXepoObZozndYWlR7GeEF0W4hiBfF1Cgh5mLWL0OFDAtisP7CAwsY3BzGHUlitmrLgd
 J9NW1ywrpk0U9sF3sHEubGMOQBay4uZ3GV/uS/IDIfdI+DhtMZVdxNj7HKixGVJmLc1rzwDuIyI
 mMwiccQuBXQMBTTGgYVk129jB/q0Qw+qvTah7CnU/NRewHCA0DaA/bNWuxT7DmCatvEt5xQ+g6G
 Kx14VNXkdL1uI/1Nk/1VrGU1qKo4AWwd0r2isYTh0pAOrqmKjFFK/3NRUULRz5RQJDWiqWIGPaA
 rd17Tu9Q3pBUk+5vgP4Yr3cEFkt8uFjiqMJePnrd2LzT3zlWuipeM6d+KO7Zs0lGnCvuGwwz3MB
 zW/9jtarTX0upt39lMBzaS69HIYavDAPKkKPMPgpjuqBZ9QfAbkj1TLPieptEVz+NBqdt+qiAcx
 Etfskey5Mr+oHBaSsBSD94Dt7RUjZa+bxFCwPBaMEDRJvuJ
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A28BEA4C6E0C;
 Tue, 27 Oct 2026 06:41:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58314)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xLZvI-0000000078y-0hNS;
 Tue, 27 Oct 2026 05:40:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Stefan Agner <stefan.agner@openhomefoundation.org>
Date: Tue, 27 Oct 2026 06:40:32 +0100
Message-ID: <20261027054034.4556-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027054034.4556-1-bernd@kuhls.net>
References: <20261027054034.4556-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v2 4/6] package/docker-cli: bump version to
 v29.9.2
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

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKaHR0cHM6Ly9kb2NzLmRvY2tl
ci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5MTIKaHR0cHM6Ly9kb2NzLmRvY2tlci5j
b20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5MTMKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20v
ZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5MjEKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5n
aW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5MzEKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5l
L3JlbGVhc2Utbm90ZXMvMjkvIzI5NTIKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3Jl
bGVhc2Utbm90ZXMvMjkvIzI5NTMKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVh
c2Utbm90ZXMvMjkvIzI5NjIKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Ut
bm90ZXMvMjkvIzI5NzIKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90
ZXMvMjkvIzI5ODAKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMv
MjkvIzI5ODEKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkv
IzI5ODIKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5
OTAKaHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5OTEK
aHR0cHM6Ly9kb2NzLmRvY2tlci5jb20vZW5naW5lL3JlbGVhc2Utbm90ZXMvMjkvIzI5OTIKClNp
Z25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KU2lnbmVkLW9mZi1i
eTogU3RlZmFuIEFnbmVyIDxzdGVmYW4uYWduZXJAb3BlbmhvbWVmb3VuZGF0aW9uLm9yZz4KW0Jl
cm5kOiBzcXVhc2hlZCBhbmQgcmViYXNlZCBjb21taXRzIGZyb20KIGh0dHBzOi8vZ2l0aHViLmNv
bS9ob21lLWFzc2lzdGFudC9idWlsZHJvb3QvY29tbWl0cy9kb2NrZXItMjkuOC4xLwogYnVtcCB2
ZXJzaW9uIHRvIDI5LjkuMl0KU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxz
Lm5ldD4KLS0tCiBwYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoIHwgMiArLQogcGFj
a2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZG9j
a2VyLWNsaS9kb2NrZXItY2xpLmhhc2ggYi9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5o
YXNoCmluZGV4IDA2NzU4MDg2YmQuLjY3ZjRjMTE5NWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZG9j
a2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKKysrIGIvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1j
bGkuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDU4
NjRjY2RmY2VlZjNhOWU4ZGRiMjliNGE1NTVkNWI4MmE1NTFiNTI1ODA2N2FhYzE2NGI2MTU2YzZj
ZmRjMDggIGRvY2tlci1jbGktMjguNS4yLWdvMi50YXIuZ3oKK3NoYTI1NiAgZTNiMWZhYjVlMmVl
MmQ2YjYzYjhjZTBlOGJiZDA4ZDZmNTRjMDUzN2M0NzAzMzJmMmMzNDVhYjk5NzIzMzQwOSAgZG9j
a2VyLWNsaS0yOS45LjItZ28yLnRhci5negogc2hhMjU2ICAyZDgxZWEwNjA4MjUwMDZmYzhmM2Zl
MjhhYTVkYzBmZmViODBmYWYzMjViNjEyYzk1NTIyOTE1N2I4YzEwZGMwICBMSUNFTlNFCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayBiL3BhY2thZ2UvZG9ja2Vy
LWNsaS9kb2NrZXItY2xpLm1rCmluZGV4IDIxNmNmNzBiOTUuLjU2M2Y0Yzg1MWIgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLm1rCisrKyBiL3BhY2thZ2UvZG9ja2Vy
LWNsaS9kb2NrZXItY2xpLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotRE9DS0VSX0NMSV9WRVJTSU9OID0gMjguNS4yCitET0NLRVJfQ0xJX1ZFUlNJT04g
PSAyOS45LjIKIERPQ0tFUl9DTElfU0lURSA9ICQoY2FsbCBnaXRodWIsZG9ja2VyLGNsaSx2JChE
T0NLRVJfQ0xJX1ZFUlNJT04pKQogCiBET0NLRVJfQ0xJX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCi0t
IAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
