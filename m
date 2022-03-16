Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2C6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 01:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF52B84276;
	Wed, 16 Mar 2022 01:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e677jb0UaotE; Wed, 16 Mar 2022 01:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96BA8425B;
	Wed, 16 Mar 2022 01:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC0D21BF9BA
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 01:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C957681A16
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 01:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CcQN0UGkHX6 for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 01:04:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3053817C0
 for <buildroot@busybox.net>; Wed, 16 Mar 2022 01:04:15 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id u3so1253518ljd.0
 for <buildroot@busybox.net>; Tue, 15 Mar 2022 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KiLHFL6Pwf1fsjM+2tVSw+WL5VDSuhme1Isg/0qi+Q4=;
 b=VH4LM3ZKsIYr3FcWR2zebMrjrxSwoiL7GvALSeBPx9zS4YguLcFHnVAMh5MU414NfN
 UhivTUj8gW8zttkP4hopph/PQCjvHIieDqo9mpmcEx/Yukh1unHzeY97rxImDriYpClm
 KKr56yq+8d6MmR9XFtQqtPQyjLyME3QY2WuItwDAC/uYTOCGcDmjvAzgpNY2z4Vqy9Db
 EztI0kwQrV2tx4yFzfFwJUjSq9WTe8i5FXLyLaKo1z6O0x2cfX9xvsVl9SaBt13K0UJe
 NwACgRY5elN/VZpwQv6sIHfSvpS4t/gBhOxlq8j6QYtRVUCMzTGnD848UnNiJ+JG0j5m
 tK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KiLHFL6Pwf1fsjM+2tVSw+WL5VDSuhme1Isg/0qi+Q4=;
 b=AhuOFWIiW8qCL+cZTTvx5hve+T273GBF7CwPjwX1Px5/qxRgw9eJnRBpU2Y90ADxAI
 TAhuP/7ivI9i2ViTyG3KOVQo0r452DKr6t8qeUwiPWNH7OmlQxeTpjg45QInnY9E64Bx
 TLwFZeNMdBvsZ9o91BZiLk3i5oj6ZTI+fSAE12ky4qwwOO4iacvkb/PWZ9we+S7SExun
 KY/a5+hTKVZCwtwc53xew9GLOQycWAX8bs64FiQkWWaq2B0Yd1j51KXPLK7CwOqKWbLv
 8BznUReMxg/kDjEzfpnRXxLSvllG3cLlrmA9QzgDidYM+nfDpA7mG69Y85GJaglMIqBS
 4dbg==
X-Gm-Message-State: AOAM5335CDsmC089V3hlxdnQNjMoxK5q+4MW5YtLTctgw/T21IDbyewS
 NuvKkY3JPnf4c+gqdWa0hBMwEtQsMBdI0WwY+A+Nt6Feb2M=
X-Google-Smtp-Source: ABdhPJzXXSMdknV/gl0/SQha+GTSZEr/tFL0q/thASmJj7Z/d8dG9ifo4VD2biAHeTMmozOFcGTHSzmWOK1q81mUZEc=
X-Received: by 2002:a05:651c:2dc:b0:247:e451:48ae with SMTP id
 f28-20020a05651c02dc00b00247e45148aemr18877268ljo.248.1647392653391; Tue, 15
 Mar 2022 18:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAHYcJGqtHhDF7zKDak-+V2w_=PmbL5T7iB7P7ZV-paMbkWBBVA@mail.gmail.com>
In-Reply-To: <CAHYcJGqtHhDF7zKDak-+V2w_=PmbL5T7iB7P7ZV-paMbkWBBVA@mail.gmail.com>
From: Avijit Das <avijitnsec@gmail.com>
Date: Tue, 15 Mar 2022 19:04:02 -0600
Message-ID: <CAHYcJGq5iFY-nLz5YYvcGZPgJ1HoYRVF-xdM8OHcrnWvu__u7g@mail.gmail.com>
To: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="000000000000e95ca805da4b7d9d"
Subject: [Buildroot] Not able to enable GUI library on Buildroot
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
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000e95ca805da4b7d9d
Content-Type: multipart/alternative; boundary="000000000000e95ca605da4b7d9b"

