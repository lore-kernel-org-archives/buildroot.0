From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Dec 2018 11:57:31 +0100
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
References: <CADvTj4rPZqjx_iNHF7Q8DKa63P+OOX=v-YuhCfUZMR4VOa-zsw@mail.gmail.com>
 <CADvTj4ognr24o+CU-gBsCkH2K=KqbwAtrNv2Vv+9L_97HFUQhg@mail.gmail.com>
 <CADvTj4pMMmcwaij-ApcgHQB0ZSAyh3vQHQ_VEb-rQGtraxHuwA@mail.gmail.com>
 <CADvTj4r=OkPbwSyN2ZUmFxraHQYp07ciW700574-ZD2Xzjqihw@mail.gmail.com>
 <20181227084902.GN14286@scaer>
 <CADvTj4qwOPD774mrqNOWK+FZ1wWVX8jAhsYnW3fQ0b7-nTaswA@mail.gmail.com>
 <20181227091134.GO14286@scaer>
 <CADvTj4oEdXRcOScrou=L0-AWG1pGu3kD9PLj=j9WoeJUBUG8bA@mail.gmail.com>
 <20181227104029.GP14286@scaer>
 <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
Message-ID: <20181227105731.GR14286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2018-12-27 04:42 -0600, James Hilliard spake thusly:
> On Thu, Dec 27, 2018 at 4:40 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > I can confirm that, without the hunk in src/systemd/meson.build, I was
> > able to build systemd with this defconfig:
> >     BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> >     BR2_INIT_SYSTEMD=y
> That's without c++ right?

Yes, that's without C++.

You can check a defconfig by doing:

    $ cat >.config <<_EOF_
    BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
    BR2_INIT_SYSTEMD=y
    _EOF_

    $ make olddefconfig

    $ grep CXX .config
    # BR2_TOOLCHAIN_BUILDROOT_CXX is not set

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
