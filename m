Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC56FCA0ED3
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 15:58:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 504C3408C8;
	Mon,  2 Sep 2024 15:58:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4bMCuMlDahD; Mon,  2 Sep 2024 15:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3090040383
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3090040383;
	Mon,  2 Sep 2024 15:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40AA41BF292
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B81D606E7
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 15:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9WtX6kTuM3Vh for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 15:58:11 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45517606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45517606D6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45517606D6
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 15:58:10 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-20573eb852aso7058715ad.1
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 08:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725292690; x=1725897490;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JxIhhEYK+Ite+czIguzNE4PXkh9F4MxzgETd8TzglIM=;
 b=H33HX1yqQIgyZHMcDMsgH+pUjdakisdG6d4RRwa6udcvlYOimMl9Avk8+/INrLjpY3
 uJpfKRNxVycDjOS+e+sXEJbO4cTZljl6c/H3noVrdyv1f+QeDz694KjEUxKIwgNmqD9z
 OvdkAFouVUwWB6wJnfwQ+BLYDZmpJF2ppbTSQdqUAiAZRiuXVkghGEhkWBABHZJFn6Kv
 ZGxrsO53xZvZbQe2CR5/z6uBq+db3VoASvoVaY8hCqGrP1qfShfPWQSHcUkvgEqWpiu3
 TGHZjuFtW5VadB5iPAthf/eCIgTToWoMNJJ7r8MuW3VNB1XiJ3KhOvYlqAnvkspI1aAk
 EZcw==
X-Gm-Message-State: AOJu0YyDzbEZEg/bbhISBoCMCfYEd4mGoPG5N0oscJ1Qzj1bs8PY0FfG
 rG6KFFY8EggpPOCHSHDfBiFafzs8D88HyPVMDfQEsd5g6qnY+B66Xi7n9DyuF7A=
X-Google-Smtp-Source: AGHT+IFZzYL13+nrzopYMrqUY5QYms9AjaR1o7HzD7IEFpFJ1fRxGIE06hvi97ZW7Kbw40k3grOy/A==
X-Received: by 2002:a17:902:f547:b0:205:63af:3487 with SMTP id
 d9443c01a7336-20563af38a4mr55857145ad.0.1725292689929; 
 Mon, 02 Sep 2024 08:58:09 -0700 (PDT)
Received: from [192.168.2.17] ([189.113.44.122])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2051553703asm67739775ad.181.2024.09.02.08.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 08:58:09 -0700 (PDT)
Message-ID: <84cd0ec9-1915-41c1-a4ab-031c4310112f@newtesc.com.br>
Date: Mon, 2 Sep 2024 12:58:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240902132403.177333-1-flavio.tapajos@newtesc.com.br>
 <ZtXYnRjjvtodARmI@landeda>
Content-Language: en-US
From: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
In-Reply-To: <ZtXYnRjjvtodARmI@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1725292690; x=1725897490;
 darn=buildroot.org; 
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JxIhhEYK+Ite+czIguzNE4PXkh9F4MxzgETd8TzglIM=;
 b=3MnBW23diksfOAIEfmQZxxo5+ReiZqSn6W0QbCse/tHDf1UE9FlAcW4TBAzlpZnpsi
 6Xtz0JnLs8OWa1v7XcXsTXybtN81BRniTF8lPk+kSWDvekRzNS91nnqPcY9TAcjhJfXC
 4o9Ef1YLw4E6rMeUO1DS0WZIBTIVOKssizKfkxAwuSBnBV5F7+0C3FFYy/aheqaDBG5b
 WIQS7MOZoVkTN1at0vtKIo9c+cd4Cye3r9R+IppZwHJhi8W0vzlj3cNPePKtJeFQjFiI
 gytrGln05S47vP99qCs9SKfj9OxlQQ0ZSIsG0jSdSq2JqnFUJBL9qYjXJgwn7wxS/eeh
 nlOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=3MnBW23d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlalchemy: fix build
 issue with setuptools > 69.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5873319114564596759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5873319114564596759==
Content-Type: multipart/alternative;
 boundary="------------2HAGe2DAQYPbbcmJ9C6bbKq5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2HAGe2DAQYPbbcmJ9C6bbKq5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Morin,

