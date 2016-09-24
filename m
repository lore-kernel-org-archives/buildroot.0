From: =?ISO-8859-1?Q?J=F6rg_Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 24 Sep 2016 10:47:19 +0200
Subject: [Buildroot] [PATCH] package/wvstreams: add patch to fix build
	with C99 compilers
In-Reply-To: <9fbfd5af-6933-9b6e-6898-9bcea17e22a1@gmail.com>
References: <20160923214227.12888-1-joerg.krause@embedded.rocks>
 <9fbfd5af-6933-9b6e-6898-9bcea17e22a1@gmail.com>
Message-ID: <A6BEEF15-B2C6-49FA-8D0F-A3F127248835@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi Romain,

Am 24. September 2016 10:31:57 MESZ, schrieb Romain Naour <romain.naour@gmail.com>:
>Hi J?rg,
>
>Le 23/09/2016 ? 23:42, J?rg Krause a ?crit :
>> wvstreams uses a bundled version of argp. Compiling argp fails for
>all
>> compilers not using the C89 standard by default:
>> 
>> """
>> In file included from argp-fmtstream.c:35:0:
>> argp-namefrob.h:62:32: error: redefinition of ?argp_fmtstream_write?
>>  #define __argp_fmtstream_write argp_fmtstream_write
>>                                 ^
>> argp-fmtstream.c:395:1: note: in expansion of macro
>> ?__argp_fmtstream_write?
>>  __argp_fmtstream_write (argp_fmtstream_t __fs,
>>  ^
>> In file included from argp-fmtstream.c:34:0:
>> argp-fmtstream.h:209:32: note: previous definition of
>> ?argp_fmtstream_write? was here
>>  #define __argp_fmtstream_write argp_fmtstream_write
>>                                 ^
>> argp-fmtstream.h:223:1: note: in expansion of macro
>> ?__argp_fmtstream_write?
>>  __argp_fmtstream_write (argp_fmtstream_t __fs,
>>  ^
>> """
>> 
>> The issue is that C99 changed inline semantics. This patch takes
>these
>> changes into account and allows to build the bundled argp and
>therefore
>> wvstreams with non-C89-compilers.
>> 
>> Note, that wvstreams is not maintained anymore. Last activity was on
>> Github was 2011, the current version 1.6.1 dates from 2009.
>
>Thanks for this investigation and the fix.
>Are you using wvstreams or it's for the sake of autobuilders ?

No, I am not using wvstreams and yes, it is for the sake of autobuilders.

>I'm wondering if we should deprecate this package ?
>Last time I looked at it, I disabled it for musl based toolchains.
>
>Thoughts ?

I am not sure which policy Buildroot follows here, but I would like to know.

J?rg
