Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D84C433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 16:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EEF40918;
	Wed,  5 Jan 2022 16:18:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQ-OOcu1RnGw; Wed,  5 Jan 2022 16:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE1940A04;
	Wed,  5 Jan 2022 16:18:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2379B1BF340
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 16:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FC6F82B8C
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 16:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mailoo.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_WhY91tK1Av for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 16:17:59 +0000 (UTC)
X-Greylist: delayed 00:20:35 by SQLgrey-1.8.0
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0559F82865
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 16:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1641398241; bh=SHlxQtLwU4aaJYgadp1kAMQaBNLKgh/5PDVUixiLXkg=;
 h=X-EA-Auth:From:To:Cc:Date:Subject:MIME-Version:X-Mailer:
 Message-ID:Content-Type;
 b=bSlH1LcP0jlSET/Rd6krnAKqdstDcLovoOTkYg46Mb/wtXvSREoVupxvp57jknIaB
 zlczfoqRPlr12dME27RG4D6szPhxR7Srb7gNJyWme6h8vASDOpXFXIjhL/K/NYgzMb
 itKrpgz20x7RlByZnqHpx1WaVB3yChetiIy+jwiA=
Received: by www-7.net-c.com with http webmail; Wed,  5 Jan 2022
 16:57:21 +0100 (CET)
X-EA-Auth: PGcaEsJX07OIFkU3OMfSyp4RJInX3XgeKx47/bknViIUy8g9EjSy+kQ+aa1vEJQooBa3ujqseP5CejMl8AyhYuPqcj3tgQ8S
From: marc.chalain@mailoo.org
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 16:57:21 +0100 (CET)
X-Priority: 3
MIME-Version: 1.0
X-Mailer: COMS/EA21.01/r20211110
Message-ID: <ea-mime-61d5bfe1-7547-225ebd37@www-7.net-c.com>
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_61d5bfe1_7547_25c5e242"
Subject: [Buildroot] package/aravis: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marc Chalain <marc.chalain@gmail.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

------=_NextPart_000_61d5bfe1_7547_25c5e242
Content-Type: multipart/alternative;
 boundary="----=_NextPart_001_61d5bfe1_7547_398570e1"

------=_NextPart_001_61d5bfe1_7547_398570e1
Content-Type: text/plain;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello and Happy new year,



I propose the integration of a camera capture library:



