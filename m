Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABACB606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QMzppscZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=i0c/G+bR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63CBB60604;
	Mon, 26 Oct 2026 10:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ocAodtVTwcI; Mon, 26 Oct 2026 10:34:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 887D060608
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793010879;
	b=qmXW2EVElDjiyjUP8K5j0XDq3XcQbwCcpwqnsTyq+rM9v9lTQ0lhbep6cVYNivWecSRg
	 NzuEtrMaAyEvnxZTtaTENvjeGF1qRoyzb60+aK3VcSisMEpsKdUjsvEH+asKkwVOOVSX7
	 2WeML0Jh5oIyrjFUp5UUgfC1R+nAdshpb2wpdJhyUWtvGvBwf7FaRiFrozjH5RJ3LwSbG
	 G1PUiaW35798Uxzq4EB6bzopsV8yhroFF9x86ZGxaxrfii0mEKbBHVt0eoUxT7+v+zix4
	 vHyCKnWNZu2gWav3TvgWQ72F6M0GHtuL7LqcMqWZ3iWoGw8qmVZuFvBUgH9irgPvnDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793010879;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BKJUgi0aiUJB3jJHc3/ZvH/TkUeKrzhhqbDOtlLvdFs=;
	b=YUGW+n4LEyfK8pctYGYZFJbdGfNmkZzUxlfFWG2pw/HO7PmoRpg1W24VxWwt0HNY9b3p
	 rBJsHTkCytQhpDQ6M6oyzaZypWnEk7tbulTnt8g354p2kGpAJFsStfXKkEFan7QX71/Tb
	 141b/RZM7HxX24fucmwMpI+B8T7LyXzPPQhZCEuLMGbidcFbcy7l+ygVKj0ERbKbpn//A
	 tl7vlx3bXsQsitkOiRpCuGfbhUxv0y89wgqV/wGwf5FmQrz9LKvfuxuYWLj/JeTXPqvYD
	 WhZYIaF0CCkXu90a9Y7oWWGt2xugdQ+kwXB1fLkszn+UIYrXNd0PDmhc57IdTB/cxwg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b="i0c/G+bR";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793010879;
	bh=BKJUgi0aiUJB3jJHc3/ZvH/TkUeKrzhhqbDOtlLvdFs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMzppscZdU/TMIj39NGicKtBzPmrhVx9WtRXB/y84o00OTnKlgjsfOw5K+/jeIHvQ
	 iMkiua5bSxuV4xU00teyxNspdVQ0SEATPRu6SM4YVOJasEbvfEvmjnD6588N1BhjTm
	 yW0tEuKytw0UjzxF4XpovjUt/2SOBDybp27568ZbgJDN6w16YWqhlnGfd1UdtncI7j
	 UQfpIGGYgGo9PDE7a8cat43f6ZluyWWmxu9Far0OqA8EWDt5ndu/mTg+nCjBkBy6XG
	 D2dUPHFRlAyQzOV0DD9bZIWd6eOM21jVWxkMvQXr/6W61V1thd5aCSbiCu4gQvSNK9
	 FWryK4vyI+RMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 887D060608;
	Mon, 26 Oct 2026 10:34:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B01743
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57FA460608
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPT_3lIY4CGG for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:34:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 01CAE60604
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793010877;
 b=Jv3w8/LKyZdeTmUOP7hkGuAcPGHWfoN+XkFilLIm/TID4G2uDsKEZZb4n/lb4bIc04Ce
 nMxju+sCOmiyuVKFHCGMJbeZGxfQqtQGuHvlRXKx/ih67fFUxudxl+QXo4teGYm0qw8GN
 /me2v74Zg1vmcFdXBKifUP6ReQEcMKSkis50hvE/JvUSmgFG6KF/KurPMRBFLUG4ucKMt
 x0SXZFuvBU5bLZmVN3hXT0SsCyKJkGrhfTZvf5VHYGr7CGsU6jhkE4ml2lP9ZIY/VQ/Q0
 7K69bgP1tNAdPM1FrD4PcAAvdVfdeJodjuQJg/E3F7DsNZ4Behdi3z0UvJoOQpAEsTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793010877;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=WFfTqQ862Qe+DvUSJoImU7yArYidOzvpfgblxMhMzbM=;
 b=UcTVZLNSbAJcgf75d2u6H9l+/ku351K4NsnpGdq+yUCq9L/CxRxcsgYlt8NP7VGl50BQ
 ekpotNlMLlybqPBjFVRMzihUMpaGFSo8NYbTZ3gROSZEpvspCsw7lxT+epTdGQNZsOLZI
 H1jkT2eLNBbITq+bBMEyRtb+nxb15OR9QAvvZK0dn4bMxFdQ7Hd8HI8tYy+vjZe+fewue
 k+tdk0gWbsKEAlv6AiT7n65pY6PV8MkHznglG8ODTOavhZWN1Lltcc5uFgyC7shamgofL
 BDqMh20jf8rXqBXhAoDP70Swt1IiCaFyOkrX5kX/AhaV25I/iVcP1F0w9il52/UHbQg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b="i0c/G+bR"; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=i0c/G+bR
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01CAE60604
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:34:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=i0c/G+bR2l1ydnIoOL+zo1U3TEI0+omKq4myRfzkWNYeccg1xHH7+ghBZr4zj3HcUU5mQjtR67PJaLOGxdE9FFa5ow5VdMo1qbHnyp8MOyPeEKBdTUR4dT6qWU0CDPy9o7iulA85zAb8k7Nqco7STKOjLIAkIu7f4t4zpAMoSR4AU2wJqLLbfKBlZ8SmhUqQStA6cSXU6FyTLL9QeiwsvpJkRwKWIWfUh85pZyB4z+LcamrcAMQuLqakAmm2TYrg7V3iPfGWLzDeUWFD4SL/wtBh2w+8bQ8j1motMzZoUUo7o7oVeu5PHBXmhlu1Gw27lVAgS28U5RXe5n+f7kQsoQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=WFfTqQ862Qe+DvUSJoImU7yArYidOzvpfgblxMhMzbM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -697969032; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 26 Oct 2026 10:34:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xLI2B-000000089Sx-35AN;
 Mon, 26 Oct 2026 11:34:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261026-bump_openscap-v1-1-073bc9dfba91@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Mon, 26 Oct 2026
 10:48:21 +0100")
References: <20261026-bump_openscap-v1-1-073bc9dfba91@bootlin.com>
Date: Mon, 26 Oct 2026 11:34:31 +0100
Message-ID: <87zew07nt4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openscap: bump to version 1.4.6
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBDaGFuZ2Vsb2cgaXMgYXZhaWxhYmxlIGF0CiA+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuU0NBUC9vcGVuc2NhcC9yZWxlYXNlcy90YWcvMS40LjYK
CiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
