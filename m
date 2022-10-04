Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756C4C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C76F60EF2;
	Tue,  4 Oct 2022 11:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C76F60EF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o30fCFe3aPO3; Tue,  4 Oct 2022 11:21:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F10960B88;
	Tue,  4 Oct 2022 11:21:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F10960B88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC4211BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9799C83065
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9799C83065
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRlDyPRF_F2w for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:21:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C0568305A
Received: from sonic303-21.consmr.mail.sg3.yahoo.com
 (sonic303-21.consmr.mail.sg3.yahoo.com [106.10.242.38])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C0568305A
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:21:19 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664882477; bh=9+UVXB8hZQ6vGtGjmfbLAeF89l+wwyiX9Nj5sENx7w7=;
 h=X-Sonic-MF:Date:Subject:To:From:From:Subject;
 b=b6pbANoC6O3BHmpsuS+qVS/tGd0Swd0Ry650mdivUJKAZaHAemYSB7iNpc6wKaTgjEcIRvo3dBGCzeUSumtFUJvUB4Do6KilX0RBzHXwiLWfhB0BWXM+mtTwz6UNq1mNMpqu4p23hbAG1j/J360Zwwotjn/3TNlq+PLwJxT5N5OSWhXAed6xSYSnXWaz64GNoNz/VG6p9CxLM3IiwumH/NjKA9246YtoZbymzCD6qTwUgcKDrZN4phKlm3Fuv45DsiU6OpvaZJSm0TKMIcYD86K9WV5j01epr4GUTDCQYeXduGLUOJVWw1zYYjsMhgkS2i4vJfPXV/hxudmRskH8gQ==
X-YMail-OSG: we2EHlwVM1l5BQb3HI8HFA5cGIJq.QSBsY6.zwgvyj58MThRoFjDOU3QDEJnYQp
 oGkZO3TDak_zMAwwcskUkjYF7chWulZIfgodr5UA8LOKRQYRgrzJXvNgA2XwELCu7_8guxCOaYy3
 _HMptZcJ7pMn9.5qAXAobu.5m_YKNUI6.rRFBkfKX1NrGVQ59TutWHsFW3EizyhLeGqHoe_3B8Cv
 y2gbn6zffb9W0X1GGTOmSdBz1JD8B12z2IB.Ldx_6XwK4ToOOx1wGECgZc6DIcvh_IUe_yVnrpMr
 Dtgt245HDIWcM333pVpBqOu_fRYDTsU5bYZOfKE1.zgDEnXGlQDLqYIy6IjsDagEiM8O4tI8mWeF
 dsCE7VCcyFjjhB8WiZVhSXDKhlvC.cymVWYBxzSgEBoZ.NUbuxhHMIx2g0dr3tm91MAO8Qv3K56y
 atsRPLK6.5Wl8_sBhKr48GHPHOgnScA_mw40rgFWIGn_CPF1SgueogpSIiyvKKRMBMT9Ri3wiZd3
 HpingV2hU1nOFozg61rTCZcd5lfGTspHIfHMeJHRZGJx.9DwvwLb6M4XUnOKKZ2yESJ7ACLCdc1G
 9uqv1.yKzaxBpcWPTYHpW5CyD8ESfhMiW49CGEZwja1.XcP8kMRI4Ea1p932qE92_4mgZJy2yYzk
 KHBQMDj8hspzZ7HdoP1x_phezAoHCZ5B_JTv0ynlIoZQFl7A.yhAN3XGdC8SaHpJhjAZcCE1jbDW
 EUiCd0U.wQI7fujWybDzcE0c5MAkKVpyKpW87UyJ3.aP48u1s01zsAMWVDxVtB5tjiZ77KfC81qd
 HVxeYRYmGcHzZ.rc2AXfM3QmJLXEearKEKuaeKXrp4Wj2h0qV8PgNqD5kJe0I41xvV4uRWmo.XHt
 Pr5IEMoNUFQitfyXCpcNPGyQySoIhzcqWC6hwXCDLSymDq75S84swNHoiFMbTgvZUn04XAN3ECrW
 0cJQnHVmzivkHm5DoKEzrQ.OaPVSvje_4JRXRK1mNdqfd2qCkK9juuTxmP44PlW987cD2mTEzn0S
 eri8qq_eLIhL9TVYCALQ5h9dzAkB0.VX.JhfJIea.ZLwhWN_T.znOqXpFUMmfxXpqK0_wSHjh7jL
 9P6q1izvhcg.6ZWYtK.AHA22zEKoz2uvTOMaFri7..HTbQ0HyDCDYFwjmDANZOnH5BWCSQNxR4Rt
 INcZdRXpkY8UjyLUwkyjYKdOvvY55sHsf6QY3O9jHqyN9JgBLXPcipe9KZGjjrhx6q71AklTy_Iv
 Nluq.vMudE6o3ct_Bkya.fKo8mT34A5CF471_pbn6l.iv7Nu2jD7hmUSiNd.JScmwP.NbNfe47uZ
 MHbftcAAHG7JY1DUkLfHjgzKLLYidE2zNVBKkyqpHWM0VeljEYGr2oQytOPyuzRD4AYh_gaZIIey
 k8_khDwzIoJTeecKv0uwDRFOhYftqXaBSDr21BNMSjtY3JjMYnNuA4Q8f8TVlkYKirBcdA0zTyFP
 eS1W7rWD3QOeUmrLXamW6Dr0Fp4BN.JUwaXDALmXXwIiHWyiHeLfoxccINzgrzPm38mimxhOGKA8
 klavuxixyjj3NLs5kVs1rhPsvXebg4_Hxj4DJvaKiNzwq0Lz3F5YAoUXGaiVaZDw8V42O0_.hGb8
 v18T7hCP.aPfgOOouGcDPRQYgm_efn.1e6QafgBt1KItroncGDYvNobyM8t20gHXNlOxUd2zrU7H
 L0733Q699GqCJ9SrK_DgVyv.abPVo23DyQ2AXTsWIvnxfv_xmUo.x.KcG9GnRdscQ0OwcKSlPdK9
 Z64D6cL9yz.dRVVYqjpUe_DCVqXnxwnuCipAW1HL_YTQaZSQQDey55pkabFMvKKmdijWhwSHKMSj
 367vP2IAQVt_hwrqIGl73UqH1_uuyzoPwDSzbcpywRbOdKG8caJZoP.IekLxO0WWy0Ae0kDUoZQw
 KnSC8xbcW4F3NUgzQAP5hQSBmQ6oOOW9h2fLIJpTgTvtDhvAAQ.CGRJSB9yql_J3oyQTkEnI2Fd2
 Uz_TXXUKtuM3oI_hwdlZke7664QpAsxLaQo4v0c_91pQkBSUIo7.QPb2whzP7OhQTUIRepM_6W9R
 9MflQoy4S9cxGcndhTOzmp0gMBcqPayuNae1pWpVRmLGC7qGb7CREfCO.78t3lXkCLvZWZm.g6Wo
 bNHp1
