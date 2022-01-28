Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1A9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 03:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EAA241649;
	Fri, 28 Jan 2022 03:59:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWOzMCrKxCmC; Fri, 28 Jan 2022 03:59:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05F6E41632;
	Fri, 28 Jan 2022 03:59:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8634E1BF275
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 03:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 750898340C
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 03:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fHiUnoHXNBca for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 03:59:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A6CEA833D3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 03:59:35 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id n15so6984298uaq.5
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 19:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Fcv3sXYmP0dLVPCBb6AezHSzk2nluP2td9g6AcdZ7oE=;
 b=Jj7vSwptNhR54qhjoac4VnOZ657+onha5mwUX3FSxY8zPhr83vNNXYMc7+6+QoZsgT
 vd8cGnJREKicHhJHaGKtsgVDlsHLYHI13nUS4lik3Jfj5Zw1Z5WKCCb8MQu+lrM25rsK
 Gm4vVsPbSK81/rkkwdtZJ7sBOigQYvd1hlB3gfxm57Khs6ZnUKUT58Xc+SPCvHI/Ntxm
 YDndHyaIjLytmOPOlHFs8jtq/i7uMJldE3Ej60bb685HsorCk5lLdtbObL4KIlxbi+qA
 az8TC+SKr91T5i45Iy+4MX1rHDwNJYIiJbeC9b4uITaRjpgr9wzg2Nyi8bGBhk7nyD+L
 fB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Fcv3sXYmP0dLVPCBb6AezHSzk2nluP2td9g6AcdZ7oE=;
 b=YLcMOWtz+qPfLP3tW7HCbOtjjZV6XoXxLxdODOumYY+dcpOSUShsH2zjJSIFVxIC8J
 8tdTO9LRsHCeAzLQ9ACDWtcL5XXzICthnswtGJHyeoX96+DY9yGti8lLi4U4VKCX7WNP
 gZqmgNkaVhJBmclsC7Gnav962EdwbLkUns1aYDVgO8x3lyfO8I9k0qsY0Ze4zcvz09tf
 3cwn0HGCSthqo8BhYWuTXSSUs5YthinKnpAQBsinWG4D8wMaw8TvifS5gCEOIN0EbPe7
 CpgqmoPr5nu/gaqjPbwtltf9eQPk633op441R8AwdcNdA/oFcnqoO/vHw6fwAjslCWMv
 I35g==
X-Gm-Message-State: AOAM533cmZAmiaMNd8Wjhmn7InXXlVGFZbUlxzf/c3fb554IvDFFQs2k
 +gGSLEZJwpzTYI5EIZEXjxasfHC745PSBCLk6t2mjgFN3RM=
X-Google-Smtp-Source: ABdhPJw00LqPTFoLqRgEXdYNsCFEvPu4FzrYUn1I940NPD87vhJEP+QB25IcWMGegoD80olGY1TnNAR70hXtBiEjIU4=
X-Received: by 2002:a9f:26a6:: with SMTP id 35mr3333250uay.98.1643342374334;
 Thu, 27 Jan 2022 19:59:34 -0800 (PST)
MIME-Version: 1.0
From: Chris <cheart0@gmail.com>
Date: Fri, 28 Jan 2022 12:59:23 +0900
Message-ID: <CAA6F-SOWP+gotpC8jtANa8-GZRu7ZvwcQuEMH_uNc54Yb0ibPQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] swupdate suricatta build error
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
Content-Type: multipart/mixed; boundary="===============6748048870440827360=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6748048870440827360==
Content-Type: multipart/alternative; boundary="00000000000077775205d69c7617"

--00000000000077775205d69c7617
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, there
Did anybody ever see the same issue? When build 2021.11 for raspberry pi,
we added swupdate package and enabled suricatta mode by "make
swupdate-menuconfig", then we got error as below,

suricatta/common.c:79:26: error: storage size of =E2=80=98json_res=E2=80=99=
 isn=E2=80=99t known
   79 |  enum json_tokener_error json_res;
      |                          ^~~~~~~~
