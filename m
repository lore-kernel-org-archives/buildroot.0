Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE4DC4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 14:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE14F8176F;
	Sun,  4 Dec 2022 14:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE14F8176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wa6TUBUwI4nW; Sun,  4 Dec 2022 14:17:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D05C281815;
	Sun,  4 Dec 2022 14:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D05C281815
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAD3E1BF3A6
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 931B9400C4
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 14:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 931B9400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzqxsNRMsmex for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 14:17:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F49B40012
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F49B40012
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 14:17:22 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id vp12so22116381ejc.8
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 06:17:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x215yPG2p9w20q2egHZpg/OTGHh2N42CaEFmbDT5YhM=;
 b=fHw5E2uWsBolx4CdN4ockY4iSYPl7PLqn/RQss/aq01p4/b7J77Nr+dy8EA5KP2kXG
 6spgG6mWanavb2biRp5V/e7Kg5em2UWynpiSyymkzLF/9WdjjhuywhikdT9unHytXLFH
 xx5Bhzlel/lkx4IUfy5ngSuDZypoxR1SjRBPyBZ2bsmwJfUPzK2mmvprDTAaB90NxUly
 948lJ+Fl0nj9Zc3Qv4RUDhyPSWW7kPVIOeR+S7JFqAYHRaC4nzwdx3/yze0dkQvf782z
 m8/tfAoGXMM1nVE2hW/4+HWIx1hAKuEsoQ1crqRinndILRcUSv5Q9OpbUtXaiuGt7zhs
 BtNw==
X-Gm-Message-State: ANoB5pmn63raI/rPxmsRMB0IPkYFwk/l/wbDkyS2ESe11l14OeNt/Zrg
 ml13u7bXKwvZLU+L2F6P8DH29rtRyrEKesEz04xz4tffg5JUrg==
X-Google-Smtp-Source: AA0mqf6ng7VqqKmDHKbZCQDEEmdKpsJ5z/jAuwM34PKRgg4vDiAhjq0n2rtmUHrUpUCVMsDiPfcaFQUgwX937H01WkA=
X-Received: by 2002:a17:906:a259:b0:7ad:ccae:a30d with SMTP id
 bi25-20020a170906a25900b007adccaea30dmr53100407ejb.704.1670163440400; Sun, 04
 Dec 2022 06:17:20 -0800 (PST)
MIME-Version: 1.0
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 4 Dec 2022 16:17:10 +0200
Message-ID: <CA+fTLhj4PubMRELghtEYVCW3Q3FvEjK=mL=fOxdGNE_Jia6aOw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=x215yPG2p9w20q2egHZpg/OTGHh2N42CaEFmbDT5YhM=;
 b=kpXWSC1DI1ovcSQMifc9IinLs6BKWRwiHSL4ju2OkKKNQ0C5g24kfIvzBp3KXAu+u4
 mponBhdWJWKmu4PtQ8i8OXOaLp/FDoLTZXrrDYe8LG5fjf9GB2gZwFjr3y/SSuKouV5o
 j2O7CS1CK0qKK/NSiT1vufnvCh0pmE8Ek0lYms3jTZ1JTk9U65VOIPxfP9ygKxVwLDCu
 MEHzB1qdO35E9KZT13pWra+dg2/dpJ5GhdbgZfPRLwBLO1I/RJfJT9hf5vmZyaZprJAt
 fidoLTWJSK8SP2S9TRGFWorWCNw6yz+32SaLjpsE0s8l0aQE/ZRb3meEgi7nSZe8lSX7
 lrNw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kpXWSC1D
Subject: [Buildroot] python 3.10.8 pip module seems to be broken in rc3
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
Content-Type: multipart/mixed; boundary="===============7043680353895455405=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7043680353895455405==
Content-Type: multipart/alternative; boundary="00000000000094fe0605ef013a92"

--00000000000094fe0605ef013a92
Content-Type: text/plain; charset="UTF-8"

Hi!

I am unable to resolve this error with pip (installed by selecting
python-pip ):

# pip
Traceback (most recent call last):
  File "/usr/bin/pip", line 33, in <module>
    sys.exit(load_entry_point('pip==21.2.4', 'console_scripts', 'pip')())
  File "/usr/bin/pip", line 25, in importlib_load_entry_point
    return next(matches).load()
  File "/usr/lib/python3.10/importlib/metadata/__init__.py", line 171, in
