From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 08:20:35 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
In-Reply-To: <20200323194237.GA30642@dell5510>
References: <20200228173052.5128-1-petr.vorel@gmail.com>
 <20200305043708.GA2841817@x230> <20200305090322.5b1e5fcc@windsurf>
 <20200323194237.GA30642@dell5510>
Message-ID: <20200324082035.381bc785@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

On Mon, 23 Mar 2020 20:42:37 +0100
Petr Vorel <petr.vorel@gmail.com> wrote:

> > You can search the autobuilders for successful build results, filtering
> > per config options. See http://autobuild.buildroot.net/search.php.  
> 
> > For example:  
> 
> >   http://autobuild.buildroot.net/index.php?status=OK&symbols%5BBR2_PACKAGE_LIBTIRPC%5D=y  
> 
> > will search all successful builds that had BR2_PACKAGE_LIBTIRPC enabled.  
> 
> Thanks! Not sure if it's just a slow net on my side, but search takes ages.
> Not sure whether you still maintain this web service, but adding index on column
> which stores symbols might help (suppose it uses database).

The search has indeed never been "fast", but it's true that it's
particular slow now, much slower than it was. Not sure what happened,
as nothing changed.

You can find the schema of the MySQL database at
https://git.buildroot.org/buildroot-test/tree/web/schema.sql. It does
have indexes. However, the symbol_for_result table really has (tens
of?) millions of entries.

Last summer, we had an intern at Bootlin who worked on this, and
greatly improved the performance of those queries. But it seems like
this have worsen again, for some reason. I can share a dump of the
database if anybody wants to play with it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