Em 02/09/2024 12:24, Yann E. MORIN escreveu:
> Flávio, All,
>
> On 2024-09-02 10:24 -0300, Flávio Tapajós spake thusly:
>> Patching the version constraint is considered safe byhttps://github.com/sqlalchemy/sqlalchemy/discussions/11818
>>
>> Fixes:
>>    http://autobuild.buildroot.org/results/c531b6e63c5121138e8e8a1c5d1501d9d7e1391e/
>>
>> Signed-off-by: Flávio Tapajós<flavio.tapajos@newtesc.com.br>
>> ---
>>   ...tools-below-69.3-and-prepare-for-bui.patch | 35 +++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch
>>
>> diff --git a/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch b/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch
>> new file mode 100644
>> index 0000000000..70533421c6
>> --- /dev/null
>> +++ b/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch
>> @@ -0,0 +1,35 @@
>> +From 9f321c9e73f4c108baa1ef63528965079cab2f6d Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?=<flavio.tapajos@newtesc.com.br>
>> +Date: Mon, 2 Sep 2024 10:12:56 -0300
>> +Subject: [PATCH 1/1] Revert "pin setuptools below 69.3 and prepare for "build"
>> + for releases"
>> +
>> +This reverts commit 9553604fcc80fa175832433f4eff657ac95ae058.
>      $ make check-package
>      package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:4: generate your patches with 'git format-patch -N'
>      package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:0: missing Signed-off-by in the header (https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches)
>      package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:0: missing Upstream in the header (https://nightly.buildroot.org/#_additional_patch_documentation)
Sorry, I'll fix it
> However, ths patch has zero chance of getting upstream, so it means we'd
> have to carry it foever and ever.

That is unlikely. After my question, maintainers opened the ticket 
https://gerrit.sqlalchemy.org/c/sqlalchemy/sqlalchemy/+/5478 with the 
description:

 > The pin for ``setuptools<69.3`` in ``pyproject.toml`` has been 
removed. This pin was to prevent a sudden change to :pep:`625` in 
setuptools from taking place which changes the file name of SQLAlchemy's 
source distribution on pypi to be an all lower case name, which is very 
likely to cause problems with various build environments that expected 
particular naming style.  However, the presence of this pin is now back 
environments that otherwise want to use a newer setuptools, so we' 
decided to move forward with this change, with the assumption that 
environments will have largely accommodated the setuptools change now.

> We've had a few packages already with the same issue, and we could just
> cop out by adding --skip-dependency-check to _BUILD_OPTS, see for
> example commit 4b4ec03998e (package/python-ml-dtypes: skip dependency
> check).
>
> What is the reason upstream has pinned to an older setuptools? Can we
> just skip the dependency check insterad of reverting?
I would find it better to revert, since the maintainers already 
acknowledged that the pinning should be removed and dependency checks 
are mostly useful
>
> Regards,
> Yann E. MORIN.
>
>> +---
>> + pyproject.toml | 12 +++++-------
>> + 1 file changed, 5 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/pyproject.toml b/pyproject.toml
>> +index 0f53594df..780c9bf68 100644
>> +--- a/pyproject.toml
>> ++++ b/pyproject.toml
>> +@@ -1,11 +1,9 @@
>> + [build-system]
>> +-build-backend = "setuptools.build_meta"
>> +-requires = [
>> +-    # avoid moving tohttps://github.com/pypa/setuptools/issues/3593
>> +-    # until we're ready
>> +-    "setuptools>=61.0,<69.3",
>> +-    "cython>=0.29.24; platform_python_implementation == 'CPython'", # Skip cython when using pypy
>> +-]
>> ++    build-backend = "setuptools.build_meta"
>> ++    requires = [
>> ++        "setuptools>=47",
>> ++        "cython>=0.29.24; platform_python_implementation == 'CPython'", # Skip cython when using pypy
>> ++    ]
>> +
>> + [tool.black]
>> + line-length = 79
>> +--
>> +2.46.0
>> +
>> -- 
>> 2.46.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------2HAGe2DAQYPbbcmJ9C6bbKq5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Morin, <br>
    </p>
    <div class="moz-cite-prefix">Em 02/09/2024 12:24, Yann E. MORIN
      escreveu:<br>
    </div>
    <blockquote type="cite" cite="mid:ZtXYnRjjvtodARmI@landeda">
      <pre class="moz-quote-pre" wrap="">Flávio, All,

On 2024-09-02 10:24 -0300, Flávio Tapajós spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Patching the version constraint is considered safe by <a class="moz-txt-link-freetext" href="https://github.com/sqlalchemy/sqlalchemy/discussions/11818">https://github.com/sqlalchemy/sqlalchemy/discussions/11818</a>

Fixes:
  <a class="moz-txt-link-freetext" href="http://autobuild.buildroot.org/results/c531b6e63c5121138e8e8a1c5d1501d9d7e1391e/">http://autobuild.buildroot.org/results/c531b6e63c5121138e8e8a1c5d1501d9d7e1391e/</a>

Signed-off-by: Flávio Tapajós <a class="moz-txt-link-rfc2396E" href="mailto:flavio.tapajos@newtesc.com.br">&lt;flavio.tapajos@newtesc.com.br&gt;</a>
---
 ...tools-below-69.3-and-prepare-for-bui.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch

diff --git a/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch b/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch
new file mode 100644
index 0000000000..70533421c6
--- /dev/null
+++ b/package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch
@@ -0,0 +1,35 @@
+From 9f321c9e73f4c108baa1ef63528965079cab2f6d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <a class="moz-txt-link-rfc2396E" href="mailto:flavio.tapajos@newtesc.com.br">&lt;flavio.tapajos@newtesc.com.br&gt;</a>
+Date: Mon, 2 Sep 2024 10:12:56 -0300
+Subject: [PATCH 1/1] Revert "pin setuptools below 69.3 and prepare for "build"
+ for releases"
+
+This reverts commit 9553604fcc80fa175832433f4eff657ac95ae058.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
    $ make check-package
    package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:4: generate your patches with 'git format-patch -N'
    package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:0: missing Signed-off-by in the header (<a class="moz-txt-link-freetext" href="https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches">https://nightly.buildroot.org/#_format_and_licensing_of_the_package_patches</a>)
    package/python-sqlalchemy/2.0.32/0001-Revert-pin-setuptools-below-69.3-and-prepare-for-bui.patch:0: missing Upstream in the header (<a class="moz-txt-link-freetext" href="https://nightly.buildroot.org/#_additional_patch_documentation">https://nightly.buildroot.org/#_additional_patch_documentation</a>)
</pre>
    </blockquote>
    Sorry, I'll fix it<br>
    <blockquote type="cite" cite="mid:ZtXYnRjjvtodARmI@landeda">
      <pre class="moz-quote-pre" wrap="">
However, ths patch has zero chance of getting upstream, so it means we'd
have to carry it foever and ever.</pre>
    </blockquote>
    <p style="margin: 0px 0px 1.2em !important;">That is unlikely. After
      my question, maintainers opened the ticket <a
href="https://gerrit.sqlalchemy.org/c/sqlalchemy/sqlalchemy/+/5478"
        class="moz-txt-link-freetext">https://gerrit.sqlalchemy.org/c/sqlalchemy/sqlalchemy/+/5478</a>
      with the description:<br>
    </p>
    <p style="margin: 0px 0px 1.2em !important;">&gt; The pin for
      ``setuptools&lt;69.3`` in ``pyproject.toml`` has been removed. 
      This pin was to prevent a sudden change to :pep:`625` in
      setuptools from taking place which changes the file name of
      SQLAlchemy's source distribution on pypi to be an all lower case
      name, which is very likely to cause problems with various build
      environments that expected particular naming style.  However, the
      presence of this pin is now back environments that otherwise want
      to use a newer setuptools, so we' decided to move forward with
      this change, with the assumption that environments will have
      largely accommodated the setuptools change now.<br>
    </p>
    <p style="margin: 0px 0px 1.2em !important;"></p>
    <blockquote type="cite" cite="mid:ZtXYnRjjvtodARmI@landeda">
      <pre class="moz-quote-pre" wrap="">We've had a few packages already with the same issue, and we could just
cop out by adding --skip-dependency-check to _BUILD_OPTS, see for
example commit 4b4ec03998e (package/python-ml-dtypes: skip dependency
check).

What is the reason upstream has pinned to an older setuptools? Can we
just skip the dependency check insterad of reverting?</pre>
    </blockquote>
    I would find it better to revert, since the maintainers already
    acknowledged that the pinning should be removed and dependency
    checks are mostly useful<br>
    <blockquote type="cite" cite="mid:ZtXYnRjjvtodARmI@landeda">
      <pre class="moz-quote-pre" wrap="">

Regards,
Yann E. MORIN.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+---
+ pyproject.toml | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 0f53594df..780c9bf68 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,11 +1,9 @@
+ [build-system]
+-build-backend = "setuptools.build_meta"
+-requires = [
+-    # avoid moving to <a class="moz-txt-link-freetext" href="https://github.com/pypa/setuptools/issues/3593">https://github.com/pypa/setuptools/issues/3593</a>
+-    # until we're ready
+-    "setuptools&gt;=61.0,&lt;69.3",
+-    "cython&gt;=0.29.24; platform_python_implementation == 'CPython'", # Skip cython when using pypy
+-]
++    build-backend = "setuptools.build_meta"
++    requires = [
++        "setuptools&gt;=47",
++        "cython&gt;=0.29.24; platform_python_implementation == 'CPython'", # Skip cython when using pypy
++    ]
+ 
+ [tool.black]
+ line-length = 79
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2HAGe2DAQYPbbcmJ9C6bbKq5--

--===============5873319114564596759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5873319114564596759==--
