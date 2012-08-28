From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Aug 2012 19:14:25 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <201208270043.26928.yann.morin.1998@free.fr>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208262240.51214.yann.morin.1998@free.fr>
 <201208270043.26928.yann.morin.1998@free.fr>
Message-ID: <201208281914.25890.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 27 August 2012 00:43:26 Yann E. MORIN wrote:
> On Sunday 26 August 2012 22:40:50 Yann E. MORIN wrote:
> > What's left, now, is to change each dependency on a package /main/ symbol
> > to a dependency on the corresponding _AVAILABLE symbol, plus a select on
> > the the /main/ symbol. I hope to update my scripts with this functionality.
> > I definitely do not want to manually review hundreds of packages! ;-)
> 
> Well, find attached an updated pkg-avail script that does just that.
> 
> Please note however that the script is not bullet-proof, neither when adding
> the _AVAILABLE symbols, nor when using them. It avoids mangling simple cases
> (such as: "depends on PKG_FOO||PKG_BAR" and stuff like that) and thus misses
> some of the dependencies, but may still butcher other places. :-/
> 
> Enough for today, more tomorrow...

For those interested, I've posted two patches that can be applied ontop
commit bc753d3ca243bcda35d567465ee649ecee3ef236 :

    http://ymorin.is-a-geek.org/download/tmp/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