Aravis is a library to help GigE camera capture.
https://github.com/AravisProject/aravis/releases/tag/0.8.16
This rules install on target:
=C2=A0libaravis
=C2=A0arv-camera-test
=C2=A0arv-fake-gv-camera
=C2=A0arv-test
=C2=A0arv-tool
and on staging
=C2=A0aravis/*.h

Signed-off-by: Marc Chalain <marc.chalain@gmail.com>
---
=C2=A0DEVELOPERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
=C2=A0package/Config.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 1 +
=C2=A0package/aravis/Config.in=C2=A0=C2=A0 | 16 ++++++++++++++++
=C2=A0package/aravis/aravis.hash |=C2=A0 1 +
=C2=A0package/aravis/aravis.mk=C2=A0=C2=A0 | 20 ++++++++++++++++++++
=C2=A05 files changed, 41 insertions(+)
=C2=A0create mode 100644 package/aravis/Config.in
=C2=A0create mode 100644 package/aravis/aravis.hash
=C2=A0create mode 100644 package/aravis/aravis.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6dc2e68e42..05c1c3c921 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1653,6 +1653,9 @@ N:=C2=A0=C2=A0=C2=A0 Manuel V=C3=B6gele <develop@man=
uel-voegele.de>
=C2=A0F:=C2=A0=C2=A0=C2=A0 package/python-pyqt5/
=C2=A0F:=C2=A0=C2=A0=C2=A0 package/python-requests-toolbelt/
=C2=A0
+N:=C2=A0=C2=A0=C2=A0 Marc Chalain <marc.chalain@gmail.com>
+F:=C2=A0=C2=A0=C2=A0 package/aravis
+
=C2=A0N:=C2=A0=C2=A0=C2=A0 Marcin Bis <marcin@bis.org.pl>
=C2=A0F:=C2=A0=C2=A0=C2=A0 package/bluez5_utils/
=C2=A0F:=C2=A0=C2=A0=C2=A0 package/cc-tool/
diff --git a/package/Config.in b/package/Config.in
index 9fed0ab4cb..2a1781afe9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1698,6 +1698,7 @@ menu "Logging"
=C2=A0endmenu
=C2=A0
=C2=A0menu "Multimedia"
+=C2=A0=C2=A0=C2=A0 source "package/aravis/Config.in"
=C2=A0=C2=A0=C2=A0=C2=A0 source "package/bitstream/Config.in"
=C2=A0=C2=A0=C2=A0=C2=A0 source "package/dav1d/Config.in"
=C2=A0=C2=A0=C2=A0=C2=A0 source "package/kvazaar/Config.in"
diff --git a/package/aravis/Config.in b/package/aravis/Config.in
new file mode 100644
index 0000000000..02c71c44da
--- /dev/null
+++ b/package/aravis/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_ARAVIS
+=C2=A0=C2=A0=C2=A0 bool "aravis - GigE Camera"
+=C2=A0=C2=A0=C2=A0 depends on BR2_USE_WCHAR
+=C2=A0=C2=A0=C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_16
+=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_32
+=C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_LIBGLIB2
+=C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_LIBXML2
+=C2=A0=C2=A0=C2=A0 help
+=C2=A0=C2=A0=C2=A0 =C2=A0 aravis provides the support of GigE camera
+=C2=A0=C2=A0=C2=A0 =C2=A0 and USB3Vision camera.
+=C2=A0=C2=A0=C2=A0 =C2=A0 https://github.com/AravisProject/aravis
+
+comment "aravis needs a toolchain w/ wchar, NPTL, PCRE 16/32"
+=C2=A0=C2=A0=C2=A0 depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREAD=
S_NPTL || \
+=C2=A0=C2=A0=C2=A0 !BR2_PACKAGE_PCRE_16 || !BR2_PACKAGE_PCRE_32
diff --git a/package/aravis/aravis.hash b/package/aravis/aravis.hash
new file mode 100644
index 0000000000..f8512491ec
--- /dev/null
+++ b/package/aravis/aravis.hash
@@ -0,0 +1 @@
+sha256 057166753443acc115259ca1f74bd1b28ed4d48f35261cb248eafb8f86664bc7 a=
ravis-0.8.16.tar.gz
diff --git a/package/aravis/aravis.mk b/package/aravis/aravis.mk
new file mode 100644
index 0000000000..bd783a0374
--- /dev/null
+++ b/package/aravis/aravis.mk
@@ -0,0 +1,20 @@
+#########################################################################=
#######
+#
+# aravis
+#
+#########################################################################=
#######
+
+ARAVIS_VERSION =3D 0.8.16
+ARAVIS_SITE =3D $(call github,AravisProject,aravis,$(ARAVIS_VERSION))
+ARAVIS_DEPENDENCIES =3D \
+=C2=A0=C2=A0=C2=A0 host-pkgconf \
+=C2=A0=C2=A0=C2=A0 libglib2 \
+=C2=A0=C2=A0=C2=A0 libxml2
+ARAVIS_INSTALL_STAGING =3D YES
+ARAVIS_LICENSE =3D LGPL-2
+ARAVIS_LICENSE_FILES =3D COPYING
+ARAVIS_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
+ARAVIS_CONF_OPTS +=3D -Ddocumentation=3Ddisabled
+
+$(eval $(meson-package))
--=20
2.30.2




------=_NextPart_001_61d5bfe1_7547_398570e1
Content-Type: text/html;
 charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello and Happy new year,</div><div><br></div><div>I propose the integ=
ration of a camera capture library:<br></div><div><br></div><div>Aravis is =
a library to help GigE camera capture.</div><a href=3D"https://github.com/A=
ravisProject/aravis/releases/tag/0.8.16" rel=3D"noreferrer noopener">https:=
//github.com/AravisProject/aravis/releases/tag/0.8.16</a><br>This rules ins=
tall on target:<br>=C2=A0libaravis<br>=C2=A0arv-camera-test<br>=C2=A0arv-fa=
ke-gv-camera<br>=C2=A0arv-test<br>=C2=A0arv-tool<br>and on staging<br>=C2=
=A0aravis/*.h<br><br>Signed-off-by: Marc Chalain &lt;marc.chalain@gmail.com=
&gt;<br>---<br>=C2=A0DEVELOPERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++<br>=C2=
=A0package/Config.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 1 +<br>=C2=A0package/aravis/Config.in=C2=A0=C2=A0 | 16 ++++++++++++=
++++<br>=C2=A0package/aravis/aravis.hash |=C2=A0 1 +<br>=C2=A0package/aravi=
s/aravis.mk=C2=A0=C2=A0 | 20 ++++++++++++++++++++<br>=C2=A05 files changed,=
 41 insertions(+)<br>=C2=A0create mode 100644 package/aravis/Config.in<br>=
=C2=A0create mode 100644 package/aravis/aravis.hash<br>=C2=A0create mode 10=
0644 package/aravis/aravis.mk<br><br>diff --git a/DEVELOPERS b/DEVELOPERS<b=
r>index 6dc2e68e42..05c1c3c921 100644<br>--- a/DEVELOPERS<br>+++ b/DEVELOPE=
RS<br>@@ -1653,6 +1653,9 @@ N:=C2=A0=C2=A0=C2=A0 Manuel V=C3=B6gele &lt;dev=
elop@manuel-voegele.de&gt;<br>=C2=A0F:=C2=A0=C2=A0=C2=A0 package/python-pyq=
t5/<br>=C2=A0F:=C2=A0=C2=A0=C2=A0 package/python-requests-toolbelt/<br>=C2=
=A0<br>+N:=C2=A0=C2=A0=C2=A0 Marc Chalain &lt;marc.chalain@gmail.com&gt;<br=
>+F:=C2=A0=C2=A0=C2=A0 package/aravis<br>+<br>=C2=A0N:=C2=A0=C2=A0=C2=A0 Ma=
rcin Bis &lt;marcin@bis.org.pl&gt;<br>=C2=A0F:=C2=A0=C2=A0=C2=A0 package/bl=
uez5_utils/<br>=C2=A0F:=C2=A0=C2=A0=C2=A0 package/cc-tool/<br>diff --git a/=
package/Config.in b/package/Config.in<br>index 9fed0ab4cb..2a1781afe9 10064=
4<br>--- a/package/Config.in<br>+++ b/package/Config.in<br>@@ -1698,6 +1698=
,7 @@ menu &quot;Logging&quot;<br>=C2=A0endmenu<br>=C2=A0<br>=C2=A0menu &qu=
ot;Multimedia&quot;<br>+=C2=A0=C2=A0=C2=A0 source &quot;package/aravis/Conf=
ig.in&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 source &quot;package/bitstream/Conf=
ig.in&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 source &quot;package/dav1d/Config.i=
n&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0 source &quot;package/kvazaar/Config.in&=
quot;<br>diff --git a/package/aravis/Config.in b/package/aravis/Config.in<b=
r>new file mode 100644<br>index 0000000000..02c71c44da<br>--- /dev/null<br>=
+++ b/package/aravis/Config.in<br>@@ -0,0 +1,16 @@<br>+config BR2_PACKAGE_A=
RAVIS<br>+=C2=A0=C2=A0=C2=A0 bool &quot;aravis - GigE Camera&quot;<br>+=C2=
=A0=C2=A0=C2=A0 depends on BR2_USE_WCHAR<br>+=C2=A0=C2=A0=C2=A0 depends on =
BR2_TOOLCHAIN_HAS_THREADS_NPTL<br>+=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAG=
E_PCRE_16<br>+=C2=A0=C2=A0=C2=A0 depends on BR2_PACKAGE_PCRE_32<br>+=C2=A0=
=C2=A0=C2=A0 select BR2_PACKAGE_LIBGLIB2<br>+=C2=A0=C2=A0=C2=A0 select BR2_=
PACKAGE_LIBXML2<br>+=C2=A0=C2=A0=C2=A0 help<br>+=C2=A0=C2=A0=C2=A0 =C2=A0 a=
ravis provides the support of GigE camera<br>+=C2=A0=C2=A0=C2=A0 =C2=A0 and=
 USB3Vision camera.<br>+=C2=A0=C2=A0=C2=A0 =C2=A0 <a href=3D"https://github=
.com/AravisProject/aravis" rel=3D"noreferrer noopener">https://github.com/A=
ravisProject/aravis</a><br>+<br>+comment &quot;aravis needs a toolchain w/ =
wchar, NPTL, PCRE 16/32&quot;<br>+=C2=A0=C2=A0=C2=A0 depends on !BR2_USE_WC=
HAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \<br>+=C2=A0=C2=A0=C2=A0 !BR2_PAC=
KAGE_PCRE_16 || !BR2_PACKAGE_PCRE_32<br>diff --git a/package/aravis/aravis.=
hash b/package/aravis/aravis.hash<br>new file mode 100644<br>index 00000000=
00..f8512491ec<br>--- /dev/null<br>+++ b/package/aravis/aravis.hash<br>@@ -=
0,0 +1 @@<br>+sha256 057166753443acc115259ca1f74bd1b28ed4d48f35261cb248eafb=
8f86664bc7 aravis-0.8.16.tar.gz<br>diff --git a/package/aravis/aravis.mk b/=
package/aravis/aravis.mk<br>new file mode 100644<br>index 0000000000..bd783=
a0374<br>--- /dev/null<br>+++ b/package/aravis/aravis.mk<br>@@ -0,0 +1,20 @=
@<br>+#####################################################################=
###########<br>+#<br>+# aravis<br>+#<br>+##################################=
##############################################<br>+<br>+ARAVIS_VERSION =3D =
0.8.16<br>+ARAVIS_SITE =3D $(call github,AravisProject,aravis,$(ARAVIS_VERS=
ION))<br>+ARAVIS_DEPENDENCIES =3D \<br>+=C2=A0=C2=A0=C2=A0 host-pkgconf \<b=
r>+=C2=A0=C2=A0=C2=A0 libglib2 \<br>+=C2=A0=C2=A0=C2=A0 libxml2<br>+ARAVIS_=
INSTALL_STAGING =3D YES<br>+ARAVIS_LICENSE =3D LGPL-2<br>+ARAVIS_LICENSE_FI=
LES =3D COPYING<br>+ARAVIS_LDFLAGS =3D $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)=
<br>+<br>+ARAVIS_CONF_OPTS +=3D -Ddocumentation=3Ddisabled<br>+<br>+$(eval =
$(meson-package))<br>-- <br>2.30.2<br><br><br>

------=_NextPart_001_61d5bfe1_7547_398570e1--

------=_NextPart_000_61d5bfe1_7547_25c5e242
Content-Type: text/x-patch;
 name="0001-package-aravis-new-package.patch"
Content-Disposition: attachment;
 filename="0001-package-aravis-new-package.patch"
Content-Transfer-Encoding: base64

RnJvbSA0Y2RhYmE1YTU1N2NkMzkzODAyYjRlNTYzZTZmMGM3ZjZiY2MwODU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBtY2hhbGFpbiA8bWFyYy5jaGFsYWluQHNjYW50ZWNoLmNvbT4K
RGF0ZTogV2VkLCA1IEphbiAyMDIyIDE2OjMxOjU3ICswMTAwClN1YmplY3Q6IFtQQVRDSCAxLzFd
IHBhY2thZ2UvYXJhdmlzOiBuZXcgcGFja2FnZQoKQXJhdmlzIGlzIGEgbGlicmFyeSB0byBoZWxw
IEdpZ0UgY2FtZXJhIGNhcHR1cmUuCmh0dHBzOi8vZ2l0aHViLmNvbS9BcmF2aXNQcm9qZWN0L2Fy
YXZpcy9yZWxlYXNlcy90YWcvMC44LjE2ClRoaXMgcnVsZXMgaW5zdGFsbCBvbiB0YXJnZXQ6CiBs
aWJhcmF2aXMKIGFydi1jYW1lcmEtdGVzdAogYXJ2LWZha2UtZ3YtY2FtZXJhCiBhcnYtdGVzdAog
YXJ2LXRvb2wKYW5kIG9uIHN0YWdpbmcKIGFyYXZpcy8qLmgKClNpZ25lZC1vZmYtYnk6IE1hcmMg
Q2hhbGFpbiA8bWFyYy5jaGFsYWluQGdtYWlsLmNvbT4KLS0tCiBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgfCAgMSArCiBwYWNr
YWdlL2FyYXZpcy9Db25maWcuaW4gICB8IDE2ICsrKysrKysrKysrKysrKysKIHBhY2thZ2UvYXJh
dmlzL2FyYXZpcy5oYXNoIHwgIDEgKwogcGFja2FnZS9hcmF2aXMvYXJhdmlzLm1rICAgfCAyMCAr
KysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hcmF2aXMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9hcmF2aXMvYXJhdmlzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2FyYXZpcy9hcmF2aXMubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVS
UwppbmRleCA2ZGMyZTY4ZTQyLi4wNWMxYzNjOTIxIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisr
KyBiL0RFVkVMT1BFUlMKQEAgLTE2NTMsNiArMTY1Myw5IEBAIE46CU1hbnVlbCBWw7ZnZWxlIDxk
ZXZlbG9wQG1hbnVlbC12b2VnZWxlLmRlPgogRjoJcGFja2FnZS9weXRob24tcHlxdDUvCiBGOglw
YWNrYWdlL3B5dGhvbi1yZXF1ZXN0cy10b29sYmVsdC8KIAorTjoJTWFyYyBDaGFsYWluIDxtYXJj
LmNoYWxhaW5AZ21haWwuY29tPgorRjoJcGFja2FnZS9hcmF2aXMKKwogTjoJTWFyY2luIEJpcyA8
bWFyY2luQGJpcy5vcmcucGw+CiBGOglwYWNrYWdlL2JsdWV6NV91dGlscy8KIEY6CXBhY2thZ2Uv
Y2MtdG9vbC8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcu
aW4KaW5kZXggOWZlZDBhYjRjYi4uMmExNzgxYWZlOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25m
aWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTE2OTgsNiArMTY5OCw3IEBAIG1lbnUg
IkxvZ2dpbmciCiBlbmRtZW51CiAKIG1lbnUgIk11bHRpbWVkaWEiCisJc291cmNlICJwYWNrYWdl
L2FyYXZpcy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL2JpdHN0cmVhbS9Db25maWcuaW4i
CiAJc291cmNlICJwYWNrYWdlL2RhdjFkL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2Uva3Zh
emFhci9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FyYXZpcy9Db25maWcuaW4gYi9w
YWNrYWdlL2FyYXZpcy9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMDJjNzFjNDRkYQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvYXJhdmlzL0NvbmZp
Zy5pbgpAQCAtMCwwICsxLDE2IEBACitjb25maWcgQlIyX1BBQ0tBR0VfQVJBVklTCisJYm9vbCAi
YXJhdmlzIC0gR2lnRSBDYW1lcmEiCisJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCisJZGVwZW5k
cyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX05QVEwKKwlkZXBlbmRzIG9uIEJSMl9QQUNL
QUdFX1BDUkVfMTYKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1BDUkVfMzIKKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfTElCR0xJQjIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWE1MMgorCWhlbHAKKwkg
IGFyYXZpcyBwcm92aWRlcyB0aGUgc3VwcG9ydCBvZiBHaWdFIGNhbWVyYQorCSAgYW5kIFVTQjNW
aXNpb24gY2FtZXJhLgorCSAgaHR0cHM6Ly9naXRodWIuY29tL0FyYXZpc1Byb2plY3QvYXJhdmlz
CisKK2NvbW1lbnQgImFyYXZpcyBuZWVkcyBhIHRvb2xjaGFpbiB3LyB3Y2hhciwgTlBUTCwgUENS
RSAxNi8zMiIKKwlkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTX05QVEwgfHwgXAorCSFCUjJfUEFDS0FHRV9QQ1JFXzE2IHx8ICFCUjJfUEFDS0FH
RV9QQ1JFXzMyCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FyYXZpcy9hcmF2aXMuaGFzaCBiL3BhY2th
Z2UvYXJhdmlzL2FyYXZpcy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAuLmY4NTEyNDkxZWMKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2FyYXZpcy9hcmF2aXMu
aGFzaApAQCAtMCwwICsxIEBACitzaGEyNTYgMDU3MTY2NzUzNDQzYWNjMTE1MjU5Y2ExZjc0YmQx
YjI4ZWQ0ZDQ4ZjM1MjYxY2IyNDhlYWZiOGY4NjY2NGJjNyBhcmF2aXMtMC44LjE2LnRhci5negpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9hcmF2aXMvYXJhdmlzLm1rIGIvcGFja2FnZS9hcmF2aXMvYXJh
dmlzLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmJkNzgzYTAzNzQK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2FyYXZpcy9hcmF2aXMubWsKQEAgLTAsMCArMSwy
MCBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgYXJhdmlzCisjCisjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIworCitBUkFWSVNfVkVSU0lPTiA9IDAuOC4xNgorQVJBVklTX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLEFyYXZpc1Byb2plY3QsYXJhdmlzLCQoQVJBVklTX1ZFUlNJT04pKQorQVJB
VklTX0RFUEVOREVOQ0lFUyA9IFwKKwlob3N0LXBrZ2NvbmYgXAorCWxpYmdsaWIyIFwKKwlsaWJ4
bWwyCitBUkFWSVNfSU5TVEFMTF9TVEFHSU5HID0gWUVTCitBUkFWSVNfTElDRU5TRSA9IExHUEwt
MgorQVJBVklTX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCitBUkFWSVNfTERGTEFHUyA9ICQoVEFS
R0VUX0xERkxBR1MpICQoVEFSR0VUX05MU19MSUJTKQorCitBUkFWSVNfQ09ORl9PUFRTICs9IC1E
ZG9jdW1lbnRhdGlvbj1kaXNhYmxlZAorCiskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKLS0gCjIu
MzAuMgoK
------=_NextPart_000_61d5bfe1_7547_25c5e242
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

------=_NextPart_000_61d5bfe1_7547_25c5e242--


