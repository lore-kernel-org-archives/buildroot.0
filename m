Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0993CCA0FFD
	for <buildroot@archiver.kernel.org>; Sat, 30 Aug 2025 13:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A6FC6076B;
	Sat, 30 Aug 2025 13:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2YsJN4Qkm1z; Sat, 30 Aug 2025 13:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 925C260760
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 925C260760;
	Sat, 30 Aug 2025 13:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B94FFA
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41F324019A
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zf5CMWDa7v77 for <buildroot@buildroot.org>;
 Sat, 30 Aug 2025 13:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D770E40198
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D770E40198
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D770E40198
 for <buildroot@buildroot.org>; Sat, 30 Aug 2025 13:10:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.106.177]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1u8mX42e91-00bohl; Sat, 30
 Aug 2025 15:10:53 +0200
To: buildroot@buildroot.org
Date: Sat, 30 Aug 2025 15:10:34 +0200
Message-ID: <20250830131036.1295970-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:VZt444fDhPy1CcHldnVT1R86cHiIKYrw9Ktr1uaSpLHRgGNJqsO
 0Vfg35MmYKBs1tWqhDFQYsvi3Y/umyR0QvGz+vWEKOqqs89nQTq0w/hQbQwr/kkffKweCk9
 PTuLc0CW4C58+NzJjH4INUHGo3u84r9zlC+ZxLQcJiS1YMmdAPUK7p8h3UjSlaQcm60CtOA
 LlKOTl37qdf1xPHnJemFA==
