Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E05C433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3719461051
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3719461051
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4943605F7;
	Mon,  1 Nov 2021 15:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVXjttDNf0LE; Mon,  1 Nov 2021 15:55:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE6C605A5;
	Mon,  1 Nov 2021 15:55:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48F6F1BF2AF
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:55:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 380E2605A5
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NkwSHqJehQOu for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 15:55:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F79B605A4
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635782113; bh=Z9AsoZ7fDZqkvCo5XLgm5vbI9GmnwoGBQMuL3Ng9/mc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=lWo/wB5o6UZtYltOdZ3asLope2gDMhtCXJhflefiyq/31mu7BCTAc0/6TSD75LCAwpaUsgC0xIb0qJ3U0+UVkQ8MTfIAgLakLLeSYWecUQMyk2EiZVLyMezZBecn5zoM3C+eHRMDIeRkBQhiEaX5C4Elwcy3GhYY+MkkJdS8QzdIsIK+eJSM+THNAEysDO1V+fHPhTL1iKITKlDFHmbKqSbo/SZr1gI0pSS2py2SztDDDyjpRQV9C7/Zh4RLurDdW7sWkUhjuB8livK+g0vTZeGN7m0StqqmNdsp79Dzj+pYnoRxhcLI9/Vi8RKXRdVcnVkee9+2/IwcbVvpt+Rb3w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635782113; bh=iTdD+AKeDEE6sIOHj6Gen078cg/hCTxXE9QFkDLuKNH=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=iNkucgIP5xE7ZoF0/JxEs5VCl/133JiIky/ScH62LgtTW8bO8FJk3Oc4Kz7tVXjmbpGjvhWNP0wjQahEU0E+Ih3tF/v89kC9Qvu/DjR2kP0T3idekJP0BKnfZA3aRBe/2XsESmELDsVDJMhJ57tKSzRRiJwi9cVDADtaqq7aEE/FP65nyAOSv4SZ2fJZpKCtds3dtJBK/cmizORHMA5s0IunJ/d5RWKHFct1v1wr8x02Ue7dST8KIzuY1yKNsfMad9CzKeSIrLStsWmXU1EcE77ABlpigw1s+eodlEZHkl5+Jx+ZI6+K/sPsRaFmLVVKFhYy68pA0lW9OH4n2CLC2A==
X-YMail-OSG: bZAioFoVM1nf9YrY3InzS0ja199WUQrBdTvsZDEWXFtLVJWalajIAuYkdrWffrv
 CrIK8cFaaN8ql_q2D9sZyOmmH2HEh9J4sTE0o.RtIugeY34R_WWCXOZ4bmwxgQswdIlOYjQhn4.6
 gNAEOlu0clj.20YK_NpEN4AlwrJtksghBpa8hrDSOcidoOsOWpFfj_nM9PptBFZFUKurRJqgoemO
 C_aP1ppIni.I_du7VQ4A6BfsI4sn0MHMx2pz0gSfuM.gnyiPa6ZSWABnbiar7xbNad4NE.O.eb6S
 1INeK9nx40NymZ6Yoggle_1MVGy2oXg6lFIzbD4J22N2SyZozkmB2ZGfFebKPohhBiwta1RI2XzX
 cEhIuG2e4TXn8yBTlOYoZPHSezCWpWltJHiBShypuFsP7YlVBnJXidpmtY2XmGoiahZ.odb2bncZ
 CUfyMg6nTve8yufqWUE2.16cy3vOZRt9nqdoqsiV_vZpe16rSRZp4acW.f6GZECkVI2ezZ072pyP
 VtlxXhUPuPm13Fz8S2ORVAtRxW5v1sm6O9bg6dbKzKmr_.L7.FmXN4zgukv8CvPP8Cx4azzpDa_H
 3i13adHKOssLYnZlK7EC0jbcHSBtWos_P6baka_W.0SquCXpMl3hp2vVLnqs4OJC4gzIGr7C7Q0K
 rZZJJmeQPludeWkLb_5HjEhc65_B8O0egBxjeznmcpOqF_3xb0xJaiJUaR0ZiYVRlqJjkygsxkf.
 rQtMoPNgAdRYlIWNjQqG8ANl3Zw12eHhTwtBc8LibqrwpzaH5WLTaEo3QRBRprwjKE8N6K8Xj2Ad
 15JDikUmQs2pbDAWyLTc48AtmJmFTNaaxy7ir36wBmUQrfDpOlclKWMtlHRClI72GXBN_bHx1VcS
 LeZf8AnyFQs4oEV0p7xTYPU3FXeu7l0AnmdHGV8MADEDfbRYb7YlUl8ELZd0Hvj6UUO1NKmTAose
 w23xzzanyTxlF.uMeRolMnFRO4QE0UlT0AKZVkDOKp98liZ6huAoeVZfsASynscKyI1Vjv1zCSE2
 G.STOf15WYOYBZ0Z8EFjJCAexuSOVveaRlzpUei3EXGAABjiRdXsZFGVRu3d9NRzT5XfryKifAUg
 LR5AiGsbbtjxXu15ryAvCBU5IoLtqXvk5CIGt6Ual_v4F1bDKYGANFY666WQvEm_Cr0hB4U5qtUY
 d0IbU1LHMfTIYqCMnG2dvwrvjgnmbV1c7uHwJv9c_wqw2FzhQCWAMze9RMzRjfXELPHWQ4myfHzk
 RjuJ4ZWVPc_7LoioYYvRw6DZZ1_MhDELwuwH0xL5lOBrFcdljn6nDtMw3O.BhIIjQL9z0dN_ug5C
 V1QEK019nLR90HjXof6HK9Sx8y_3va4llHbxi6tMoLZ7xKHBpIwjajNjrbzd80_PidlZwWThxQvz
 9H1ZuR7doP7UCnjtZ5zHZ3mj8najq.6sJUyoiAONI1JwUrE2.7EAe03U9jkvTsR5qsbaV8JWMX0q
 R0tw6LQiuXTM09__2oKrFP8YHXrbI1Q_WC9LLJI4s_QfPW3gFq4tNvNWE8FAVzjtb8RGKyIylYcE
 an2Damiv_A505gsDLsCYDI9Eto_yQuFTJ3f3W6YzWJNMdwerQIJ7VBiOdB1d7Tq4h3O6lOoE.jSS
 abta9WYAsdG9QR_uZOGHLCYulLAj71uRFwDd111G_B2zHVT3wxUtd32Alq1ztzALShSQHDMoE3KO
 iN3G_DNRVEdoOgqNyEHYbpbVwpLXqAFl8BK8spQ9_x4i089pvJHjaC1O06zibfEn1RKSDdYpPovv
 Zj9fweQl99FPTf.oEFcnEi2Kmq8Umrxh0sWzZzdMInFS7G0A3VqKV1SDTTVlRIEvrPfPn2ftHnGJ
 ymUFc0j0yNHPXosIQWbxp9Y.ECqMIyz2Z4r1uXwusOSFy0OiKUB5MziF1A4PXY.WRb3saoHcYVcN
 FAjzXRfwv3TOKqO.BcIvEiYp5aWv9FdikcIrNbondt7kR3MiBdIF09YcUMijig60Ev1.asrf2jQH
 s2GcfiLO3ula0GLX1iW_AhX1KKYOug34PdbXykNiw2wFIomgiczajx411UohiQfVyHkE_chNu79E
 usWj9Xbhk8Oa4c_wKs6NUe0QHNeKgTwnxBV_lwLvH7lN_GoZf_63u_lp6UT6Hrfr9rDjE5l11Lea
 vtTTNs23zZtLLdYmFpJMIHnqL7kjlhQTZu_OUaY.T4j9CrRiUpIoKLpyI1Xjl3WlvDB4tYy9c4Qq
 lFMoVprzdH39W6ylbkXqNXfVp9F8ii_Zj2OlVkR3FK.2bcx0w.T0RYW2uZPKRd73M043SKV48bKC
 sYZ1sMFi0N6mmFE3wI0Oe
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 1 Nov 2021 15:55:13 +0000
Date: Mon, 1 Nov 2021 15:55:10 +0000 (UTC)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <1223689404.2770685.1635782110085@mail.yahoo.com>
In-Reply-To: <20211001164045.74dfe4d1@windsurf>
References: <20211001015433.11176-1-tallubko.ref@yahoo.com>
 <20211001015433.11176-1-tallubko@yahoo.com>
 <212347867.858114.1633098903235@mail.yahoo.com>
 <20211001164045.74dfe4d1@windsurf>
