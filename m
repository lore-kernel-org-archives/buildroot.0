From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 15:34:41 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <CAHXCMMK9Y-bReA=vij5ti0ZKeehXEx45nsw8H-+G01LUcF1RMw@mail.gmail.com>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr> <877g5vb7bb.fsf@dell.be.48ers.dk>
 <20140509102029.GC3173@free.fr>
 <CAHXCMMK9Y-bReA=vij5ti0ZKeehXEx45nsw8H-+G01LUcF1RMw@mail.gmail.com>
Message-ID: <20140509133441.GE3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-09 13:16 +0200, Samuel Martin spake thusly:
> > On 2014-05-09 12:00 +0200, Peter Korsgaard spake thusly:
[--SNIP--]
> >> Thanks. Like I mentioned on IRC I do like the looks of the graphs, but
> >> I'm not really happy with the use of environment variables to control
> >> it, as it isn't intuitive.
> 
> I'm not a big fan of env. vars. either.
[--SNIP--]
> An alternaitve solution could be using a config file; Python has some
> packages for this [1] ;-).
> This way, the config file could be initialized with what is set in the
> menuconfig, so used as defaults.
> If some options are passed on the command line, they will override
> these defaults.
> If someone wants to do something more fancy and automatic, then one
> just could update the config file.

Well, this does not solve the issue at hand: how do we pass options on
the command line in the first place?

We added 'graph-depends' and 'PKG-graph-depends' (and 'graph-build'
too) as make targets so it was easier for users to generate the graphs
rather than directly call the scripts (since the scripts could even
reside in another dir when building out-of-tree, and it would be more
complex to reach for the scripts).

Adding a config file would not help much either: modifying the config
file can't easily be automated, which is all the point in being able to
pass extra args when generating the graphs.

There are people out there using a bunch of graphs to include in their
projects' documentations, in an automated way.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