--000000000000e95ca605da4b7d9b
Content-Type: text/plain; charset="UTF-8"

Hi,

I am building Buildroot for an imx8mm board. The HDMI display is up. I
validated the display using the fb-test. I am trying to enable a graphics
library, either gtk3 or qt5.

*gtk3 *
When I am enabling the gtk3 library, if I run the demo application, I am
getting the following error.

# /usr/bin/gtk3-demo

(gtk3-demo:350): Gtk-WARNING **: 01:21:03.518: cannot open display:
#

I have tried setting the display to localhost:0.0, did not work.

*QT5*
The widget library is not building. There is a compilation error:

qkeyeventtransition.o .obj/qmouseeventtransition.o
.obj/qbasickeyeventtransition.o .obj/qbasicmouseeventtransition.o
.obj/qgraphicseffect.o .obj/qpixmapfilter.o .obj/qrc_qstyle.o
.obj/qrc_qmessagebox.o .obj/moc_qwidgetrepaintmanager_p.o
.obj/moc_qwidget_p.o .obj/moc_qpixmapstyle_p.o  -latomic
/home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/lib/libQt5Gui.so
/home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/lib/libQt5Core.so
-lpthread  -lrt -lpthread -ldl
ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so
ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5
ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5.15
rm -f ../../lib/libQt5Widgets.so.5.15.8
mv -f libQt5Widgets.so.5.15.8 ../../lib/libQt5Widgets.so.5.15.8
rm -f ../../lib/libQt5Widgets.so
rm -f ../../lib/libQt5Widgets.so.5
rm -f ../../lib/libQt5Widgets.so.5.15
mv -f libQt5Widgets.so ../../lib/libQt5Widgets.so
mv -f libQt5Widgets.so.5 ../../lib/libQt5Widgets.so.5
mv -f libQt5Widgets.so.5.15 ../../lib/libQt5Widgets.so.5.15
make[2]: *** [Makefile:51: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:292:
/home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f3778f293adefe/.stamp_built]
Error 2
make: *** [Makefile:84: _all] Error 2

I have attached the config file. Can you please suggest?

Thanks,
Avijit

--000000000000e95ca605da4b7d9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div>Hi,<br></=
div><div><br></div><div>I am building Buildroot for an imx8mm board. The=C2=
=A0HDMI display is up. I validated the display=C2=A0using the fb-test. I am=
 trying to enable a graphics library, either gtk3 or qt5.=C2=A0</div><div><=
br></div><div><u><b>gtk3=C2=A0</b></u><br></div><div>When I am enabling the=
 gtk3 library, if I run the demo application, I am getting the following er=
ror.=C2=A0</div><div><br></div><div># /usr/bin/gtk3-demo<br><br>(gtk3-demo:=
350): Gtk-WARNING **: 01:21:03.518: cannot open display:<br>#<br></div><div=
><br></div><div>I have tried setting the display to localhost:0.0, did not =
work.=C2=A0</div><div><br></div><div><u><b>QT5</b></u></div><div>The widget=
 library is not building. There is a compilation error:=C2=A0</div><div><br=