load
  File "/usr/lib/python3.10/importlib/__init__.py", line 126, in
import_module
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in
_find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in
_call_with_frames_removed
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main.py", line
9, in <module>
  File
"/usr/lib/python3.10/site-packages/pip/_internal/cli/autocompletion.py",
line 10, in <module>
  File
"/usr/lib/python3.10/site-packages/pip/_internal/cli/main_parser.py", line
8, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py",
line 23, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/parser.py",
line 12, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/configuration.py",
line 21, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/exceptions.py",
line 7, in <module>
  File
"/usr/lib/python3.10/site-packages/pip/_vendor/pkg_resources/__init__.py",
line 35, in <module>
  File "/usr/lib/python3.10/plistlib.py", line 61, in <module>
ModuleNotFoundError: No module named 'xml'

Is this an known issue?

Best regards,
Indrek

--00000000000094fe0605ef013a92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<div><br></div><div>I am unable to resolve this error w=
ith pip (installed by selecting python-pip ):</div><div><br></div><div># pi=
p<br>Traceback (most recent call last):<br>=C2=A0 File &quot;/usr/bin/pip&q=
uot;, line 33, in &lt;module&gt;<br>=C2=A0 =C2=A0 sys.exit(load_entry_point=
(&#39;pip=3D=3D21.2.4&#39;, &#39;console_scripts&#39;, &#39;pip&#39;)())<br=
>=C2=A0 File &quot;/usr/bin/pip&quot;, line 25, in importlib_load_entry_poi=
nt<br>=C2=A0 =C2=A0 return next(matches).load()<br>=C2=A0 File &quot;/usr/l=
ib/python3.10/importlib/metadata/__init__.py&quot;, line 171, in load<br>=
=C2=A0 File &quot;/usr/lib/python3.10/importlib/__init__.py&quot;, line 126=
, in import_module<br>=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;=
&quot;, line 1050, in _gcd_import<br>=C2=A0 File &quot;&lt;frozen importlib=
._bootstrap&gt;&quot;, line 1027, in _find_and_load<br>=C2=A0 File &quot;&l=
t;frozen importlib._bootstrap&gt;&quot;, line 1006, in _find_and_load_unloc=
ked<br>=C2=A0 File &quot;&lt;frozen importlib._bootstrap&gt;&quot;, line 68=
8, in _load_unlocked<br>=C2=A0 File &quot;&lt;frozen importlib._bootstrap_e=
xternal&gt;&quot;, line 883, in exec_module<br>=C2=A0 File &quot;&lt;frozen=
 importlib._bootstrap&gt;&quot;, line 241, in _call_with_frames_removed<br>=
=C2=A0 File &quot;/usr/lib/python3.10/site-packages/pip/_internal/cli/main.=
py&quot;, line 9, in &lt;module&gt;<br>=C2=A0 File &quot;/usr/lib/python3.1=
0/site-packages/pip/_internal/cli/autocompletion.py&quot;, line 10, in &lt;=
module&gt;<br>=C2=A0 File &quot;/usr/lib/python3.10/site-packages/pip/_inte=
rnal/cli/main_parser.py&quot;, line 8, in &lt;module&gt;<br>=C2=A0 File &qu=
ot;/usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py&quot;,=
 line 23, in &lt;module&gt;<br>=C2=A0 File &quot;/usr/lib/python3.10/site-p=
ackages/pip/_internal/cli/parser.py&quot;, line 12, in &lt;module&gt;<br>=
=C2=A0 File &quot;/usr/lib/python3.10/site-packages/pip/_internal/configura=
tion.py&quot;, line 21, in &lt;module&gt;<br>=C2=A0 File &quot;/usr/lib/pyt=
hon3.10/site-packages/pip/_internal/exceptions.py&quot;, line 7, in &lt;mod=
ule&gt;<br>=C2=A0 File &quot;/usr/lib/python3.10/site-packages/pip/_vendor/=
pkg_resources/__init__.py&quot;, line 35, in &lt;module&gt;<br>=C2=A0 File =
&quot;/usr/lib/python3.10/plistlib.py&quot;, line 61, in &lt;module&gt;<br>=
ModuleNotFoundError: No module named &#39;xml&#39;<br></div><div><br></div>=
<div>Is this an known issue?</div><div><br></div><div>Best regards,</div><d=
iv>Indrek</div></div>

--00000000000094fe0605ef013a92--

--===============7043680353895455405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7043680353895455405==--
