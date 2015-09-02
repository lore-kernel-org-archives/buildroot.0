From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 2 Sep 2015 20:24:09 +0200
Subject: [Buildroot] First rootfile system build using buildroot
In-Reply-To: <CAKpDV8t+_+_dDKD07ZtT9KdJWTqpoLnXe+fJq_tALohfJAZ82Q@mail.gmail.com>
References: <944894A3EB1D044A9003B2F944389BB20474C3458C@svr-wa-exch1.atg.lc>
 <CAKpDV8svFZsaBA_hZjpoM5SFdSohihmugGW_9jYps=zsNzG5Mw@mail.gmail.com>
 <20150902033810.GS17874@tarshish>
 <CAKpDV8u0ojKAuOJMEzFOjd7dKx6k9Sm-fK8Z5xk7Y7_xdJPNyg@mail.gmail.com>
 <20150902114729.GA18583@tarshish>
 <CAKpDV8vpO_2UUWUBssE6hDCV=Jh3b1sAeY4=V-b6xEazzdJAPg@mail.gmail.com>
 <55E700A5.3080403@imgtec.com>
 <CAKpDV8s=1pCEaM33q-5YRADPhrAfkEaRbncFKBPeb3CWwxz_Ew@mail.gmail.com>
 <55E70DF5.7060309@imgtec.com>
 <CAKpDV8uF2+EPKHTtcfSG6P43apra6ZeC=wd9q4X3_L-U3h98_g@mail.gmail.com>
 <20150902171635.GB18583@tarshish>
 <CAKpDV8t+_+_dDKD07ZtT9KdJWTqpoLnXe+fJq_tALohfJAZ82Q@mail.gmail.com>
Message-ID: <CAHXCMMJ=GDJ3boDtCYV8YbGXDgnHa93De5RJdT-fWGjYhBVnCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Katoch,

On Wed, Sep 2, 2015 at 7:58 PM, Dinesh Guleria <din.gulu.er@gmail.com> wrote:
>>> You find the list of kernel defconfig files under the arch/<your
>>> architecture>/configs/ directory of the *kernel*.
>    I have selected bcm2835 (Rpi controller), its building fine.
>
> Buildroot /board directory contains folder for many boards. What is the
> significance of buildroot /board directory ?

You might find some answers here [1] (even if this section of the
manual is about for user's project customization, the rough idea is
still followed in the official buildroot tree).

>
>
> What is the significance of  *_deconfig files under buildroot directory
> /configs
>

Please, understand that Buildroot uses the same configuration tool as
the linux kernel, i.e. Kconfig.
So, the *_defconfig files in the <buildroot>/configs/ directory are
exactly the same that what the *_defconfig files in
<linux>/arch/<your_arch>/configs/ are.
IOW,:
- for the kernel: a <cpu>_defconfig file is the minimal set of linux'
configurations for the given CPU;
- for Buildroot: a <target>_defconfig file is the minimal set of
Buildroot's configurations for the given target, with one of these
configurations being the kernel's defconfig name or configuration file
(depending on your selection in the menu).


Take some time in the Buildroot manual [2] (at least, parts I and II),
you'll certainly learn something useful for your work.
Then, if you have not found the answers to some question, let us know
what is missing in the manual (we try hard to make Buildroot easy for
new comers, including the manual ;-]).


[1] http://buildroot.org/downloads/manual/manual.html#customize-dir-structure
[2] http://buildroot.org/downloads/manual/manual.html


> Regards,
> katoch
>
> On Wed, Sep 2, 2015 at 10:46 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> Hi Katoch,
>>
>> On Wed, Sep 02, 2015 at 10:27:01PM +0530, Dinesh Guleria wrote:
>> > >> And type the name of the defconfig (without the trailing _defconfig).
>> > As i need to build for raspberrypi.
>> > And as I have *raspberrypi_deconfig* in my following directory /config
>> > of
>> > buildroot.
>> > So i write the name as *raspberrypi *.
>> >
>> > But getting following error at the time of make . see the attached
>> > image.
>>
>> This option is about the *kernel* config, not Buildroot one. You find the
>> list
>> of kernel defconfig files under the arch/<your architecture>/configs/
>> directory of the *kernel*.
>>
>> baruch
>>
>> --
>>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
>> Systems
>>
>> =}------------------------------------------------ooO--U--Ooo------------{=
>>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,

-- 
Samuel