UI-OutboundReport: notjunk:1;M01:P0:o/gsvevowz0=;JJo0G6uslD3jzfH7PDcUAAf8nTw
 Jsx7hoGT0U/kI2KiyDRecTJCwheekJOO9c/1/Ix8l8jQp8DHi6QYxJ+HtUJA3jHK4fNO3J+Zn
 AkfoVZ4usbjk7wCeBOHnU2oCMWuO99G5pBJNdNAU0B369dBPqriptnAzqxYriMSe/B8I1QGyX
 rMZyzpYTgVpYwMXpXG+1NKCBxMo4ZiAaDg5H2/A6PGcsGNhaVtdxzFWYyymkGq465LtHfsjuo
 npM6SuB+XoJBjZLNzhuT34eRi8kQbGWL54dUVwfJA0AKvjJcrKQLfgavcilMKjDvwXKwQpFQQ
 a4Lia0+r3/F2JYNfZ6lJ0tdooI/PRnLv96DVZANkn6cLaQ+V64AWcBS9q99bh1f9SlkvQ9A4w
 5yTbBdpYGSx6cd7z1ZnRGf4Nb63cLuWc+aJb/gNC6PhE1GDAlT+lVVZlm4XZb30EYPoynn05f
 5r5jVAUDw6PiHpmfgyoQd0dxvX8iSqsRueMdLteYv7KYouLJX9VhKb6BXrXNe5msjEGcK/Vre
 pKs35mXMX+36O0Kr6cL2KQrTNUp6041Kg7dwHRg+W02TuJ4xkmElOcE5+jQuobtzdd5dAOfQI
 A60ZTLgdFB0ZjxhVP6xW/n7409SZ+3dWwK1PwxcQOKHu8awoqXJpRgFOnyOdZi7MvNS9bALz1
 oICzku81utYYAPnDGPrTGhuS1IoPTotSqi9liRvIjkvGlwoIFi5C2S9Vl5EauSGqBbLqc+uy+
 lpzpPcMTo1DZTI4us7uR2LZicxnOi+ULWM/8M67gkdYTcWh3qqe4qS4Qi8FpYzNAtdIZ+JFbv
 /h4n27bwRHD+oPIIK/licItj/NIeNvKu5yyuijeFLSR5cfAIqK4EK11N72Y1YSejENK4R30jA
 noZJDKdrmWmvR6oa/gwyeCRxYP9canr1rbODw233WsSYblNJ7EPlrwTS/iU70P96vD8y5wppn
 RrVUvRllvHyViuboAIxjbdJYyNua3ENs0EK9iqNB00K7aGW6UQjNl7CTqU/MJygMqQN73YyUR
 ZvXfJ6EVHmbVFhF0XheB897BcxQ1XsMCCSPKguIw/E7GlR9P+AMcrEJxlgvwNR9/NXr9asUyY
 P0tqdhXOlmJGbFKST4NXbJHKJfnl2lp6Xmj7zMFw7WJ5Ah4nTrXebLNEHBT7oA9jgwG6REg0H
 U3JStQLObo5aUhs7yy9+HHDmZjqa2/OAlA3hTvz/XvLNlczD4zMWTHb+/pYchWXlsWKBJ+mRp
 SqOGa48wu3c39b0oPY7jbIB9QstFIKlPmtUUnx6AVGCa1BgPSm/XDQFDA/XFdk2Lp/gBPXjP5
 +0scC0jrmMovH0TndNIGTKfOEUOiWjeVbI3/c2jYS9mJoB+Bqk6Cu4FGR4MAngZu6KxUbaiZB
 v7xVvvtTNbdU4702s9HyU/RCnhLGi4DByFt+Wj6mHXdGPjqXjMfWgYaHTaITyFxrOjOiPahmX
 HWWzG2oHu5QjQDLLsOq6+FGslq9DrYwNT7SHKwTAcpH7I8rxnL57ErygA2mjyge6eFkOtLGA6
 +cA38jW1T1r7dlSQn8pPI6RMbiz6wOEnhewoDGtIJczRwEiUfC0Nr9MGv2UpJa675mYcIP27k
 /ixFTOtP2CW0/2kst+SofgTGCf/LYB7TvrKq0fco8LdGxZ2ULoD4LVckSW9uTLKRe6dlTbbSr
 DKJx+ocmFJHtjmZSFRlUvFtXhG2hikUyFwwl8FEKO0nmfrAIy+bYPyqROcOFWlxRs47XayzdR
 FA5F6X3P1JPKlOaumYjz7dHvNMVwYy26MUs0zmav3vWlpopD1H7PaaB63PsCKS0kYJcv+rx/k
 2nb7zFDvpM5EpMEYBD83y0Ft7fxISiVrG9yeCAMVgsD6T6aG++44dM6wFS5Ex0xJkMnsUppD9
 8Xny+fd7DCMzVRoHglv+ClKwqnHQBMOvu++VUl2pyyyT/SAneaCObHbcUDs/Hvi4PWI1caukW
 AmAdrlTVIlo324fDJlosr0pFMQgQg5D6kUIFyA4awTuJgsKtnTGbxrxQU/hLwIMFeHteOldvn
 6vhfTi88vAjUcJFwA0jJmzDmMw+JwjWj7ydqL072xiy7AUBN+zCt1zZhzNYuHo2YeXwBx21YN
 O3yCnwvRlj00u9VSrPhxiGDjp4QPytN+ew62hR5HZDxxY0H9eBCLsxkuBQ0+Irx5G1kZxwbQU
 Cb2eP1mKRVCKoMi4qk2BaSEEWp2AZFxPWNYbJiJpxA3CvO4cjQ18krAeMA83TBcmVClCaRbEb
 Zuzm8NFljn75m5VjDIwjHOtLOimIDx9fhyuO2mnypC4P0l2BZiPgnZ6mDSL5KpCGJ/sSGweuA
 ZXGg6xyQETAzobmDjaOaYElFCTuAAqzTUzMvdqS9WQnK+mEhtxS4gyDUfmIhy/S7bfBXYQLtG
 U9F/dV1S5tzDhC/1eAGA3GKU+vr/subOInKkXBWZldQt1rij4ar4CzVobBHweqQrAJyLZA1a8
 b+fGtoM9lYkmNPtVPlNM8QK1QOq1ESmIxQluY7JxSBtk6ukh6JYIGdsNE+85q3ZMRzkykA1tw
 0JcVNpD+U6V9nMGUGeBFqocoet8XVXFWvsH+/Mf9vyyMcZ/D3x8ZLngGbeb1fDPB9TFSNjuzo
 SVmkYWLqpl13XF7BQwhbpFY/F0Xo2PNJ9Krmg2+UHZzXBUuOM6AnnSbpNFnPotyTpSDKHIqP8
 WEvxdYvPW4LH5JLirYAi7NaI0S+80SjNHbglJPkI0U09ahPciEmDDm8Egb1OXC1el35nR190W
 Quj2WOvGLMtltJN2Bh4ua/VSLrmxlmXsflSELJdY48ndcFcg9y1BJDca93kFUZk4OzgAN0t9P
 dqzz4388h7mTnHNJ5xMJb0voHynP5RcViLxKdcDHAKOYLChHGyFLf6VfzIKMY9PQL6qFFr6JQ
 USN+7LIoHOZHb27e5duTtN75QQuKDgaYLlcjdkAnGgHQX8SfyaVjfqf9Dr3r7YgNbnHxwCace
 OBqYSwt9VL6y/M1yFf+DFhCYXehMCp/XwVYatBBvrAu0zlXcofwNLCS5XAf0XjV3fWZc9i60q
 5FZB0lzgzDemAQU29T/1VFzgUI+EB2jgcunGS+OmJHBeu3qStl/wmrQqc+gboucEfpMp4sjgR
 /cy0FyNvPa9L61CaoF51vGBAEnZ5vg5EqKFUrVQea45RFj9gAS2O/OSZQUPrbAP/0IobDXRAe
 Yjzo96AmJkoJ+gIMJHHUO0rHzUl47811ZeofVjBA8P8p3EkSJAZJ6TCUc3xvsFzCXQ3EdFBgU
 KIFE2L+W2QpyHmGb3dj36IfwCAYxN28S/Gr4HlU4FnSUClvYXGuEV5Da55oTHOQ2+KfBd02f4
 bmfFmioIIeGNiw2Rtj9aUNrqY8kl+WOyRRmRzjC4PUuvQhsVCooAUKsao7lhvSypw46M6DHs/
 udO9r3P+D75yAEEhWhuhTXgMtIC3x7jN7Sp8s+qdHYGV/nx0AjSv80kkmtXc5/NrDh/EoiB9w
 iwLMKaR0HhZRxyLJIakT8y6jrXLbUzbatvfyf/wFMMmb1h4iB3GhUtTPrNc74HidymQ/Eop+h
 4RqNW+OeVgrdrTRK+ffO3QL8LJIJ9QEqbrQzS4vpwyJ02fvlRXQqBUWZVys02yMvi9iYCo6M5
 qa6yhdUyhkv3P4uu6RlWBi6D1v43j/Kaj2C/GeGiq42fppwyDH5hqL4OPxLLBgW4ymuMo4d1d
 w+wSYbz2yuRG1qmRkeElsHRMrK5U4DWTwwFqDSaYv1eyI3MqbaBndwjyK6LlwaBM29fUKF5hu
 3F+Xc69Wl5ppB4S14pvI1PN2R5gkEtDwHw0PKUNWqvtv8dzPWtrLn6W5hQ+HCaaDpEd8r0WW6
 cUk6YiF/4tXOkx0Mb/KaQ2HMpPhisN5djSYVKMXPOIHflJyHCbLMdear7MykM+VcUMrmcsjrQ
 aKgf9QfvIDtdmte2+j7VTUMJi9HaBmkn/dthAfmjntfHZ/OC17h6HxSkP7vr5J8WRiHOavqO3
 xspODCpB1ZRYgifabRCjNRrBe1mBREmo4Q2bjS57WOR/EH+TxrATokaaoJypar3DngEF//eUd
 6wV5UGbBuj5nDFnWG2loDwKG9B7hg/rSd1NowLD2Xn1Iydur+SdHZ1NXg3rMsRGwRaoeEmqMO
 7ab4VQzdRdQhe5fTVJtya4pa5jyUPCyYh7M/pogPj688p8Eyf057ypfNxnxBWGpQTVyb622Cv
 G6ZZpjeniZ9cYVyLzu5pKFuuQSs80zBSqPGv96XnH15p9JHGQntYzn3RWizmp6PwQkKHJ/2SU
 E1mdOV0IthN4y5Np8+jBD89kLQa0q1YDbYdPtri5JSeiAV5FwJcl+2LrcXntsnrq02AARN4kY
 SsnOkCbnedg95YyOi0ZEpIhT299SH3ebppMR5wqB0SYylSt/Uy7w9K0LdcIfVhKPk92gmLXBm
 5ObD66jmQna7NOrf6ITS3acIQ7C7irXKTzfKS/nuISW3nlmgzQgiEREaabkuZLrj53yhVWoJ6
 2liCf5zsLhO7ikEpIBBMgm9tKhDBXtnHhG0HYwCoBtG1vlhT5YR7qmyhIVS6RmHVA+zSwe/qS
 3Jm89z6tTv6kb9diK1rRAhBFmAFj47tMSB5athi54NR/ZoaSJUzzvdO4otQYZy1nmF2InaRC+
 2JOfAKaL4StNSVKd6ESgp0AjXsYamoSgA3i/FAYFTCUGAFdkUpLSvyZE7A7o1cDPQYBMHs2vR
 kvCbdVS6Lbpe4if1emzvCfdo7X7NUBgD2Kf/8YmhtzCWbtjg8NMgv+adkKLDYxOZ1lZ01CrBB
 FU+Db23XncvJL6VvDbt2gMlLc7zzvAxjRKsH2O9P8yJ0g0WCwd1rl2+aqY2jCw62TddnUhAO6
 EgOSLgktxDzbH3q11mhVEuX0d3IDd9mAObHPIrUaon9arLtkprMYQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1756559453; x=1757164253; i=fiona.klute@gmx.de;
 bh=4NE4DY87KupK2twegfbOYYLoVdAXeaZH7mXY0Z4kTNQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OnMcCEXFKrjas31MJ7DuXUhkcjzUy/cHs9QxjOe8l07BmEZmd05oJWIM6GVku7HW
 3/CV7GjaG86ZDGPkXVkS9I8nWBqDGx3qF8Gx+x/PqsiSCh/fPFE/gR6/gBMr4q6rc
 mV4yFYPTIW++F3RjAA8Iqqa7Yy9BlqxF+aA0qB1RrSU8Y92F+xr7UCTjqe0OfUG4N
 AhcgkcH/XxhEn5kANbXjgwhv5na3wrHqXFPmqydUJaLg7pPGiEvMem/Z4M2sbgFqm
 Up/L3anMOM/TAgkVSbT8FrBMmU6Tar0rr/XJmVXf+nl417b1Mut3wn8NvpaaDkTQp
 oDqhVwIMt0LD1t0Weg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=OnMcCEXF
