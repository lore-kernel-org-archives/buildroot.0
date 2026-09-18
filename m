Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34D8C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 14:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94E2B810D4;
	Fri, 18 Sep 2026 14:32:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BVztBP1avZR; Fri, 18 Sep 2026 14:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 15BE2810DF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789741947;
	b=JGKNv64ExIM2XiKGd/WlyoUSxn8eQOfPJJnDnsYIKBRsuDPwByp1FelrNcA7v26+Au3A
	 EoJrrOGkCPYXtuCFIb09Vu98Sdfc4wG3lFDe9MEU6Emm70BlWkeW47deL1g354SPqh4Yg
	 w1AJEF6vWetBHvJxcfH3Lk5VS2uYgeDUxvJ8QrcbLKtTrYa+fQalwdBm645D/6kcWpv1J
	 bYkw9dGfERf1dJa7eskaRbuZq28wBA4Eok0K8UCKoHbMpg9cS9V/5MH6aUm0kwgbPjcjX
	 Z/u9TOtbq6Ga5jtNYefJT9F0aPXeQFliZCl1JwcoLJ5ppQl/55ZL2oGDvMALjjWXMww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789741947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2043lVxs6A/A6kfIP/bMcp8xHj92nB9zj8ssPYOGWUg=;
	b=MHs5Fl2UYVw5vGbmMd+jEIPTLgQymxfGevYZqOcNTUj5kiOgFq9zD/SJ1oXx5UHJIwps
	 wln1TcF1H/cEvAxLU2ESlZ0QvHZEwrTgJhVipbghsi3Xw+XTr9uw5yznp+hyoyIbUT2/8
	 N9LDMZetZLGqMxvKp2JEiFkeRQDwTvGXH0EeDWibYk8l9t0JeB3/RfuFPWFq69wslMYyi
	 wZ7CvxirDNkUqUL9+eY2Sno4jxFAVYn1aQyEZIav8xHggvYZoVzeVYKMdR3yYOa2/RkQX
	 g1hIWEnPbp3FrFuAsnKV/MngPJkjQJfP8uYrkWTmKeiPCOTrJrZR82U/GXMejKesEuA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789741947;
	bh=2043lVxs6A/A6kfIP/bMcp8xHj92nB9zj8ssPYOGWUg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m+bHLacaz2OJiqERI08cDUNajU+pepgOC8uQr7BBLlyydFkoXWUTShOQSqVw/fhRZ
	 kNlQ8nLQs0UORYiMYhgut4OXBQ3X5qAW+gRtUVtVEWdgr7mygVSHrljc6PtwKkwTeh
	 Ty9OCz3RLngp4IxBDxc5HzBCrnlfT6rynl+b10ctX/tLD1okzzKCU1HiBJkVhuTmuq
	 mXd1rB1Oo5BCl78bmBhLEWS47jMe7VmLsOohQCJ26nbiopy7jzwrnJTx+5XVeNfsMJ
	 7LXA7P7XRW7wmgtXn9jV2csEVd/SSBXnzLa8t5+fkBCRKnf8r30jCbSIBuvH2OFe5v
	 J9yHoHR2SFBag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15BE2810DF;
	Fri, 18 Sep 2026 14:32:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDBC4279
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D40AC40839
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0bDBcmqkRIP for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 14:32:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 807FE4080C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789741943;
 b=i4ufHqSNK1kjsfnXAjBOobSvRC+T/4oncRoMcCpUfedBcjnBAD/1NIcrnLsV1CNeMEz+
 oTMc1c4357k2y2hh7JWtyBvlklX397JchOAf1wxLgx75uGehukS5Qm32J0ylmodmmDtHM
 LIJopxUNBYtqYTF3SbqgPC3GST+CncEY3b1tvgi40UYoKBcoaxdWMp7DHTS5+HMwQGlYo
 uCVKqA1pOf5AjiDJ0qccaumDAwWQNLuvMWz+7Qo75bsqoqg5hYJvl2PZb5aZbV8sZG8Eg
 AUbaRI0Bt6pEVY1fHvThvxNtoGI4qMfJlykxzdHP7GMXyVp2r+yoB6ViYogHn8JAdXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789741943;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=eTg5fiL6HNcWGxa38WQNQTUae8MMTraFfXSVSMU7dqI=;
 b=CSKmBaoJ9ZyRM2S2yBd2swNpdfCRBrqReQKg6AH2aEF/dAVzSFyLxmyiF5SvYd8E2xjh
 D65tkGTYGTi4jZdLjln4yvbH4eZpfe9Gkep0xvhmHLoWmM86zZQFcFz/pGUznhVMxxNQ9
 evaYfUUvcPthMOrusYEeut4OM5AS+q9fAetaG4KkB+GpiPJ5hbuGxbzoXxwUxmUHOmdhc
 kqp+nWJfNbtMXryGLPBXwNLdt7wi5HJxh5EM7EPCSR3XgK4opH3MgWxS2VmcbOpV+q4aI
 JbXeUOkTqdZx/Fym2uzf4jcc/m9LJzBdbL5FIyDtz8VrGBTQ6+g02h2MslHHNY7DL3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=suJir6TZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=suJir6TZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 807FE4080C
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789741937;
 bh=eTg5fiL6HNcWGxa38WQNQTUae8MMTraFfXSVSMU7dqI=;
 h=From:To:Cc:Subject:Date:From;
 b=suJir6TZLKalzj7gjw2/6k86lYxkILkpqKsOMxdQAfCKA6U6JfA3/LLXZb7vI88IT
 Mipzrq1drKIZCko1FzXq3OS0AXgeR1Y/jUTged8Eik0ux4Rscjha+pYFAeQJn619OC
 Ns3HE41Fh0vKuqkbDjn4RY96gKIHLfNMiwlvJ7pfWFj6HqCAQ/yMuxWm5Ma6qSlp4d
 wPJ2HqhbceHQSPmX0Zkqx+WapO1JfTHB1OR5kFBjhIDpXUOuHN/7XRTJnrtXbnoKtH
 iJYvHm3g7o7hxpwrJJqNJEb8CHocItbZrYKj+huq+hqiafDK0KinhTmQqet1c08Szn
 DNaBceKmIIvAQ==
