From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 28 Jul 2013 09:00:35 +0200
Subject: [Buildroot] [PATCH] ser2net: bump to 2.9
In-Reply-To: <20130728062615.GG5161@tarshish>
References: <1374992536-7801-1-git-send-email-yegorslists@googlemail.com>
 <20130728062615.GG5161@tarshish>
Message-ID: <CAGm1_ktcdOp2HhmYk09B0uhax=qo_pqqQ68fiPiggGZN9ipMyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 28, 2013 at 8:26 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Yegor,
>
> On Sun, Jul 28, 2013 at 08:22:16AM +0200, Yegor Yefremov wrote:
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/ser2net/ser2net.mk | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
>> index 588571c..cc728a6 100644
>> --- a/package/ser2net/ser2net.mk
>> +++ b/package/ser2net/ser2net.mk
>> @@ -4,8 +4,9 @@
>>  #
>>  ################################################################################
>>
>> -SER2NET_VERSION = 2.8
>> +SER2NET_VERSION = 2.9
>>  SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>> +SER2NET_AUTORECONF = YES
>
> Please add a comment explaining why this is needed.
>
> baruch
>
>>  SER2NET_LICENSE = GPLv2+
>>  SER2NET_LICENSE_FILES = COPYING
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

That's why:

/bin/bash ./libtool --tag=CC   --mode=link gcc -Wall -g -O2   -o
ser2net controller.o dataxfer.o devcfg.o readconfig.o selector.o
ser2net.o utils.o telnet.o buffer.o  -lnsl
libtool: Version mismatch error.  This is libtool 2.4.2
Debian-2.4.2-1ubuntu1, but the
libtool: definition of this LT_INIT comes from libtool 2.2.6b.
libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
Debian-2.4.2-1ubuntu1
libtool: and run autoconf again.
make: *** [ser2net] Error 63

Should I write something like: broken configure script?

Yegor
