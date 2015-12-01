From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 1 Dec 2015 11:33:25 +0100
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <20151201095826.GC2193@tarshish>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
 <20151201095826.GC2193@tarshish>
Message-ID: <CAGm1_ks+db-1cASJWweJ6B2LHBa+zNfzj1V2+aQvdhFYbT=UOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 1, 2015 at 10:58 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Yegor,
>
> On Tue, Dec 01, 2015 at 09:52:22AM +0100, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Remove obsolete compilation error patch and update jimtcl related patch.
>
> [...]
>
>> -OPENOCD_VERSION = 0.8.0
>> +OPENOCD_VERSION = 0.9.0
>>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>> -OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
>> +OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
>>
>>  OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>
> Is this still needed?

Commit message states: Pass -std=gnu99, needed to build with a basic toolchain.

I've commented this like and could successfully compile with musl +
gcc 4.9.3 and also with Linaro ARM 2015.08 (GCC 5.x).

@Thomas and @Claudio: any idea, what configuration produced compiling issues?

Yegor
