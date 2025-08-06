Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1465BC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 16:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC82441305;
	Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZefy9btDM5s; Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FD941012
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18FD941012;
	Wed,  6 Aug 2025 16:16:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E40431
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4515261461
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSNrXn_6MkV3 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 16:16:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4847B613DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4847B613DF
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4847B613DF
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 16:16:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.163.130]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1v511q0dms-00R6X5; Wed, 06
 Aug 2025 18:16:12 +0200
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Titouan Christophe <titouan.christophe@mind.be>,
 "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Wed,  6 Aug 2025 18:15:54 +0200
Message-ID: <20250806161555.3805467-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806161555.3805467-1-fiona.klute@gmx.de>
References: <20250806161555.3805467-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fDzyRhCUCFOLABmftgh7zUmNi4lS0puyX8RZkbYDorTdbvr9App
 DXtOjCpSRUI04DsFdSIroHJlC0WrxEuajVNwQa2imSlT84YkEPKnP83j4LDn+OaPi2WjF2u
 Fj6xw09WvwiSBUa/3pLBFGpFDRX89GZQ/Spq/3opVcAFuZucATFdeSox2I9iXlBKqfaJPxO
 GlZw0UkaklmeHrkz/2m9w==
UI-OutboundReport: notjunk:1;M01:P0:CdCod5xlJUk=;pIBdJrrnjHAHn6PGJzijvo26rxZ
 UJ758x67MpjzRd5KJujH8kRBKH1CWli93maGq+ZTYrx7SW/FUFsbP95HQTrv0zxacDAWgwJJF
 MeaYjGQrTy7+mxqtEzt/sDiNZYc1rTRPO/rS41c480JMps09K28ISc15hcM09oEHalTda2M2Q
 lSs5AvYN8GG8VXWGx3QYRGTUV6p0GtB/w0T8RxZju926sOqhR3fCoQXig4LTiY6Q/IwbTytFJ
 m+GwcVizfjerG87KZZCdrzYzQS+0Ku5Zt5cWbRW0wH9HM/x8CEKev6vxDzCiNVd5t2etGkTWa
 kPIw9kFYtNVUQC7A7GLQhQUJYPQSIiDJqm04TRUoPxePQFHavB3+z7D2JNXClLA5ixQ3p4hl6
 iq9jMyfBxjD0mzeL7zdpopc1TplJvaT7DLpeDxRNqsVWU8iMF1CWnGPx3n7T1VSuMsMZFwt//
 ajXpTqK0lxmnGj2k1q29vi3tCNUP4m/P2CqtfNjdSwPJURPlZazW8PCWhT9HGge8Jm1ecM4Xt
 zpaP2EA+KU77/wabc7xN3FegVnOwFj5VVZDnKPvuQCocSBn7q2DBm6HrHTmpDaHoSwmZwHtPC
 lFBwbtbHz2IOwh0Q66up2df7l2+ATmAgoYn0z+DjYm2dGz/eS5L7v33zjoHfxExrNLdjWGdjh
 NRv8nDGmNSHWi6zQDK5LwD37yecRdYUCqLuZMMfWjTC5IOeq9QSKwGi1CdnnKbcj8WkffnW7t
 t77IyqLLI/rhyPj/IPZ0LOGBl/uOi9XesQLJUY2S1HS3iv69Enx3x7wMRwM8tYE5Al+bOEHZ8
 aGTJuOFQ3aAKktaQ9SQLU+GW5FOArwHiT/Soe31UYTgep51TbeCUWG3VKkgdLjHwq56AqJzkh
 Z+sEiq9b7QF/y3p+x1f+pDAy/VCF9FkSgG6GM0dtK2Z8EZyO4L+5QjW2Pr9pZMDDFvU5oJFol
 +QUeHUdufEv4HUuOeRCU6wbocmGsjQwLx3yUEf0RgwjMiCTTV7wiq8NrKn9pIuV6pLwbPvIeD
 G+4zw7NrxT1DptcmslhnxGLNfUsVE32tYBoVf3TGGxvk7oqQ+bXd0qlWB3VLFY6uhVczd+oNl
 pu+VhHk254uXUFeVaiuqP63Yh+KuStWZJN2faMN94PydBtsEKh82DtdAnZqqQN8ld7uQ5cc0p
 1RTLKpxRIRFEzQ6bRGgIENYvLCDFrZ989JKXIcvu3DJusf6pExaRlHqRw14fOoPlp62JW8GuF
 j9DQlWYfI5cksdalSy3L7/d8B3tW0NOQ2sDN76x/grFy8c0wX3O7S72XzMWbgHdt+N0Kvun8G
 1jk58xAIAm2vsFIv+geKy9Bju5TaR96MzTPt4obZxI62rl5A1rX4hPmbL+QxUixxkM5jTh5Wa
 NyI6HtsPTT9HlRN4CohrYEJOLYv9HMatAg1or2qFX+RZM67wuEkKfksm2yqvnLAtHisVIiXPM
 dw0oMJV+gFcA0/ji0Zs3hGQI6ibTj2LuLz7wZiBJgbyiF1own4H3aPfzwB8xirCRoW2U1EC6P
 eNMUvuJy74ND8YaiiY0l/kLEwn6Lm1TxGBEQ/5J7MvreCMWAE4mXCJvTvZ6y9NtQcY9jZpsoY
 S9z/eNonObHsv1+dJ6S+FzgMc65EOnT9elnM9T/95ct8sqogzGEuBoKSl37Ocly17JUYaHO64
 szuy/MjzGGn7GKFMjbjbPZ8ZuCLR4DYeuchZtzDJ2pVWVLjgrcxJiPYtobeTSEY+jsV7bXcGK
 DJV9sPgiQXzMzSViOMHKL16qlXZxubijAlDqaycljZsjllBehuLiPmi5JqAHSXsaPn1eE9uaM
 rgW+XH1jFVGygFwa5BY9grEnHL2r7W5WvSca1Ah7NqYK3sl0WeOawR7rslMKVtHLn2RvHR/IL
 NAwJAf90oL6ViRSbMu6A49Ru0MMfrYd0LMtDuWIQGeAPPt5F618LJOd9vAwFmbYnKUB9MeAH3
 8VbYuzfSgtACh4QNC/CLLOTgEQ3ryS5iXFBw3iLm/tjakH6szyHGhHgFPValz1zYtdj7d/RuE
 mLT4tWDxdUa1MlzEa9EfY567I/MPYyP1tR6GIumerRG9v9pfKghuXbxe+PcgOzjhhNkFdi99N
 o2sxKF/8+p3/7z07Yq8rYYBEpOoXk/SqDwOsSA8T1oeKyv8eQ4u95lcI0fBfp0XLYVT3L3++S
 QtZjAmqiAsskfVouX1UF4esO36hZcZK55wrQD8OtKCliLaetvBbl1c156TnhC00Ls8hpJZKtE
 ajST/cUQ/nBTdyThuJRkOgbiOmP2JJ9EhhScRTJJRl0Phc6Y09Od/lJj3q1RnNGBueUTHKk1G
 BP2SXlI8DmbggEMKlgQGA8YtTdx6gmwtdbbG1mSRG4O40bu68y3G/FgWWV5yMVBDyNvQel8vZ
 LVTAqzcOGD+DF6u/ZLW+DIPsCLO1/fbsHRjmFgVgL7jqzxSCP0Lq2n8PM19I1EW6d83bBroRu
 kQ3+cfpbd2SsjMyRoChZgPa3YMmEtBve5zvKRC8OcFweOqWjl83U0XeTObri7eDeKPjEzQNRZ
 hpPOJWxN4jk1rW+VeEAnPlj498kqBUlqy2vMub4bfsXbiJrORD2a4SDAPBx7EuBPXrd83pNd8
 A5YhyDdkZ6MYriqmM3adKcAUgEeJB4+XMYxy1Qixb7g05Bv79oIv2eG3dF+x/NdmiNN8TU3sQ
 PxnCGnggVtJAn5QhfRS2Q4US6iOnna8afLUidQi5Ocs1w3uIsKMf1lRxsyqJBoAaBqiibQ99k
 hFuKghCarTOylXySab9qGSRWJBNP0tGkiNZqidrjg1CfPivxJOGUR8K57sINhHvL2gtmCGJw/
 Zo4eYRprXu2lVhf1hTbXSnG1BhR1mkD4sdgmQg5fW/j2wWLPjFGg5nKGBLtS1IjqvLBFKefh+
 sTUWwETGopFxbVZsV+TXjAiUMVWN9dK09paDxmbHMQacrjhHXVYQ6V7rp5N9B1+cekEzdvZ0r
 vp748yTAtJMckUDHpnLSKnVQraMLDHBBFK8YB1E02DkRkpGoXE8VAAwLQ/g3c0tB3in9u5rW4
 RKa3IXzNuDHzLBZkSyBEh9H+GHypblhoW9qYYo07QCMDEFARWCtjObtq7zwJuKKAsut1Vifbp
 Bwhj3EYe7RNeXbAdfFRicTqOiWxYEciMTzSfp4YA3eOrD1WGtgam5HP7GUyIpE0OKxP7FxWrl
 kZTL3Kt1UJYY6oO0/hJGUkC9Msox/nXUMIN6X4WtuU8/bU7TzerZ+J6zYNJcwKEsg2/NPYquM
 Me+J9hGdTqBFzUgQcaBxsmxtBHSPen6hRnHyD6OH6/l+HUPJOuO/t7WEkzd4av91pVf8SNjK3
 W1424qXpdkWupn/bVtZd6q8BOJu267mIGha+pyN7yfbAgCycrSCzKExgfDSRFhXYAR6SAmGq+
 ZMBLMW3rANh/2M0o2Ft6WMsw1Y9OoYPd6TjNAU9JWa2gNALumeSu0FHH21mdS9cb8JUR9sJhk
 Hzy0AvIkPVOWdz1icM6tpxgS0AywNaEtwNbh++6fDc4fioS/HPkcr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1754496972; x=1755101772; i=fiona.klute@gmx.de;
 bh=UohtiEuMSqJJ/j41TmU1ENrPAT2CuW4Oftnpz4DnmWk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bLJESySAq6RwqTKgrkV77fSFdJitTawDxkTIKkA/2RKqMKLU54aShyC0iixf+C9M
 tGZJ5brMYlR35MW1cdp9M1KM7z1Dfqeo+aCmKJLpxa/2a/BEeSADM41l7nDUtaN3U
 DiEiXvBr6dGSFmsWspAOrkRGTNXaxtKHYRHlcAWIppJdrKKXAVoUBVMeAeT6o7Lqu
 BakBOsyX6sJcEtf9OSUU/LtlsiIyqZncZgbDdMwbQ2zBOenQXwEbPiodWGoCy5hAQ
 wtM4VbZBjbCYQo+6u26DNFWe29UpTzqg5WCu8XPnA+7VM6EF79s1cwx+hojIvACUk
 mS0xCaZkG318Vsm5FQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bLJESySA
Subject: [Buildroot] [PATCH v3 2/3] package/pkg-utils.mk: include package
 directory in show-info output
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The new package_dir element contains the path of the package
directory. For Buildroot packages this is a path relative to the main
Buildroot directory, for packages from external trees an absolute
path.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Tested-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/pkg-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 0266f66b42..288a202230 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -120,6 +120,7 @@ define _json-info-pkg
 		"virtual": false$(comma)
 		$(call _json-info-pkg-details,$(1)) \
 	)
+	"package_dir": $(call mk-json-str,$(patsubst $(CURDIR)/%,%,$($(1)_PKGDIR))),
 	"stamp_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"source_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_DIR))),
 	"build_dir": $(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$($(1)_BUILDDIR))),
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
