From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 May 2014 13:16:56 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <20140509102029.GC3173@free.fr>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr> <877g5vb7bb.fsf@dell.be.48ers.dk>
 <20140509102029.GC3173@free.fr>
Message-ID: <CAHXCMMK9Y-bReA=vij5ti0ZKeehXEx45nsw8H-+G01LUcF1RMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Peter, all

On Fri, May 9, 2014 at 12:20 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Peter, All,
>
> On 2014-05-09 12:00 +0200, Peter Korsgaard spake thusly:
>> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>  > On 2014-05-07 00:44 +0200, Yann E. MORIN spake thusly:
>>  >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>  >>
>>  >> Currently, all the dependencies of a package are drawn on the dependency
>>  >> graph, including transitive dependencies (e.g. A->B->C and A->C).
>>  >>
>>  >> Very big graphs, with lots of packages with lots of dependencies, the
>>  >> dependency graph can be very dense, and transitive dependencies are
>>  >> cluttering the graph.
>>  >>
>>  >> In some cases, only getting the "build-order" dependencies is enough (e.g.
>>  >> to see what impact a package rebuild would have).
>>  >>
>>  >> Add a new environment variable to disable drawing transitive dependencies.
>>
>>  > I've marked it as Changes Requested in PAtchwork, since I have a cleaner
>>  > patch to come soon, with other cleanups in the graph-depends script.
>>
>> Thanks. Like I mentioned on IRC I do like the looks of the graphs, but
>> I'm not really happy with the use of environment variables to control
>> it, as it isn't intuitive.

I'm not a big fan of env. vars. either.

>>
>> Perhaps we should simply have kconfig options for these things?
>
> As I said on IRC, I doubt this would be usefull, For example:
>
>   - for depth: someone might want a 3-level deep graph for some package,
>     and a 4-level deep graph for another,
>
>   - for transitive deps: someone would like the complete dependencies
>     graphed for some package, and only the 'build-order' deps for some
>     another.
>
> This means the user would have to go back to the menuconfig between each
> graph, and this could not be made automatic (eg. called from within a
> script that generates the graphs for the documentation of the project.)
>
> What we could do, however, would be something like:
>
>     make BR2_GRAPH_OPTS='--depth 4 --no-transitive' graph-depends
>
> (the existing BR2_GRPAH_DEPS would disapear).
>
> Thoughts?

An alternaitve solution could be using a config file; Python has some
packages for this [1] ;-).
This way, the config file could be initialized with what is set in the
menuconfig, so used as defaults.
If some options are passed on the command line, they will override
these defaults.
If someone wants to do something more fancy and automatic, then one
just could update the config file.

[1] https://docs.python.org/2.7/library/configparser.html

Regards,

-- 
Samuel
