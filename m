From: Pedro Aguilar <paguilar@paguilar.org>
Date: Sun, 23 Nov 2014 20:20:38 +0100
Subject: [Buildroot] [PATCH v4 4/4] guile: new package
In-Reply-To: <20141123152936.GB4210@free.fr>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-5-git-send-email-paguilar@paguilar.org>
 <20141118211819.GL4333@free.fr> <546E72F4.5040103@paguilar.org>
 <20141123152936.GB4210@free.fr>
Message-ID: <54723386.5070700@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 23/11/2014 16:29, Yann E. MORIN wrote:
[--SNIP--]
>>> Did you try to send that patch upstream?
>>
>> They already fixed it in git, but there isn't any stable release with this
>> fix.
>
> Ah, so this is a patch that you back-ported from upstream, then?
>
> In this case, just add a pointer to the upstream patch.

Ok, the following patch series will include the commit pointer.

>>>> +diff -Nau guile-2.0.11.orig/configure.ac guile-2.0.11/configure.ac
>>>> +--- guile-2.0.11.orig/configure.ac	2014-03-12 14:36:02.000000000 +0100
>>>> ++++ guile-2.0.11/configure.ac	2014-11-03 23:59:51.897267207 +0100
>>>> +@@ -862,7 +862,7 @@
>>>> + }]])],
>>>> +     [guile_cv_use_csqrt=yes],
>>>> +     [guile_cv_use_csqrt="no, glibc 2.3 bug"],
>>>> +-    [guile_cv_use_csqrt="yes, hopefully (cross-compiling)"])])
>>>> ++    [guile_cv_use_csqrt="no (cross-compiling)"])])
>>>
>>> Not OK: it is possible to be cross-compiling with glibc, in which
>>> case the result should be 'yes'.
>>
>> Using csqrt() is OK only for some versions of glib. If we use the fallback
>> code, we're sure that it will work properly even with recent versions of
>> glib.
>
> /me gets confused...
> glib or glibc?

glibc :)

> But even if the fallback code works in all cases, I gues we still want
> to use the normal code whenever possible. That is, we want to detect
> that csqrt() is available before using it.
>
> But OK, we can live with the fallback code in Buildroot.
>
> Maybe you could try to push a patch upstream to add a check whether
> csqrt() is present and useable in the C library? That would allow us to
> drop one patch when we update guile when the next release is out.

I'll send the patch to them shortly.

Thanks.

-- 
Pedro Aguilar
http://paguilar.org
