From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Oct 2018 09:07:22 +0200
Subject: [Buildroot] [PATCH 3/6] package/qt5: prepare for per-version
 hash files
In-Reply-To: <49cfb8fd-924b-f1e9-8524-3aae0055f4e9@lucaceresoli.net>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
 <cb17b9830b43b22d08ed65f5252a036f9ca3a94d.1538913431.git.yann.morin.1998@free.fr>
 <12e99890-01c9-4a50-9276-b99815b90b71@lucaceresoli.net>
 <20181012154653.GB31509@scaer>
 <49cfb8fd-924b-f1e9-8524-3aae0055f4e9@lucaceresoli.net>
Message-ID: <20181013070722.GE31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2018-10-13 00:07 +0200, Luca Ceresoli spake thusly:
> On 12/10/2018 17:46, Yann E. MORIN wrote:
> > On 2018-10-12 09:12 +0200, Luca Ceresoli spake thusly:
> >> On 07/10/2018 13:57, Yann E. MORIN wrote:
[--SNIP--]
> >>> -# Hashes for license files:
> >>> -sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
> >>> -sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
> >>> -sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> >>
> >> Shouldn't this removal happen in patch 5?
> > 
> > Notice how we create the .hash file for the 5.11.2 version? This means
> > that the hash-check for license files will be using it rather than the
> > main hash file.
> > 
> > So, the hashes for the license of the 5.11.2 version are no longer
> > usefull in the main hash file, ergo they get removed.
> 
> So this is a bit different from what you do to qt5base and
> qt5virtualkeyboard. For those you leave the license hashes both in the
> versioned files and the unversioned files.

Ah, right, I forgot to do it for those, indeed. I've fixed it.

> However this difference has no practical effect since after patch 3
> there are versioned hashes for all versions, thus the unversioned file
> is ignored. Patch 5 will trim all the unused lines anyway, so I'm OK if
> this is committed as-is.

In fact, I'd prefer to respin with:

  - a patch that does things consistently, i.e. that either removes the
    license for the two paclages, or for none of them, not tsomething
    in-between ;

  - a better commit log that adds the explanations you requested.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
