Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14E3C77B73
	for <buildroot@archiver.kernel.org>; Thu, 20 Apr 2023 06:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6043683F0C;
	Thu, 20 Apr 2023 06:56:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6043683F0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5KDXoiJKPRFj; Thu, 20 Apr 2023 06:56:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4257784130;
	Thu, 20 Apr 2023 06:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4257784130
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D24961BF4E5
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 06:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AABFA60C01
 for <buildroot@lists.busybox.net>; Thu, 20 Apr 2023 06:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AABFA60C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ws7LY4umFnvc for <buildroot@lists.busybox.net>;
 Thu, 20 Apr 2023 06:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526A460B8B
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 526A460B8B
 for <buildroot@buildroot.org>; Thu, 20 Apr 2023 06:56:33 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2a8ba5f1d6bso3047271fa.2
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 23:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681973791; x=1684565791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LpQ0VMsh8vEgkuMgA9It3HcNLU4o+D4Y/tAsfFb9meo=;
 b=QuYIo2xi4xjXFfHPAWYqZAn6zef3qe6tYniWZae7OKCOigDuuno1vD271oBAKDXx52
 QWkg9oCSjQ849FofxgFOICXsCOlsSh9vXubuXwU4+9mfX3MqZ6h+QgSl3SVNrp0AcX7J
 aTrLfoIoserix4W4OhWK54zHTiUwehGeZTTPf5cAibs1Paz9RglNnTCAk5jTT1EV+D5b
 qaEkFnxLAIuNe6SbpG/xXkMqhXhbF3YnncrtLWRnATaS5yUX3JNwTD6yohfnEf47lfRk
 tp0BbXEg4V9gzGG3q0QznImrNbT705w6vJ8Z6CPWm7u9ABWpFXOSmYJZFe17R6elvGC4
 CzEQ==
X-Gm-Message-State: AAQBX9dWo0PZm0LKOhvHnV9VcmQL/QfhMMDY/sO4Cfs2xrEP8EqDEBBO
 HtHA2KZB0ec19UvqBP3N0gRYTSaKfnQOIYSyqbyQSTpKk4jebyvH
X-Google-Smtp-Source: AKy350ZTeHJfYsZBn6rT2zT0VwXmRXVJOvZjSc3HsWRt6EJPfUtHxlgXfFIcUR+tS+0DUlXO7E3jvPDCfzOk0JfbUB0=
X-Received: by 2002:ac2:598b:0:b0:4d8:62e5:4f66 with SMTP id
 w11-20020ac2598b000000b004d862e54f66mr74074lfn.7.1681973790867; Wed, 19 Apr
 2023 23:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230207165031.17188-1-sebastian.weyer@smile.fr>
 <20230207170301.GK4124@scaer>
In-Reply-To: <20230207170301.GK4124@scaer>
From: Sebastian WEYER <sebastian.weyer@smile.fr>
Date: Thu, 20 Apr 2023 08:56:19 +0200
Message-ID: <CADSVbUufSwOTpXRDDJDVhk7938nqPmnXL2rS1UkwiksWVNabnA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1681973791; x=1684565791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LpQ0VMsh8vEgkuMgA9It3HcNLU4o+D4Y/tAsfFb9meo=;
 b=e/HvYeX+VmSIbK7cL8Wh5m36Y9/zyRboxjTWFVB3wKGuVhoexQhL+FmrwhrGMY5kB1
 xvJ7oJ8pAsP9s/d4UDN/IA/smnVjhkCvMwVQGUCglb2yBYQtici0yv0ILAkF1JOhEhPt
 2LDfQ+Y7N3ExFUs0zgC3MusZc1pzu8Fs5EVs9Ij04FIOk5ac91/I6r5IgwdYVqD4PA/8
 QZdavdll7EPXUMRf3mXAFPcrTKVSgMhIu8LVVLd1qfcNX6OcH6P7sIiQr2AoBLC73YNr
 IiqSgAduw6RKPySlNct0qwH6Hu5LnLOW0vJQTaLugXfccRfpjBOisq6/jRmgN7Wf/Zam
 Es+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=e/HvYeX+
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_rust.py: Add test
 to check correct vendoring
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8031508006986898652=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8031508006986898652==
Content-Type: multipart/alternative; boundary="000000000000539a8005f9bf0aa2"

