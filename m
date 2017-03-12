From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 21:11:39 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <992feb18-768a-dd03-4402-e01840158fbb@mind.be>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20170312180508.GE3739@free.fr> <20170312182150.GF3739@free.fr>
 <992feb18-768a-dd03-4402-e01840158fbb@mind.be>
Message-ID: <20170312201139.GG3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-03-12 20:43 +0100, Arnout Vandecappelle spake thusly:
> On 12-03-17 19:21, Yann E. MORIN wrote:
> > Thomas, All,
> > 
> > On 2017-03-12 19:05 +0100, Yann E. MORIN spake thusly:
> >> On 2017-03-12 18:49 +0100, Thomas Petazzoni spake thusly:
> >>> +for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do
> > So, as I said earlier:
> >   - cd in TARGET_DIR first;
> >   - exclude .lib/firmware and /usr/lib/firmware
> > 
> >     cd "${TARGET_DIR}"
> >     find ./{usr/,}{bin,lib,sbin} \
> >         -type f \( \( -path './lib/firmware/*' -o -path './usr/lib/firmware*' \) \ 
> >                     -prune -o -print \)
> 
> 
>  As I wrote in the older thread, there are also binaries in /usr/share.

What kind of binaries are in /usr/share? I've looked at my system
(Ubuntu 16.04, x86_64), and none of the 139615 files in there is an ELF
file.

> That
> basically leaves nothing except /etc, and a specific exclusion is anyway still
> needed for /lib/firmware, so I would just do "find .".

To be clear, you would do 'find .' instead of 'find ./{usr/,}{bin,lib,sbin}',
but still do the exclusion as I suggested above, right?

I would be OK with that. Afterall, if one is smart enough to put an ELF
file for a co-proc somewhere else than in /lib/firmware, too bad for
them.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
