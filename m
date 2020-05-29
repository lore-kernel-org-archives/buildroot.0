From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 21:07:05 +0200
Subject: [Buildroot] [PATCH v2] package/cvs: fix mktime related compile
 failure
In-Reply-To: <20200529204343.4b3c92bb@gmx.net>
References: <20200528215912.30258-1-ps.report@gmx.net>
 <20200529080948.0476a536@windsurf.home>
 <20200529204343.4b3c92bb@gmx.net>
Message-ID: <20200529210705.0f1f9efe@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 May 2020 20:43:43 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> > With the time_t conversion to 64bit, time_t *is* larger than an
> > unsigned int.
> >
> > So aren't you papering over the problem, and in fact potentially
> > causing some issues in CVS, which seems to assume the time_t fits in
> > 32-bit ?  
> 
> ....it is only the internal assumption of the local mktime implementation,
> as far as I see all cvs callers of mktime use time_t to store the return
> value....

Hm, ok. But does it make sense to use the AlpineLinux patch instead ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
