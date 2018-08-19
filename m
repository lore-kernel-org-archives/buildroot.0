From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Aug 2018 18:26:41 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for custom initramfs
 contents
In-Reply-To: <b3576a560b4ad4272bdbe2520b0d2378a328deec.camel@web.de>
References: <20180810183405.25378-1-r.jacob2002@gmail.com>
 <20180819133917.GB15347@scaer>
 <b3576a560b4ad4272bdbe2520b0d2378a328deec.camel@web.de>
Message-ID: <20180819162641.GC15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Richard, Raphael, All,

On 2018-08-19 18:05 +0200, Richard Kunze spake thusly:
> Yes, you did understand ski7777 (that's Raphael :-)) on IRC correctly -
> we're indeed using the initrd to set up the environment for the "real"
> root file system.

OK, so next time, do provide such explanations from the onset, it helps
in the review.

Consider that the commit log is here to:

 1. explain the problem, i.e. what you expected and fails, or what you
    need and is missing...

 2. explain the cause of the problem, e.g. the current limitations that
    cause the above grievance;

 3. explain the remedial to lift the limitations and fix the problem.

The commit log is usefull:

 1. to the reviewers, to understand the patch;

 2. to the author, to formalise their thoughts about the issue;

 3. to anyone in the future, author included, to understand what the
    change was made back at the time it was made.

> I thought the requirement for an additional initrd with different
> content from the main root file system would be quite common (after
> all, almost all server and desktop linux distributions use a similar
> setup) and wondered why Buildroot did not provide any means for this,

Probably mainly because Buildroot does not target desktop or servers,
but mostly embedded devices that are not meant to be taht flexible that
they require an initrd; i.e. the overwhelming majority of embedded
devices boot directly into their final rootfs.

The only case I've seen, is a device that would boot into a very minimal
system, download the real image from a server, and kexec into that. But
then that case would even be better served with two separate defconfigs
as well, because they really were two different systems.

> so I implemented it back at the start of our project (
> https://github.com/ftCommunity/ftcommunity-TXT in case you're
> curious). 
> 
> And now, while finally switching from our initial, hacked-up-buildroot-
> tree initial setup to a proper br-external setup (should have done that
> from the start, really), this was the final change that prevented
> building from a pristine Buildroot tree, so we decided to try and get
> it upstream ;-)
> I can understand your reasoning why you don't want to accept it,

Note that I did not say 'no'. I said I did not like it; which is a bit
different. ;-) I don't have the final say.

At least, provide a commit log that completely explains the reason for
the commit, that would be a very good step forward. (TBH, that is the
main sticking point for me in the current state.)

> though, and will probably implement a two-stage build as suggested in
> your mail instead.

That is my position: to suggest such a two step procedure, because it is
the most flexible solution.

However, as I said: I *do* understand the underlying reason for your
proposal. Let's just try to find the best way to do it.

> Again, thank you very much for your review and advice.

You're welcome! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
