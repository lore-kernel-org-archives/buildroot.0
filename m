From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 28 Mar 2008 21:16:51 +0000
Subject: [Buildroot] gcc 4.2.2 patch
In-Reply-To: <20080328211023.GO1783@mx.loc>
References: <1206735722.3224.70.camel@nigel-x60>
	<20080328204136.GN1783@mx.loc> <87bq4yh8e7.fsf@macbook.be.48ers.dk>
	<20080328211023.GO1783@mx.loc>
Message-ID: <1206739011.3224.88.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> > Bernhard> On Fri, Mar 28, 2008 at 08:22:02PM +0000, Nigel Kukard wrote:
> > >> Is this patch ok to bump gcc to 4.2.2?
> > >> 
> > >> I grep -r'd the buildroot tree and replaced each occurrence manually and
> > >> removed 4.2.0.
> > >> 
> > >> -N
> >
> > >> Index: package/lvm2/lvm2.mk
> > >> ===================================================================
> > >> --- package/lvm2/lvm2.mk	(revision 21539)
> > >> +++ package/lvm2/lvm2.mk	(working copy)
> > >> @@ -64,7 +64,7 @@
> > >> $(LVM2_TARGET_SBINS): $(LVM2_DIR)/.configured
> > >> $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR)
> > >> $(MAKE) CC=$(TARGET_CC) -C $(LVM2_DIR) DESTDIR=$(STAGING_DIR) install
> > >> -	for binary in $(LVM2_SBIN); do echo $$binary; cp -a $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
> > >> +	for binary in $(LVM2_SBIN); do echo $$binary; install -m0755 -p $(STAGING_DIR)/sbin/$$binary $(TARGET_DIR)/sbin; done
> >
> > Bernhard> close.
> > Bernhard> Correct would have been to use $(INSTALL). Also the for
> > Bernhard> loop doesn't make too much sense, fwiw.
> >
> >What does this hunk have to do with $SUBJ ?

Nothing at all ... I was being a twit again. Just cleaned up and created
a nice clean svn repo to apply patches against to commit  :)

> I see Nigel just applied it. Nigel, you should perhaps wait at
> least a few hours or a day for people to comment, i guess. But then i
> don't really care.

Applied the GCC version change ... just wanted at least one other person
to see if it looks ok before committing, went over it a few times and it
looked ok, applied it to my svn repo and it got mangled with a lvm2
bugfix I'm busy with. Didn't commit the LVM2 change  :)

-N


-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080328/8a06be36/attachment.pgp 
