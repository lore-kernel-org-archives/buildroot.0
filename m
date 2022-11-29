Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4FAC433FE
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 22:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 377D960B2B;
	Tue, 29 Nov 2022 22:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 377D960B2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oDADNLXKycUe; Tue, 29 Nov 2022 22:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B86D60BE0;
	Tue, 29 Nov 2022 22:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B86D60BE0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8011BF5AD
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2542D41675
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 22:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2542D41675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asD8yxBdpuQJ for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 22:25:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579AA415FA
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 579AA415FA
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 22:25:35 +0000 (UTC)
Received: from smtpclient.apple ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPA
 id 092hpjl0WcXav092ipHQtl; Tue, 29 Nov 2022 23:25:32 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 29 Nov 2022 23:25:29 +0100
Message-Id: <0D32AFEE-0712-48AE-A855-3FFC249371DD@benettiengineering.com>
References: <ec8d8bd9-5185-b9fb-f6cb-6aec971a5de1@mind.be>
In-Reply-To: <ec8d8bd9-5185-b9fb-f6cb-6aec971a5de1@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (20B101)
X-CMAE-Envelope: MS4xfM41+dbbIYmAkElkEjx+IiTKqzYpA+bz7+N5XFhIfykoUFsQEzmVO9TA0TZ5yYc5j50D0MhV+DLiznw9yTDaayqXYsn5jdKUKBkbYHDY2GPeQG7baAb1
 h4D+rUl7MkR02oJBX+DtxPoHlmZCyU3SSxhPHcSj+6SybcKdz3BJlOoJsMN24Hf1uJ9j01a1WZO/DMiojVnK510jPlQJE0sgkvwukRp4ZlPhpuPekmx3qlqL
 mJx4nwuj0OOIPUxU2HmwAa5y++YXb8p/gGQr2AmtlbrUGEGiZjnHrZSRi5uPhCpC
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669760732; bh=1p4j1DrUQmPyz35dzvW1IwvT5R3eEJpRv4G1Q7/ScPE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=aQ9Qi/eonfrlaoiBnAbxM2IYU65RKzOD5tgRJUUruQaegpB9P8HwjHI5056EeQwNk
 OBcJTbnvAqCQ96mU4bg1mF+8WR6CwWaglTsSfYnUsD/iSsb2gAXdpFUcTgEQyDiyf+
 7eV1tULm/Wzfi+1/yk2bkG3XJ+3X0Ty//7RitS6CzUEWuD96DYMU6JrKLB2F5PIwzO
 reUpkCcPFxAcRJh3Kov8oI/QsZdkAWzDxdELb/AZKkDSztuIhWh9PIeBJ40xUDvshR
 IR2me3QNHZ2vevsS8iDWbQYgUHT7fvXHbv8AibkhX1l0JFO5ZEtNiLG4GXntYHXesQ
 MflNOBvflqfpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=aQ9Qi/eo
Subject: Re: [Buildroot] [PATCH 2/2] package/rtl8192eu: fix build failure on
 Big Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8250391226719741085=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8250391226719741085==
Content-Type: multipart/alternative; boundary=Apple-Mail-D2C1F9F5-F3EB-41AE-825D-6135BD49EC66
Content-Transfer-Encoding: 7bit


--Apple-Mail-D2C1F9F5-F3EB-41AE-825D-6135BD49EC66
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Arnout,

> Il giorno 29 nov 2022, alle ore 23:16, Arnout Vandecappelle <arnout@mind.b=
e> ha scritto:
>=20
> =EF=BB=BF
>=20
>> On 29/11/2022 22:08, Giulio Benetti wrote:
>> Add local patch that allows to override CONFIG_LITTLE_ENDIAN in case we'r=
e
>> building for Big Endian architectures. Then let's undefine
>> CONFIG_LITTLE_ENDIAN and define endianness according to $(BR2_ENDIAN).
>> Fixes:
>> http://autobuild.buildroot.net/results/13a/13a809570423ead33628663033db4c=
3c4001a79b/
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>  ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
>>  package/rtl8192eu/rtl8192eu.mk                |  9 ++++-
>>  2 files changed, 48 insertions(+), 1 deletion(-)
>>  create mode 100644 package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USE=
R_EXTRA_CFLAGS-at-the-.patch
>> diff --git a/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA=
_CFLAGS-at-the-.patch b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-US=
ER_EXTRA_CFLAGS-at-the-.patch
>> new file mode 100644
>> index 0000000000..2f6ecfb210
>> --- /dev/null
>> +++ b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS=
-at-the-.patch
>> @@ -0,0 +1,40 @@
>> +=46rom f51cbcbeafd8d60e9b8f35b7ca62b6c941d72e3b Mon Sep 17 00:00:00 2001=

