From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 8 Jan 2014 19:46:35 +0100
Subject: [Buildroot] [PATCH 2/5] toolchain/external: fix wrapper by not
 passing conflicting flags
In-Reply-To: <20140108180141.GA3430@free.fr>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <5d0fbb9b1f4439750dde9bb7788b273ec94a3bd5.1389134731.git.yann.morin.1998@free.fr>
 <CAGduivx327zJ_Vy=NDzE9pQKBEkd+OPWHLw2SOYaHACMtvX07Q@mail.gmail.com>
 <20140108235132.2e741f4a@skate>
 <CAGduivw60X1M=cG9xx_ZJqVOgnKB5C7DpfduEwLJD+j0r46sSA@mail.gmail.com>
 <20140108180141.GA3430@free.fr>
Message-ID: <CAGduivy2C_c+gwWT4vtS_twWPJm6cD5e7h6_032h1466pEAJ4A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Jan 8, 2014 at 7:01 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On 2014-01-08 16:57 +0100, Maxime Hadjinlian spake thusly:
>> On Wed, Jan 8, 2014 at 4:51 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Dear Maxime Hadjinlian,
>> Hi Thomas,
>> >
>> > On Wed, 8 Jan 2014 13:45:59 +0100, Maxime Hadjinlian wrote:
>> >
>> >> Shouldn't we change the different defconfig that exists ? At least the
>> >> RaspberryPi so it would sets an example (and maybe add something about
>> >> this in the manual ?)
>> >
>> > Why would the defconfig need some changes following this patch?
>> To set a visible example of settings the correct -march/mcpu/mtune options ?
>> Also, this would eliminate all the warnings that Yann saw while
>> building a kernel for the rpi, so it seems like a good candidate.
>
> There is nothing in that patch that impacts the configuration.
> There is no reason to change any defconfig to 'activate' this change.
>
> Rather, the config options BR2_GCC_TARGET_CPU, BR2_GCC_TARGET_ARCH, and
> BR2_GCC_TARGET_MTUNE, if any, are pased at the time we build the wrapper
> itself.
>
> Those options are set automatically when you choose, in the menuconfig,
> the type of CPU your target has. And since that will automatically set
> the BR2_GCC_TARGET_{ARCH,CPU,MTUNE} options, they are forcibly set.
>
> And since the raspberrypi_defconfig (as you use that as an example)
> already sets BR2_arm1176jzf_s=y, this will set BR2_GCC_TARGET_ARCH and
> BR2_GCC_TARGET_CPU.
>
> And this is exactly this situation this patch fixes: our options forcing
> the compiler flags, when some are already provided on the command line.
>
> So, there is no need (and no reason) to change any of our defconfigs to
> take advantage of this change.
>
> Regards,
> Yann E. MORIN.
My  bad,
I spoke too quickly and I misunderstood some information.

Thanks for your clarifications.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
