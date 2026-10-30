Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23412606A32F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 20:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P8xdxzrq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74FD660ABF;
	Fri, 30 Oct 2026 20:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RU3tyPnH6kA; Fri, 30 Oct 2026 20:06:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 55B2360AA9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793390787;
	b=fIlaxtfozQaNCt7NgVnpiWIZPboBT0del3vq68CoHSQq3YGePfCjnt41X43EjZkyoq3Q
	 n0TAb6vhp8erPwLp8raPYLO0U8n9Wf8OKeFftYDsKpBpAEdHECT9sfn7McgBfdqNMDmrY
	 CcoMRuK9TuCii6sLuuvqdc7awlx9DqqL4Y+s5Lde0OBTlUnnWcfKBzrvn3AtsDDap0prL
	 Eo1/29D4SG9VTJlP7ZeRPMcXt+yET45b1egrWzhIelNqBpZYdXgqvloRmlhZy8v6DSCPF
	 8/dAVm1RVdzspFWUhyyn7VLlJ5wcUY48X/4yTq++YL0PipBsknPph9uNeJOshIo70RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793390787;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=XLItdRkfd/Ixbr5P09927bqQXYvcnVJsFgpLDcNA2gE=;
	b=IvuSAy4G94h1Kuudv/HuP4ETUiy78ZiFf3/V8KaPvFEjCJrSeoRbuxmekQA15tFt8xMD
	 l15QzX9YJLoCDXFUSSyLbivsVGNQaFtmJL2iDlqvagdC89dyfgW/BMhMeHi2fUTHWGRdZ
	 kL43AY1y0kTQxKcXj7AD9ZVudjIzlu6/MDquvVDog4SXkiu0HGGN8cXy7W85P/5Xxqbcn
	 WDS2KzQLNFk5czbcbmRJprnKa0qoKuJUDR+G9EotT3BHt/rbxg6xScIEdeFery0Fyr8E/
	 DyHd2srixSzDDZjGl9kApPiItsQk3/j7dJCFtdo/MyvmH5ZAOqozvNbBNr/7atv+ldg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793390787;
	bh=XLItdRkfd/Ixbr5P09927bqQXYvcnVJsFgpLDcNA2gE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=P8xdxzrqhELFlUXfqNKa0TXspgyiVe4PchZtPsXA3dGnGiW6SHoAgPYdetgGZ+E7p
	 ZehjzFowUJjUdpM7+uZ9fxfpCWYwmaQzdyalSF1eCwJPGKR++BD2TqEn6FjA29c1BZ
	 Zi1b3TM06QscY5sWEEA6Q5pt82IO0jWkv419yo03ipNBruHBPjeb8048l0dwosAz8P
	 nhRIDUJ/NPHDQO2RgOI8MS77rRUqsO5apVzBqTRcfzENhbv1vgMxiWHEz8OWiSra4R
	 qy1DRkQm05fySgLdqH3iQvh1TAjHI7tUc4/i8jRoj1jU8i5joS5TarPas2zDdlnqrN
	 aKh5QIVlEsGOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55B2360AA9;
	Fri, 30 Oct 2026 20:06:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64E48712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 617E880B97
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FhAHgLoav5xz for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 20:06:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6516E80FF2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793390785;
 b=TwpJ0VwMMgbTNUnBYnUCXvc5DKXctmQI4IRirSmv1onMWH0pfK8dF+0qTHxSHDyhw9GE
 JE7Gf3gSHk361IceCK95OTDLzn3I+jOXsum+5pzF2Hgn15oKGUPIncHlOCJFw+fxkl9Yg
 e17fgyCnFjrpbmCKeL54kUdTS/ctmcobXt1syn7BMtXcEY1VX805z4IQWcvgXmBnPmvcy
 DVqObz2tNyHagybaAS9GUvndC6xxUbZp8fBZ8vbkWpUWb1wCaWf71GQnITdJW0X7LLqQO
 o8WSWHU1PufBNEpFk588K5w7hKlk6iQ3MQAKapA8jcF6zZ+1x79Rv1mi4inP6xAPwuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793390785;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=76xOXrICEy/P/IM6e45dxs54UivbgjmWZU2zuRYjUuY=;
 b=PTXlMCLkOG2Qp0AvKJk6NHQnyeErrxP9S+FVnVpV6J2ReipOMeIc/qp/sctWag5bzIU5
 R6eTjihmY8pw8CHez8frKVSN2sSdeAQN2ec2bQ6fA6TWR31lTYkiZANwICP+hMLvRF9R7
 gsnxfmSsvN3YFX6AOwm04fb57Gx4hP06esSFh0OqZ7HQERjAaEjneBEq6Pb7zxNTV6jrx
 Ld1zV9EW/Ft6l8D4Vzoz3H6fwK2OwvrFpzXSWPwp3txygNdsY8iljKKr22HEtQNiE8JmQ
 7PPcjfRx7DuYBQWyHCmJ4pZb7tbtZgs9WiNi6AVR23FcPnEq2+3Nj+gMs5E6Cc2tYrw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Pz1GmGGn; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6516E80FF2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 20:06:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHXBj-1xIhzR2xxB-00DWcf; Fri, 30
 Oct 2026 21:06:20 +0100
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 30 Oct 2026 21:05:47 +0100
Message-ID: <20261030200552.779306-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TUpOHTakxGS9uzzzuaA4oHetExodZifnnUwppjk7XykweeXDSo4
 5XMoOrpZiHj3gERcixGhwxtvC5G4MFNIhaEhALj4UsXPOWE9OPj1fVikFZ66ffW9huXXBsN
 1lBMr5jECXfAGSBmoMnvqjW+vHxMvpXFAvZEuk2MTN4k1xv9VehKyINqPrKDv4qDHdOGq+n
 Dw0EFfHX2YSA2+6RSLykQ==
UI-OutboundReport: notjunk:1;M01:P0:173u6uy4jl0=;4XiE/nYdGeu71AYpumQ1zbEGQJ4
 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
 dc=
Subject: [Buildroot] [PATCH 0/5] Update systemd to current stable
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

this series updates package/systemd to the current stable release
v262.1. I'm sending it as one patch per major version because I think
it'll be easier to review this way, to bisect if needed, and also to
apply only *some* of the updates if later ones need a revision. ;-)

Patch one is a bit of cleanup that should make the others easier to
read, and can be applied independently.

In addition to the builds where I need current systemd, I've tested
with:

support/testing/run-tests -o output/test/ \
    tests.init.test_systemd \
    tests.init.test_systemd_selinux

Note that the pre-built kernels used in tests are at the lower edge of
the supported version range from v260 onwards.

Best regards,
Fiona

Fiona Klute (othermo GmbH) (5):
  package/systemd: sort {,HOST_}SYSTEMD_CONF_OPTS
  package/systemd: bump version to 259.10
  package/systemd: bump version to 260.6
  package/systemd: bump version to 261.4
  package/systemd: bump version to 262.1

 package/systemd/Config.in                  |   3 +-
 package/systemd/systemd.hash               |   2 +-
 package/systemd/systemd.mk                 | 250 +++++++++++----------
 support/testing/tests/init/test_systemd.py |   8 +-
 system/Config.in                           |  10 +-
 5 files changed, 145 insertions(+), 128 deletions(-)

-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
