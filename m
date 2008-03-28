From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Mar 2008 22:10:24 +0100
Subject: [Buildroot] gcc 4.2.2 patch
In-Reply-To: <87bq4yh8e7.fsf@macbook.be.48ers.dk>
References: <1206735722.3224.70.camel@nigel-x60> <20080328204136.GN1783@mx.loc>
	<87bq4yh8e7.fsf@macbook.be.48ers.dk>
Message-ID: <20080328211023.GO1783@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2008 at 09:59:44PM +0100, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> On Fri, Mar 28, 2008 at 08:22:02PM +0000, Nigel Kukard wrote:
> >> Is this patch ok to bump gcc to 4.2.2?
> >> 
> >> I grep -r'd the buildroot tree and replaced each occurrence manually and
> >> removed 4.2.0.
> >> 
> >> -N
>
> >> Index: package/lvm2/lvm2.mk
> >> ===================================================================
> >> --- package/lvm2/lvm2.mk	(revision 21539)
> >> +++ package/lvm2/lvm2.mk	(working copy)
> >> @@ -64,7 +64,7 @@
> >> $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
> >> $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
> >> $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
> >> -	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
> >> +	for binary in $(LVM2_SBIN); do echo $$binary; install -m0755 -p $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
>
> Bernhard> close.
> Bernhard> Correct would have been to use $(INSTALL). Also the for
> Bernhard> loop doesn't make too much sense, fwiw.
>
>What does this hunk have to do with $SUBJ ?

No idea, perhaps Nigel would know ;)
It just cought my eye since that's exactly what is just ugly and really,
really should be cleaned up. Folks have to graps that we they are
writing *makefiles* and not shell-scripts in this context.

whatever. I see Nigel just applied it. Nigel, you should perhaps wait at
least a few hours or a day for people to comment, i guess. But then i
don't really care.
