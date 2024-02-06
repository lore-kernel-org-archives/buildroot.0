Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FE3C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 695E2416B4;
	Tue,  6 Feb 2024 16:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 695E2416B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qXjy8weyT22v; Tue,  6 Feb 2024 16:00:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E5DF416B9;
	Tue,  6 Feb 2024 16:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5DF416B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 195531BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA396822B8
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gaFFCWJyH5Jx for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:00:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64DFB82285
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64DFB82285
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64DFB82285
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:00:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b1d7f7366so3043359f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 08:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707235218; x=1707840018;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rDP/1zuFjc1BCan5roWhS5lEB4dqPi4bjrjta3eiJwE=;
 b=qClJTkLcuICyRWXE7e86xuCqQnRk+S38xchbEeRuYfJOJr8JjTIoztZEfIOoLCvzjV
 HT/H1Wwuv0g9iHaflWvIZDAZ/N0D6HaHno38sQS9JFvdUlV+Lh72QZ+YwtoT6ANZMnvO
 uYvwTQQa3TzU+yR+p9HURoTZOw1E0nbt1kFONnEcn1UaYu6V/LRvM4dlmqP9jrjEjUwG
 YV7S4WcC6U9F+cf0Fy47RVLMuvK9G8u8aipb1mZ7bZvUix++/+7WcT/gt+6RHVuM2EzG
 FxCNvKKaAoU/9MXz6K7Ho2lUB+Xx75+nCMK5MstKeImwUMhrrM8w3ZFTqr9+il1i0IEW
 nVLw==
X-Gm-Message-State: AOJu0YxrYaFMMyPTgm7PJG3/q7/dW85egj0bKBKJDYCEyt31SgiC906e
 O+aoZP/vhyNtN3JRygwFKlN4XCR9pV8F1XRo6SiHbmUX/Pg9MSzwTazEDxO6QBRU64tWgXBUWCI
 T
X-Google-Smtp-Source: AGHT+IFe8gFUOz76WmiP6TqhMzveoMF+rxw3tgzhsHsQ+J54wwf+kR5EaiHizdaz56Qad0i5p/k5tQ==
X-Received: by 2002:a5d:4986:0:b0:33b:139e:9110 with SMTP id
 r6-20020a5d4986000000b0033b139e9110mr1432919wrq.36.1707235218210; 
 Tue, 06 Feb 2024 08:00:18 -0800 (PST)
