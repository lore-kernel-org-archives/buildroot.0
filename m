From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Feb 2019 11:32:19 +0100
Subject: [Buildroot] [EXT] Re: [PATCH v2 1/3]
 package/arm-gnu-rm-toolchain: new package
In-Reply-To: <CAAXf6LX=T_hPz05g6vmkfHFpH4HKuGnTfxva7YJxJ4YX8tojog@mail.gmail.com>
References: <20190205074324.8097-1-kostap@marvell.com>
 <20190205074324.8097-2-kostap@marvell.com>
 <20190205091940.GA18066@scaer>
 <BYAPR18MB2360CDED4B3FB0DDAC921F3FCA6E0@BYAPR18MB2360.namprd18.prod.outlook.com>
 <CAAXf6LX=T_hPz05g6vmkfHFpH4HKuGnTfxva7YJxJ4YX8tojog@mail.gmail.com>
Message-ID: <20190205103219.GB18066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kostya, All,

On 2019-02-05 11:15 +0100, Thomas De Schampheleire spake thusly:
> El mar., 5 feb. 2019 a las 10:34, Kostya Porotchkin
> (<kostap@marvell.com>) escribi?:
[--SNIP--]
> > > > +define HOST_ARM_GNU_RM_TOOLCHAIN_INSTALL_CMDS
> > > > +   mkdir -p $(HOST_DIR)/opt/gcc-arm-none-eabi/
> > > > +   cp -a $(@D)/* $(HOST_DIR)/opt/gcc-arm-none-eabi/
> > >
> > > You should rather use a mv to avoid the size duplication, like we do in the
> > > external-toolchain infra for the main toolchain.
> > [KP] Yes, already doing so following Thomas review

Yeah, the guys were doing the review at the same tiem I was, I just got
sidetracked and did not notice before sending my mail. ;-)

> > > Also, why do you not install them in $(HOST_DIR)? As it is as you did, other
> > > packages have to know about this specific location, which is not entirely
> > > nice... However, if installing in $(HOST_DIR), maybe we have to be carefull
> > > about not causing name-clashing with other host stuff...
> > [KP] Again, after Thomas review I am adding symbolic links from the toolchain executables in "bin" folder to the $(HOST_DIR)/bin
> > Will it be enough? I am noty sure if it's good to just extract the entire package to the $(HOST_DIR)/.
> > Please correct me if I am wrong.
> Yes, I think that we should only have symlinks there, not the actual
> extracted tarball. This follows the same approach as the internal
> toolchain.

Yes, actually, symlinks will probably be enough, indeed. I was just
pointing out the usefulness of being able to call the tools from a known
location, even only if via symlinks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
