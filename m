From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 20:52:45 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
 BR2_SHARED_LIBS
In-Reply-To: <20151018183347.06045571@free-electrons.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
 <20151018150918.7db2cc07@free-electrons.com>
 <20151018155838.GE3583@free.fr>
 <CAEHm_sjfxGkfvzvi=y-Mq+xGdOObGyKLfgfbO0g2MN+kCNUteg@mail.gmail.com>
 <20151018183347.06045571@free-electrons.com>
Message-ID: <20151018185245.GF3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Charles, All,

On 2015-10-18 18:33 +0200, Thomas Petazzoni spake thusly:
> Charles, Yann,
> 
> On Sun, 18 Oct 2015 16:18:10 +0000, Charles Duffy wrote:
> > I provided this patch because my build results were unnecessarily enlarged
> > by dynamic libraries on an otherwise static-only system.
> > 
> > It sounds to me like we could optionally disable only dynamic libraries;
> > leave static libraries always enabled; and end up in a place that works for
> > everyone.
> 
> Yeah, that's also my thought. In uClibc, you can enable/disable the
> shared library build, but not the static library build. So maybe we
> should do:
> 
> 	--enable-static \
> 	$(if $(BR2_STATIC_LIBS),--disable-shared,--enable-shared)
> 
> I.e, always static, and shared as soon as BR2_STATIC_LIBS is disabled.

Yes, I think this would be the best solution.

Charles, care to send the patch, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
