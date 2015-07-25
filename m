From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 18:13:34 +0200
Subject: [Buildroot] [PATCH v6 1/1] rtl8821au: new package
In-Reply-To: <alpine.LNX.2.00.1507241546220.30794@localhost>
References: <1437691280-23926-1-git-send-email-christian@paral.in>
 <alpine.LNX.2.00.1507241546220.30794@localhost>
Message-ID: <20150725161334.GI3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulli, all,

On 2015-07-24 15:50 +0200, Hans Ulli Kroll spake thusly:
> Note : I'm new on the list, so I had insert this tread by hand !

Welcome! :-)

> I'm the one working on the RTL8821AU driver.

Yeah, great! I saw that Christian and I did some work on the same
module, but based on diffferent code-dump by different vendors. It would
be great if you two could synchronise your work on this, to avoid
duplication and to get the best driver possible, with a ultimate goal of
submitting it for inclusion in the mainline. ;-)

> On Thu, 23 Jul 2015, Christian Stewart wrote:
> > Adding a kernel module based USB wifi driver. There is no official
> > version of this driver that works properly on ARM and with newer USB
> > WiFi cards. This driver version builds module 8821au and is based on a
> > kernel module release from ASUS with various fixes integrated in.
> 
> This message will be commited please change.

No, that's OK to get some details when adding a new package.

> The I think the difference between the version from ASUS and mine based
> the one Edimax are in the handling of the LED.
> Maybe there are more ...

Well, if that's the only difference, we can consider that to be a minor
issue that can be resolvdd by back-/forward-porting it from one code
base to the other.

> > I've switched to use ulli-kroll's branch of rtl8821au. While it's based
> > on an older vendor version, it has binary firmware and around ~1800
> > commits of work to improve the driver. I think this work is probably
> > more valuable than the vendor's updates.
> > 
> 
> -> git send-email --compose
> Will add some message an intreductory message

That's OK the way Christian did: that part isindeed not part of the
commit message, as it lise below the '---' line, so git wil ignore it
when the patch is applied.

> > --- /dev/null
> > +++ b/package/rtl8821au/0001-disable-default-debug.patch
> 
> I do add some kind of "disable debug message"
> This will take some time, I'm currently working in the code.

Great! :-)

> > +config BR2_PACKAGE_RTL8821AU
> > +     bool "rtl8821au"
> > +     depends on BR2_LINUX_KERNEL
> > +     help
> > +       rtl8821au wifi driver
> > +
> > +       https://github.com/paralin/rtl8821au
> 
> Please fix this URL !
> 
> Maybe add some line "out of tree driver"

Well, if it were an in-tree module, we would not have a package for it,
as it would come with the Linux source tree. So, this is obviously an
out-of-tree module. ;-)

> And the USB3 issue I found inthe HW as you can read in
> Readme.md

I see that Christian added that in the new commit log and help text.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
