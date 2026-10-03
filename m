Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F918CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0663460E83;
	Sat,  3 Oct 2026 16:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ha8qbqk05w11; Sat,  3 Oct 2026 16:07:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97B7760E1C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791043642;
	b=lZlss/nK0lm5BcN0A9/lsWweHEDK/WO2OGmtH3tbcEHYgTz4EmjR379ZpLzUTPPVZyKP
	 9o+HDacQRBcbleCukKo1koCOAr5lJTTP8aEXHMw/FLPKako9KN++rGns4A3LEBgsjg6GM
	 vTHO+G/G6no8KliQ5C+yR3Ln3jQMCxiIGZ86pg7evAYWIm3agwZAVAs/2NfueeUebGlMe
	 hv4vHG8M/cioqsRqCs7lIww89qnhzWDRCYLNznkpcpX9y4anBAoEFbcahlts/iU5hkQGF
	 NI2n4T1xHe6O4oIcY6MEclMX7NUQOKus4H9kPVCaDXJUYVQEyKLZ83EkkXStOJSvPqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791043642;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2sL/aYoQaSONu2ALGpgejZGyfoGZ9yH4UCZq3YPmVgs=;
	b=pevmubMDriGHiOhLfwckMVkI3bPEPLl1NzwhWWlh4+NZKK925DCkXrM64oEEG4QSZJkK
	 c72A5RbuTiAvKbAUh17E9uFZA9EHN0K1nYYtsF0rwJ3awYteDVCRRN7fQMQfRmQq8bvE/
	 tEXXp/tkMNIZ9xSY1ww5smGpkkE/1tpxQJik2cg5WJtZvoMdLR3KrVqKbywc6Ge9wY2TA
	 Vcp7Pl8Ume4GDIuFAQTpMK7GeHenHE2DdW1KKLEwcLRAH1sJyjQM8xwPAU9h9zd+mROpj
	 Dll4ySKnvkBGptJWziCRwEFzdNGVGZtTQJ324uZp+E7qTItQl2ATIeCIqLgNrIoEdJg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791043642;
	bh=2sL/aYoQaSONu2ALGpgejZGyfoGZ9yH4UCZq3YPmVgs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IcPOGnBfJ3LrlA3Cg6J8uKIEdrkD2ec7ZsDtbfi+wd5aHKtAo5F8RUwW/Q/jmEbM6
	 CxjOQ9Njt+U/w9ntKRYusyyk5fX26Yda0Bh/NVO5qo8T0UFE25/PXFGr6KGtmiPdUg
	 u68BaqWR90zPzFrP+IQ3RJSkSsDjmmzaAq5kFDGuUqLKLuCjHU0nGtYuN9vH6iLOsj
	 mvd7QiiPInqdYWP2Zhn4xJYrmwo89du394aVd6N5USy3O5jUAl/9tCDuFq34LD77t6
	 4RG2Tyu0KlS448Xp8HlloDkfsE2EVwg52e/foo7K8uivsAp83jRi1hB5Ob9oohTdIh
	 VkCv3NLJlyrUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B7760E1C;
	Sat,  3 Oct 2026 16:07:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD7D2335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9301380EBA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLv127CY46dB for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 08C8C80FA8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791043639;
 b=KLsoKcNQ7BFjiQcW1Qf717g/4CY6Oa++DEDt/7Ul5e3U0wbPqcttqcKj4KWVVCzFD/oe
 5S7l/4JbPbcIpowVkhWOTIe8tTPjJ5azuV55EWlFwv7dvenWyUD49Pp4RuTwVyMBF/qUl
 02OXmf7gNuXUR/17cbsS9ppA3WJFbjxwrQgUjxplcQEx+iqL7fKeDWPAUoDruo8ALt8XQ
 Lh895fc/7HEj/t0uxX8yeIsmR0YkjiwFok7q3NrxUFBMHR4pfB1jqNc3vz/UNCTv0cw0+
 EVZBNqrRN4c4Wa27e0wdiKKVX/i2rZvh9IaTAc2xuTjNt0PUzTqhwTSZdMsDd2FPG1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791043639;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lUE91Gs8D2RayuAVaQI7p0ferMRJ/xGVQSU7BdGxLBA=;
 b=iArZ5oJljm2pC8HYj9DOG6DCqdYW2WT3Dos3BCVwDNRs5a+gAXRXOXnxu4reCF5d2p7S
 cx5jW/emBMSIC+U6rHQ+76ReuyMypc0Q8Po3XEvmEOL7zAbBcja2L0LOy8SlL+c/shFd5
 l/5VAwr1qOF9IEr8IYj6BibgzfCJBiwv4Outdnnh2TCXyWS6GLpTvI0NQZ+h7/WyXfXc0
 3H97X5PjtrEAttUD0/rrIbz9Jm9wfOEk1fG5FIK70szKo61nKQnLidbXRxP7rhGHimO7F
 GkH7g3qo51+YbNaL29nErHKthJGkatOVFKEJb0TzAJ+CWF6jnRLXqr3ZG+D3DeQ/K6w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bvpLieiY; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bvpLieiY
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08C8C80FA8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791043634;
 bh=lUE91Gs8D2RayuAVaQI7p0ferMRJ/xGVQSU7BdGxLBA=;
 h=From:To:Cc:Subject:Date:From;
 b=bvpLieiYWeRR88prO9SzfZLzvCA7jYge3YMwN5Ng+FJ+v6hhASUNDuRTSTzDpKmVm
 R4K4ZMJnc4qeIpvObcdozq3jQok3na6Flhbg+mpTbyAplYAjOZZ1D79R5cbF7XgBza
 QexuY7mNzNhIO4lslkRYJdNeS8MUmSTUHh6oeXk8zYR+i8OEEWHYiKB9lS4TLsSEkR
 PEI7Gf6NHz2YFkX5LkX1e6smSA4c98TSCo2zFTXour9ILQSojVu10hs0ZVKbNfkmvr
 1Gm9InbeuJKVzDwSvqgeerikwNnu93WAc/M5sHTSq6IN2+FiyHG0fKaXi7HXexCbDp
 pmn5o1IybhKyA==
