From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Feb 2014 17:06:17 +0100
Subject: [Buildroot] [PATCH 1/2] infra: Add generic check_prog_host
	function
In-Reply-To: <20140223150431.400d91e2@skate>
References: <1393160241-10015-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140223150431.400d91e2@skate>
Message-ID: <CAGduivwx_LZ_bbBojErDRBFeDHso7EAZoH-6Rrj9UsoA2yQRRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Sun, Feb 23, 2014 at 3:04 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sun, 23 Feb 2014 13:57:20 +0100, Maxime Hadjinlian wrote:
>
>> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
>> index a8261b3..e5a6e36 100755
>> --- a/support/dependencies/dependencies.sh
>> +++ b/support/dependencies/dependencies.sh
>> @@ -64,6 +64,16 @@ if ! which sed > /dev/null ; then
>>       exit 1
>>  fi
>>
>> +check_prog_host()
>> +{
>> +     prog="$1"
>> +     if ! which $prog > /dev/null ; then
>> +             echo >&2
>> +             echo "You must install '$prog' on your build machine" >&2
>> +             exit 1
>> +     fi
>> +}
>
> This seems like a good direction. However:
>
>  1/ It would be nice if we could use it for the other similar cases in
>     dependencies.sh. You will maybe have to extend the function with a
>     second argument that would be the name of the package to install on
>     typical distributions, since for some programs, we suggest the user
>     which package should be installed, when it is not obvious from
>     looking at the name of the missing program.
>
>  2/ We should rework dependencies.sh so that it does *all* its checks,
>     and only at the end abort the build if some error was detected.
>     It's quite annoying to start the build, see that a program is
>     missing, install it, restart the build, see that another program is
>     missing and so on.
>
> 1/ is I believe a natural extension of what you're proposing here, and
> could be included in your patch set.
You are right, I can also uses check_prog_host for which and sed.
That's what I have modified for the v2 of this patch.
The other check (for the host compiler, locale, various tools, ...)
have different kind of smarts to do, which would need a rework like
what you have in mind for 2/. So I let them alone for the time being.
>
> 2/ involves much more work, and we can certainly consider it as a
> separate work, to be done as a separate patch set.
Agreed, this will be another patch.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
