From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:17:41 +0100
Subject: [Buildroot] [PATCH 3/4] package/dvb-apps: bump version
In-Reply-To: <20131222192851.037f3123@skate>
References: <cover.1385937338.git.yann.morin.1998@free.fr>
 <8ff24edea518d291706dddec42aa360cef4176ed.1385937338.git.yann.morin.1998@free.fr>
 <20131222192851.037f3123@skate>
Message-ID: <20131222201740.GA27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-22 19:28 +0100, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Sun,  1 Dec 2013 23:36:06 +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Fixes for scanning DVBS, misc compiler warnings suppressed.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/dvb-apps/dvb-apps.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> I don't know if it is happening since this bump, but there are some
> dvb-apps build failure in the autobuilders:
> 
>   http://autobuild.buildroot.org/results/7f6/7f69d253ffcdd285ab73616c5748e46a796ebfb8/build-end.log

Too old kernel headers:

util.c:184:7: error: 'SYS_TURBO' undeclared (first use in this function)
util.c:188:7: error: 'SYS_DVBT2' undeclared (first use in this function)
util.c:193:7: error: 'SYS_DVBC_ANNEX_A' undeclared (first use in this function)
util.c:194:7: error: 'SYS_DVBC_ANNEX_C' undeclared (first use in this function)
util.c:262:26: error: 'DTV_ENUM_DELSYS' undeclared (first use in this function)

Those were added back in 2011, between 2001-05-12 and 2011-12-17.

I don't know what to do about too old toolchains... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