X-Sonic-MF: <kwangson@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.sg3.yahoo.com with HTTP; Tue, 4 Oct 2022 11:21:17 +0000
Received: by hermes--production-sg3-cf9dc7f8d-ss2cs (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 0ba20ec25240528177c4febaf5c1994a; 
 Tue, 04 Oct 2022 11:21:16 +0000 (UTC)
Message-ID: <beae0467-a121-e1ce-5c1f-08179a809665@yahoo.com>
Date: Tue, 4 Oct 2022 20:21:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
References: <7b6a36f0-b5a9-ebd9-dcd3-faeb8940fbf7@yahoo.com>
To: buildroot@buildroot.org
From: Kwanghoon Son <kwangson@yahoo.com>
In-Reply-To: <7b6a36f0-b5a9-ebd9-dcd3-faeb8940fbf7@yahoo.com>
X-Forwarded-Message-Id: <7b6a36f0-b5a9-ebd9-dcd3-faeb8940fbf7@yahoo.com>
X-Mailer: WebService/1.1.20702
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1664882477;
 bh=m3yX3PZ+/ZeoFmCw5ucIRlJM4u1nKlYvGT8P2xWucLE=;
 h=Date:Subject:References:To:From:In-Reply-To:From:Subject:Reply-To;
 b=cQlHVCYG8RwwSrGM3292KQWatbERkxXcLGtxPLCwHnX7BER1TsdR/9GnDO63wxxdu3EHdeqOfBCP65uuxc6DLw3xc3YVQIp/t2my4cvTWcqJT9ZmObCmYmEXyLq3Hks/pH7Frg/dhww+Ly47OU0b4wbGaFoG2HIAUkvBxHUXIqmbKZBSSo6uorAbC3C3TJ/RDD9F9FhLJ37dI0TGSb/OSAQEWNN2eH19H54ene7TgCtRx/xPfhDQcYjSEEhxihg5YV7qKI18X8GzK6CBNoryWe8jdOsRqpAAPhUhWUFP+M6c/1GmObI+m4212vT4LteU3uRCCUXPGm35CkOCimaseA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=cQlHVCYG
Subject: [Buildroot] Khadas VIM3 support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Hi all,
I hope this is correct place to ask.

Recently I worked with VIM3 khadas board which is not include in buildroot.

1. Is anyone tried to patch vim3 board?
2. If no one interested, allowed send patch for vim3 board?

VIM3 has emmc/SD card boot option. But I'll send patch with SD card boot option like rpi board.
(After erase emmc vendor file system like armbian does.)

Best regards,
kwang.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
