From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Jan 2019 22:00:37 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-01-18
In-Reply-To: <20190120195338.GA10424@itchy>
References: <20190119070033.A2FE1209BF@mail.bootlin.com>
 <20190120195338.GA10424@itchy>
Message-ID: <871s57nlp6.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

On Sun, Jan 20 2019, Eric Le Bihan wrote:
> On 2019-01-19 08:00, Thomas Petazzoni wrote:
>> Hello,
>>
>> Build statistics for 2019-01-18
>> ===============================
>>
>>       branch |  OK | NOK | TIM | TOT |
>>    2018.02.x |  22 |   0 |   0 |  22 |
>>    2018.11.x |  27 |   0 |   1 |  28 |
>>       master | 200 |  50 |   2 | 252 |
>>
> [...]
>>      riscv32 |                skalibs-2.6.4.0 | NOK | http://autobuild.buildroot.net/results/6c5ee3b8a94c7c2434a3aad303d6c7844b566b72 |
>
> This one may require deep digging... The build fails because mcontext_t
> is not defined.
>
> Looking at sysdeps/unix/sysv/linux/riscv/sys/ucontext.h, this may happen
> if __USE_MISC is not defined, which means that, according to
> include/features.h, _DEFAULT_SOURCE would not be defined...
>
> Should marking skalibs as "depends on !BR2_riscv" be acceptable as a
> temporary fix?

A number of packages are affected. Mark promised[1] to take a look soon.

baruch

[1] http://lists.busybox.net/pipermail/buildroot/2019-January/240690.html

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