>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Wed, 28 Sep 2022 21:17:17 +0200
>> +Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS +=3D $(USER_EXTRA_CFLAGS)'=
 at the
>> + end of EXTRA_FLAGS assignment
>> +
>> +At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAG=
S
>> +since it's assigned at the beginning of the Makefile. For example it's n=
ot
>> +possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't=

>> +allow to build these modules for big endian architectures. So let's move=

>> +the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
>> +EXTRA_CFLAGS assignment.
>> +
>> +[Upstream status: https://github.com/clnhub/rtl8192eu-linux/pull/65]
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +---
>> + Makefile | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 32a1898..b67a5a4 100755
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -1,4 +1,3 @@
>> +-EXTRA_CFLAGS +=3D $(USER_EXTRA_CFLAGS)
>> + EXTRA_CFLAGS +=3D -O1
>> + #EXTRA_CFLAGS +=3D -O3
>> + #EXTRA_CFLAGS +=3D -Wall
>> +@@ -2329,6 +2328,8 @@ ifneq ($(USER_MODULE_NAME),)
>> + MODULE_NAME :=3D $(USER_MODULE_NAME)
>> + endif
>> +
>> ++EXTRA_CFLAGS +=3D $(USER_EXTRA_CFLAGS)
>> ++
>> + ifneq ($(KERNELRELEASE),)
>> +
>> + ########### this part for *.mk ############################
>> +--
>> +2.34.1
>> +
>> diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu=
.mk
>> index 0e8ffea5cb..589cb7f59e 100644
>> --- a/package/rtl8192eu/rtl8192eu.mk
>> +++ b/package/rtl8192eu/rtl8192eu.mk
>> @@ -7,9 +7,16 @@
>>  RTL8192EU_VERSION =3D 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
>>  RTL8192EU_SITE =3D $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERS=
ION))
>>  RTL8192EU_LICENSE =3D GPL-2.0
>> +
>> +# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
>> +RTL8192EU_USER_EXTRA_CLAGS =3D -UCONFIG_LITTLE_ENDIAN
>=20
> It is not actually hardcoded. The only thing that is hardcoded is CONFIG_P=
LATFORM_I386_PC=3Dy, which triggers the following fragment in the Makefile:
>=20
> ifeq ($(CONFIG_PLATFORM_I386_PC), y)
> EXTRA_CFLAGS +=3D -DCONFIG_LITTLE_ENDIAN
> EXTRA_CFLAGS +=3D -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
>=20
> SUBARCH :=3D $(shell uname -m | sed -e s/i.86/i386/)
> ARCH ?=3D $(SUBARCH)
> CROSS_COMPILE ?=3D
> KVER  :=3D $(shell uname -r)
> KSRC :=3D /lib/modules/$(KVER)/build
> MODDESTDIR :=3D /lib/modules/$(KVER)/kernel/drivers/net/wireless/
> INSTALL_PREFIX :=3D
> STAGINGMODDIR :=3D /lib/modules/$(KVER)/kernel/drivers/staging
> endif
>=20
>=20
> Clearly, all of this is rubbish in Buildroot context. So what we should do=
 is to set
>=20
> RTL8192EU_MODULE_MAKE_OPTS =3D ... CONFIG_PLATFORM_I386_PC=3Dn
>=20
> At that point, we can set all the appropriate config options we like, whic=
h would be the -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT in USER_=
EXTRA_CFLAGS.

Yes, this is another approach, but there is only a patch with my proposed so=
lution applied [1]
so maybe for consistency we could keep it the same, what about it?

Thanks for reviewing
Giulio

[1]: https://github.com/buildroot/buildroot/commit/354f9387f33b5fab023cb98e5=
2d84d58624f0ecf

