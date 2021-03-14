From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 13:42:49 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <CA+h8R2r7oBE1h7FSQC+CR=q2Vr-K5bS-qkwVFO-+GT24Qb6Raw@mail.gmail.com>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
 <CA+h8R2ps1MF-NiZKYWceSTruHLXMpzLPORhzORetVKuF1PWDdA@mail.gmail.com>
 <20210312230903.18bf4a0a@gmx.net>
 <CA+h8R2r7oBE1h7FSQC+CR=q2Vr-K5bS-qkwVFO-+GT24Qb6Raw@mail.gmail.com>
Message-ID: <20210314124249.GW2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, Peter, All,

On 2021-03-12 15:51 -0800, Christian Stewart spake thusly:
> On Fri, Mar 12, 2021 at 2:09 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > On Thu, Mar 11, 2021 at 1:08 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > > -BATMAN_ADV_VERSION = 2019.3
> > > > +BATMAN_ADV_VERSION = 2021.0
> > > I get build errors against 2 different device kernels (x86_64 and pi4):
[--SNIP--]
> > For me the update fixed the compile for RPi4_64 ;-), can you share your
> > defconfig(s)?
> OK, I see what happened here. I just ran "make batman-adv" in an
> existing tree without enabling the Kconfig options.
> 
> The problem is when batman adv protocol version 5 is not enabled:
> 
> BR2_PACKAGE_BATMAN_ADV=y
> # BR2_PACKAGE_BATMAN_ADV_DEBUG is not set
> # BR2_PACKAGE_BATMAN_ADV_NC is not set
> # BR2_PACKAGE_BATMAN_ADV_BATMAN_V is not set
> 
> That's causing the "batadv_v_init" undefined errors.

So is this an actual issue that still needs to be addressed, or can the
patch be applied now?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
