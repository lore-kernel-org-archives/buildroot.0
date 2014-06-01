From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Jun 2014 15:25:49 +0200
Subject: [Buildroot] [PATCH] package infra: remove duplicates in
 dependencies list
In-Reply-To: <20140601151543.0d804348@free-electrons.com>
References: <1401618534-16200-1-git-send-email-yann.morin.1998@free.fr>
 <20140601151543.0d804348@free-electrons.com>
Message-ID: <20140601132549.GF3430@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-01 15:15 +0200, Thomas Petazzoni spake thusly:
> On Sun,  1 Jun 2014 12:28:54 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Currently, we just use what a package declares as its dependencies.
> > 
> > But some packages may declare the same depdency more than once. For
> > example, php has two options to add SQL support: 'mysql' or 'mysqli',
> > which are not exclusive. So, php.mk has mysql twice as a dependency.
> > 
> > Although that does not cause any grievance for make, we end up generating
> > dependency graphs where this duplicate dependency is visible.
> > 
> > Add an intermediary variable which contains the $(sort)-ed list of the
> > dependnecies, thus eliminating any duplicates.
> 
> Typo: dependencies

Grr.. I missed that one, already reported by the other Thomas... :-/

> Also, I'm wondering: is it necessary to do this in the core package
> infrastructure, or should we do it in the graph-depends tool, or even
> do it only in the $(1)-show-depends target? I don't have a strong
> disagreement with the patch, maybe after all it's cleaner to have the
> dependencies sorted and with duplicates removed.

IMHO, it makes sense to cleanup and sort dependencies, even for make
rules.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
