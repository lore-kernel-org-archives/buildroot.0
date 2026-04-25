Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A3AFF885D
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 12:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED91260F4C;
	Sat, 25 Apr 2026 12:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ps9GGA4tGDU8; Sat, 25 Apr 2026 12:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E1B360F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777119142;
	bh=Hu/XVKaHuppVrbrCAqTqoZo9Oj5iu/nKe6BbvUE/mwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=gqmdRjaVB+NV0fleY5ibODSsXk9x5TUkH+hEKiqtgcfFv5LL30fO9BO8PvuzoubUX
	 0op270vlLRqTZ0bnLIpAPfgZCDJvkzA0gbWWKJpef2yR986KTrJjLpqNSG9th7LF/L
	 FWts6dmBoCf5kYpvqfy8aF+HpwFONXwPvc/98tlouuqVyqw1R92tptsxMFRnBntuNM
	 exOEswmGNOr0GKaF2lWR4Z7Dob6is7m66BPbZB0s2PkGbvFOpllTekItLFBNOV1LvP
	 BCdm56oleuES6NpST2WYpjJKAt8eW3n1zrfGArwcRQKLVl8Acr2wOEmPTF1Pi8Gwe9
	 mHZVE1SvNaRGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1B360F46;
	Sat, 25 Apr 2026 12:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C30722DF
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A580E40BF3
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I9GdBN4osbei for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 12:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 83C8E40BED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83C8E40BED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83C8E40BED
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 12:12:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhU9j-1vmVq84BMp-00iCEn; Sat, 25
 Apr 2026 14:12:16 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 14:12:00 +0200
Message-ID: <20260425121200.810180-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Or7wntV57XgNgC+iM/AJPkTOc988+IU1/Q4HEqOc7Q2HBKNV3w9
 l/Bf/ZQI0bE1L8j04pWH1SmigbaukiplBQGvpkKdT5OUWY3YOv/INqQ2wCTCeQ046oh58dU
 fgoIFfqp1pKMqf/XwdXovLQ6ZS5n632jRRaa/QuLnoxIhOBssdnwgxCfrqB6QQ7HH1KjDA6
 RBxS43r/2b3D77ZPwknxw==
