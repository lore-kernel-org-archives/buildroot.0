From: Anders Darander <anders.darander@gmail.com>
Date: Tue, 5 Jun 2012 12:41:03 +0200
Subject: [Buildroot] adding a package
In-Reply-To: <CAGXs5wXXBo+WjmZTvRGzBXfBdeVOzexKh6JTWQSL8xN-O+KhgA@mail.gmail.com>
References: <CAGXs5wXdM_jfwH-9C=j=Oz=4L0dpF2pDAucqx9kYaTBy3MJAJQ@mail.gmail.com>
 <20120605055548.GA18708@sapphire.tkos.co.il>
 <CAGXs5wVOE2vH3wHcqS0Af2T0Oeg2GdNtktoK=o3Y3sGog9vSxQ@mail.gmail.com>
 <20120605064159.GB18708@sapphire.tkos.co.il>
 <CAE4k238km9p1m-oYtN2BuOOkpT0sWoe210jB7N9khSMfYW-iaQ@mail.gmail.com>
 <CAGXs5wXXBo+WjmZTvRGzBXfBdeVOzexKh6JTWQSL8xN-O+KhgA@mail.gmail.com>
Message-ID: <CAE4k239raarnUtdCXf=HON7jo35WKY6e-ehfF7Vq=+Le3oEe6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we're leaving buildroot, it's probably a good idea to move the
discussion to the Yocto Project discussion list:
yocto at yoctoproject.org

On Tue, Jun 5, 2012 at 11:44 AM, Kevin Wilson <wkevils@gmail.com> wrote:
> Hi,
>
> As said, I need a filesystem for ARM.
>
> Thanks Brauch (and also thanks for Anders Darander)
> I downloaded the tarball for yokto
> project and acted according to the instructions,
>
> However, unless I do not understand something correctly,
> there is a config file named conf/local.conf ;
> In this file you must select a Machine from one
> of with these entries:
>
> #MACHINE ?= "qemuarm"
> #MACHINE ?= "qemumips"
> #MACHINE ?= "qemuppc"
> #MACHINE ?= "qemux86"
> #MACHINE ?= "qemux86-64"
> #
> # There are also the following hardware board target machines included for
> # demonstration purposes:
> #
> #MACHINE ?= "atom-pc"
> #MACHINE ?= "beagleboard"
> #MACHINE ?= "mpc8315e-rdb"
> #MACHINE ?= "routerstationpro"

There is a limited set of supported boards from a standard yocto download.

You should either find a bsp-layer for your board (or a board close
enough), or you'll have to create a machine config yourself.

> However, I am not using a beagleboard, I am using some
> other ARM based board. And it seems to me that using qemuarm is not a
> good choice, as I prefer not to work with qemu emulator,

What board are you using? Something standard/common?

A list of layers available for OpenEmbedded Core (which is what yocto
is based on) is found at http://www.openembedded.org/wiki/LayerIndex.

Cheers,
Anders

> Does anybody knows anything ?
>
> rgs,
> Kevin Wilson
> sw engineer
>
>
> On Tue, Jun 5, 2012 at 11:06 AM, Anders Darander
> <anders.darander@gmail.com> wrote:
>> On Tue, Jun 5, 2012 at 8:42 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>>> Hi Kevin,
>>>
>>> On Tue, Jun 05, 2012 at 09:28:55AM +0300, Kevin Wilson wrote:
>>>> Thanks for your quick response !
>>>> >If you need a package manager try
>>>> > something like yocto (http://www.yoctoproject.org).
>>>> >
>>>> I don't have experience with Yokto
>>>> Any idea: does Yokto has some known package manager mechansim (like
>>>> apt-get or rpm?) or is it uses some unique package manager of its own
>>>> ?
>>>
>>> I don't have experience with yocto either. A quick glance at
>>> http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html
>>> (especially the block diagram) seems to indicate that yocto support more than
>>> one package manager.
>>
>> Yes, Yocto (or oe-core and meta-oe) supports opkg (ipk), deb, and rpm.
>> Likely opkg (ipk) and rpm are the most tested and most widely used.
>>
>> /Anders



-- 
Anders Darander
EPO guidelines 1978: "If the contribution to the known art resides
solely in a computer program then the subject matter is not
patentable in whatever manner it may be presented in the claims."