>=20
>=20
> Regards,
> Arnout
>=20
>> +# Set endianness
>> +RTL8192EU_USER_EXTRA_CLAGS +=3D -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_EN=
DIAN
>> +RTL8192EU_USER_EXTRA_CLAGS +=3D -Wno-error
>> +
>>  RTL8192EU_MODULE_MAKE_OPTS =3D \
>>      CONFIG_RTL8192EU=3Dm \
>> -    USER_EXTRA_CFLAGS=3D"-Wno-error"
>> +    USER_EXTRA_CFLAGS=3D"$(RTL8192EU_USER_EXTRA_CLAGS)"
>>    define RTL8192EU_LINUX_CONFIG_FIXUPS
>>      $(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-D2C1F9F5-F3EB-41AE-825D-6135BD49EC66
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Arnout,<br><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 29 nov 2022, alle ore 23:16, Arnout Vandecappell=
e &lt;arnout@mind.be&gt; ha scritto:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span></span><br><span></span><br><sp=
an>On 29/11/2022 22:08, Giulio Benetti wrote:</span><br><blockquote type=3D"=
cite"><span>Add local patch that allows to override CONFIG_LITTLE_ENDIAN in c=
ase we're</span><br></blockquote><blockquote type=3D"cite"><span>building fo=
r Big Endian architectures. Then let's undefine</span><br></blockquote><bloc=
kquote type=3D"cite"><span>CONFIG_LITTLE_ENDIAN and define endianness accord=
ing to $(BR2_ENDIAN).</span><br></blockquote><blockquote type=3D"cite"><span=
>Fixes:</span><br></blockquote><blockquote type=3D"cite"><span>http://autobu=
ild.buildroot.net/results/13a/13a809570423ead33628663033db4c3c4001a79b/</spa=
n><br></blockquote><blockquote type=3D"cite"><span>Signed-off-by: Giulio Ben=
etti &lt;giulio.benetti@benettiengineering.com&gt;</span><br></blockquote><b=
lockquote type=3D"cite"><span>---</span><br></blockquote><blockquote type=3D=
"cite"><span> &nbsp;...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++=
++++++++++++++</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp=
;package/rtl8192eu/rtl8192eu.mk &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;9 ++++-</span><br></bl=
ockquote><blockquote type=3D"cite"><span> &nbsp;2 files changed, 48 insertio=
ns(+), 1 deletion(-)</span><br></blockquote><blockquote type=3D"cite"><span>=
 &nbsp;create mode 100644 package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-=
USER_EXTRA_CFLAGS-at-the-.patch</span><br></blockquote><blockquote type=3D"c=
ite"><span>diff --git a/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-US=
ER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8192eu/0001-Makefile-move-EXTRA_C=
FLAGS-USER_EXTRA_CFLAGS-at-the-.patch</span><br></blockquote><blockquote typ=
e=3D"cite"><span>new file mode 100644</span><br></blockquote><blockquote typ=
e=3D"cite"><span>index 0000000000..2f6ecfb210</span><br></blockquote><blockq=
uote type=3D"cite"><span>--- /dev/null</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>+++ b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-US=
ER_EXTRA_CFLAGS-at-the-.patch</span><br></blockquote><blockquote type=3D"cit=
e"><span>@@ -0,0 +1,40 @@</span><br></blockquote><blockquote type=3D"cite"><=
span>+=46rom f51cbcbeafd8d60e9b8f35b7ca62b6c941d72e3b Mon Sep 17 00:00:00 20=
01</span><br></blockquote><blockquote type=3D"cite"><span>+From: Giulio Bene=
tti &lt;giulio.benetti@benettiengineering.com&gt;</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+Date: Wed, 28 Sep 2022 21:17:17 +0200</span><b=
r></blockquote><blockquote type=3D"cite"><span>+Subject: [PATCH] Makefile: m=
ove 'EXTRA_CFLAGS +=3D $(USER_EXTRA_CFLAGS)' at the</span><br></blockquote><=
blockquote type=3D"cite"><span>+ end of EXTRA_FLAGS assignment</span><br></b=
lockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><blockquo=
te type=3D"cite"><span>+At the moment USER_EXTRA_CFLAGS can't override local=
 Makfile EXTRA_CFLAGS</span><br></blockquote><blockquote type=3D"cite"><span=
>+since it's assigned at the beginning of the Makefile. For example it's not=
</span><br></blockquote><blockquote type=3D"cite"><span>+possible to undefin=
e the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't</span><br></blockquote=
><blockquote type=3D"cite"><span>+allow to build these modules for big endia=
n architectures. So let's move</span><br></blockquote><blockquote type=3D"ci=
te"><span>+the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the las=
t</span><br></blockquote><blockquote type=3D"cite"><span>+EXTRA_CFLAGS assig=
nment.</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></=
blockquote><blockquote type=3D"cite"><span>+[Upstream status: https://github=
.com/clnhub/rtl8192eu-linux/pull/65]</span><br></blockquote><blockquote type=
=3D"cite"><span>+Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettieng=
ineering.com&gt;</span><br></blockquote><blockquote type=3D"cite"><span>+---=
</span><br></blockquote><blockquote type=3D"cite"><span>+ Makefile | 3 ++-</=
span><br></blockquote><blockquote type=3D"cite"><span>+ 1 file changed, 2 in=
sertions(+), 1 deletion(-)</span><br></blockquote><blockquote type=3D"cite">=
<span>+</span><br></blockquote><blockquote type=3D"cite"><span>+diff --git a=
/Makefile b/Makefile</span><br></blockquote><blockquote type=3D"cite"><span>=
+index 32a1898..b67a5a4 100755</span><br></blockquote><blockquote type=3D"ci=
te"><span>+--- a/Makefile</span><br></blockquote><blockquote type=3D"cite"><=
span>++++ b/Makefile</span><br></blockquote><blockquote type=3D"cite"><span>=
+@@ -1,4 +1,3 @@</span><br></blockquote><blockquote type=3D"cite"><span>+-EX=
TRA_CFLAGS +=3D $(USER_EXTRA_CFLAGS)</span><br></blockquote><blockquote type=
=3D"cite"><span>+ EXTRA_CFLAGS +=3D -O1</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+ #EXTRA_CFLAGS +=3D -O3</span><br></blockquote><blockquo=
te type=3D"cite"><span>+ #EXTRA_CFLAGS +=3D -Wall</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+@@ -2329,6 +2328,8 @@ ifneq ($(USER_MODULE_NAM=
E),)</span><br></blockquote><blockquote type=3D"cite"><span>+ MODULE_NAME :=3D=
 $(USER_MODULE_NAME)</span><br></blockquote><blockquote type=3D"cite"><span>=
