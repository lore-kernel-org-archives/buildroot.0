From: Patrick Williams <patrick@stwcx.xyz>
Date: Mon, 18 Apr 2016 12:14:35 -0500
Subject: [Buildroot] [PATCH] Adding in support for custom configurations
In-Reply-To: <CAJJ6jxuPyLjaZOWNJTeEebrEsyUqT81gwgoZcUDTH9A6yPX++w@mail.gmail.com>
References: <1460734834-32123-1-git-send-email-patrick@stwcx.xyz>
 <20160417223143.0b54cce6@free-electrons.com>
 <20160418162528.GA5827@asimov.austin.ibm.com>
 <CAJJ6jxuPyLjaZOWNJTeEebrEsyUqT81gwgoZcUDTH9A6yPX++w@mail.gmail.com>
Message-ID: <20160418171435.GB5827@asimov.austin.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 18, 2016 at 10:07:58AM -0700, Steve Calfee wrote:
> Hi Patrick,
> 
> On Mon, Apr 18, 2016 at 9:25 AM, Patrick Williams <patrick@stwcx.xyz> wrote:
> 
> > Since machines are often developed under confidentiality we are
> > attempting to create a "second level" BR2_EXTERNAL.  This is the
> > openpower/custom tree and where the 'custom' came from in this patchset.
> > Our intention with that is to give developers a location to place
> > machines, packages, and patches currently under NDAs while they are
> > being developed.  By having them in a separate tree, the developers can
> > continuously rebase against our master branch and have less of a issue
> > with merge conflicts, since we promise not to place anything in the
> > custom tree ourselves.
> >
> > We already utilize BR2_GLOBAL_PATCH_DIR and include custom/*.mk to allow
> > patches and additional packages to be placed under the custom tree.  The
> > only piece that is missing is the defconfigs; hence this first attempt
> > at a patch.  We would like to be able to do the following:
> >
> 
> Couldn't you get everything you want by allowing a custom user "fred"
> to create a symlink in your ...configs/ directory to his own custom
> config like:
> 
> ln -s ../custom/configs/freds_defconfig
> 
> Then all the buildroot infrastructure will work as designed, you can
> have your standard BR2_EXTERNAL tree and "fred" can have his own
> custom tree. Since you won't check in the symlink and only fred's
> development will use it, no git conflicts....?
> 
> Regards, Steve

Steve,

That is a good idea.  I failed to mention one aspect that would prevent
that from working very well.

A few of the companies we work with keep a custom tree in their own
repository (one of them SVN) and then as part of their build process
they copy it on top of the custom tree.  They don't have a mechanism to
maintain the symlinks because they don't actually make commits to our
repository.

-- 
Patrick Williams
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160418/ffb3071a/attachment.asc>
