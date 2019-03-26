From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Mar 2019 22:45:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ecryptfs-utils: Add support
 without gettext
In-Reply-To: <6be479f6-983d-e383-5038-437de745f0a8@mind.be>
References: <20190315023456.15988-1-vadim4j@gmail.com>
 <20190326192819.GL2660@scaer>
 <6be479f6-983d-e383-5038-437de745f0a8@mind.be>
Message-ID: <20190326214522.GM2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-03-26 21:49 +0100, Arnout Vandecappelle spake thusly:
> On 26/03/2019 20:28, Yann E. MORIN wrote:
> > Also, it is usualy bad practice to generate such scripts from configure.
> > Instead, they should be generated in Makefile.am as new targets. Yes,
> > this is a bit more involved, but is much cleaner: when you change such a
> > script, you just have to run 'make' again, rather than re-run configure.
> 
>  Is that really so? I thought automake would generate a rule that just re-runs
> config.status when such a file changes. Haven't tested though.

Hmm.. Maybe. It's been a while I wrote my last autotool package.

In any case, I still remember that it's good practice to only generate
from ./configure things that are needed to do the actual build, and that
anything not needed to run 'make' should be handled in Makefile.am.

(pushing the comparison to the limits: if they were C files, you'd
compile them from Makefile.am, not configure).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