--000000000000539a8005f9bf0aa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann, hello all,

I just wanted to ping this again since the patch seemed to be fine and it
hasn't been applied in 2 months.
Thank you :)

Regards,
Sebastian

On Tue, Feb 7, 2023 at 6:03=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Sebastian, All,
>
> On 2023-02-07 17:50 +0100, Sebastian Weyer spake thusly:
> > Currently the tests TestRust and TestRustBin do check for vendoring by
> > requiring package ripgrep to be built but only if the download
> > directory is already empty, otherwise the existing contents of the
> download
> > directory will be reused and therefore not be redownloaded.
> >
> > This new test will only verify that the required packages are downloade=
d
> > and vendored correctly without doing a runtime test. It does so by
> setting a
> > path to a folder "dl" inside the build directory
> (output-directory/testname/)
> > and then setting the environment variable BR2_DL_DIR to this path befor=
e
> the
> > build starts. This code was essentially copied from the file
> > test_gitforge.py which was added in commit
> > 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5
>
> There is a missing piece in this otherwise detailed commit log: why set
> BR2_DL_DIR in the environment, rather than set it in the config options?
>
> The reason is that a user may already have BR2_DL_DIR set in their own
> envronment, and that would override the dl dir we set in the config
> options.
>
> No need to respin, that can be fixed when applying.
>
> Regards,
> Yann E. MORIN.
>
> > We want the package ripgrep to be built since it requires vendoring
> > directly. Additionally we want the package python-cryptography to be
> > built because it has rust dependencies and therefore indirectly also
> requires
> > vendoring.
> >
> > Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> > ---
> >  support/testing/tests/package/test_rust.py | 42 ++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/support/testing/tests/package/test_rust.py
> b/support/testing/tests/package/test_rust.py
> > index fb9dd2d916..763125ca20 100644
> > --- a/support/testing/tests/package/test_rust.py
> > +++ b/support/testing/tests/package/test_rust.py
> > @@ -1,4 +1,5 @@
> >  import os
> > +import shutil
> >
> >  import infra.basetest
> >
> > @@ -54,3 +55,44 @@ class TestRust(TestRustBase):
> >      def test_run(self):
> >          self.login()
> >          self.assertRunOk("rg Buildroot /etc/issue")
> > +
> > +
> > +class TestRustVendoring(infra.basetest.BRConfigTest):
> > +    config =3D \
> > +        """
> > +        BR2_arm=3Dy
> > +        BR2_cortex_a9=3Dy
> > +        BR2_ARM_ENABLE_NEON=3Dy
> > +        BR2_ARM_ENABLE_VFP=3Dy
> > +        BR2_TOOLCHAIN_EXTERNAL=3Dy
> > +        # BR2_TARGET_ROOTFS_TAR is not set
> > +        BR2_PACKAGE_HOST_RUSTC=3Dy
> > +        BR2_PACKAGE_RIPGREP=3Dy
> > +        BR2_PACKAGE_PYTHON3=3Dy
> > +        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=3Dy
> > +        BR2_BACKUP_SITE=3D""
> > +        """
> > +
> > +    def setUp(self):
> > +        super(TestRustVendoring, self).setUp()
> > +
> > +    def tearDown(self):
> > +        self.show_msg("Cleaning up")
> > +        if self.b and not self.keepbuilds:
> > +            self.b.delete()
> > +
> > +    def check_download(self, package):
> > +        # store downloaded tarball inside the output dir so the test
> infra
> > +        # cleans it up at the end
> > +        dl_dir =3D os.path.join(self.builddir, "dl")
> > +        # enforce we test the download
> > +        if os.path.exists(dl_dir):
> > +            shutil.rmtree(dl_dir)
> > +        env =3D {"BR2_DL_DIR": dl_dir}
> > +        self.b.build(["{}-dirclean".format(package),
> > +                      "{}-legal-info".format(package)],
> > +                     env)
> > +
> > +    def test_run(self):
> > +        self.check_download("ripgrep")
> > +        self.check_download("python-cryptography")
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>


