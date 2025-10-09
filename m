Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F79CCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C277612CD;
	Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYaB5HDAaqj9; Thu,  9 Oct 2025 14:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9102F612C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9102F612C1;
	Thu,  9 Oct 2025 14:32:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8299E226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 684FD83E85
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRzICND4HoUd for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:32:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00FAC83E8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00FAC83E8E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00FAC83E8E
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.1.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvvJ-1ucm4m052D-00iYYw; Thu, 09
 Oct 2025 16:32:37 +0200
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:32:14 +0200
Message-ID: <20251009143216.2282077-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-1-fiona.klute@gmx.de>
References: <20251009143216.2282077-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nnSjlhsGZoZIoc3A6nDGS7si7PkHYQ8+jv/c1JUCsFlUwayRiek
 +LmFQ8zLd2X6CvjBmbeDlBbzHyEAK6THiwO8hRkXsZElyIZFHWwh6E2x9TAPAcERs4ovSY0
 HvLk4hYteAf2r1MShb7ZpceacW0zen0PG7q/8Jo2S0wjvalOL0CSk49j7LDrkpms4Txr5/U
 +D7wGzE5YBZSho1+QUT7w==
UI-OutboundReport: notjunk:1;M01:P0:cllHtypJMQo=;TeK4aXTpSXn8eQmE9IaLThJWrsN
 IFTt82x4fPkO8mP5R/iE+J7aBkg+c7Pt5CB08JrGZAzw5T2xhIkmqxYMBugh+lT2J0IIJmiaM
 Lxsh5YaZdGgk0luNUAeT7+zPV97lbAWXn8AGCrBOL/eXozvghxv1aKgAfRrciBW9TyP1hTA2K
 rtNP65nJvO5WyrnH+kD0rzxKzoha77z0u+TTvFUQ19shfnqO9uaPzWphby+U9uOeGsDW8B+KP
 tliVQey0w5uqwWCmFV7pn9GGuaY+gqfXQxcBVuJX7bQNFgc21uuCG2vrF68TTnBlfhL1Zv9Za
 wU6V8bFwN40n22MAqLne0V0cHM2Q7s4HM3B7mLljP04PvlhLNKrr1oIFEl08l/Fr6QFIhbd7k
 ywq2JlKHkeS+Xq8m1cb/I69uUvqZZJBcZTmMWTnbS7JXCME42JEnyx8t4vQugARIcvrs5f+Y+
 iZazlEbHALP3dW8YT2zXptEtPRnc42PaDoO0HuND6devpwtxGHDeKX8XE73bEUhK/5uYuWIi0
 Duw/FULLVBUcLzmD8524A8H9pDrkjlL7ucc/9FLlf8oYXyB4kHJP4dQ1I1uOD5AefgxH/F7+h
 kck/LwgvtwnVuwiMiyg9T0LZSjeSdQDwMpr6AZmwt0r+XAxnjs8SyBnilrSjUifOqaBU+yipG
 8up56O69a4+QS57FHdXJxvGOA+ocqCDf+NE4mBeNrrJev1Pw+uALcF2vo5ju7t8eweg0uaNuN
 PZNb1uwW6xfs2lVlOb24GuPV2vV1zLA7SLhkHg8zH9B6YL7UtQXP/DcgS7LRDahsSBTXDvvP1
 EZLQKc7c7VMjQJGeFNcD9xMle2mb2E+j50NshQeKoENcdumJAJdxWr42Ua2hiI4ZCuUpx88KK
 S9Ulu4jFHB9s5f9WXZ7o/k1CERqEuQk62e7IrRAutGW3/sevt6qVt/GEQ04m99Eq5BHLS8g2N
 EUrLOd9B2Fp7CvIdwHP3SfUGqdhZsH0tPZhoR0hc74Bw/uSS3V8M9+up9JBzCrSRB03UvPbLW
 TiXtnt0InLmPldIR3d6mH50lg7KL0OgN0rXKdqZ3Meh63vl0ZcMVHVCuZHs7RQbhC5N62Dns0
 /ayukyQUJUOSME65RrtjzMAsv3+Mg2b2jpjey0+iCqLgsZWKPDr0Krq9o3HCPetQLDq9xA4P9
 bNbwZ5mHpjZEBAAgY6uxTprNJeAvnZantGO3dQbGH4U0vKjqaEbosQdZFjyjwkIJiFVZKBVe7
 N6zUIfLEalkPWGsEC4i/I3TYfYw78uGolDSlwiCZo2Tny3fK1cPWMu9yQLovOYfpnwg7qLrjD
 eQx4XVzUfEx8Srq0Qz/Jda8Vj0IiaWqoIBuN5ReIQUzhIdZJLVzq5LPz39bmH99Li/das5+12
 tyJHndk6AOo3IQ1gQDIwY6gaxsV9YNhwlefd/PiRDnaGRT/t7bPlvmDfys+BIHxJIrHLAnSyW
 /LWexMdAOcUtG8FJRQ1jQseRqSZkaH0r2UV0m8gczDlgtR61sneNaegxeS7mAGxz7X0pEQ4Xe
 ddZvykog04F0cyIxSpjBXIqQYKNdkhws1R2ujlAWBTexDzX10eQW0Jkzz2NPImCYc+PH+gWGR
 PtvnBrno+FPcGHVBAesQ5XLQ/nNdEjpL29rnswNe+sfgzWVk7g/AY+jZrTaEBMOtNylEIA62M
 aX1Fw7TtrYbQ27CgW5HTBv5cR4+Wn2j4pbRBl10GvYWMSKgz+2YTl3zjbas4B03MBn3FS/Imp
 yHVGUg5grc43PXeUugQyWsRrKhkTEV0bN+z2sdUlCE3HceDHCXShqtnSoBbecwsSUmkkhlDB4
 KwyeQWZxYlxFNPXovSnVJ2bAMVCY3kE8yhXMSbERC6wdap0Ith3aJUQzFIgn6haWGRgvDWwgb
 GuK5yz9IBUInVTnHBIOfd61WX1bsnnRumuYKmyD5OzmKzs0AWxna+Zk7rkgeZKTiR19PUZe8+
 zow4QEAXhGqer/LZ3KU67GEik+oIoFYOpJFAhqMV9TayWHGc89GxbYMqqYzbSJF63qGv4W2bn
 WhxVfvqloynZbbpmp8CILev/GDuTTnbL7HVYjxEGgKR1aWQSv5IqiXq70nIqlPvZoRXmW4mTf
 +lCJtTaYJm7bpzUpof8GkhcagIjgfT2xVsDIp4in+nZtvud+WKSFEbn8au6V5/EXiuepwsNd1
 9nMzNSf0UddM89sR2utvO2ckSMPqvCCpmPNwYXw33y2G7M9Zgbjzejl9/Es/nlCcA/KR55/08
 ZfdUBWfvyISOs6i5CGBQ1DnCXJWJ8tOVYS3liJoJ9t5PCrsDMISPaziy4N208sNXVU1Okdxk5
 FD5X8UMyF5+9w5IbF/d9xRv1UCtosCRBQUZVqgwQAKpiOB7AA7Q3sWS/RxuFYEnSxsaRjWEvH
 MztTAUSHuN6tt11Fxpx9ieXi4SsoWuDLn1U2TA95z6ff44RhClrEzvAUexEU2UsTM+Efi0ost
 xCVHz/yr0Hx4E353UlkHgYEh03USl2SyMhb2PdA53SzgJMtKtxhjrFBC32n/cgSxOi52jw/Ru
 TKbbR+oVXiKy8ZT5WImAS3MF+RPI9WaWEO4N8GTvZmuozK7dXdL2wGo9SXlIfJ9ssaKzGZ4am
 1xdtUoF7yqFD19wTpnwVsA6nlLWRc53T50VA843Sq8qn3jOhYPtb0//JRvPCHMLCSeBmCZkC0
 2A4k7FGF87MVUakJAK4qvHkw+GHoVGOQLlF6Eh8B2t0QWvK5Hxg013O6PENOh5mmxDfu5xRnh
 Xj/dJQtJoyBgdZRDyWsp47DBJVI+t/KSxotdqHtAJEQNGtypxUr694g+UfaHeXP66IeVVw3lV
 SlfLV4UcOrTiJynES8YJzxfyW7lVvlRtGa1PMaG+bku7XoBaAeWZQfg5MaMPbP3hv+56gSxoC
 NX6JnhVQFK31mNZoulJ9yEHM1gwKc+d/6DmQICiYUGadit1sKnqt4jd82lNxGyMmnC2fcjFew
 PR8TdqZ82+WFyNvChbmQ9RWuMKCbl9ZU+8RrJtsFe9dRqp+ft6o+Exrtqpuun5Fp2RFJBQKmf
 Dbbyal1gfpuz3ewxFXvvk6FE8X0VaN4983UdjnIUCM/ncf1xUhEu9ih6x0CMWEJLdAIAw9Szu
 fyv/5VYJ9woIesaOAXPNEyGP8OgK/q4DlYkvbZNWmMtbgISh/i5+7KX9RWZHy4MIgLa+mGoyq
 cYOTuluOyb3Oo4xTOgj9WKVplds17nLamTdEy7Y67krFVEdnuSvaP6Xh9tbx+TNMzG8D1N6Y9
 pmjCBg4nheakfWVMCKMWtNyzs+lt33qvMxvtqdWTeXihSckYCGSe5hg6rAXPwdKN6FlSU1TD8
 oZSZEcW9d/7oabNXu1zlDolABQzsSwgd7L6YZpVYbhtl1Cw0ht88I4xjrOgBwsrvAdhuE0l6S
 wO86xF5tZ4GuieSh9ca7eACMaXK9TwLcoCdIA2kj4aLH6uWkPJHsP7z7jzviQNYwf3vlAxTzv
 b/okItK/vdqlBlcTDND1z+42/pia+/e71Qf+wKyZn2v+n355TFVJlHLPhABBz8mA0yi8WT24H
 llJSBKMOkQbLGvLKcIBODdV+j8GPp1y1IVg1PKV+aihodGqoMmsnKwHtWF+MMQIePaaId2XOA
 xWK5bDIIWvwp5oSG1/2sSCCczADHJNL5UPcizfJqVEwbmmGxbxsv9DliOVesbJBDrtSAfTFTX
 dUZHYP/iqgJabyhdkeo2I1KofK5A+5JfVzc6sGo7N78U00zuPhytjH5ad0Vau6241uCGTdO25
 BJWQ4gi0k/Jr8Gepl4FVJb5vEJFA6j2n7V1DAG4nZxmIgMI3qt48tAs8Qpo7jMOxD6Tsy+YYW
 DgPD/0R8HwBmyWhtWa5kBDIG7KtsyArLO/cmuOHyrfckgU+yWIQm5cRw3bCnI9sgoxO1kgWEL
 owneEGtwtLztrhhIbMbxNE1Ki/pAQe7WlijuL1mdbj4iJ/Zj9wr9mbu3kdcoAGhSzO0KOWR04
 DDkJeXV4uzefjyTHTCQhKZPgIiG1EBJ8RVWtOobTrwDL+8A6v0OSKFvWVHiNfF/f5HXrYUrBD
 0DP+I+mG25hpLLBjuRYf1uiFb6MsFISZXuGZQxnJVndNcWwdmTud27+LnRfCroyhd1KXNf54W
 n4w16pRug0nvc3BS5MOsvzvXQglPlmtbBxU8Yr7nU+BiPlMiQketYemEscJyNfUNhfJiOSMR+
 CagKfVDF6nwWTxRg+uEEyZxlyOxemSQL4PoLzIzzI2zYtZKYZBqJsG6cV5w5qLZXLpWMYlZtT
 6STIlptIC5B17dbkAdz5qar+Oi/unOP2V4NM4IiwKawLr9epobnf0+VwhELiGnH4LATgL0av8
 8/eYZqIfJZw4cyEAATamYLZniBxp2JdxobKiRf4hMs9kdi5oQ9ieQSaMPAEOr3N85QZOdbTxd
 nFGeArz2MWVKLZ8L56Us0/6wGtfL7jVNfz020Cd4rDg5vG+LMYhkNEI+t5REjyVTcMvhxiAkP
 mSKBGiW/+Vgcb6a6RQImKhEZ9k3Lrd9ytzPNhdnee8q0zjM1Kb5oe0FT23t6ca9qbtr02yZ8X
 u0tetjzHkGjDGMbgMj+8CukoVLZI70wgdpt+fWXBAcrKkDdelPfz6bBJDllWs5muBo6rT/R2C
 VENZL1VblGCYMLmcbX6LWlsd955wYkpfwprrY2f+D8YiQOD9HDVA2Rus8k3hw4kJG7ar/OqzI
 Wt5+HogjbCAwHSuroarQYOEq57xiA2eIeEQix29TurwNBATftH9tTDbZGMEmITF1yJQD9kx2a
 4PI09gTODWMbYp6WSAjpHH4sWRrVJ4BLeDQp6R5isvuHHt0IsHfnwAKkLwx5Ci3F6FXFiznXH
 6OLRAmAGRyvtUZ1UeBkesYgclsU3MKKNok7c319yuHpwGPVCdQ+CbafV+rJC6PROI4/ckBNKv
 125mweEV8wuupsE6BKl4glVSAzeFBhcPWO3VpeCslo7G0T7nyjgVeY0mMc5NlkpHhYnJ9MJvb
 5dLF8e532D7h87cEQ4SVtKImzR6/1/DVn0JaG2t04up8RPsYdF2slG7fqPwc8fL5Brrhwj5iF
 XoYy5idQjKWON62ye5E8V5yR4X39xT8QpkE7FGe62g00FASus+XVDaAz14V7+U0i6UThQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760020357; x=1760625157; i=fiona.klute@gmx.de;
 bh=y8AYUh+eROeNAyC7rCMGWGcksBQJ0oZy/iWI/NvE5TA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iWik8sdTv3K2NNzNnw8oYxHYi7QvAsuYvl77C4ZHxko2yU9DppYMCdCvcce3fDgB
 bnq3rGmZ5eCEvFHU73HbS6l6RyzDkYlo6D71vxnnXdoKFMDSg3oMKXCZIOoRlzRhz
 xNY35qas5txq+B6UOO+/ys+N+mUkU5PeFKpL7gKaLlGR19ggED1y5yZ0MIKyDbJPg
 KqbKeCOdyDNRQXlNNtGUSzh5hg+yalFq/GwC8QLGqubWU6kq0dwkJqMejwUKGMhBL
 eP9pkEpLpLXvPbTP22AZES6pXiz9qnpgPAHQI/L3mr30GVgcNqIhfxJcpnFlAqUC6
 40Uzu5QjFetH5X6c4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=iWik8sdT
Subject: [Buildroot] [PATCH 2/4] package/libsemanage: install modules to
 site-packages dir
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

$(PREFIX)/lib/python$(PYTHON3_VERSION_MAJOR) is for the standard
library, additional modules like this should go to site-packages.
This patch changes only the host package because Python bindings are
disabled for the target package.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libsemanage/libsemanage.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 289954f700..12e378f045 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -41,7 +41,7 @@ HOST_LIBSEMANAGE_MAKE_OPTS += \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
 	DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf \
 	PYINC="-I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)/" \
-	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/" \
+	PYTHONLIBDIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages" \
 	PYLIBVER="python$(PYTHON3_VERSION_MAJOR)"
 
 define HOST_LIBSEMANAGE_BUILD_CMDS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