Received: from [192.168.68.114] (lfbn-nan-1-1117-126.w90-12.abo.wanadoo.fr.
 [90.12.67.126]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600002cc00b0033af5716a7fsm2427300wry.61.2024.02.06.08.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 08:00:17 -0800 (PST)
Message-ID: <8260a015-44ed-4a2a-8d33-67c4268f810d@smile.fr>
Date: Tue, 6 Feb 2024 17:00:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
 <1dd4afa6-e225-4e79-bb3a-21d0e04c7571@smile.fr> <ZcJH2rjRQQwKTbyN@landeda>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZcJH2rjRQQwKTbyN@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707235218; x=1707840018;
 darn=buildroot.org; 
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDP/1zuFjc1BCan5roWhS5lEB4dqPi4bjrjta3eiJwE=;
 b=vbZwsYkLdGIlBbx4saF248/Pu+1Uyi0wEAWEaEkl/LBxOrh3TPVOEEE298ab8v/65+
 Me3L7EfJadQ6GH/ZiWR87EAZjgzbKph7UaeIjegbvB+XaBv4+jVLV6Q90FYygOBFFU2p
 5AAxt6LHgzHzquLd3S9CYHHKnHQuCDNmCrLVS08Dch689tVcdU0Ee1Ix7f70X2wDO4dO
 PWPyU2bmJoMGqIq+MplzH1CDwOGlPW5kJ7bKUWj1cu8jRVjXSXr7uwg9IECHalJdjzOv
 9VM/kPAHiZBwiiTmv1lOp68eAbUcW9Z9VvvSgZ0bgT5JcIzD7zEWsWyUnQhMb4ykd7Nc
 hzTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vbZwsYkL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Content-Type: multipart/mixed; boundary="===============4808527581384340544=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4808527581384340544==
Content-Type: multipart/alternative;
 boundary="------------WrTq8RMhYM2Op6zIgd1lYEza"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------WrTq8RMhYM2Op6zIgd1lYEza
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 06/02/2024 15:53, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-02-06 15:09 +0100, Antoine Coutant spake thusly:
>> On 11/01/2024 06:17, James Hilliard wrote:
>>> Signed-off-by: James Hilliard<james.hilliard1@gmail.com>
> [--SNIP--]
>>> -PYTHON_RPDS_PY_VERSION = 0.12.0
>>> +PYTHON_RPDS_PY_VERSION = 0.16.2
>> rpds depends on the crate pyo3. This crate uses
>> "std::sync::atomic::AtomicI64" which doesn't exist for 32 bits
>> targets. That leads to an error [1].
> I have been discussing this with Romain IRL, and he explained that the
> issue _already_ happenned with 0.12.0, so this is not a regression and
> thus reverting this patch will not fix the issue.
>
> Is that correct?

Yes, this patch is not a regression. I did a test with Buildroot 2023.11

and it failed. This bug is old but i described it here because I was

working on it when the version bump was applied and I thought

it was related.

>
> Also, will std::sync::atomic::AtomicI64 ever be available for 32-bit
> targets? If not, would that be considered a bug in the std lib?

according to the rust doc, std::sync::atomic::AtomicI64 is only available

on platforms that support atomic loads and stores of i64 [1]. Moreover,

std::sync::atomic types might not be available on all platforms [2].


That's why the crate portable-atomic [3] have been created. It provides

atomic types and compare and swap operations for all targets that can use

std. That's the crate used by pyo3 upstream to solve the problem [4].

>> An issue have been opened on pyo3's github [2]. A fix have been accepted [3]
>> but it isn't in the last release. Thus, this version bump doesn't
>> fix this problem.
>> [1]:https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842
>> [2]:https://github.com/PyO3/pyo3/issues/3614
>> [3]:https://github.com/PyO3/pyo3/pull/3619
> It is not going to be easy to carry this change as a patch in Buildroot:
> it would require that we be able to patch a package during the vendoring
> step.
>
> In this case, we'd need to do the vendoring (because we need the pyo3
> crate to be downloaded), then apply the patch (with mangled paths) to
> add the new dependency, then restart the vendoring. In the generic case,
> we'd even need to be able to repeat the process in case that new
> dependency has to be patched and so on and so on... That's not going to
> be easy, by far...
>
> Meh...
>
> We can't even update to a random sha1 from the rpds git tree, because
> they do nit even have an update to switch to a newer (even if
> unreleased) pyo3.
>
> Meh, again...
>
> Not sure what to do...
>
> What about adding a dependency on BR2_ARCH_IS_64 to python-rpds-pym and
> propagate that to all its dependencies?

I think this is the best way to avoid this bug. Patching during the

vendoring process seams to be possible. But it will be quite

impossible to maintain.


The dependency on BR2_ARCH_IS_64 must be removed when

the version of spo3 used by rpds will use portable-atomic.

>
> Regards,
> Yann E. MORIN.


[1]: https://doc.rust-lang.org/std/sync/atomic/struct.AtomicI64.html

[2]: https://doc.rust-lang.org/std/sync/atomic/index.html#portability

[3]: https://github.com/taiki-e/portable-atomic

[4]: https://github.com/PyO3/pyo3/pull/3619/files


Regards,

Antoine Coutant

--------------WrTq8RMhYM2Op6zIgd1lYEza
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06/02/2024 15:53, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZcJH2rjRQQwKTbyN@landeda">
      <pre class="moz-quote-pre" wrap="">Antoine, All,

On 2024-02-06 15:09 +0100, Antoine Coutant spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 11/01/2024 06:17, James Hilliard wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Signed-off-by: James Hilliard <a class="moz-txt-link-rfc2396E" href="mailto:james.hilliard1@gmail.com">&lt;james.hilliard1@gmail.com&gt;</a>
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">[--SNIP--]
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">-PYTHON_RPDS_PY_VERSION = 0.12.0
+PYTHON_RPDS_PY_VERSION = 0.16.2
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">rpds depends on the crate pyo3. This crate uses
"std::sync::atomic::AtomicI64" which doesn't exist for 32 bits
targets. That leads to an error [1].
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I have been discussing this with Romain IRL, and he explained that the
issue _already_ happenned with 0.12.0, so this is not a regression and
thus reverting this patch will not fix the issue.

