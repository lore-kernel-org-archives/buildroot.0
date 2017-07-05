From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jul 2017 09:38:07 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <20170705072538.GE3499@scaer>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer>
Message-ID: <20170705073807.GF3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2017-07-05 09:25 +0200, Yann E. MORIN spake thusly:
> On 2017-07-04 16:54 -0700, Markus Mayer spake thusly:
> > From: Markus Mayer <mmayer@broadcom.com>
> > 
> > The Linux tools master makefile (linux-tools.mk) must be included after
> > all Linux tools sub-makefiles (linux-tool-*.mk). This is currently
> > ensured by sorting all package makefiles alphabetically.
> > 
> > In preparation for adding linux-tool-tmon, we cannot keep relying on
> > this mechanism. In the C locale, linux-tool-tmon.mk will be sorted
> > behind linux-tools.mk, which would break the build.
[--SNIP--]
> However, I am totally in favour of fixing it once and for all.
> 
> But rather than do a hack in the main Makefile as you suggest, I would
> just ensure the ordering of the files.
> 
> I think we should just rneame the individual tool files to remove
> the .mk extension, and then exp[licitly source them from
> package/linux-tools/linux-tools.mk
> 
>     include $(wildcard package/linux-tools/linux-tool-*)
> 
> and be done with that once and for all.

But don't hurry in doing so, we've been discussing this IRL with Thomas,
and he is not happy with that proposal (but he agrees that touching the
main Makefile is not acceptable).

We're looking to find an alternative solution...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
