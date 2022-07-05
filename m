Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD5BC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 01:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7EAE82D12;
	Tue,  5 Jul 2022 01:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7EAE82D12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OO2h5Ly0k-Hb; Tue,  5 Jul 2022 01:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0667E82CF9;
	Tue,  5 Jul 2022 01:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0667E82CF9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BD671BF36D
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 01:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 260CF4097E
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 01:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 260CF4097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_igmywuUXQc for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 01:21:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07EFB40131
Received: from sonic314-43.consmr.mail.bf2.yahoo.com
 (sonic314-43.consmr.mail.bf2.yahoo.com [74.6.132.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07EFB40131
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 01:21:40 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1656984099; bh=NNtzI12fZpSwtTUvCvaSFOPKq9/UOtZc2a3PGRmitH3=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=F7gzfeYBdIcNFCTMTIyZfsP29sNMDJ15ttdHvPRG/Ea5i8sC8bbhh7LQOlNqo10OJJWoyy8MwQ8WldWTP3RjFoXd1cpPfDsFFfKUJrocREAgfAoK+nmpTAlDzlY+PByIb5HitIjiA/1byzGZKBaO8tTQ6Bv+d7W4R9D5JkH5pXdsRrGDmKg0xvYsdaEuvcA755EnZ4yAYIBYyiLm7BZ74ElvdNRXcG3M4E4/Iw7V5ACYfA/iZNRTx+EUwoTbD4UYSYcLCxgjVE0VddmqHC4GB+zjjJaf8HVltskmR+9X+bz+y7QU/eAM22LkLj61T/qCFs9Huontcq28oC2FAFN77w==
X-YMail-OSG: 99tKhSUVM1kdEVQPm01RzEf8lHFC0H3KJhs1YryQbRKtamceI8LRxlODlMMVtcI
 lm.ZOaUuwtQHs1Os8Vcm1.gGxTT2fy4zTeCPcbHDUybXm1nfdDd_.kSjWuVDmh3yVztTAVB4FghQ
 .mkcVWk.6DM2lGjme4KOG_FdNJZOP.A92UE2.x9zImvht4LQEjsIULSlWb8TQSGhWM54_Xnb5xOf
 bMbTKGFhcDZ1lA17Jm0wUg_GbjtQnPw1OKOTOn6jiuYo7QdDekJA0NUZ9GCoXSJOQTwvATVBfdR1
 1UT6bygWNYVpoh_wBNj7GvPQYqlwGbJ0j16.vo.e.h067PoCtawY2f3F1PPP_1mMX.12ATIg2VO2
 O35ShMz.ApfMWV.8sZ54bq1narWM2Ir6hov38S99mt0Q48tbWxnklrMAZh978LBuUDMza79o8dFX
 26yyIAcG_tgSX4ljK4PITkrmbttqlPNRYd6AovNH2C2v.MDgMKduMNhG7uUX0DW5U6sRICnf4tzM
 DFRpCns3.6rOani6O.cFej4dcBtL6tmK4pqaxcOhKkXCC2woRDYzE7NCithhqWYl9Wcruwjsr1hZ
 eIXI6A3JPoIKVxdFMDusiqL9CnG09e4SRn0jNEtV4o.tryC9r8jlusLW0IG9jIaA2ehwjKNcDrCd
 1IMtFTZWh3EAXsauPDGs8PAuEv8Fvy8PkmU.TVk7WGVDgJpa8k5RFChS3nSvv3Rupd6VC4EE5xH7
 rK1RlqNp.ZgINL9VMU41pYGBcos6JYoqWNh140JzDfctR3XPQV5R8pPZRWHjSSE9hiSbynjGu3rJ
 c08.tmmxN02Fqh9FDve4KhRvQf.8Nvao5aIfMKKJxsX0dDhVpQfmNrsJNiFkjjyHsGxLcAjqrnSY
 P6jybGacdfIJcA7NcV.C877_GYVVJ_sMWGh2tV54Mltu3od__6v2sOWRUcf_GijJ8HZXfy6XbhP_
 vlwmy4hM74_OVTUqvn9kAnJU1FaeFZGoHzWHrE_7t7jUYfu_YlDPqS2hNnnvn5iDxasFdo5Jm6qV
 0wXodkEpS6Jh2eD0Uw3n4m1iWDTMF4npqvErjnsEAyn3j4Ubm5ePyehJhvdHxigbZ1dyxj_yfB.L
 wgOhd.SlWBxUbZ1FyFsyXelev1GpDL_GL_lvNaGQ_GFuiAQJ.3ac6Hkem7B13wO.uLCN7faD9THz
 BSvjJOB28pco6rRX9l0J4fFi_8GXVBPlKOHnPwdRNKfyXClsTg5QESsjpCk41i7h2czg.lEUqgLk
 jH6OgwDskHxPjGmLU2n0t12aXxaHYgsqM.oJPVu7mr4sM2BLluJ4l2km0AGah5BSKxYds1GtZU_d
 P9KNITl1IXqUmh7LlFkgZq5I.f6tjuU_7Cna91w8XA4.VF0y1yRaeHhOBM8u7mIzZBNw.SG_j3_I
 4.Cr0vLFKe_QQ8AQ0XEWGSWj1TFJPQXi8_UwFe4rPfgXG45g7G1BiDNrgClLC_EZ99jckkhXeNOJ
 YKFX4Kc7kShPBlDCLliW4n_jk6TynCkw8seqMfDicVMqfjgv.IBYTCWSO3Tf109V4IhZL58k5DzO
 t8BDdah.t2FjItWsdFAVW5lOFJQ_mLdEB5ue4DCfzen_qMyi3X.ZSeFzU2CS2ArQIvxRcVvxQy82
 k_yK2BaVy4jsDowY9XiWxaCLPsfdi6tb6_KsHWVi4nqrnb5MB7WyuJr7tlEDehy5hDN7hAK3di7I
 MZwHEn1Gz6_Hn.tRu7Mo6GsOQSLVIjrQzpSobXU7fW6ctG16GSUvAyIFT.u0p55iW3ei3WjSkCfz
 zhxiPsogMLbOKC3ry7a1CoD4T0moKauzzqxWfrFTvgBqu05XiFpekBht70V58MvImLVg.XNjsAIq
 fWRlpHT_eJGZDjJZAqMfw5YcDEKoLuglG19VZDzaif.Gjdk7G5Cq3ahHWBaAwBhOPkh5SW2SqFPi
 2gTaM605TM3CMPhJjMODOw_loGxb2b7TEzXDV8uCVy3.EgniVLMR8OhDL27wpmc.2xhbcd7OACst
 83och4jeEc71EcGYNm30d3OYB0BIVgk4W5WTiqXzOkXppfq4RlJ.HWXjiWs0SG420uM3NdE289vX
 JYYitEyBI3BHW2P4Gwa6LFOxCUEkLVcwYbgnA.qCM9zFY7pfR0IPgBIyrx0Pi1m6rIwh0iX8jQh0
 0EamSkKmJZjA0HeCE9p2Oiw2I_ALMvXF2K6ei8wKjVJqeSwTTPtkZICYdVWVVHN.0kt16QwxarJo
 XQB8yhCktSnXjkRQ0o5hQ_R_h8uNOved4Hdrqa4F.6fiDjbfMVcX8DVaZORohPPg6tAhAo0Y8Vi6
 ERNZhJRm94h6_TxGEe0Ee8bslQ3xK7usXnpp.YHR5Z8zYvcEkcKg7l9L6sK.wy3MQP4SOFCY-
X-Sonic-MF: <hsiangkao@aol.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 5 Jul 2022 01:21:39 +0000
Received: by hermes--production-gq1-56bb98dbc7-x97s6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9bb6e3d1f5e57a63b95a6bbd13402d47; 
 Tue, 05 Jul 2022 01:09:34 +0000 (UTC)
Date: Tue, 5 Jul 2022 09:09:28 +0800
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <YsOPSCutgJC27E7M@debian>
References: <20220703093952.1300768-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220703093952.1300768-1-fontaine.fabrice@gmail.com>
X-Mailer: WebService/1.1.20381
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aol.com; s=a2048; t=1656984099;
 bh=Zz4B7iTOXtpKQLoU0G8OOpRR2qMSGaD2p3byut29Qvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject:Reply-To;
 b=GcAeW1O789VrN8frzjC7zT/z5pg1Ko8+S72fkVP0PJzaoExZwRCpQ9lieRNeDeAYB8Rt9VsRVACTSK1uElh7q/q8L4RTog+4pv7FP1Z5FSkDqaRbDeYn8y3O8vxug2/4g1pRNXLago5e3PjKYCCKqT1UprKzK/BeAGCZaz2EbWhidwZUWq2cyFADE3g+LvhSvNDgkrxq20shc0Fv8VFXJ82y+X7+XV0JJVaUeLJIKcZ42EzlXLTdiLTsYc0ButKjdWyPtLaQfHFrRZ65KBERbnlIpQeATU772pwezMUIIrcM9WCQE7tKjdiTljcmfyn1Y1ZilkH/ohMY0M67IUSWAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com
 header.a=rsa-sha256 header.s=a2048 header.b=GcAeW1O7
Subject: Re: [Buildroot] [PATCH 1/1] package/erofs-utils: bump to version 1.5
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
From: Gao Xiang via buildroot <buildroot@buildroot.org>
Reply-To: Gao Xiang <hsiangkao@aol.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Jul 03, 2022 at 11:39:52AM +0200, Fabrice Fontaine wrote:
> - Drop patches (already in version)
> - liberofs is now released under GPL-2.0+ OR Apache-2.0 license:
>   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=49b344c5531a7819f282b0b1b6eb01682c0e41ae
> - This bump will fix the following build failure on or1k thanks to
>   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/commit/?id=100cae2b98a70ac69ae7a09ed94f86ddf8c89fe2
> 
>   In file included from ../include/erofs/cache.h:11,
>                    from cache.c:9:
>   ../include/erofs/internal.h:34:2: error: #error incompatible PAGE_SIZE is already defined
>      34 | #error incompatible PAGE_SIZE is already defined
>         |  ^~~~~
> 
> https://lists.ozlabs.org/pipermail/linux-erofs/2022-June/006462.html
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/755f8d736b8ad96b213bb3975b26f1143e60e5b5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks for this!

Looks good to me,
Reviewed-by: Gao Xiang <hsiangkao@aol.com>

Thanks,
Gao Xiang
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
