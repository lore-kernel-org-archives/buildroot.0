From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 19:24:01 +0200
Subject: [Buildroot] [PATCH] package/python: fix sqlite3 extension
 without threads
In-Reply-To: <20140715191811.487b84ac@free-electrons.com>
References: <1405167112-9063-1-git-send-email-yann.morin.1998@free.fr>
 <20140715191811.487b84ac@free-electrons.com>
Message-ID: <20140715172400.GC3351@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-15 19:18 +0200, Thomas Petazzoni spake thusly:
> On Sat, 12 Jul 2014 14:11:52 +0200, Yann E. MORIN wrote:
> > Fix a compiler error when building the sqlite3 extension, when the
> > toolchain does not have threads.
> > 
> > Fixes:
> >         http://autobuild.buildroot.net/results/10f/10f268cd55f16ee53f4c5e17e1248b0a1820f6ea/
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  .../python-015-fix-sqlite-without-threads.patch    | 48 ++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 package/python/python-015-fix-sqlite-without-threads.patch
> 
> Applied, thanks. Do you know if Python 3 is affected as well?

It is not. The cset I backported is from 3.3, and we're using 3.4.1:
    http://hg.python.org/cpython/file/v3.4.1/Modules/_sqlite/connection.c#l760

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
