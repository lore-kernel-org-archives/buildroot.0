From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 3 May 2014 21:50:58 +0200
Subject: [Buildroot] [PATCH v2 03/24] armadillo: new package
In-Reply-To: <20140503170809.GC10671@free.fr>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-4-git-send-email-s.martin49@gmail.com>
 <20140503170809.GC10671@free.fr>
Message-ID: <CAHXCMMJnij9s1Tz_nXq+GD936+rS2UNRgjXRbvQFVawFD9wSEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

On Sat, May 3, 2014 at 7:08 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
>> Armadillo is a C++ linear algebra library.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> This should come _after_ you add the clapack package, since it is a
> dependency of armadillo.

Ah! right! i rebased it too much :-/

>
> Some other comments below...
>
> [--SNIP--]
>> diff --git a/package/Config.in b/package/Config.in
>> index 07fd166..4475b07 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -766,6 +766,7 @@ source "package/zyre/Config.in"
>>  endmenu
>>
>>  menu "Other"
>> +source "package/armadillo/Config.in"
>>  source "package/apr/Config.in"
>>  source "package/apr-util/Config.in"
>>  source "package/argp-standalone/Config.in"
>
> Alphabetical order, please.
good catch!

>
> [--SNIP--]
>> diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
>> new file mode 100644
>> index 0000000..b2cfdfc
>> --- /dev/null
>> +++ b/package/armadillo/armadillo.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# armadillo
>> +#
>> +################################################################################
>> +
>> +ARMADILLO_VERSION_MAJOR = 4.000
>> +ARMADILLO_VERSION = $(ARMADILLO_VERSION_MAJOR).4
>
> There's now 4.300 availble. If 4.000 is a requirement, there's now
> 4.000.5.
Yep, i think bumping packages is often easier than getting them
integrated, so i keep it for later (the same is true for opencv,
numpy, and maybe others ;-])

>
> With the patch re-ordering, plus the alphabetical sort, you can add my
> reviewed tag (not added here, so patchwork does not catch it.)
>

Thanks,

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Samuel
