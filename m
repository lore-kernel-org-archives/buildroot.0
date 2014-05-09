From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 May 2014 12:00:24 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
	dependencies in dependency graph
In-Reply-To: <20140509095224.GB3173@free.fr> (Yann E. MORIN's message of "Fri, 
 9 May 2014 11:52:24 +0200")
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr>
Message-ID: <877g5vb7bb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > All,
 > On 2014-05-07 00:44 +0200, Yann E. MORIN spake thusly:
 >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> 
 >> Currently, all the dependencies of a package are drawn on the dependency
 >> graph, including transitive dependencies (e.g. A->B->C and A->C).
 >> 
 >> Very big graphs, with lots of packages with lots of dependencies, the
 >> dependency graph can be very dense, and transitive dependencies are
 >> cluttering the graph.
 >> 
 >> In some cases, only getting the "build-order" dependencies is enough (e.g.
 >> to see what impact a package rebuild would have).
 >> 
 >> Add a new environment variable to disable drawing transitive dependencies.

 > I've marked it as Changes Requested in PAtchwork, since I have a cleaner
 > patch to come soon, with other cleanups in the graph-depends script.

Thanks. Like I mentioned on IRC I do like the looks of the graphs, but
I'm not really happy with the use of environment variables to control
it, as it isn't intuitive.

Perhaps we should simply have kconfig options for these things?

-- 
Bye, Peter Korsgaard
