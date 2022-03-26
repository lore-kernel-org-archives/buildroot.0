Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00308C433F5
	for <buildroot@archiver.kernel.org>; Sat, 26 Mar 2022 16:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8207982AB6;
	Sat, 26 Mar 2022 16:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z8nSUH8xd7Wt; Sat, 26 Mar 2022 16:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AE6382A6C;
	Sat, 26 Mar 2022 16:52:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 894D61BF3E9
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 786B241578
 for <buildroot@lists.busybox.net>; Sat, 26 Mar 2022 16:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1jkjSD-WtlX for <buildroot@lists.busybox.net>;
 Sat, 26 Mar 2022 16:52:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D27C41574
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 16:52:26 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id l128so11450473vsc.7
 for <buildroot@buildroot.org>; Sat, 26 Mar 2022 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VJ0yY1ePkq9YF0qk6AeOePsfWbnz6PSfXjzfoqMtK68=;
 b=qtZuLjLXh8hJdg1VknQY7nWw2vMae7mzeLzsM2fFtvx+g9/5QX+sS3F6FhhHAI2xtw
 NawXoYhb7NOkCrARNBSef2kLEw9cQW7umglUfsDak4VL8Kzu9hwVOwOt70KMgRggXs8r
 u/6q7f42jfEYIjMYAx17HOexinXWo7EkjihycKE1jMU0K2Mgu3Tysa1SAhtRcDOGD3PN
 CpGqqytm6S8vPgY1rzZeNG6hgHL2fHjJ6mKKT6CPdB+ABPnjqVM+UFqREyyyi2tF5tKP
 dtyb9ncm6pO/TwUmbr9TymnVq6Gc7o4VPiprjXM2L/Na2YCh77frfjRq07ygTezJ79+r
 jw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VJ0yY1ePkq9YF0qk6AeOePsfWbnz6PSfXjzfoqMtK68=;
 b=jyUVtB7QOeYNheM521p/jnlTQ0sI0ZBdu2pjMqxBbFqjOjxRRxKDkXORFnGOrlsL78
 98anjgsMzLCB97yvswgaK6K6BAgnNIdvUlPsZXupLole2BAZ6j1IckVNr81KXKLekEHR
 ZZpzu7CqBhLT/ND/2npcek6silOIL3vxFppu/Nxuc8hJNnoGnBltTZmSspNlK9av/V2i
 Yaafl4502oG+DiqSv5UtvezQhubQdTJ0tGAoiZuCQZeLz3WlX4PUyYWO/6vp26i32BHF
 MRdm6+LHNxINbl3MuRd9icoGV4DI9b04FJAnVDyIOQ533DdZ3D67h2FIUGkmj5bh400J
 S7cQ==
X-Gm-Message-State: AOAM533uYsNDR07NGVHlkBGkQM0Hq17b8FguBaA50nUqTfGeBJ3hWF7J
 Uwy+KNCCNtpC9gwUFf6tzUe9TNOlO2srSkoorfnS2T/znXs=
X-Google-Smtp-Source: ABdhPJySaoWWC35uid3BC0wY7qiTW85RsPSHAe8EWyhww0ks4YzfV7KUHaOuZEkz9CDTnDLrWCisLEo0gI1hoKTRI6E=
X-Received: by 2002:a05:6102:34d8:b0:325:539c:f7f6 with SMTP id
 a24-20020a05610234d800b00325539cf7f6mr6965902vst.86.1648313545052; Sat, 26
 Mar 2022 09:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAN5CKbfJWXWZ2sQhOf-=81p+h-9QkZgRbegAnXHLPRn78XxNKg@mail.gmail.com>
 <4470C393-DAE8-4385-A817-9895CF2CFECC@0leil.net>
 <CAN5CKbdDQi+2q6Zis5QyerNY7r=n0sH_AF61_5xejHyFqEx4FQ@mail.gmail.com>
In-Reply-To: <CAN5CKbdDQi+2q6Zis5QyerNY7r=n0sH_AF61_5xejHyFqEx4FQ@mail.gmail.com>
From: snathick <snathicktechno@gmail.com>
Date: Sat, 26 Mar 2022 09:52:13 -0700
Message-ID: <CAN5CKbfFYxnSZWdqFetxZfe-eWUuOyxkVP6yjh4+6ufTTH3yZw@mail.gmail.com>
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Subject: Re: [Buildroot] Python package integration
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
Content-Type: multipart/mixed; boundary="===============7618785522762109839=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7618785522762109839==
Content-Type: multipart/alternative; boundary="00000000000054d50005db21e76d"

