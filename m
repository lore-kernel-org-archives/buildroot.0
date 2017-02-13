From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Feb 2017 18:02:06 +0100
Subject: [Buildroot] [PATCH] riemann-c-client: disable parallel make
In-Reply-To: <20170213090741.9137-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 13 Feb 2017 10:07:41 +0100")
References: <20170213090741.9137-1-peter@korsgaard.com>
Message-ID: <87o9y6kos1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/2f8/2f85a2d19232365f7e5fddde6092af9dd74d4518/
 > http://autobuild.buildroot.net/results/80d/80d83c650c668ee1e87c288bd7a0ce63eab95631/

 > The build system doesn't specify any dependencies between the generated
 > header files and the source files including them, causing a race condition:

 >   GEN      lib/riemann/proto/riemann.pb-c.c
 >   GEN      lib/riemann/proto/riemann.pb-c.h
 >   CC       src/src_riemann_client-riemann-client.o
 > In file included from ./lib/riemann/riemann-client.h:23:0,
 >                  from src/riemann-client.c:18:
 > ./lib/riemann/attribute.h:21:40: fatal error: riemann/proto/riemann.pb-c.h: No such file or directory

 > Work around it by forcing non-parallel make.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