+ endif</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br><=
/blockquote><blockquote type=3D"cite"><span>++EXTRA_CFLAGS +=3D $(USER_EXTRA=
_CFLAGS)</span><br></blockquote><blockquote type=3D"cite"><span>++</span><br=
></blockquote><blockquote type=3D"cite"><span>+ ifneq ($(KERNELRELEASE),)</s=
pan><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquot=
e><blockquote type=3D"cite"><span>+ ########### this part for *.mk #########=
###################</span><br></blockquote><blockquote type=3D"cite"><span>+=
--</span><br></blockquote><blockquote type=3D"cite"><span>+2.34.1</span><br>=
</blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><block=
quote type=3D"cite"><span>diff --git a/package/rtl8192eu/rtl8192eu.mk b/pack=
age/rtl8192eu/rtl8192eu.mk</span><br></blockquote><blockquote type=3D"cite">=
<span>index 0e8ffea5cb..589cb7f59e 100644</span><br></blockquote><blockquote=
 type=3D"cite"><span>--- a/package/rtl8192eu/rtl8192eu.mk</span><br></blockq=
uote><blockquote type=3D"cite"><span>+++ b/package/rtl8192eu/rtl8192eu.mk</s=
pan><br></blockquote><blockquote type=3D"cite"><span>@@ -7,9 +7,16 @@</span>=
<br></blockquote><blockquote type=3D"cite"><span> &nbsp;RTL8192EU_VERSION =3D=
 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0</span><br></blockquote><blockquote=
 type=3D"cite"><span> &nbsp;RTL8192EU_SITE =3D $(call github,clnhub,rtl8192e=
u-linux,$(RTL8192EU_VERSION))</span><br></blockquote><blockquote type=3D"cit=
e"><span> &nbsp;RTL8192EU_LICENSE =3D GPL-2.0</span><br></blockquote><blockq=
uote type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"cite">=
<span>+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN</span><br></blockquote>=
<blockquote type=3D"cite"><span>+RTL8192EU_USER_EXTRA_CLAGS =3D -UCONFIG_LIT=
TLE_ENDIAN</span><br></blockquote><span></span><br><span> It is not actually=
 hardcoded. The only thing that is hardcoded is CONFIG_PLATFORM_I386_PC=3Dy,=
 which triggers the following fragment in the Makefile:</span><br><span></sp=