MIME-Version: 1.0
X-Mailer: WebService/1.1.19198 YMailNorrin
Subject: Re: [Buildroot] [PATCH 1/1] package/chipsec: new package
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
From: Tal Lubko via buildroot <buildroot@buildroot.org>
Reply-To: Tal Lubko <tallubko@yahoo.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============8497016261680875097=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8497016261680875097==
Content-Type: multipart/alternative; 
	boundary="----=_Part_2770684_1869507999.1635782110083"

------=_Part_2770684_1869507999.1635782110083
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hi
I've resubmitted the patch for chipsec few days ago.I can't find any sign t=
o it here=C2=A0https://patchwork.ozlabs.org/project/buildroot/list/=C2=A0an=
d I haven't got any mail with comments.
How can I know the patch state?
Regards,Tal
    On Friday, October 1, 2021, 05:41:06 PM GMT+3, Thomas Petazzoni <thomas=
.petazzoni@bootlin.com> wrote: =20
=20
 Hello,

On Fri, 1 Oct 2021 14:35:03 +0000 (UTC)
Tal Lubko <tallubko@yahoo.com> wrote:

> I've submitted a patch which adds new package - chipsec, which=C2=A0is a =
framework for analyzing the security of PC platforms.
> I haven't got a reply for this patch so I've got a feeling I've done some=
thing wrong.Have I?