Subject: [Buildroot] [PATCH v4 0/2] Add external tree information to
 CycloneDX SBOM
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
Cc: Titouan Christophe <titouan.christophe@mind.be>,
 Thomas Perale <thomas.perale@mind.be>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Hi everyone,

this series adds information about external trees that were used in
the build to utils/generate-cyclonedx output. I think having this
information is important to accurately interpret SBOM data: External
trees may add or modify packages, and in that case the Buildroot
version alone will not be enough to precisely identify the packaging
that was used. To be able to identify which packages come from
external trees, it also adds a new package_dir field to per-package
data in make show-info output, which will be an absolute path for
packages from external trees.

One open question regarding CycloneDX properties: I've added a
BR_EXTERNAL_TREE property to packages from external trees with the
bom-ref of the external tree, following the pattern of the existing
BR_TYPE. However, the CycloneDX specification recommends (but does not
require) registering properties with the CycloneDX property taxonomy
(see https://github.com/CycloneDX/cyclonedx-property-taxonomy). Is
that something we should do for Buildroot?

It would mean registering a "buildroot" namespace for CycloneDX and
maintaining documentation on supported properties within that
namespace. As far as I can see, adding a section to the manual or an
independent file to the repository should work. I'd be happy to add a
document specifying the current properties (modified for the
namespace), but I can't speak for the Buildroot project in registering
a namespace, so I'd want maintainer agreement before working on
that. Either way it doesn't need to hold up merging, we could always
add the namespace later.

Best regards,
Fiona


Changes v3 -> v4:
* Former patch 2 has been merged (commit
  b10f50399afcdc1cfaed06387b3f51d2dfa27ad0).
* Add an "external" mapping with external tree name and version to
  show-info output for packages from external trees (new patch 1).
* Use that "external" mapping and "package_dir" to derive external
  tree information. This removes the need for a separate input file
  with external tree info (patch 2, replacing former patches 1 and 3).
* @Titouan Christophe: I've dropped your Tested-By due to the major
  changes, of course you're welcome to re-test. :-)

Changes v2 -> v3 (in patch 1):
* Fix merge conflict after reordering of metadata structure in commits
  6098cc45d64e9e7928f888b7cdf79533813d19c4 and
  9cbbc477626c433fe78614de9474f8446b7e2389

Changes v1 -> v2 (all in patch 1):
* drop unnecessary default=None for "--external-trees" option
* fix help string for "--external-trees" option ("%" needs to be "%%"
  so it's not treated as a formatting specifier)

Fiona Klute (WIWA) (2):
  package/pkg-utils.mk: include external tree info in show-info output
  utils/generate-cyclonedx: include external tree information

 package/pkg-utils.mk     | 12 ++++++
 utils/generate-cyclonedx | 90 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