></div>qkeyeventtransition.o .obj/qmouseeventtransition.o .obj/qbasickeyeve=
nttransition.o .obj/qbasicmouseeventtransition.o .obj/qgraphicseffect.o .ob=
j/qpixmapfilter.o .obj/qrc_qstyle.o .obj/qrc_qmessagebox.o .obj/moc_qwidget=
repaintmanager_p.o .obj/moc_qwidget_p.o .obj/moc_qpixmapstyle_p.o =C2=A0-la=
tomic /home/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e=
6f3778f293adefe/lib/libQt5Gui.so /home/avijit/buildroot/output/build/qt5bas=
e-d16bf02a11953dcac01dca73e6f3778f293adefe/lib/libQt5Core.so -lpthread =C2=
=A0-lrt -lpthread -ldl =C2=A0<br>ln -s libQt5Widgets.so.5.15.8 libQt5Widget=
s.so<br>ln -s libQt5Widgets.so.5.15.8 libQt5Widgets.so.5<br>ln -s libQt5Wid=
gets.so.5.15.8 libQt5Widgets.so.5.15<br>rm -f ../../lib/libQt5Widgets.so.5.=
15.8<br>mv -f libQt5Widgets.so.5.15.8 ../../lib/libQt5Widgets.so.5.15.8<br>=
rm -f ../../lib/libQt5Widgets.so<br>rm -f ../../lib/libQt5Widgets.so.5<br>r=
m -f ../../lib/libQt5Widgets.so.5.15<br>mv -f libQt5Widgets.so ../../lib/li=
bQt5Widgets.so<br>mv -f libQt5Widgets.so.5 ../../lib/libQt5Widgets.so.5<br>=
mv -f libQt5Widgets.so.5.15 ../../lib/libQt5Widgets.so.5.15<br>make[2]: ***=
 [Makefile:51: sub-src-make_first] Error 2<br>make[1]: *** [package/<a href=
=3D"http://pkg-generic.mk:292" target=3D"_blank">pkg-generic.mk:292</a>: /h=
ome/avijit/buildroot/output/build/qt5base-d16bf02a11953dcac01dca73e6f3778f2=
93adefe/.stamp_built] Error 2<br>make: *** [Makefile:84: _all] Error 2<br><=
div><br></div><div>I have attached the config file. Can you please suggest?=
=C2=A0</div><div><br></div><div>Thanks,</div><div>Avijit</div></div>
</div></div>

--000000000000e95ca605da4b7d9b--

--000000000000e95ca805da4b7d9d
Content-Type: application/octet-stream; name=freescale_imx8mmevk_defconfig
Content-Disposition: attachment; filename=freescale_imx8mmevk_defconfig
Content-Transfer-Encoding: base64
Content-ID: <f_l0stk3240>
X-Attachment-Id: f_l0stk3240

