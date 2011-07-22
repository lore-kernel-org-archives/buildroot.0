From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 22 Jul 2011 18:57:22 +0200
Subject: [Buildroot] Crosstool-ng buildroot installing old version tools
In-Reply-To: <CADfuMF6B3qLE9oUmsXMiZOSeCjOdXXUh16+8ESzBpufhmt0QUg@mail.gmail.com>
References: <CADfuMF6B3qLE9oUmsXMiZOSeCjOdXXUh16+8ESzBpufhmt0QUg@mail.gmail.com>
Message-ID: <201107221857.22411.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vasanth, All,

On Friday 22 July 2011 14:06:31 Vasanth Ragavendran wrote:
> I am using buildroot for generating toolchain for my target. However since I
> need glibc for it I'm using the toolchain from crosstoolchain-ng in the
> toolchain option in make menuconfig of buildroot. However the "crosstool-ng"
> the buildroot installs is 1.11.3 and checking the conf file of crosstool-ng
> reveals that some of the tools the crosstool-ng uses are pretty old versions
> like gcc 4.4.6. It takes these values by default. However i'm trying to
> change these versions in the conf file present in
> buildroot/toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc, while
> the crosstool-ng installs in buildroot, it still takes the old values only
> for the tools. like i changed the gcc version to 4.5.2
> in crosstool-ng.config-glibc from gcc-4.4.6, the buildroot still installs
> the 4.4.6 version only and not 4.5.2 why is this happening? Plz help.

To change the crosstool-Ng configuration, as instructed in the menu help
entry, you can run:
  make ctng-menuconfig

There, you'll be able to change the crosstool-NG related settings, such as
the gcc or glibc versions to use.

The default are values that are known to pretty much work in all cases,
which is why they are not totally up-to-date, without being completely
out-dated either.

Note however that, if the toolchain was already built, it might happen
that the new settings are not taken into account. It is highly suggested
to restart from scratch if changing the toolchain settings. This is valid,
AFAIK, whether you are using the crosstool-NG backend, or the internal
backend.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