an><br><span>ifeq ($(CONFIG_PLATFORM_I386_PC), y)</span><br><span>EXTRA_CFLA=
GS +=3D -DCONFIG_LITTLE_ENDIAN</span><br><span>EXTRA_CFLAGS +=3D -DCONFIG_IO=
CTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT</span><br><span></span><br><span>S=
UBARCH :=3D $(shell uname -m | sed -e s/i.86/i386/)</span><br><span>ARCH ?=3D=
 $(SUBARCH)</span><br><span>CROSS_COMPILE ?=3D</span><br><span>KVER &nbsp;:=3D=
 $(shell uname -r)</span><br><span>KSRC :=3D /lib/modules/$(KVER)/build</spa=
n><br><span>MODDESTDIR :=3D /lib/modules/$(KVER)/kernel/drivers/net/wireless=
/</span><br><span>INSTALL_PREFIX :=3D</span><br><span>STAGINGMODDIR :=3D /li=
b/modules/$(KVER)/kernel/drivers/staging</span><br><span>endif</span><br><sp=
an></span><br><span></span><br><span>Clearly, all of this is rubbish in Buil=
droot context. So what we should do is to set</span><br><span></span><br><sp=
an>RTL8192EU_MODULE_MAKE_OPTS =3D ... CONFIG_PLATFORM_I386_PC=3Dn</span><br>=
<span></span><br><span>At that point, we can set all the appropriate config o=
ptions we like, which would be the -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG8021=
1_STA_EVENT in USER_EXTRA_CFLAGS.</span><br></div></blockquote><div><br></di=
v><div>Yes, this is another approach, but there is only a patch with my prop=
osed solution applied [1]</div><div>so maybe for consistency we could keep i=
t the same, what about it?</div><div><br></div><div>Thanks for reviewing</di=
v><div>Giulio</div><div><br></div><div>[1]:&nbsp;<a href=3D"https://github.c=
om/buildroot/buildroot/commit/354f9387f33b5fab023cb98e52d84d58624f0ecf">http=
s://github.com/buildroot/buildroot/commit/354f9387f33b5fab023cb98e52d84d5862=
4f0ecf</a></div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span>=
<br><span></span><br><span> Regards,</span><br><span> Arnout</span><br><span=
></span><br><blockquote type=3D"cite"><span>+# Set endianness</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+RTL8192EU_USER_EXTRA_CLAGS +=3D -D=
CONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN</span><br></blockquote><blockquot=
e type=3D"cite"><span>+RTL8192EU_USER_EXTRA_CLAGS +=3D -Wno-error</span><br>=
</blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><block=
quote type=3D"cite"><span> &nbsp;RTL8192EU_MODULE_MAKE_OPTS =3D \</span><br>=
</blockquote><blockquote type=3D"cite"><span> &nbsp; &nbsp; &nbsp;CONFIG_RTL=
8192EU=3Dm \</span><br></blockquote><blockquote type=3D"cite"><span>- &nbsp;=
 &nbsp;USER_EXTRA_CFLAGS=3D"-Wno-error"</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+ &nbsp; &nbsp;USER_EXTRA_CFLAGS=3D"$(RTL8192EU_USER_EXTR=
A_CLAGS)"</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbs=
p;&nbsp;define RTL8192EU_LINUX_CONFIG_FIXUPS</span><br></blockquote><blockqu=
ote type=3D"cite"><span> &nbsp; &nbsp; &nbsp;$(call KCONFIG_ENABLE_OPT,CONFI=
G_NET)</span><br></blockquote><span>________________________________________=
_______</span><br><span>buildroot mailing list</span><br><span>buildroot@bui=
ldroot.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/buil=
droot</span><br></div></blockquote></body></html>=

--Apple-Mail-D2C1F9F5-F3EB-41AE-825D-6135BD49EC66--

--===============8250391226719741085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8250391226719741085==--