Is that correct?</pre>
    </blockquote>
    <p>Yes, this patch is not a regression. I did a test with Buildroot
      2023.11</p>
    <p>and it failed. This bug is old but i described it here because I
      was</p>
    <p>working on it when the version bump was applied and I thought</p>
    <p>it was related.<br>
    </p>
    <blockquote type="cite" cite="mid:ZcJH2rjRQQwKTbyN@landeda">
      <pre class="moz-quote-pre" wrap="">

Also, will std::sync::atomic::AtomicI64 ever be available for 32-bit
targets? If not, would that be considered a bug in the std lib?</pre>
    </blockquote>
    <p>according to the rust doc, <span style="white-space: pre-wrap">std::sync::atomic::AtomicI64 </span>is
      only available</p>
    <p>on platforms that support
      atomic loads and stores of i64 [1]. Moreover,</p>
    <p>std::sync::atomic types might not be available on all platforms
      [2].</p>
    <p><br>
    </p>
    <p>That's why the crate portable-atomic [3] have been created. It
      provides</p>
    <p>atomic types and compare and swap operations for all targets that
      can use</p>
    <p>std. That's the crate used by pyo3 upstream to solve the problem
      [4].<br>
    </p>
    <blockquote type="cite" cite="mid:ZcJH2rjRQQwKTbyN@landeda">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">An issue have been opened on pyo3's github [2]. A fix have been accepted [3]
but it isn't in the last release. Thus, this version bump doesn't
fix this problem.
[1]: <a class="moz-txt-link-freetext" href="https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842">https://gitlab.com/buildroot.org/buildroot/-/jobs/6093854842</a>
[2]: <a class="moz-txt-link-freetext" href="https://github.com/PyO3/pyo3/issues/3614">https://github.com/PyO3/pyo3/issues/3614</a>
[3]: <a class="moz-txt-link-freetext" href="https://github.com/PyO3/pyo3/pull/3619">https://github.com/PyO3/pyo3/pull/3619</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is not going to be easy to carry this change as a patch in Buildroot:
it would require that we be able to patch a package during the vendoring
step.

In this case, we'd need to do the vendoring (because we need the pyo3
crate to be downloaded), then apply the patch (with mangled paths) to
add the new dependency, then restart the vendoring. In the generic case,
we'd even need to be able to repeat the process in case that new
dependency has to be patched and so on and so on... That's not going to
be easy, by far...

Meh...

We can't even update to a random sha1 from the rpds git tree, because
they do nit even have an update to switch to a newer (even if
unreleased) pyo3.

Meh, again...

Not sure what to do...

What about adding a dependency on BR2_ARCH_IS_64 to python-rpds-pym and
propagate that to all its dependencies?</pre>
    </blockquote>
    <p>I think this is the best way to avoid this bug. Patching during
      the</p>
    <p>vendoring process seams to be possible. But it will be quite </p>
    <p>impossible to maintain. <br>
    </p>
    <p><br>
    </p>
    <p>The dependency on BR2_ARCH_IS_64 must be removed when</p>
    <p>the version of spo3 used by rpds will use portable-atomic.</p>
    <p> </p>
    <blockquote type="cite" cite="mid:ZcJH2rjRQQwKTbyN@landeda">
      <pre class="moz-quote-pre" wrap="">

Regards,
Yann E. MORIN.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>[1]:
      <a class="moz-txt-link-freetext" href="https://doc.rust-lang.org/std/sync/atomic/struct.AtomicI64.html">https://doc.rust-lang.org/std/sync/atomic/struct.AtomicI64.html</a></p>
    <p>[2]: <a class="moz-txt-link-freetext" href="https://doc.rust-lang.org/std/sync/atomic/index.html#portability">https://doc.rust-lang.org/std/sync/atomic/index.html#portability</a></p>
    <p>[3]: <a class="moz-txt-link-freetext" href="https://github.com/taiki-e/portable-atomic">https://github.com/taiki-e/portable-atomic</a></p>
    <p>[4]: <a class="moz-txt-link-freetext" href="https://github.com/PyO3/pyo3/pull/3619/files">https://github.com/PyO3/pyo3/pull/3619/files</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Antoine Coutant<br>
    </p>
    <p><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------WrTq8RMhYM2Op6zIgd1lYEza--

--===============4808527581384340544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4808527581384340544==--