suricatta/common.c:82:15: warning: implicit declaration of function
=E2=80=98json_tokener_parse_ex=E2=80=99 [-Wimplicit-function-declaration]
   82 |   json_root =3D json_tokener_parse_ex(
      |               ^~~~~~~~~~~~~~~~~~~~~
suricatta/common.c:82:13: warning: assignment to =E2=80=98struct json_objec=
t *=E2=80=99
from =E2=80=98int=E2=80=99 makes pointer from integer without a cast [-Wint=
-conversion]
   82 |   json_root =3D json_tokener_parse_ex(
      |             ^
suricatta/common.c:84:23: warning: implicit declaration of function
=E2=80=98json_tokener_get_error=E2=80=99 [-Wimplicit-function-declaration]
   84 |  } while ((json_res =3D json_tokener_get_error(json_tokenizer)) =3D=
=3D
      |                       ^~~~~~~~~~~~~~~~~~~~~~
suricatta/common.c:85:4: error: =E2=80=98json_tokener_continue=E2=80=99 und=
eclared (first
use in this function)
   85 |    json_tokener_continue);
      |    ^~~~~~~~~~~~~~~~~~~~~
suricatta/common.c:85:4: note: each undeclared identifier is reported only
once for each function it appears in
suricatta/common.c:86:18: error: =E2=80=98json_tokener_success=E2=80=99 und=
eclared (first
use in this function); did you mean =E2=80=98json_tokener_error=E2=80=99?
   86 |  if (json_res !=3D json_tokener_success) {
      |                  ^~~~~~~~~~~~~~~~~~~~
      |                  json_tokener_error
suricatta/suricatta.c:17:10: fatal error: json-c/json.h: No such file or
directory
   17 | #include <json-c/json.h>


   - host machine (OS/release) --Linux MINT20
   - version of Buildroot--2021.11
   - target for which the build fails--raspberry pi b
   - package(s) for which the build fails--swupdate
   - the command that fails and its output--as posted above
   - any information you think that may be relevant


Thanks
Chris

--00000000000077775205d69c7617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, there<div>Did anybody ever see the same issue? When bu=
ild 2021.11 for raspberry pi, we added swupdate package and enabled=C2=A0su=
ricatta mode by &quot;make swupdate-menuconfig&quot;, then we got error as =
below,</div><div><br></div><div>suricatta/common.c:79:26: error: storage si=
ze of =E2=80=98json_res=E2=80=99 isn=E2=80=99t known<br>=C2=A0 =C2=A079 | =
=C2=A0enum json_tokener_error json_res;<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~<br>suricatta/common.c:82:15: warning: implicit declarati=
on of function =E2=80=98json_tokener_parse_ex=E2=80=99 [-Wimplicit-function=
-declaration]<br>=C2=A0 =C2=A082 | =C2=A0 json_root =3D json_tokener_parse_=
ex(<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^~~~~~~~~~~~~~~~~~~~~<br>suricatta/common.c:82:13: warning: assignment =
to =E2=80=98struct json_object *=E2=80=99 from =E2=80=98int=E2=80=99 makes =
pointer from integer without a cast [-Wint-conversion]<br>=C2=A0 =C2=A082 |=
 =C2=A0 json_root =3D json_tokener_parse_ex(<br>=C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>suricatta/common.c:84:23: warni=
ng: implicit declaration of function =E2=80=98json_tokener_get_error=E2=80=
=99 [-Wimplicit-function-declaration]<br>=C2=A0 =C2=A084 | =C2=A0} while ((=
json_res =3D json_tokener_get_error(json_tokenizer)) =3D=3D<br>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~<br>suricatta/common.c:85:4: error: =
=E2=80=98json_tokener_continue=E2=80=99 undeclared (first use in this funct=
ion)<br>=C2=A0 =C2=A085 | =C2=A0 =C2=A0json_tokener_continue);<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~<br>suricatta/common.c:85=
:4: note: each undeclared identifier is reported only once for each functio=
n it appears in<br>suricatta/common.c:86:18: error: =E2=80=98json_tokener_s=
uccess=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98json_tokener_error=E2=80=99?<br>=C2=A0 =C2=A086 | =C2=A0if (json_res =
!=3D json_tokener_success) {<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~<br>=C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0json_tokener_error<br>suricatta/suricatta.c:17:10: fatal error: json-c/j=
son.h: No such file or directory<br>=C2=A0 =C2=A017 | #include &lt;json-c/j=
son.h&gt;<br></div><div><br></div><div><ul style=3D"box-sizing:inherit;marg=
in:0.9375rem 0px 0px;padding-left:1.875rem;color:rgb(32,33,36);font-family:=
&quot;SF Pro Display&quot;,&quot;Segoe UI&quot;,&quot;Open Sans&quot;,&quot=
;Clear Sans&quot;,&quot;Helvetica Neue&quot;,Helvetica,Oxygen-Sans,Oxygen,U=
buntu,&quot;Droid Sans&quot;,Tahoma,Roboto,-apple-system,BlinkMacSystemFont=
,&quot;Hiragino Sans GB&quot;,Cantarell,Arial,STHeiti,sans-serif,&quot;Appl=
e Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,&quot;Segoe UI Symbol&quot;;=
font-size:18px"><li style=3D"box-sizing:inherit">host machine (OS/release) =
--Linux MINT20</li><li style=3D"box-sizing:inherit">version of Buildroot--2=
021.11</li><li style=3D"box-sizing:inherit">target for which the build fail=
s--raspberry pi b</li><li style=3D"box-sizing:inherit">package(s) for which=
 the build fails--swupdate</li><li style=3D"box-sizing:inherit">the command=
 that fails and its output--as posted above</li><li style=3D"box-sizing:inh=
erit">any information you think that may be relevant</li></ul><div><font co=
lor=3D"#202124" face=3D"SF Pro Display, Segoe UI, Open Sans, Clear Sans, He=
lvetica Neue, Helvetica, Oxygen-Sans, Oxygen, Ubuntu, Droid Sans, Tahoma, R=
oboto, -apple-system, BlinkMacSystemFont, Hiragino Sans GB, Cantarell, Aria=
l, STHeiti, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol"=
><span style=3D"font-size:18px"><br></span></font></div></div><div><font co=
lor=3D"#202124" face=3D"SF Pro Display, Segoe UI, Open Sans, Clear Sans, He=
lvetica Neue, Helvetica, Oxygen-Sans, Oxygen, Ubuntu, Droid Sans, Tahoma, R=
oboto, -apple-system, BlinkMacSystemFont, Hiragino Sans GB, Cantarell, Aria=
l, STHeiti, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol"=
><span style=3D"font-size:18px">Thanks</span></font></div><div><font color=
=3D"#202124" face=3D"SF Pro Display, Segoe UI, Open Sans, Clear Sans, Helve=
tica Neue, Helvetica, Oxygen-Sans, Oxygen, Ubuntu, Droid Sans, Tahoma, Robo=
to, -apple-system, BlinkMacSystemFont, Hiragino Sans GB, Cantarell, Arial, =
STHeiti, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol"><s=
pan style=3D"font-size:18px">Chris</span></font></div></div>

--00000000000077775205d69c7617--

--===============6748048870440827360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6748048870440827360==--
