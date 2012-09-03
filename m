From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 04 Sep 2012 01:07:39 +0300
Subject: [Buildroot] Is there an include statement in buildroot ?
In-Reply-To: <CAHXCMM+ZOiZf1FWKKYjVjDgwG9Cy2DfwJNT_18FpqBcbZspZpQ@mail.gmail.com>
References: <50452381.5040804@petroprogram.com>
 <CAHXCMM+ZOiZf1FWKKYjVjDgwG9Cy2DfwJNT_18FpqBcbZspZpQ@mail.gmail.com>
Message-ID: <50452A2B.1070802@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel

4.9.2012 0:50, Samuel Martin kirjoitti:
> Hi Stefan,
>
> 2012/9/3 Stefan Fr?berg <stefan.froberg@petroprogram.com>:
>> Hello everyone
>>
>> My package .mk file is getting quite large now and I would like to break
>> it to more easily
>> sizeable and logical chunks.
>>
>> Is there a way to include other .mk files in main .mk file ?
> Actually, you don't need to explicitly include .mk files, this is
> automatically handled in the Makefile at the root of BR.
> To convince yourself ;-) :
> grep -nE 'include .*?mk' Makefile
>
>> Like something like this:
>>
>> package/newpackage/A.mk
>> package/newpackage/C.mk
>> package/newpackage/D.mk
>> etc....
>> package/newpackage/newpackage.mk
> However, if you there is a specific order for the inclusion, you can do:
> package/newpackage/A.mk.in
> package/newpackage/B.mk.in
> ...
>
>> And newpackage.mk would have:
>>
>> include "A.mk"
>> include "B.mk"
>> include "C.mk"
>>
>> etc....
>>
> Then, in the newpackage.mk:
> include A.mk.in
> include B.mk.in
> ...
>
> Or just:
> include ./*.mk.in
>
>
> Cheers,
>

I put the following in newpackage.mk :

include package/newpackage/A.mk.in
include package/newpackage/B.mk.in
etc...

And Oh My God, it worked!
All the variables and other stuff from those files
were now visible in main newpackage.mk!

Thanks Samuel ! :)

Stefan
