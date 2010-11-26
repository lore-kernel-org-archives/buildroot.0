From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Sat, 27 Nov 2010 01:05:47 +0200
Subject: [Buildroot] handling package souce in .zip file
In-Reply-To: <1290800123.14151.49.camel@coalu.atr>
References: <AANLkTinM+8TXLvddMZopiOOV_i-GR2+-z-k8s_6WY_UJ@mail.gmail.com>
	<1290800123.14151.49.camel@coalu.atr>
Message-ID: <AANLkTi==3zifJ5J6eToFRvVTTBvPh0zx2FW=qn_jrXrH@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 26, 2010 at 9:35 PM, Lionel Landwerlin
<llandwerlin@gmail.com> wrote:
> What's about this :
>
> unzip file.zip /tmp/plop
> mv /tmp/plop/*/* output/build/myzippkg-0.1/

Yes, this is almost what I was thinking, but the problem is that there
is no way to override "standard" buildroot extraction step or at least
I don't know it (using GENTARGET) :)

> Regards,
>
> --
> Lionel Landwerlin
>
> Le vendredi 26 novembre 2010 ? 20:37 +0200, Paulius Zaleckas a ?crit :
>> I want to add package, but its source is available only in zip format :(
>>
>> I was thinking how to handle zip, but I don't have preference:
>> 1. Not generic methods, since this may be the only package with zip:
>> a) add possibility to override the whole extraction procedure.
>> b) add post download hook, and repackage this zip as tar.
>> 2. Generic method:
>> a) add very hacky INFLATE.zip which will repackage zip as tar.
>> b) add special handling for INFLATE.zip without involving tar.
>>
>> Repackaging zip as tar is a headache, since it is not possible to
>> pipe unzip output to tar. So one has to extract zip to some dir and
>> then tar this dir and delete dir after taring.
>> Extracting zip without tar is also a little bit problematic since unzip
>> has no equivalent option for --strip-path/--strip-components
>> So maybe it is not possible to make generic support...
>>
>> What do you guys think?
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