No, you have not. You just need to give some time for the community to
review your patch. The current backlog of patches is ~390 patches to
review, which explains why not all patches receive immediate attention.

As long as you can see your patch at
https://patchwork.ozlabs.org/project/buildroot/list/ it means that it
hasn't been forgotten.

In any case, thanks a lot for your contribution!

Best regards,

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
 =20
------=_Part_2770684_1869507999.1635782110083
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp3e577bd2yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Hi</div><div dir=3D"ltr" dat=
a-setdir=3D"false"><br>I've resubmitted the patch for chipsec few days ago.=
</div><div dir=3D"ltr" data-setdir=3D"false">I can't find any sign to it he=
re&nbsp;<a href=3D"https://patchwork.ozlabs.org/project/buildroot/list/" re=
l=3D"nofollow" target=3D"_blank">https://patchwork.ozlabs.org/project/build=
root/list/</a>&nbsp;and I haven't got any mail with comments.</div><div dir=
=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"fa=
lse">How can I know the patch state?</div><div dir=3D"ltr" data-setdir=3D"f=
alse"><br></div><div dir=3D"ltr" data-setdir=3D"false">Regards,</div><div d=
ir=3D"ltr" data-setdir=3D"false">Tal</div><div><br></div>
       =20
        </div><div id=3D"ydp2c8e1807yahoo_quoted_5849397899" class=3D"ydp2c=
8e1807yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, October 1, 2021, 05:41:06 PM GMT+3, Thomas P=
etazzoni &lt;thomas.petazzoni@bootlin.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">Hello,<br clear=3D"none"><br clear=3D=
"none">On Fri, 1 Oct 2021 14:35:03 +0000 (UTC)<br clear=3D"none">Tal Lubko =
&lt;<a shape=3D"rect" href=3D"mailto:tallubko@yahoo.com" rel=3D"nofollow" t=
arget=3D"_blank">tallubko@yahoo.com</a>&gt; wrote:<br clear=3D"none"><br cl=
ear=3D"none">&gt; I've submitted a patch which adds new package - chipsec, =
which&nbsp;is a framework for analyzing the security of PC platforms.<br cl=
ear=3D"none">&gt; I haven't got a reply for this patch so I've got a feelin=
g I've done something wrong.Have I?<br clear=3D"none"><br clear=3D"none">No=
, you have not. You just need to give some time for the community to<br cle=
ar=3D"none">review your patch. The current backlog of patches is ~390 patch=
es to<br clear=3D"none">review, which explains why not all patches receive =
immediate attention.<br clear=3D"none"><br clear=3D"none">As long as you ca=
n see your patch at<br clear=3D"none"><a shape=3D"rect" href=3D"https://pat=
chwork.ozlabs.org/project/buildroot/list/ " rel=3D"nofollow" target=3D"_bla=
nk">https://patchwork.ozlabs.org/project/buildroot/list/ </a>it means that =
it<br clear=3D"none">hasn't been forgotten.<br clear=3D"none"><br clear=3D"=
none">In any case, thanks a lot for your contribution!<br clear=3D"none"><b=
r clear=3D"none">Best regards,<br clear=3D"none"><br clear=3D"none">Thomas<=
br clear=3D"none">-- <br clear=3D"none">Thomas Petazzoni, co-owner and CEO,=
 Bootlin<br clear=3D"none">Embedded Linux and Kernel engineering and traini=
ng<br clear=3D"none"><a shape=3D"rect" href=3D"https://bootlin.com" rel=3D"=
nofollow" target=3D"_blank">https://bootlin.com</a><div class=3D"ydp2c8e180=
7yqt3444080489" id=3D"ydp2c8e1807yqtfd85442"><br clear=3D"none">___________=
____________________________________<br clear=3D"none">buildroot mailing li=
st<br clear=3D"none"><a shape=3D"rect" href=3D"mailto:buildroot@buildroot.o=
rg" rel=3D"nofollow" target=3D"_blank">buildroot@buildroot.org</a><br clear=
=3D"none"><a shape=3D"rect" href=3D"https://lists.buildroot.org/mailman/lis=
tinfo/buildroot" rel=3D"nofollow" target=3D"_blank">https://lists.buildroot=
.org/mailman/listinfo/buildroot</a><br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_2770684_1869507999.1635782110083--

--===============8497016261680875097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8497016261680875097==--