X-KAS-Sym: v3:f51bdf72230551df:cUsXPMx0H4sbL4WVoT/dv3zTsJF5iWO5bRGmWD1z2zkLt
 N0F3586AIOmGYj3D/aaEG6PBl8SLV7kvbE1zB4pBdfmau6j0sIqP0MrMNRUxFWcPTjjZubJooUB
 6ExcADap8mttgELI8REL3WLBt4QqnEnWlHkoBQM7/THI+xNANvX137HB8bLQgq5fOBL0q5KZ4vB
 qg4QgG62l9r1bv+dYeMwDPIv5YspQXAAGuLY51eY7k2IiZqwxBkBzcT32Qp0HHMNs7usz8hyJhn
 U4hETGHDUFfA/vBTXI3FjMN9u0TCYBvlCSpvOTlOSx2G4AGhLshgEc5GGyGsyRN8oSUPSrzw==:
 b6bHkcbJz9VzCq9RgHXUlcRcPpRunV+WVPIiAYuNdl1XHJ9hYToM25rXb4kwKZk304dFqiN5Yfe
 TuH2D+1+gtbKmKX5e3+mqCovRVWvc16LucqLkQvuXqCzFRtC5T7fLRYkesxwGgw0iFq9dpUIPQP
 NFGWAs8UCyaMWkFS4zcghHDG8dO/zqbCUEOMhdrCkbGGtUGXwHt6Epe4D9rqHvHo+au9AZOpwN3
 fQK2HpCRAsuphyZIiPPuivPoPBxHU3hqN1MzPiuLBs4zQ87/hTg1Xi5eJB2R19GGXNseN2OfVp9
 lP0PkTccDHZbtEdB5e3xPKmIcDqtSMYmL9TAzqD7NITTkT4EuLv44+9o+Tj5QSToTZcJSyuW9jm
 ys0y3wfyK9wvKwTYlF6T4qz4aWPePLECdgDyPUi0EfaRGq3kY51Jy+nCKs1WeO3oZRCZYNYEfpH
 t6U6uILrHMZIziSd0I4PJpcLyfy4DBVzhYrU9eLBtjXUUEPK9qANGWAG2anEtuLcZqPgQaZUOhX
 TdrzkN8jcemgF192YbOXdIT/14H0zW0RNLWV0bSF8h2bisVL3HiakErL4QkUk3V5JmToTe79QQi
 PGgz48Gy5VDTWaglJZEXCwCvDfPWkwd4zG+K62rzIRLwJwKvfNFcTRQC1bRRRgnZQPoKGBufGnZ
 +iOyfp81E40xylJUk56JgcSJ7f4zGJG80Y+etD2cPckklGLH4JKzUVPMqJw==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D99DCA4C53CC;
 Sat,  3 Oct 2026 18:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40626)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xD2GX-000000002cA-34Ei;
 Sat, 03 Oct 2026 16:07:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 18:07:12 +0200
Message-ID: <20261003160713.1350799-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/2] package/python-scipy: remove license file
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
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 5d695881f8dc68ff1efe2cce75dda462c5990e3c bumped the
package from 1.16.3 to 1.17.1. In Version 1.17.0 upstream removed the
license file scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING:
https://github.com/scipy/scipy/commit/14dffda0b83c46728a7c88998804a4663bb735b3

causing an error with make target python-scipy-legal-info:

ERROR: while checking hashes from package/python-scipy/python-scipy.hash
ERROR: scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING has wrong sha256 hash:
ERROR: expected: 0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe
ERROR: got     :
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-scipy/python-scipy.hash | 1 -
 package/python-scipy/python-scipy.mk   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 27a72904d2..5be848c8ad 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -6,5 +6,4 @@ sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENS
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
-sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING
 sha256  106d55c931fd6a84822e5345d900273d059f1c27310d02567ccb313c5d18c55d  scipy/spatial/COPYING_QHULL.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 8c536df130..e6e87d0cb8 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -19,7 +19,6 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/ndimage/LICENSE.txt \
 	scipy/optimize/tnc/LICENSE \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
-	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/COPYING_QHULL.txt
 PYTHON_SCIPY_CPE_ID_VENDOR = scipy
 PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