--00000000000054d50005db21e76d
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working with integrating below package to buildroot
https://github.com/richteel/TeelSys_Python_SHT

locally computed sha256 and .hash as follows
sha256  d62efb2207390e623cf7c6067606f300a68cb2d0a448c93368302d3fa0d50b87
 python-sht21-84398b3267158d15e2322878294c0d7e0e6fa78d.tar.gz
sha256  5979e787d347e88357e5e8d70c446e9b082c40c32014ec632942aaed0a218e73
 LICENSE

when building error with hash mismatch

ERROR: python-sht21-84398b3267158d15e2322878294c0d7e0e6fa78d.tar.gz has
wrong sha256 hash
ERROR: expected:
d62efb2207390e623cf7c6067606f300a68cb2d0a448c93368302d3fa0d50b87
ERROR: got     :
88696f8d6961cda3c52676607dde37ae7825ab0567364dc4a0162d964ad6266e
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

hash generated was perfect, but how it got generated  hash
88696f8d6961cda3c52676607dde37ae7825ab0567364dc4a0162d964ad6266e not
understanding

Any suggestions to resolve this issue?



Thanks,
Snathick

On Thu, Mar 24, 2022 at 1:35 PM snathick <snathicktechno@gmail.com> wrote:

> Hi quentin,
>
> Thanks for the response and suggestions.
>
> As per your suggestion modified .mk as follows
>
> ################################################################################
> #
> # python-sht21
> #
>
> ################################################################################
>
> PYTHON_SHT21_SITE = $(call
> github,richteel,TeelSys_Python_SHT,84398b3267158d15e2322878294c0d7e0e6fa78d))
> PYTHON_SHT21_LICENSE = MIT
> PYTHON_SHT21_LICENSE_FILES = LICENSE
> PYTHON_SHT21_SETUP_TYPE = setuptools
>
> $(eval $(python-package))
>
> observed that package is not downloading make is failing informing that
> output/build/python-sht21 no setup.py is present
>
> Any suggestions
>
>
> On Thu, Mar 24, 2022 at 12:08 PM Quentin Schulz <foss+buildroot@0leil.net>
> wrote:
>
>> Hi,
>>
>> On March 24, 2022 5:49:46 AM GMT+01:00, snathick <
>> snathicktechno@gmail.com> wrote:
>> >Hi,
>> >
>> >I am trying to add the below python package to buildroot
>> >
>> >https://github.com/richteel/TeelSys_Python_SHT
>> >
>> >
>> >.mk file as follows
>> >
>>
>> >################################################################################
>> >#
>> ># python-sht21
>> >#
>>
>> >################################################################################
>> >
>> >PYTHON_SHT21_VERSION = 1.0
>> >PYTHON_SHT21_SOURCE = pysht21-$(PYTHON_SHT21_VERSION).tar.gz
>> >PYTHON_SHT21_SITE = https://github.com/richteel/TeelSys_Python_SHT
>>
>> I think this is one of the issues.
>>
>> The documentation (
>> https://buildroot.org/downloads/manual/manual.html#github-download-url)
>> states that you should use:
>> PYTHON_SHT21_SITE = $(call
>> github,richteel,TeelSys_Python_SHT,$(PYTHON_SHT21_VERSION))
>>
>> I also don't think there's a need for PYTHON_SHT21_SOURCE since Buildroot
>> will figure it out from _SITE variable here.
>>
>> Finally, I couldn't see tags or releases on this github repo, so you want
>> to pass a commit id to PYTHON_SHT21_VERSION, e.g.
>> 84398b3267158d15e2322878294c0d7e0e6fa78d for the last commit in master
>> branch.
>>
>> >PYTHON_SHT21_LICENSE = BSD
>>
>> It's actually MIT.
>>
>> Cheers,
>> Quentin
>>
>> >PYTHON_SHT21_LICENSE_FILES = LICENSE
>> >PYTHON_SHT21_SETUP_TYPE = setuptools
>> >
>> >$(eval $(python-package))
>> >
>> >make command giving following error
>> >
>> >wget --passive-ftp -nd -t 3 -O
>> >'/home/snathick/buildroot/output/build/.pysht21-1.0.uyWYsC/output' '
>> >http://sources.buildroot.net/pysht21-1.0'
>> >--2022-03-24 08:57:12--  http://sources.buildroot.net/pysht21-1.0
>> >Resolving sources.buildroot.net (sources.buildroot.net)... 172.67.72.56,
>> >104.26.0.37, 104.26.1.37, ...
>> >Connecting to sources.buildroot.net (sources.buildroot.net
>> )|172.67.72.56|:80...
>> >connected.
>> >HTTP request sent, awaiting response... 404 Not Found
>> >2022-03-24 08:57:13 ERROR 404: Not Found.
>> >
>> >package/pkg-generic.mk:185: recipe for target
>>
>> >'/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded'
>> >failed
>> >make[1]: ***
>>
>> >[/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_downloaded]
>> >Error 1
>> >Makefile:84: recipe for target '_all' failed
>> >make: *** [_all] Error 2
>> >
>> >
>> >Any suggestions to resolve the issue
>> >
>> >
>> >
>> >
>>
>
>
> --
> Thanks & Regards,
> Snathick
>


-- 
Thanks & Regards,
Snathick

--00000000000054d50005db21e76d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am working with integr=
ating below package to buildroot <br></div><div><a href=3D"https://github.c=
om/richteel/TeelSys_Python_SHT">https://github.com/richteel/TeelSys_Python_=
SHT</a></div><div><br></div><div>locally computed sha256 and .hash as follo=
ws</div><div>sha256 =C2=A0d62efb2207390e623cf7c6067606f300a68cb2d0a448c9336=
8302d3fa0d50b87 =C2=A0python-sht21-84398b3267158d15e2322878294c0d7e0e6fa78d=
.tar.gz<br>sha256 =C2=A05979e787d347e88357e5e8d70c446e9b082c40c32014ec63294=
2aaed0a218e73 =C2=A0LICENSE</div><div><br></div><div>when building error wi=
th hash mismatch <br></div><div><br></div><div>ERROR: python-sht21-84398b32=
67158d15e2322878294c0d7e0e6fa78d.tar.gz has wrong sha256 hash<br>ERROR: exp=
ected: d62efb2207390e623cf7c6067606f300a68cb2d0a448c93368302d3fa0d50b87<br>=
ERROR: got =C2=A0 =C2=A0 : 88696f8d6961cda3c52676607dde37ae7825ab0567364dc4=
a0162d964ad6266e</div><div>ERROR: Incomplete download, or man-in-the-middle=
 (MITM) attack</div><div><br></div><div>hash generated was perfect, but how=
 it got generated=C2=A0 hash 88696f8d6961cda3c52676607dde37ae7825ab0567364d=
c4a0162d964ad6266e not understanding<br></div><div><br></div><div>Any sugge=
stions to resolve this issue?</div><div><br></div><div><br></div><div><br><=
/div><div>Thanks,</div><div>Snathick<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 24, 2022 at 1:35 =
PM snathick &lt;<a href=3D"mailto:snathicktechno@gmail.com">snathicktechno@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hi quentin,</div><div><br></div><div>Thank=
s for the response and suggestions.</div><div><br></div><div>As per your su=
ggestion modified .mk as follows</div><div>################################=
################################################<br>#<br># python-sht21<br>=
#<br>######################################################################=
##########<br><br>PYTHON_SHT21_SITE =3D $(call github,richteel,TeelSys_Pyth=
on_SHT,84398b3267158d15e2322878294c0d7e0e6fa78d))<br>PYTHON_SHT21_LICENSE =
=3D MIT<br>PYTHON_SHT21_LICENSE_FILES =3D LICENSE<br>PYTHON_SHT21_SETUP_TYP=
E =3D setuptools<br><br>$(eval $(python-package))</div><div><br></div><div>=
observed that package is not downloading make is failing informing that <br=
></div><div>output/build/python-sht21 no setup.py is present <br></div><div=
><br></div><div></div><div>Any suggestions <br></div><div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Mar 24, 2022 at 12:08 PM Quentin Schulz &lt;<a href=3D"mailto:foss%2Bbuild=
root@0leil.net" target=3D"_blank">foss+buildroot@0leil.net</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On March 24, 2022 5:49:46 AM GMT+01:00, snathick &lt;<a href=3D"mailto:snat=
hicktechno@gmail.com" target=3D"_blank">snathicktechno@gmail.com</a>&gt; wr=
ote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;I am trying to add the below python package to buildroot<br>
&gt;<br>
&gt;<a href=3D"https://github.com/richteel/TeelSys_Python_SHT" rel=3D"noref=
errer" target=3D"_blank">https://github.com/richteel/TeelSys_Python_SHT</a>=
<br>
&gt;<br>
&gt;<br>
&gt;.mk file as follows<br>
&gt;<br>
&gt;#######################################################################=
#########<br>
&gt;#<br>
&gt;# python-sht21<br>
&gt;#<br>
&gt;#######################################################################=
#########<br>
&gt;<br>
&gt;PYTHON_SHT21_VERSION =3D 1.0<br>
&gt;PYTHON_SHT21_SOURCE =3D pysht21-$(PYTHON_SHT21_VERSION).tar.gz<br>
&gt;PYTHON_SHT21_SITE =3D <a href=3D"https://github.com/richteel/TeelSys_Py=
thon_SHT" rel=3D"noreferrer" target=3D"_blank">https://github.com/richteel/=
TeelSys_Python_SHT</a><br>
<br>
I think this is one of the issues.<br>
<br>
The documentation (<a href=3D"https://buildroot.org/downloads/manual/manual=
.html#github-download-url" rel=3D"noreferrer" target=3D"_blank">https://bui=
ldroot.org/downloads/manual/manual.html#github-download-url</a>) states tha=
t you should use:<br>
PYTHON_SHT21_SITE =3D $(call github,richteel,TeelSys_Python_SHT,$(PYTHON_SH=
T21_VERSION))<br>
<br>
I also don&#39;t think there&#39;s a need for PYTHON_SHT21_SOURCE since Bui=
ldroot will figure it out from _SITE variable here.<br>
<br>
Finally, I couldn&#39;t see tags or releases on this github repo, so you wa=
nt to pass a commit id to PYTHON_SHT21_VERSION, e.g. 84398b3267158d15e23228=
78294c0d7e0e6fa78d for the last commit in master branch.<br>
<br>
&gt;PYTHON_SHT21_LICENSE =3D BSD<br>
<br>
It&#39;s actually MIT.<br>
<br>
Cheers,<br>
Quentin<br>
<br>
&gt;PYTHON_SHT21_LICENSE_FILES =3D LICENSE<br>
&gt;PYTHON_SHT21_SETUP_TYPE =3D setuptools<br>
&gt;<br>
&gt;$(eval $(python-package))<br>
&gt;<br>
&gt;make command giving following error<br>
&gt;<br>
&gt;wget --passive-ftp -nd -t 3 -O<br>
&gt;&#39;/home/snathick/buildroot/output/build/.pysht21-1.0.uyWYsC/output&#=
39; &#39;<br>
&gt;<a href=3D"http://sources.buildroot.net/pysht21-1.0" rel=3D"noreferrer"=
 target=3D"_blank">http://sources.buildroot.net/pysht21-1.0</a>&#39;<br>
&gt;--2022-03-24 08:57:12--=C2=A0 <a href=3D"http://sources.buildroot.net/p=
ysht21-1.0" rel=3D"noreferrer" target=3D"_blank">http://sources.buildroot.n=
et/pysht21-1.0</a><br>
&gt;Resolving <a href=3D"http://sources.buildroot.net" rel=3D"noreferrer" t=
arget=3D"_blank">sources.buildroot.net</a> (<a href=3D"http://sources.build=
root.net" rel=3D"noreferrer" target=3D"_blank">sources.buildroot.net</a>)..=
. 172.67.72.56,<br>
&gt;104.26.0.37, 104.26.1.37, ...<br>
&gt;Connecting to <a href=3D"http://sources.buildroot.net" rel=3D"noreferre=
r" target=3D"_blank">sources.buildroot.net</a> (<a href=3D"http://sources.b=
uildroot.net" rel=3D"noreferrer" target=3D"_blank">sources.buildroot.net</a=
>)|172.67.72.56|:80...<br>
&gt;connected.<br>
&gt;HTTP request sent, awaiting response... 404 Not Found<br>
&gt;2022-03-24 08:57:13 ERROR 404: Not Found.<br>
&gt;<br>
&gt;package/<a href=3D"http://pkg-generic.mk:185" rel=3D"noreferrer" target=
=3D"_blank">pkg-generic.mk:185</a>: recipe for target<br>
&gt;&#39;/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_down=
loaded&#39;<br>
&gt;failed<br>
&gt;make[1]: ***<br>
&gt;[/home/snathick/buildroot/output/build/python-sht21-1.0/.stamp_download=
ed]<br>
&gt;Error 1<br>
&gt;Makefile:84: recipe for target &#39;_all&#39; failed<br>
&gt;make: *** [_all] Error 2<br>
&gt;<br>
&gt;<br>
&gt;Any suggestions to resolve the issue<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Thanks &amp; Regards,</div><div>Snathick<br></div></div></div=
>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Thanks &amp; Regards,</div><div>Snath=
ick<br></div></div></div>

--00000000000054d50005db21e76d--

--===============7618785522762109839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7618785522762109839==--
