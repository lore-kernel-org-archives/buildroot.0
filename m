From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Nov 2014 19:12:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/util-linux: libuuid needs -lintl
In-Reply-To: <20141129180448.GB2204@tarshish>
References: <cover.1417276704.git.yann.morin.1998@free.fr>
 <16c19005f9076a857c9082f1f6fbe6617a1ec9a6.1417276704.git.yann.morin.1998@free.fr>
 <20141129180448.GB2204@tarshish>
Message-ID: <20141129181215.GA4217@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-29 20:04 +0200, Baruch Siach spake thusly:
> On Sat, Nov 29, 2014 at 04:59:57PM +0100, Yann E. MORIN wrote:
> > When gettext is needed (with locales), libuuid needs to be linked
> > against -lintl.
> > 
> > In dynamic link, this is solved via the DT_NEEDED ELF tag, but for
> > static links, it does not get pulled in automatically.
> > 
> > fix that by adding a Libs.private section to uid.pc, but only if
> 
> s/uid/uuid/

Fixed, thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
