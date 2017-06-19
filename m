From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jun 2017 20:48:04 +0200
Subject: [Buildroot] [PATCH 4/4 v2] tools: move check-package out of
 support/scripts/
In-Reply-To: <5947435fc2125_3a623fad069a6b206136c@ultri3.mail>
References: <eb8cb9682d84d1f110044a1448f18ef95ad79e84.1497794488.git.yann.morin.1998@free.fr>
 <5947435fc2125_3a623fad069a6b206136c@ultri3.mail>
Message-ID: <20170619184804.GD3045@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-06-19 00:22 -0300, Ricardo Martincoski spake thusly:
> On Sun, Jun 18, 2017 at 11:01 AM, Yann E. MORIN wrote:
> 
> > ---
> >  support/scripts/check-package                      | 145 +--------------------
> >  support/scripts/pkg-stats                          |   2 +-
> >  tools/00-README.txt                                |   4 +
> >  tools/check-package                                | 144 ++++++++++++++++++++
> >  .../scripts => tools}/checkpackagelib/__init__.py  |   0
> >  {support/scripts => tools}/checkpackagelib/base.py |   0
> >  {support/scripts => tools}/checkpackagelib/lib.py  |   0
> >  .../checkpackagelib/lib_config.py                  |   0
> >  .../scripts => tools}/checkpackagelib/lib_hash.py  |   0
> >  .../scripts => tools}/checkpackagelib/lib_mk.py    |   0
> >  .../scripts => tools}/checkpackagelib/lib_patch.py |   0
> >  .../scripts => tools}/checkpackagelib/readme.txt   |  10 +-
> >  12 files changed, 155 insertions(+), 150 deletions(-)
> >  mode change 100755 => 120000 support/scripts/check-package
> >  create mode 100755 tools/check-package
> >  rename {support/scripts => tools}/checkpackagelib/__init__.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/base.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/lib.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/lib_config.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/lib_hash.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/lib_mk.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/lib_patch.py (100%)
> >  rename {support/scripts => tools}/checkpackagelib/readme.txt (91%)
> 
> I forgot earlier...
> 
> Also the entry in the DEVELOPERS file must be updated
> F:	support/scripts/check*package*
> 
> Probably if I didn't used '*' it would be easier to find.
> I didn't tested but I assume we could use
> F:	tools/check-package
> F:	tools/checkpackagelib/

I'll fix as you suggest, to drop the midle wildcard.

Also, you happen to have two entries in the DEVELOPPERS file, with two
different emails:

  1368 N:? Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
  1369 F:? package/atop/

and

  1374 N:? Ricardo Martincoski <ricardo.martincoski@gmail.com>
  1375 F:? support/scripts/check*package*

Is that expected?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