QlIyX2FhcmNoNjQ9eQpCUjJfQVJNX0ZQVV9WRlBWMz15CkJSMl9TU1BfTk9ORT15CkJSMl9SRUxS
T19OT05FPXkKQlIyX0ZPUlRJRllfU09VUkNFX05PTkU9eQpCUjJfVE9PTENIQUlOX0JVSUxEUk9P
VF9HTElCQz15CkJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xMD15CkJS
Ml9QQUNLQUdFX0dMSUJDX1VUSUxTPXkKQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKQlIy
X1JPT1RGU19ERVZJQ0VfQ1JFQVRJT05fRFlOQU1JQ19FVURFVj15CkJSMl9UQVJHRVRfR0VORVJJ
Q19HRVRUWV9QT1JUPSJ0dHlteGMxIgpCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2Fy
ZC9mcmVlc2NhbGUvY29tbW9uL2lteC9pbXg4LWJvb3Rsb2FkZXItcHJlcGFyZS5zaCBib2FyZC9m
cmVlc2NhbGUvY29tbW9uL2lteC9wb3N0LWltYWdlLnNoIgpCUjJfUk9PVEZTX1BPU1RfU0NSSVBU
X0FSR1M9IiR7VUJPT1RfRElSfS9hcmNoL2FybS9kdHMvaW14OG1tLWV2ay5kdGIiCkJSMl9MSU5V
WF9LRVJORUw9eQpCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9HSVQ9eQpCUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9SRVBPX1VSTD0iaHR0cHM6Ly9zb3VyY2UuY29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwv
aW14L2xpbnV4LWlteCIKQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fUkVQT19WRVJTSU9OPSJsZi01
LjEwLnktMS4wLjAiCkJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJpbXhfdjgiCkJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQpCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0i
ZnJlZXNjYWxlL2lteDhtbS1ldmsgZnJlZXNjYWxlL2lteDhtbS1ldmstcmV2Yi1xY2Etd2lmaSIK
QlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQpCUjJfUEFDS0FHRV9RVDU9eQpC
UjJfUEFDS0FHRV9RVDVCQVNFX0VYQU1QTEVTPXkKQlIyX1BBQ0tBR0VfUVQ1QkFTRV9HVUk9eQpC
UjJfUEFDS0FHRV9RVDVCQVNFX1dJREdFVFM9eQpCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YPXkK
QlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg4TU09eQpCUjJfUEFDS0FHRV9J
TVhfQ09ERUM9eQpCUjJfUEFDS0FHRV9JTVhfUEFSU0VSPXkKQlIyX1BBQ0tBR0VfSU1YX1VVQz15
CkJSMl9QQUNLQUdFX0lNWF9WUFVXUkFQPXkKQlIyX1BBQ0tBR0VfRklSTVdBUkVfSU1YPXkKQlIy
X1BBQ0tBR0VfSU1YX1ZQVV9IQU5UUk9fVkM9eQpCUjJfUEFDS0FHRV9JTVhfR1BVX0cyRD15CkJS
Ml9QQUNLQUdFX0lNWF9HUFVfRzJEX0VYQU1QTEVTPXkKQlIyX1BBQ0tBR0VfSU1YX0dQVV9WSVZf
T1VUUFVUX1dMPXkKQlIyX1BBQ0tBR0VfSU1YX0dQVV9WSVZfRVhBTVBMRVM9eQpCUjJfUEFDS0FH
RV9JTVhfR1BVX1ZJVl9HTUVNX0lORk89eQpCUjJfUEFDS0FHRV9LRVJORUxfTU9EVUxFX0lNWF9H
UFVfVklWPXkKQlIyX1BBQ0tBR0VfTElCR1RLMz15CkJSMl9QQUNLQUdFX0xJQkdUSzNfREVNTz15
CkJSMl9QQUNLQUdFX0xJQkdUSzNfVEVTVFM9eQpCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKQlIy
X1RBUkdFVF9ST09URlNfRVhUMl80PXkKQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSI1MTJN
IgpCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9DVVNUT01fR0lUPXkKQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9D
VVNUT01fUkVQT19VUkw9Imh0dHBzOi8vc291cmNlLmNvZGVhdXJvcmEub3JnL2V4dGVybmFsL2lt
eC9pbXgtYXRmIgpCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9SRVBPX1ZF
UlNJT049ImxmLTUuMTAueS0xLjAuMCIKQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9Q
TEFURk9STT0iaW14OG1tIgpCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzE9eQpC
UjJfVEFSR0VUX1VCT09UPXkKQlIyX1RBUkdFVF9VQk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15
CkJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVD15CkJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1JF
UE9fVVJMPSJodHRwczovL3NvdXJjZS5jb2RlYXVyb3JhLm9yZy9leHRlcm5hbC9pbXgvdWJvb3Qt
aW14IgpCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9SRVBPX1ZFUlNJT049ImxmLTUuMTAueS0xLjAu
MCIKQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImlteDhtbV9ldmsiCkJSMl9UQVJH
RVRfVUJPT1RfTkVFRFNfRFRDPXkKQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NPXkKQlIy
X1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NX05BTUU9InUtYm9vdC1ub2R0Yi5iaW4iCkJSMl9U
QVJHRVRfVUJPT1RfU1BMPXkKQlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15CkJSMl9QQUNLQUdF
X0hPU1RfSU1YX01LSU1BR0U9eQpCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15CkJSMl9QQUNLQUdF
X0hPU1RfVUJPT1RfVE9PTFM9eQpCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0ZJVF9TVVBQ
T1JUPXkK
--000000000000e95ca805da4b7d9d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000e95ca805da4b7d9d--
