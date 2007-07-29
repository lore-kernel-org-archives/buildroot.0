From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 29 Jul 2007 19:14:22 +0200
Subject: [Buildroot] latest svn trunk build saga
References: <0707282336490.8510@somehost> <0707291433290.8510@somehost>
Message-ID: <00f701c7d26c$015ef610$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Cristian Ionescu-Idbohrn" <cristian.ionescu-idbohrn@axis.com>
To: <buildroot@uclibc.org>
Sent: Sunday, July 29, 2007 3:12 PM
Subject: Re: [Buildroot] latest svn trunk build saga


> Replying to myself again.
> 
> On Sat, 28 Jul 2007, Cristian Ionescu-Idbohrn wrote:
> 
>> Any of the below will fail when enabled on top of the attached .config :(
>>
>> --------------------------------------------------------------------------
>> touch buildroot/build_i486/gawk-3.1.5/.unpacked
>> ...
>> checking for C compiler default output file name...
>> configure: error: C compiler cannot create executables
>> See `config.log' for more details.
>> make: *** [buildroot/build_i486/gawk-3.1.5/.configured] Error 77
> 
> gawk still doesn't build:
> 
> ,----
> | /usr/bin/make -j1 CC=buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -C buildroot/build_i486/gawk-3.1.5
> | make[1]: Entering directory `buildroot/build_i486/gawk-3.1.5'
> | /usr/bin/make 'CFLAGS=-g -O2' 'LDFLAGS=-export-dynamic' all-recursive
> | make[2]: Entering directory `buildroot/build_i486/gawk-3.1.5'
> | Making all in .
> | make[3]: Entering directory `buildroot/build_i486/gawk-3.1.5'
> | if buildroot/build_i486/staging_dir/usr/bin/i486-linux-uclibc-gcc -DDEFPATH="\".:/usr/share/awk\"" -DHAVE_CONFIG_H -DGAWK -DLOCALEDIR="\"/usr/share/locale\"" -I. -I. -I.     -g -O2 -MT regex.o -MD -MP -MF ".deps/regex.Tpo" -c -o regex.o regex.c; \
> |        then mv -f ".deps/regex.Tpo" ".deps/regex.Po"; else rm -f ".deps/regex.Tpo"; exit 1; fi
> | In file included from regex.c:66:
> | regex_internal.h:744: error: expected specifier-qualifier-list before 'wchar_t'
> | make[3]: *** [regex.o] Error 1
> | make[3]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
> | make[1]: *** [all] Error 2
> | make[1]: Leaving directory `buildroot/build_i486/gawk-3.1.5'
> | make: *** [buildroot/build_i486/gawk-3.1.5/gawk] Error 2
> `----

You need to build uClibc with WCHAR enabled
so you need a custom uClibc ".config" file.


Best Regards
Ulf Samuelsson