--=20
[image: eco] Pour la plan=C3=A8te, n'imprimez ce mail que si c'est n=C3=A9c=
essaire
[image: SMILE] <http://www.smile.eu/>

10-12 Rue Nicolas Appert
44100 NANTES
*Sebastian WEYER*
Stagiaire production

[image: email] sebastian.weyer@smile.fr
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

--000000000000539a8005f9bf0aa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Yann, hello all,</div><div><br></div><div>I jus=
t wanted to ping this again since the patch seemed to be fine and it hasn&#=
39;t been applied in 2 months.</div><div>Thank you :)</div><div><br></div><=
div>Regards,</div><div>Sebastian<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 7, 2023 at 6:03=E2=80=
=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.mor=
in.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Sebastian, All,<br>
<br>
On 2023-02-07 17:50 +0100, Sebastian Weyer spake thusly:<br>
&gt; Currently the tests TestRust and TestRustBin do check for vendoring by=
<br>
&gt; requiring package ripgrep to be built but only if the download<br>
&gt; directory is already empty, otherwise the existing contents of the dow=
nload<br>
&gt; directory will be reused and therefore not be redownloaded.<br>
&gt; <br>
&gt; This new test will only verify that the required packages are download=
ed<br>
&gt; and vendored correctly without doing a runtime test. It does so by set=
ting a<br>
&gt; path to a folder &quot;dl&quot; inside the build directory (output-dir=
ectory/testname/)<br>
&gt; and then setting the environment variable BR2_DL_DIR to this path befo=
re the<br>
&gt; build starts. This code was essentially copied from the file<br>
&gt; test_gitforge.py which was added in commit<br>
&gt; 1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5<br>
<br>
There is a missing piece in this otherwise detailed commit log: why set<br>
BR2_DL_DIR in the environment, rather than set it in the config options?<br=
>
<br>
The reason is that a user may already have BR2_DL_DIR set in their own<br>
envronment, and that would override the dl dir we set in the config<br>
options.<br>
<br>
No need to respin, that can be fixed when applying.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; We want the package ripgrep to be built since it requires vendoring<br=
>
&gt; directly. Additionally we want the package python-cryptography to be<b=
r>
&gt; built because it has rust dependencies and therefore indirectly also r=
equires<br>
&gt; vendoring.<br>
&gt; <br>
&gt; Signed-off-by: Sebastian Weyer &lt;<a href=3D"mailto:sebastian.weyer@s=
mile.fr" target=3D"_blank">sebastian.weyer@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 support/testing/tests/package/test_rust.py | 42 ++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 42 insertions(+)<br>
&gt; <br>
&gt; diff --git a/support/testing/tests/package/test_rust.py b/support/test=
ing/tests/package/test_rust.py<br>
&gt; index fb9dd2d916..763125ca20 100644<br>
&gt; --- a/support/testing/tests/package/test_rust.py<br>
&gt; +++ b/support/testing/tests/package/test_rust.py<br>
&gt; @@ -1,4 +1,5 @@<br>
&gt;=C2=A0 import os<br>
&gt; +import shutil<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import infra.basetest<br>
&gt;=C2=A0 <br>
&gt; @@ -54,3 +55,44 @@ class TestRust(TestRustBase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_run(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.login()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRunOk(&quot;rg Buildroot =
/etc/issue&quot;)<br>
&gt; +<br>
&gt; +<br>
&gt; +class TestRustVendoring(infra.basetest.BRConfigTest):<br>
&gt; +=C2=A0 =C2=A0 config =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_arm=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_cortex_a9=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_ARM_ENABLE_NEON=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_ARM_ENABLE_VFP=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # BR2_TARGET_ROOTFS_TAR is not set<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_HOST_RUSTC=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_RIPGREP=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_PYTHON3=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_BACKUP_SITE=3D&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def setUp(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(TestRustVendoring, self).setUp()<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def tearDown(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.show_msg(&quot;Cleaning up&quot;)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.b and not self.keepbuilds:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.b.delete()<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def check_download(self, package):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # store downloaded tarball inside the out=
put dir so the test infra<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cleans it up at the end<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dl_dir =3D os.path.join(self.builddir, &q=
uot;dl&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # enforce we test the download<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(dl_dir):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.rmtree(dl_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D {&quot;BR2_DL_DIR&quot;: dl_dir}<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.b.build([&quot;{}-dirclean&quot;.for=
mat(package),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &quot;{}-legal-info&quot;.format(package)],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0env)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 def test_run(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_download(&quot;ripgrep&quot;)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.check_download(&quot;python-cryptogr=
aphy&quot;)<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">
    <img src=3D"http://ftp.smile.fr/client/Communication/signature/img/eco.=
png" alt=3D"eco" width=3D"13" height=3D"11">
            Pour la plan=C3=A8te, n&#39;imprimez ce mail que si c&#39;est n=
=C3=A9cessaire
    <table style=3D"padding:20px" border=3D"0"><tbody><tr><td style=3D"font=
-size:13px;color:rgb(255,128,84);text-align:center;padding-right:30px"><a h=
ref=3D"http://www.smile.eu/" target=3D"_blank">
                    <img style=3D"max-width: 100%; height: auto;" src=3D"ht=
tp://ftp.smile.fr/client/Communication/signature/img/Logo-new.png" alt=3D"S=
MILE">
                </a><br><br>
                    <p style=3D"line-height:15px">10-12 Rue Nicolas Appert<=
br>
44100 NANTES</p>
            </td>
            <td style=3D"border-left:1px solid rgb(59,127,254);padding-left=
:20px;font-size:13px;color:rgb(255,128,84)">
                <div style=3D"color:rgb(255,128,84);font-size:14px">
                    <b>Sebastian WEYER</b>
                </div>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    Stagiaire production<br>
                   =20
                </div><br>
                <div style=3D"color:rgb(59,127,254);font-size:13px">
                    <span style=3D"white-space:nowrap"><img style=3D"margin=
-right: 5px;" src=3D"http://ftp.smile.fr/client/Communication/signature/img=
/mail.png" alt=3D"email" width=3D"12" height=3D"10">
                        <a href=3D"mailto:sebastian.weyer@smile.fr" style=
=3D"color:rgb(59,127,254);font-size:13px;text-decoration:none" target=3D"_b=
lank">sebastian.weyer@smile.fr</a>
                    </span>
                     <br>
                                                    <span style=3D"white-sp=
ace:nowrap"><img style=3D"margin-right: 5px;" src=3D"http://ftp.smile.fr/cl=
ient/Communication/signature/img/web.png" alt=3D"url" width=3D"12" height=
=3D"12">
<a href=3D"http://www.smile.eu" style=3D"color:rgb(59,127,254);font-size:13=
px;text-decoration:none" target=3D"_blank">http://www.smile.eu</a> =20
                  </span>
                                </div>

                <br>
                <div>
                    <span><a style=3D"margin-right:5px" href=3D"https://twi=
tter.com/GroupeSmile" target=3D"_blank"><img src=3D"http://ftp.smile.fr/cli=
ent/Communication/signature/img/rs-twitter.png" alt=3D"Twitter" style=3D"ma=
x-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://www=
.linkedin.com/company/smile" target=3D"_blank"><img src=3D"http://ftp.smile=
.fr/client/Communication/signature/img/rs-linkedin.png" alt=3D"LinkedIn" st=
yle=3D"max-width: 100%; height: auto;"></a></span>
                    <span><a style=3D"margin-right:5px" href=3D"https://git=
hub.com/Smile-SA" target=3D"_blank"><img src=3D"http://ftp.smile.fr/client/=
Communication/signature/img/rs-github.png" alt=3D"Github" style=3D"max-widt=
h: 100%; height: auto;"></a></span>
                </div>
            </td>
        </tr>
        </tbody>
    </table></div></div>

--000000000000539a8005f9bf0aa2--

--===============8031508006986898652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8031508006986898652==--