X-KAS-Sym: v3:f51bdf72230551df:eojDTrCoZRtdCyn/gzXRSNQKhpNj8KmKd1dxwTaez6jR8QBE7BThEuqt0tMOAKpW4GgRt1L1QI2mX6ZrE6vfC+KOJVpLyRNQTr1LlfNbOlujXw3pZrfxish9gA5NcaFT7IQbs1BztPl3qyDUuvCqZAWpWQFv4IjfWjLP9WBOscE+LBUmO17LlCQRv1N5D11OfJ8IBMCcz5FRsFIubhT+uWNUWCUFzMllAz28Sm7UWa/70lC3QIdh3/NY0yoAFO0xciw/iUCHdvavcpGlnkdWp9HnXTHOYqnxOqpdzApCOz7EkwG5ItVgrFFauzU5JxGQ/4Me3rujRon0OX5CBePwWA==:mV4pF5200iYmNV2IysJCvFzt3RqW4yTG58nlGSwkqDSG32l1NwKR6QWUYpYPqjDXzPHOVYa6rrnX+SRE50hgPbdvyN8nKBHYXmnwKf8BiwN/E5kImJaJc/NRQfbnHLb3nx2v1X1Di2JfxOoXvGva645jXmVXxZ0b5biFPAXjqc14ZUw3GpxqfcXwxS9vYKzvwszryU5ZUNGZ7gyLK69A8VXsqcfIfR4CwPutaZ0ruWzh1Ee6WICWSJTimbSTcHDEHy2CkkvU6wExfvhTdn8KPtsZW5pPoB30F1naplA98270Niz7vByGn4Xexhex2Cu+0dYjC6J21DQDDABvKkJMHsHPqGl3XuLE8nSfxoWFg1m9Hm9+3mQJA/DSWdLKyf6oLSqHWVMUWxhRQ/DEQkOmTaLhAnmMFHW59iuvfeJvPlfXBt8uyrMG4bN7GnD8p2TkdRcDh4H1B/3bw6t/5EGR2x6qugrYW0aDybsArjRwXh4xGNGpnyurIxv1EeRtZ1kRksFdo1Q2Tv438ZAuXrVDBcnF7VZDjOGDpt8KJvIc6q7SrO41PTgt6rpUNaxGvXlnIDiOpd8bozHBqlrDfnS19iwNNpkWsQ==
Received: from fli4l.lan.fli4l (p5b3a04f1.dip0.t-ipconnect.de [91.58.4.241])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C91F7A4C452E;
 Fri, 18 Sep 2026 16:32:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55922)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x7ZdR-000000006fC-0NRn;
 Fri, 18 Sep 2026 14:32:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 18 Sep 2026 16:32:17 +0200
Message-ID: <20260918143217.2032351-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.1
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

https://lists.exim.org/lurker/message/20260918.121220.0f87338e.en.html

Contains the following security fixes:

* GCVE-25-2026-09-50-1
* GCVE-25-2026-09-51-1
* GCVE-25-2026-09-55-1
* GCVE-25-2026-09-56-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/d768aae73b6ef5604c81d3a0b905e61134f12d2d

 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index c075b2fe96..49036ecb1e 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  5bd0a3e353dbfcd5c8174388b824316a61ee2455d9052ea2f0877dee939d33b3  exim-4.100.tar.xz
+sha256  e9fb41f6724a5b136d64c9d19dbc5f26494af879a3e7e3190f91639eaa79fa0d  exim-4.100.1.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  e7f2cc1ba9af4b1113d9a40b384bf2e5439f539381126018fb9a15d3afaf687fd209d06d1cfa96e61426df0d9f4e7988e49e1192510abc02b2aa19b14b051abc  exim-4.100.tar.xz
+sha512  42b7d59bca187e0e8b3cd85d97ff40fe8de9d807fb12ce38749c30056c92689ce98b09874aec06f1d83fde806fe6193312a98681b56c8baff1acfcf91244bbab  exim-4.100.1.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index a8395a2309..c52428a800 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.100
+EXIM_VERSION = 4.100.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
