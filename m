From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 12:20:29 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <877g5vb7bb.fsf@dell.be.48ers.dk>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr> <877g5vb7bb.fsf@dell.be.48ers.dk>
Message-ID: <20140509102029.GC3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-09 12:00 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > On 2014-05-07 00:44 +0200, Yann E. MORIN spake thusly:
>  >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  >> 
>  >> Currently, all the dependencies of a package are drawn on the dependency
>  >> graph, including transitive dependencies (e.g. A->B->C and A->C).
>  >> 
>  >> Very big graphs, with lots of packages with lots of dependencies, the
>  >> dependency graph can be very dense, and transitive dependencies are
>  >> cluttering the graph.
>  >> 
>  >> In some cases, only getting the "build-order" dependencies is enough (e.g.
>  >> to see what impact a package rebuild would have).
>  >> 
>  >> Add a new environment variable to disable drawing transitive dependencies.
> 
>  > I've marked it as Changes Requested in PAtchwork, since I have a cleaner
>  > patch to come soon, with other cleanups in the graph-depends script.
> 
> Thanks. Like I mentioned on IRC I do like the looks of the graphs, but
> I'm not really happy with the use of environment variables to control
> it, as it isn't intuitive.
> 
> Perhaps we should simply have kconfig options for these things?

As I said on IRC, I doubt this would be usefull, For example:

  - for depth: someone might want a 3-level deep graph for some package,
    and a 4-level deep graph for another,

  - for transitive deps: someone would like the complete dependencies
    graphed for some package, and only the 'build-order' deps for some
    another.

This means the user would have to go back to the menuconfig between each
graph, and this could not be made automatic (eg. called from within a
script that generates the graphs for the documentation of the project.)

What we could do, however, would be something like:

    make BR2_GRAPH_OPTS='--depth 4 --no-transitive' graph-depends

(the existing BR2_GRPAH_DEPS would disapear).

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
