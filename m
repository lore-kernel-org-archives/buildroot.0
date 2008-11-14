From: malcolm blaney <mblaney@gmail.com>
Date: Fri, 14 Nov 2008 11:37:27 +1030
Subject: [Buildroot] TARGET_CONFIGURE_OPTS
In-Reply-To: <d6cda7730811131653r4c28329fnc4a6e19c3f490285@mail.gmail.com>
References: <ce76e3890811122014sbad333ai2101488d14ddb7f5@mail.gmail.com>
	<20081113140700.67b6db3b@surf>
	<ce76e3890811131642n159e96c5r769ed0e6080e599f@mail.gmail.com>
	<d6cda7730811131653r4c28329fnc4a6e19c3f490285@mail.gmail.com>
Message-ID: <ce76e3890811131707q460a9edet13e0d0d81575c67c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thiago,

On Fri, Nov 14, 2008 at 11:23 AM, Thiago A. Corr?a
<thiago.correa@gmail.com> wrote:
> [cut]
>> -Wl,/home/malcolm/buildroot/build_i386/staging_dir/usr/lib -mtune=i386
>> -march=i386   -c -o dbmulti.o dbmulti.c
>> In file included from includes.h:30,
>>                 from dbmulti.c:25:
>> options.h:436:2: error: #error You must compiled with either
>> DROPBEAR_CLIENT or DROPBEAR_SERVER selected
>> In file included from includes.h:124,
>>                 from dbmulti.c:25:
> [cut]
>
> Having the same with avr32.
>
> But the first error about the missing define shouldn't be fixed with
> an includepath change AFAIK. Unless it's finding same include with
> different contents in the host. Have to try it to make sure.

The dropbear makefile adds "-DDROPBEAR_CLIENT -DDROPBEAR_SERVER" to
CFLAGS (along with the include path libtomcrypt/src/headers) so
everything works if dropbear's CFLAGS gets used.
