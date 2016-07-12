From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 18:48:20 +0200
Subject: [Buildroot] Buildroot now requires IPv6?
In-Reply-To: <20160711164358.GT3870@tarshish>
References: <nm0hoh$8ce$1@ger.gmane.org>
 <20160711164358.GT3870@tarshish>
Message-ID: <20160712164820.GC3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant, Baruch,

On 2016-07-11 19:43 +0300, Baruch Siach spake thusly:
> On Mon, Jul 11, 2016 at 04:33:22PM +0000, Grant Edwards wrote:
> > The products for which I use buildroot do not have IPv6 support
> > (that's in the product requirements).  However, it appears that more
> > recent versions of Buildroot now force you to use a toolchain with
> > IPv6 support in the C library even if no applications uses IPv6 and
> > the kernel doesn't support IPV6.
> > 
> > Do I understand this correctly?
> 
> That's correct. The CHANGES entry for 2015.05-rc1 reads:
> 
>   Toolchains: IPv6 and Largefile support now enforced for
>   uClibc. Corresponding Kconfig symbols removed.
> 
> Only uClibc is mentioned here because other C libraries already enable IPv6 
> unconditionally.

But nothing prevents you from running on a kernel that does not have
IPv6. The requirements are only about IPv6 support in the toolchain.

Maintaining support for non-IPv6 toolchains was becoming quite a
problem, as more and more packages were breaking with such toolchains.

And come on, we're in 2016, there is no more IPv4 available, it's time
to switch over to IPV6! ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
