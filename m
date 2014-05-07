From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 7 May 2014 19:46:58 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <536A6F53.1020408@lucaceresoli.net>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
 <20140507174421.04e3c2f2@free-electrons.com>
 <CAHkwnC-nxOwx6wj3hQaPbG4Q5nzQMbyK-xhuKsPd6F5_afSrhQ@mail.gmail.com>
 <536A6F53.1020408@lucaceresoli.net>
Message-ID: <CAHkwnC98U2CNXV0KD8Uh1QEisSZvbmTwTiY3t7bp=guYjhMqFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 7, 2014 at 7:37 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Fabio,
>
>
> Fabio Porcedda wrote:
>>
>> On Wed, May 7, 2014 at 5:44 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>>
>>> Dear Fabio Porcedda,
>>>
>>> On Wed, 7 May 2014 17:32:38 +0200, Fabio Porcedda wrote:
>>>
>>>> Are you sure that In your system there isn't installed the ncurses
>>>> development package?
>>>>
>>>> On my ubuntu distribution if i uninstall the libncurses5-dev package i
>>>> got:
>>>>
>>>> make defconfig && make allyespackageconfig
>>>>
>>>> make host-cmake
>>>
>>>
>>> Well, right. On my system, libncurses-dev is definitely installed, but
>>> I was thinking that on the autobuilders chroot it is not. But in fact
>>> it is, for a simple reason: libncurses-dev is needed for 'make
>>> menuconfig'.
>
>
> Still I find it strange that it fails. If libncurses-dev is not
> found, CMake just disables building ccmake. Maybe you had configured
> host-cmake with libncurses-dev installed, then (re)built it without
> libncurses?

Nope, every time to be sure to get rid of clutter I do a "make
host-cmake-dirclean && make host-cmake".

> Anyway, this is not that important because...
>
>
>>>
>>> So I believe you're maybe using 'make xconfig' or 'make gconfig', and
>>> therefore you don't need to have the libncurses development files
>>> installed.
>>
>>
>> Well, i found that only because I used buildroot on a fresh installed
>> system, i usually have installed the ncurses development files.
>> I just think that it's useful to take care of it because it's not fun
>> that the building fail halfway, so we have to choose between:
>> -  document it
>> - add the dependency to cmake
>> -  disable it
>> The last option seems to be the preferred one.
>
>
> ...disabling ccmake is by far the best thing to do.
>
> I'm having a look at your patch right now.

Thanks
-- 
Fabio Porcedda
