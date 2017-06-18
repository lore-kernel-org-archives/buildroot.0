From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 16:23:24 +0200
Subject: [Buildroot] [PATCH 0/4 v2] tools: add a directory to contain
 usefull user-facing tools
In-Reply-To: <20170618161531.762b0929@windsurf>
References: <cover.1497794488.git.yann.morin.1998@free.fr>
 <20170618161531.762b0929@windsurf>
Message-ID: <20170618142324.GS2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-06-18 16:15 +0200, Thomas Petazzoni spake thusly:
> On Sun, 18 Jun 2017 16:01:40 +0200, Yann E. MORIN wrote:
> > Currently, we provide a few user-facing utilities, like get-developers,
> > in support/scripts/ . But this directory also contains internal scripts
> > that a user should not be directly concerned with. Besides, it is
> > two-level deep in the hierarchy, which is not really nice.
> > 
> > So, we introduce tools/ as a top-level directory, with the goal to store
> > and expose all user-facing utilities, while keeping our internal scripts
> > in support/scripts/ .
> > 
> > The first patch in the series introduces a new utility, brmake, a
> > wrapper around make that stores all the output to a log file and
> > displays only the >>> lines.
> > 
> > The second and subsequent patches each move a few user-facing utilities
> > out of support/scripts/ and into tools/ .
> 
> I am wondering if there is a very clear cut boundary between
> user-facing tools and non-user facing tools.

Yes, the frontier is not trivial.

I'd say that if a tool is meant to be called by the user, then it
belongs to tools/. If it is not meant to be alled by a user (even if it
could be so) then it belongs to support/scripts/.

> For example, graph-build-time or graph-depends are internally used by
> the Buildroot Makefile, but may also be used directly.

The primary use for those scripts is still an internal use. They are
supposed to be called from our infra.

> The size-stats
> tool is also used internally by the Buildroot Makefile, but
> size-stats-compare is meant to be used directly.

Then the former stays in support/scripts/ while the latter should move
to tools/.

> What about support/scripts/genimage.sh ?

I would leave it to support/scripts/. It is an internal helper./
Besides, it needs a few of our variables (TARGET_DIR and BINARIES_DIR),
so I see it as internal.

Of course, I might not have moved all that can/should be moved. This
series serves as a base for further discussion.

See the initial submission:

    [PATCH] contrib: add a directory to store "contrib" stuff
    http://lists.busybox.net/pipermail/buildroot/2016-October/174238.html

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