UI-OutboundReport: notjunk:1;M01:P0:xV6/HI+cbdE=;M0UurHkbIQ73I71VxxdTpY3tHAU
 SRaVpJyN55XyLWSgjjQi+WHTBbNP/Xr0i1Obqd9Dug4+K7igEYKzk3cPZMq2okC+cBMG3m/Jn
 XuP2hVu7djkRbT41Q2m9h4pdl6U0CutYbtnYsykwNBhzhJxs8q0eoX6fTUDPCCzOkbjMhPgv3
 9oO6ywID6oLRozTxb/ZfGmsodWVwreOxh4nKr33hPPB81hwF4vdAJRrlTgZWYxqNYQNIxAo3H
 vTvfz7Fa+DAj1G0+9oh+lqy0NTBjTLvFT5NwPnCwM9tKGAYh1Abhu4WDpvLY+v15MS6bRSdM4
 h/lYMXqvWtWdlIPBnGnWp9tGeGq4rMHYJRYxW3D7qC2F7CHl+OV9Eo98f3dBwxleO6gBxQjzy
 4vTgw462ZOe7Z8mdzckK7iUMjf2DYPQIJ3+JguesWTiYvQAOExnL8myCJrEca/S53Zcqzpy6P
 oXagN7WAn2dohbxv1pLS/k/+VzBcNckYekrqCYRLhFPhHIh5l7bnV4v5vQVIdSxPNrd9RpH9s
 HInF6znqCfr6xiFB7z8KFFeJ3MNqDBYmlflnEmdMLJIxOH9tS5PL0sJldEKhoJH2cYKwKNqNm
 iBEmArK1zjgygRgaMc4+FtgdM8MaI4W+LegwKNHk+qbjn0LVr+2EF21Knf+B5V4liKTrkYOFY
 h0r15m6B1p3P49FyogJOo7PCV+xNgPz4XyPYL6XBw1qfrl9Beok5xgCkpVHik+ay+fGbcOvpE
 b2F8742BeLyo8zSZ9ui+lhchtcE4iqsVnKzTiHcsw08rDyaqES5v5I1b4NThR/UIjWOjo0SBR
 yMvAXQweHtT7Bp6iXMn/yK1s3YmP0GYLv+gZDFJHM6zoXZC1eDk7VmUVlV8Riu2wvb/dAKKoL
 PttKuz8oSFbfKflcRIOhw8PYwUPMNGqgPrtTKMEYSa32Ap58kgr/aJJm7qGpn/EeTY2Yywv2J
 PTJ6yI1LhfOGo5oaT8mYz9HxRkg/pDFGLnDE3e2FTDnNK3M8JjZZ2se6XTUirKCOu88gQeDlu
 m9FlgR34DjLNCsnEnHAcxhteKyVgiRss2Yi0cMlVbFthLGovaIGyPk3aQ2DwmXLvabBbyzKvB
 hCRgPRvJ2hLTiXRno00WWG4Asd8/WkmLFY1VxZOXOo4i9SUVzwdl8bNUiI6e/RkstL8c++1Mp
 mX7+2RVxcpnRLivdWpByi0Cq/576ufZ8M2kBjO4uB1sAah5XuHg70rR+Of81kYUkEI9qvF9dE
 /OEbScLO+usz5S2zAzZ64xaPUndZhNPLoUH0h7Gc/1JE6e5LWX6fEzpwm88kHNQZC2TA1xXFX
 vmuQ2YlKMSOOAG19kS3nnYfqWzsdTn+l2Yd9v2MPCAk8/ZKg7XjE+fZa7bqqAL3Wv2+kHOuEq
 soqkahBACWlbKa+lzAi3KSFfBV+ZWIscLNMdGzPFxnWpuLKTd3KA19HgbyCk7dnB7mCcsBWvN
 gsQCR6t336JiBpjKPHETyhawFMI7jJXTrjPd+VuLgQE99BDXoON7nImJp9pqEF8Y4y4Vhggdr
 1K4ioPSzVNz77y3mzXOtd0X399wkdNiBjmf2n7qr4sBFM2Qzf15zeUS8qBPemvOENYQ46nvmN
 yQhz6r5oIM5NxO4qtgsyvTzKV6UFtb8G0f7ccKsoQXHRxZZtAEsY934k2NoIktZ9B6bi1Y+s7
 VVuH3RaFhx3glYYcVTPYLc+DfGR7ufsFILnvt7TaaEPjRT/b/WhzdzUsaoU1UbbIVnKv5IgpI
 lXAunHDmbNXo6HelFeBmT8+P8xyj34IhhIeomts+kkxjNuG+T1f0FGOlYtzEjKGetKnF3g8hC
 xoqJws2cuBW5FqZTUn1X+eeMoRpoX/66b2yEEj+gfNsaawlR7gaFxjQWbV+H8SbG8JAAOT15i
 AaXl3+6H+ewL3iaDzXy0rI5baSFCHW2OBca4BMixLJkYIB+2eonTkI8diG5+UMume37DBdwUN
 AIIUh+Z6fPJoi9Nei/a2OVydFjdmpMV50dZWszdLhDoaVwUqacmZzzonCTklBoUFNQ8drKXjT
 ub8LfLIA9er1TfUUvabum8XijmOrNAP8CTvxQPbAYlS+Ias8lvhxFZ0YdDn/J40JRiNVhJhWU
 Q7WF65fufWhuFwQZ6PrcFlZL9l5X6ECXMj/53d7BkCZoFyfnzisbkFT9JtFE3FqclmzkGEMac
 vew8AH07X6qjR3XhSPUhtrHG3jf9PYqObBbaizB3QosTNRdKiqfwzLEG9IukbcwXRbNT0f6XP
 j2uCDIXwzGDgV6GIKPdT4sC3H53tkYLrjocfWl0j0avKwwRcZAj4FAmUpL7HBIynxhwW7hE8p
 vFE5xToX0erz2X7RROMDa3aLIIFyarPyowhJ/5CGyQkRVSKgcDs7Wo86rbmagyml2fB4YA+69
 9bppwfW8Ek2blqak6XkubzxedWKI48aFbBJnFXLigt0IpdTHQWSVLhvgod6/NngRiPliJGkI0
 vMM1PeQwOIJakG16QPAeqOz87q54t/S58fCPHALglzlztYNT9SzxC6xL+RPEd31FGNACncMsP
 6monaMIFmsgwnvXZgV718PaGHb94euEs7LCBxG+AE2HCBOdBx+y1JqevUydpwb+quvcBYvKWm
 Ppxa6M5pGHLohxdJOLx6KNQ9v2UXulMGmxFnNNgq9I99dLHkJ3SnvsB4y0C1KgrNIz9PV7BVU
 +mhJemuvtQcSG0VflqrjjTISoYWnbYJvCuCj6fG7mIKaTxdB0ZILdR3vxDjA4qD77jx1uzS9E
 SQaCDCvmqJKZh7sVypxtCv9uxkr3DmQTTi0Zb6s7IAzOnwq0MDbxdZfYtt0ATTkh+bcspDM4Z
 yl5NQFMoAPOLZSJRWhr/ZsEEzXb5BBLQnJmnJkYlB3WrTYBEuyCq7ERbH90bjz/eAzLqgFHpV
 ugvQlaB6kN2VnRWEqHv+aBG5ynCmrpzOgjF6vJ0e0+eN79aomLxyaZiDiGMUUeWpV++Cma5aX
 r7V3WcLMiEe/0LQbcO+YpYKjtDTAwfWl11oxFKOxZv7nO0JZsdsFsNr533geQLkrleXTJ6f01
 SsXhz9scvKZFSED8pkZtE4TmN5N6/xbYBrAYhrX127RKluxoUtC3JyJmZVKHp++zvOGVdR3jB
 gTjNDbOSrkPrgdaB1Y0yT/LQ+5+0mdqsQLc3rjx9GcOjwSsPhs2haCDltwNkaXaYz7HMyRDv0
 hUWo2Y992S0ncxR7ldRG0xpDTLMZWzQ2MOQO9+ovrqhEmfgPlAXA3DwF4e+QskZKQbfbmR6nW
 CRv/mJsRGBaW5ADstMxc4083MfZXXQTUb2o44S/WTMS9A2QPbapVQb8OKyoXaqC5/qtozJbGN
 xf1njWsnTqLW6gZ7IRKCFxdrAVXBOls5lxiE27vWBuaAyhjyM+h7Vpsad3FoNUvpgKwveCMqH
 pe+oleWE0561mv4hV8lXtKPBlikhOzHS2hN7rVQkbaMQGPmXK0AFF4AapcCCXeoew/S43a0gK
 PMxUM9nE22iVcFU0PYqoIXUWse3h40VqIT3XzwLuzxVheigmnD8BfwXwaUUAl9aqCkuJJjma2
 r0HzDjHcaGgxbPd0hC7cCs0BN/4EMeTIpRQnDjM4XXOyxku1ePp/CU4Wk5Lh9hmbBb6hI03S9
 9YuyYnYY8ycfjVCR0TH4INbHymIDyTZaumiJe16v37P2LQj7moNFM3D743q4gyVZHdEUa6l3G
 RE5gMKXBXkipOscpd/nq3c0MohyNZCn4hVfMMCvOpy3ILW53AYyQ+3z8g/NZTP95FF23lZ9hx
 5nYv7/rRXWdu/lysjQ0jcnciv7P+w5wqcDRc/FajJfcrSd7Wk+3QcRD2shjK71wLuaeD/gulH
 MmrPZY2ZtvCNq0EU2ENrysi7UdykTBBQ2MbD23UcYo7T9+akskua+4fjMDkdI2AmyP+Z99IKp
 hQHO7a7Mq2G5W++MftBG0d8xz8+OZMRAHWVMRegmzh+EPI35WX76lzW8m1pw0TiOhYBpHSmYd
 PNHgiqXvyNsFrvo//5UBnDeWq10/XUNCP6DVbvxAew01/ilFinEWfXke8bqWT5tTeNjSjbdRq
 fpyuqdRCFneb+/oxxMKfC9MfeSngEMrtsX9mFBu1o0aykRJo1FweJoL3wOZqNCMMbTSU4qQj3
 Ffcj7i62uYMNQBli/PFfltUF04V5KGImyoW14ufT3nXZzje3O3NRN1BlAc2saAeRh8IlhtBFC
 R+oYZg68vfXk68uXonwT1LAuDkztwkgR8upE36AK32Ad8NLH9T86u9nNDvCLSVl5Xu3lVt9uD
 qqiAi5BhbOyhWD5zBHE6+ibjKFoy+Cvw7Y1+++clq1287sWIoUk5esZkkk4SU7KrvoxxnWNJA
 T3nOzbuRmARUA2rGs2JUzV3UMCt5OXYofyVyy2rl18n9/zQCouQKc+stEpSuPq0UKDbkFya7O
 0DAxr1pTDMzLQ1ciqxa/lOSwT6ry3eE2+Ag5MIwi9RYFHLX68jg0epE7G1yS2mRHJqd0rYTvX
 NImi3O3BcI/eNFjzYDflcrJCBPcAOG+gxdtedz5+Pv+Hh/7RbyFrTnW9AwnBHxw1b1zMA9v2E
 KZY/fTYUNCKObfLQLnhK1cvxKe72kXGGW/Hwr60oaj9wpj/qGSZqff8D1suIfo+NvYp3iN/VF
 Ggk+yVi8AIECddB+zujuAVIVN6JmfebLUvKYWM11uhX+BXmRSeUYUCooFmwq53zvvdlRuzUFA
 BTtJbztFjnIps3OeKw9PH2bzk1gbNwcvOPRzII8sCBexAvAPO4Xb5/62RUMN14Mk3zYaPpIQA
 ijoSDzS7VCu1M6IIgUsY/szrS+wXuNMM10icm4lAA3a+GwLIU4U+tU6ypO6g4cQxTNv47yHSz
 3RL8Q25mSnPi/HD87NTiUYfgy0i/79slUoVypy49c8oVijFkvftvudbb3YfB0WrchtsKhANkn
 hOOUJ1/y8FK1TnTBq0pkWcvoWe3b7OEmq46gQv0Jh40BQDbRGFM/jAOSKDX7aP7OOyWwqjVT7
 7IvCNTPHOvk2Bo6mMdM7QPZpr2cUx++mIuDjlL65ZzRVJDnfJ9EXVQyMwcaIcn6sZR/zg/ELF
 EoAWcp5jQfATyDhDV27LTPjO1bWAovDVkMz97oMUM84foQ+7akGZp9zW12XMl3uIloqTmp603
 OWfyrYb7vEsJEUoBVln/FdsAQEPZ794sFS6TbJFh9LS79pUVknZt7j+w3qwCz4uqaALQYbHvL
 87QrC0pStsaiFJ0VGSFdc+fX7ulNZvwFXOU9KuFSNAKJL+PMELDpUPN28NKEJg/HmtiV5uWzR
 OKUYJ39TL2beB/4iSuBIlfun6aOTr58WlLacD5J18V+jl+joxsRrfghz7gz78huUZRZSY2n/4
 ejTu3vbRjJM4Yl5wZKqpfVmaiOV3zOybD5TFYYn0tQeyb86qWusRr5z3m6Uxtx3Ki3Zv7IT7G
 EFDfT1jWf1kaxM4++qn0BbAZaGAc/Ge2vKc7O8gRuINWPcineo7g9mK2i8Xvn+txxdEMGJq+/
 37/tmQ1t6xHcfBPjkb0aWtjk//PCrzuistZlHxZ5jxpqFgBDfLuQgF1G1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777119136; x=1777723936; i=fiona.klute@gmx.de;
 bh=FUAWCBRt2bm8rR1jcCw5mV06rFHRQ6jxK7sbAM773Ac=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=mZHdr5Dl61Ba4KBvAcX86Q9hdr723oGrG/f/LytJ2COhv7Gco+cKunYcnT1vIMZ9
 yXwlJG6j/TWUil0Ic4cBAlH9q0uvi9TOb4fFgd0wOIPSMfaqtT6KDaQoCLYecf8R6
 8KeA2uOTruSnHgYXbNwaQSF1AkRQSIBAejffOYOZHzxSCxWVhj3xHgNXG5G3GdX5i
 6SQcZBWOKbp+UDSTEUimm2eZAWMi3WZps7T8AqIHqb6+u+VnVHnaMa5vDBK4XYgnn
 iUytDAspP6KdVnOeX2leoWqiEHzQgjV2dIiq2Mlt5rB69s553Ft4acqs0X1a9WvvE
 cPA4tb8edCTZPXt5+g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=mZHdr5Dl
Subject: [Buildroot] [PATCH 1/1] package/python3/Config.in.host: remove
 select on BR2_PACKAGE_HOST_OPENSSL
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no such option, and according to the commit history never
was. If BR2_PACKAGE_HOST_PYTHON3_SSL=y the build adds host-openssl to
HOST_PYTHON3_DEPENDENCIES directly.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python3/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index f3fcd63567..28fc0dbaf8 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -24,7 +24,6 @@ config BR2_PACKAGE_HOST_PYTHON3_CURSES
 
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
-	select BR2_PACKAGE_HOST_OPENSSL
 	help
 	  _ssl module for host Python3.
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
