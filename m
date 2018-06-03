From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Jun 2018 09:11:57 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing: fix python syntax
In-Reply-To: <5b136d851dd0e_208c3fee360e65a052968@ultri5.mail>
References: <141e1e33fdf6b4601677642ab64e7d76969ca96a.1527977964.git.yann.morin.1998@free.fr>
 <5b136d851dd0e_208c3fee360e65a052968@ultri5.mail>
Message-ID: <20180603071157.GA23330@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-06-03 01:24 -0300, Ricardo Martincoski spake thusly:
> On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:
> > We're about to switch to using the flake8 from the distro, and that one
> > uncovers two more issues that the previously used pip-provided one did
> > not catch:
> 
> See my comments to patch 4. What generates more warnings is the fact that we
> start using Python3 interpreter to call flake8.

Oh, so the interpreter for flake8 has an impact onhow it interprets the
code it scans. Weird...

> We can call this patch a step towards Python 3 support for the test infra.

Yeah, I like this idea! ;-]

> [snip]
> > ---
> >  support/testing/infra/__init__.py | 6 +++---
> >  support/testing/infra/basetest.py | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> By running one of below commands (after the others from .gitlab-ci.yml) I get:
> $ python3 -m flake8 --statistics --count $(cat files.processed)
> $ flake8 --statistics --count $(cat files.processed)
> 
> support/testing/infra/basetest.py:49:28: E999 SyntaxError: invalid syntax
> support/testing/infra/__init__.py:37:29: E999 SyntaxError: invalid syntax
> support/testing/run-tests:44:29: E999 SyntaxError: invalid syntax

Weird, I didn't have that last one here in the docker image... But
indeed, another case of print-is-a-function-now

> 3     E999 SyntaxError: invalid syntax
> 3
> 
> So it seems support/testing/run-tests also needs to be changed.

I'll do so when I respin the series. Thanks for the reviews! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
