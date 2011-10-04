From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 04 Oct 2011 11:20:47 +0200
Subject: [Buildroot] Segmentation faults after gcc update
In-Reply-To: <20110930215915.3d7fad80@skate>
References: <1317110841.20688.12.camel@sven> <20110927233506.55cb52a2@skate>
 <1317221262.8481.4.camel@sven> <1317373796.20520.3.camel@sven>
 <20110930215915.3d7fad80@skate>
Message-ID: <1317720237.2409.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2011-09-30 at 21:59 +0200, Thomas Petazzoni wrote:
> Le Fri, 30 Sep 2011 11:06:46 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > > I don't quite understand why libthread_db is not found as I did enable
> > > BR2_PTHREAD_DEBUG for this build and recompiled everything. Anyway, I
> > > tried gdb on a different (crashing) binary and it crashes in
> > > _dl_get_tls_static_info() as well.
> > 
> > I have now added some debug output to _dl_get_tls_static_info() and
> > related functions and from that I can tell that gdb is wrong here. The
> > code does definitely not crash in _dl_get_tls_static_info() and not in
> > _dl_update_slotinfo() either.
> > 
> > Now I am somewhat stuck. Any further ideas on how I could tackle this
> > problem?
> 
> I guess the whole stack trace is stupid, because I don't see how
> hasmntopt() can end up calling sched_get_priority_max():
> 
> char *hasmntopt(const struct mntent *mnt, const char *opt)
> {
>         return strstr(mnt->mnt_opts, opt);
> }
> 
> Maybe you should raise the issue on the uClibc mailing list?

I've opened https://bugs.busybox.net/show_bug.cgi?id=4291 for it and
will also ask on the mailing list in case that the bug report won't get
any attention.


Thanks,
Sven
