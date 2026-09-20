Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77FDC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33E440EA1;
	Sun, 20 Sep 2026 14:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVBrbGa3gz1a; Sun, 20 Sep 2026 14:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DB26840D9B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915829;
	b=Ymr3nUlyzIzZduMWStkTY2fEbccTbdaOCuwrtlnQypMZf3O67f5b3dE7nqbpRrD+Px6y
	 f+fCo8tJM89vQ841fB3l0grIU6soaOxxUShYm5xm0jJaaJsXm5zdnkdZ23x8oOgHhsmk9
	 jHPcewrFpWhqGyvt6arASgFjycUuz9PHlcgw6K7ajcAlu8ArkUvcQqXrdQb/dJGigYG+B
	 yEphqb3prnLZJrOU1+khmNIzDbqNGeh20KwLJCGwJBL4a4ty4EUZVcZNyOEABwxQlOh2o
	 L268wARvU4KlPGz1DOjeGKu3F3NWGLJdlNgROIV7sroiIv7Gny4d4kFnpRa7nNFSBjQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915829;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=NEFcPkUHMLMLM7a9LEwr14w/SelvK6Rharkrei38skBJj9fLLO7GkvNHIvQF25BbG6sL
	 bSaoCXbnd1C3q7zSenorNae91FELZJs9Sfeiw0Ad9PANhaP2rW9QgrNqcjfQKDymAoi7h
	 LoHuGyOw6w+5XuLJicfPKe0Oox3QCUkPDGejJw+BEOmDUPmwsNia5xTx2m8Z96rwbZatF
	 LwiaVDngEVI9PhbyUR9z+KU6t/s1B+lTnQYn6DklOsfABY6Kr6wQeQA305+THUvI/ulyk
	 Ymm73Zez+n4Q3tDeexDxyuu+NqJKmDD8B1iKWOF1UPMHQRMonFzOgmOziwPFOce1PYw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915828;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LE3ne/elx1tDKPnb1ktwLSbIFaWiVpBCYB55FPb7VPlK1Zt/VfrXKQSOmwf2VRyCX
	 kPncOpdsJU3tTtaY3q+jd2amOmm03lfMfJTBxbRexkl48qR27eMVXF8NjrMqByj4Se
	 xUmE9W3FMvMKJBMTZaws1q4cFXc9GqGSV/GWoomiDXiEiGQ5Mz0iGPqsW7LdYI+SEu
	 XnjstTih7iyoCd3JZuERcxrFzRRGrhrc4uwaokxEV8GFhTF+QP3IRBujZXXVtbR/T9
	 poM8IkN/rcu3TNmTLa8sCD6cGZShskzTyb92gZpxYb0UdugUtx2O8M08PezOR4TU5b
	 KU+YK43Vrofdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB26840D9B;
	Sun, 20 Sep 2026 14:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A3BF24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E45F680F36
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iljNsduIbr3G for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:50:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0972780DD3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915827;
 b=e8/WWPpEP5BaangeyW+qvBJzbeIeTkanN5eDDZ4+x0HW0cRxvT8gENPh8hC3/JDFItcb
 sdjMDBy2zvFlVLn89LyLiOxxYcaadDoN11QY0mgVRtT94AO8fuCUmfLrR4xRVQudBVXvF
 eKxxDfHaMiV+wQJOomhjHrvSMtgwjiFwK+2dz6HLPuFMrjoae+e+1KRzDLlV+Qpgmk/bw
 SCOivcyeFq3+oXbidvII69swbgcnksEDcu0JJ7ImKTSyWm3dXNRqyVmnPAKvp5HHoNSwe
 30kN6G7ZAkEo52f/uibTUPcs2mS+To0LYY+3Vlc9fEnI+XPMWKHhs0bYeR1D6Spg8bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915827;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=gFC3DvZ1vVyrCNwvtOMJvbJs/naEAhTKFMUSsaeWd1AqveoPa/McRSx0ezW98s+Ghuht
 9G9AKZTVurIesHWmH2BmUXTRaZ2d5fk8KnqeyaL1G3/gG4VJZofaFUW9cYxZCWGtm2lr1
 0EKioysopzGZNXJFubDLU7j2YUrny8RucU3x+2tfB9SQ69Tyo6ICQE2rdROMk1v3R3HJs
 JzbZg+nToM1hJCEuAIG9HSLo2SEQAB8A7vdQN6HbwjfhoSiOqRlbJb+RE8JT82Jy+xxRA
 XD/khbfPDz0sCakNMmAKf2kWORBzRJRloVz1lbojWn2gJPUFeYCV0IzC/0k8j4BfY+w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U59vnI0o; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=U59vnI0o
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0972780DD3
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=U59vnI0oCLHjoTYD2luKFyBT5/wb7bOn+LPv7EsYaqKh8UQZmvg1gwlTkc3a7CV37
 YTka+hOALr1xI/G5CVHCK562Khbr5rOtKdybABKUq5EevQon0tCssKF7uiLZ+CaAUi
 ZEZm3qQGXAt7T/OSHAZkjKaLrU/B7RShu+5rxHtyiN4JUKsM/Ah1RhY4XhD2rdAN/F
 OjStymkPytpsKTuVjTxRsAvrskg4edjTELdQWQY7vE/HAr5AGbHUiNUcIQilMCFqd9
 TAKxWYk1oyQFwk7PcyIIATBekCN6MUz13J/whgYrXqy9uDRzDAwXvaYqiQwsKaTu+v
 /bojJTwzRJkmg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:yILXe/NJ5OA5neux/m+exEE4KrSI9vfsXdbOL8RIKlk2gwQLvDRdfQttmWf9AwjQifOgtwkAEv2mTXsn+WDEjQ0ZSiTNLiMLdr4m70LdzBlRYOiVIisjnYFA2DhaFdR0pgmksgJspz4SV5piiLfDbA6NXogLUC3bCPTe+GnemcJjEothEG7FEzhole35/E6mOSu9GdK+xwMitnU+VM4RuTGRbL14Thz6dfqJ80WAZ/m4gOlQkBQETctK1tNKFIRIiuxxdQcaxjh2qtrrRAp6Aewg0VVZY9cPyyVvxDlCgev6lekBpFWkHLhMbJWjOWycJQBGMgWMElN60aRjJU72x8jPQ6xK+453QFcJ+EjFnh02lV3IgWL7v2vWUJDYhjIGHINwBuGSjdPRFE9w5dVsBNj8ug+K+FweOsnfPtdZfCnK2C6zJpCXthEdICIItJBkGGq1P/KXVfqCBytnLMuU2094osDyjv3DsqvGQu5f6KNBdbRaCFsWPavL164T6ThNnouDGX8uxrW1lDVlmFSgOaIlgCOi/6C5EVyJaQpsUMs6p+FUIP5cnzoPq97AERquLt6frqrzY4AqVtWDeEMpVg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E4220A4C488B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-1eFc
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:51 +0200
Message-ID: <20260920144428.3009612-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v4 30/66] package/freeswitch: Add support for
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

configure checks for DTLSv1_method() and DTLSv1_2_method() to make sure
OpenSSL >= 1.0.1e is used, the functions itself are not used by
freeswitch. The two functions were removed from OpenSSL 4.0.0 breaking
the configure check. To fix the problem we let Freeswitch force-detect
the function to finish configure successfully.

Bug was reported upstream:
https://github.com/signalwire/freeswitch/issues/3159

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..524599870c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -75,6 +75,11 @@ FREESWITCH_CONF_ENV += \
 FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
+# fix build with OpenSSL 4.0.0
+FREESWITCH_CONF_ENV += \
+	ac_cv_lib_ssl_DTLSv1_method=yes \
+	ac_cv_lib_ssl_DTLSv1_2_method=yes
+
 FREESWITCH_CONF_OPTS = \
 	--without-erlang \
 	--enable-fhs \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
