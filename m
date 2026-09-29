Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAABCA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDDDF8100C;
	Tue, 29 Sep 2026 18:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tj4dnAMi9_I; Tue, 29 Sep 2026 18:40:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0F46C81008
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707220;
	b=B74NfNg2x+0CBEEaHi+5hpZLkfShmdk3lH6FyeCLPh3aAW3ucKkhi6uX4x8xko4Mt4dw
	 S5zriAV+sv8jjGAn7P1EEH+zPyOGZ8A6fXYzVn3uaDZD7J2moD7nqzakx3yDY7grZwS1i
	 jfYtRmNEo4c5x9zMIwH/bXSTG92MVbq+C14ds92QehwS8OUPpKs+0Gi5T9bai1VRbQ+pk
	 uoxsmMM4TZ0anRzKW+hmPCKJ5YBOrog/opdSAJkwnrrRudJ3YjuQuozsr4/gLyh3uNCcS
	 yVUbGIUt6jg/mWonAn0urOXBv3kI385CchglZG2Pl8K/6DqHevcAsFYkaCZ1FDlpaxQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707220;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Qq4cMQi09IbqzwUMAyRfNscM2egcXTpwxjMK601OUOs=;
	b=WEKS40O/GOakH+8ghHBeiFQl1zrMonSbdW7rxYV4zJ7uTCpcDQt6J6RrXQKR9o7K042p
	 /T2E2j2jIazGIBfjAoxGXczfz70iZTYLVpdtRXVf9c1bWvyNXdKSimOnM976er8obRp2r
	 vdBVPd9vNyXn5HZigQe8DjVmVZpJ5bB6IOy9nME3qYdERChBJqDCnbo0JZsTUZ3OjLNUf
	 oidYmWHuaubDJ7R2MJWEExEJ81XKnqstUe0zo2hIZ6j8rLaCwYN307sxciDmXMdXRdBsF
	 +yknKaarX3onf4Qe/H4HgLI3zlOKKrXo9sEr7lOp9L2TXSd07h0vL6OuCq8b83yAnMQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707220;
	bh=Qq4cMQi09IbqzwUMAyRfNscM2egcXTpwxjMK601OUOs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PYfO8/R7yluIlrSDmbIS0/U+D9iIiy8Y67G1EQdf68B02Cw34arC4adh2lYNUXL58
	 Hlr66ir5E3cvPj6SWTVVsKvnPaAfuiHBnACJjvscNVps9jR7cDAU/qm1mSqkayunJd
	 FQwe5BVqrg/ScF7V24Rfb48K6RiL9XVjnV4kFqXhB38sUobsIuigc2WP8r9/kxg0oI
	 pFnQXwmryT0CE7QXUFu/99xQXkSgE2GhP0b/ioJGI/0W+dgSTWRcm04KMqjIybQpdY
	 422OcfBISqYdL12VKsKXa6v74wAazvCFNXDioDnf6MyqCTsGW7iQtx5KQna+wnrCWM
	 SCWiyL5C62hEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F46C81008;
	Tue, 29 Sep 2026 18:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E55714C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BEA2607F2
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oerYoi9YlAPg for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 93B69607E9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707216;
 b=U5sqZOxfI5EL+3VJ40dg2GYW2TicC7PF+XtpDDQJBQGdIJ6d5daNyeFXOVlhWPNLsRWh
 xmHdI9AjbCbLMxbAEVguq0ZTKFpPnjl7i6vMNj1UWArV4n6WRAa6ftpUSqaafZTQ6A1sd
 6J6ZMeci2qrl8krUVPY7ladza0aNtD5FfO/KogrN7vofiKBu+nNCqqMPbvm7Y5QSlOsyg
 3v7on5QTfMnhWcq3Z2pbwq6Rw2QaGb4LcEaYryHcwzPPR+8TBRqVSR45NEtYiyDaA/LmM
 bYpPYIc5CtzQI6FQT0P0Qp392o20NMX/cFVOA/uN5Pnu+fOWC88k8CV0g62mNyh2K2Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707216;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=xo2/GGYbJa6mMAgrljuKAl06nS/LTDyI29cmK482HXU=;
 b=ATNd/BgbpWJKVawDRCJtdKa8nJeTSE8eGgKhsJVMM7C84NLBfIT41Er4ydIEtx9vcqvn
 305GYrDxtUBlyHu96R0zsbDMREg5Nho3FjO00JDTAV8jcud+wr+tUTsZch04X19HL+qPb
 AIIy6RDcvYmFbXchgVcjPRUr+KoeFdQ4t3Q9zSyj54RMbjvqpEOiYXn8UeepSAohoTwR0
 R1qZCxe9YsU3IiyG1tt5eP0ejFGNlJdl99K2uE8TUl61DlU3S9mRKjkiNg8yNa/a/PZ/O
 5ASe3mpn0vWEOR4y4lS3tNgdNef3yx0e8Bp2WfFf+/sMRrqeUJL5wPYFJc6g+Vz+sWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mYdUEO4I; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mYdUEO4I
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93B69607E9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707024;
 bh=xo2/GGYbJa6mMAgrljuKAl06nS/LTDyI29cmK482HXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mYdUEO4IpMpKWuE8TSkHCjY3j5MHtnRXt3rJH9xalCfiSZZrXti68fBqUmH+Ap/6q
 EvvDf2uB06BkNTDxfgabvSqWzsq5qxE/+GMFismd6Z4uRW9XTDJaIvBJsSBPmzmoK9
 4StuOUFHaGQQ8pC4so4b0Gs/IyHWIVnejPkWI0zN6UMek6PNfyOhHZ+xAgUtD9eg+r
 j9SW4ZcFT4kmg56Qa2baR7aDnhLIO5qxzGz66g12j4umIEWU8K8+5km8JQzqua5Fa7
 eG0bS4RTLqcfdtNHr9UIcnhfvh+vG1eYPbUxI2DnZDrfPLFKOnF4c1Pkl8HPQS8qyz
 s1SVyjz0X+CrA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 qoHvrub5PIO9gQsSeqe3zHWKzf2O4Hp9xR6aBzTQgfW/Geec8ZhCBh1REaZysfjZ0t3IRejuXrn
 +9J74+DPia42gQNfKce9jnniK9klEdvWA4swQhv/zyQifqkiG07dhLzL2J9Cw4pT//QfHcyzWgZ
 kearqFvq4MCdIpAA4t5pZvNkwLNng30w8sn4xDnPw9OoRdey51oMGj65H0WgIUCISMiNiLW4a6e
 0cZh08jfiLjSFtMGGfrB51sFmR4iOniRt0r8Sim2D9uXtBteziuyI+jCLkHQAwLTf2BN48WBOOb
 e8pvNyLF3wqbfEgtIxe0yMSbuTpMkDheQNm2AqqKK/6Pkpbgz5AQet8YaDJj05tFrRDm7AvoEio
 oo0YoMq5eqxUPC5isyWgJ+wHTHVX4eTIV0ULTkuo0W8ltvP93a6qgTsumBu/wItidgTX08decc7
 gGKumwb5OG6IgBdRpYUZXctgVRvihnA9bvELtPEe09Lgxqyb8X4Nax2/78H9nP2+UVOUc30DsXN
 noEl8DUqnE7fl+gyqVWKp1MUUf73LAspGEsISeWn7jM6n8wa6giX0HpAd0n6b4Enw0C7LSxFqzd
 +pz9vXwXWq6FJ3AS6da32pPWe7ZwYunPpF8YzDSxbim+9tU39UPcrxzSF9uYwLrpkddrJvdGq8y
 /tvDtgjIicQTWKJYyS58=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFE7FA4C5196;
 Tue, 29 Sep 2026 20:37:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcge-000000006Jn-3h5n;
 Tue, 29 Sep 2026 18:36:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:11 +0200
Message-ID: <20260929183607.1849293-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 12/66] package/boost: fix coroutine
 dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Johan Derycke <johanderycke@gmail.com>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Simon Dawson <spdawson@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 929a9c3869..f22f263538 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -102,21 +102,21 @@ comment "boost-contract needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_COROUTINE
 	bool "boost-coroutine"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # boost-context
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context, boost-thread
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
+	select BR2_PACKAGE_BOOST_EXCEPTION
 	help
 	  deprecated coroutine library, the non-deprecated coroutine2
 	  library is a header-only library and does not need to be
 	  selected.
 
 comment "boost-coroutine needs a toolchain w/ C++11, gcc>=4.8"
+	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 comment "boost-coroutine needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_PACKAGE_BOOST_DATE_TIME
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
