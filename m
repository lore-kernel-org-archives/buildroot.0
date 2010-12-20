From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Dec 2010 15:05:04 +0100
Subject: [Buildroot] [PATCH v2] buildroot:download: Add option to
 download SVN or GIT repository with version control information.
In-Reply-To: <1292591501.6496.58.camel@dubciaranr0.verifone.com>
References: <1292492992-15797-1-git-send-email-sonic.adi@gmail.com>
	<20101217113436.43ec2958@surf>
	<1292591501.6496.58.camel@dubciaranr0.verifone.com>
Message-ID: <20101220150504.4dcf2e18@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Dec 2010 13:11:41 +0000
Quotient Remainder <quotientvremainder@gmail.com> wrote:

> There are many great features in Buildroot and one of them is that you
> can just give it a defconfig and off it goes to retrieve all the
> required components.  It would be a pity to leave this out of the
> "working tree" support structure.
> I had the idea (not implemented yet) that Buildroot should try to check
> out $(PKG)_DL_VERSION and if it fails, get an update from upstream and
> try to checkout again, failing only at this point.  Of course changes to
> the working copy would have to be cautious so that changes are not
> overwritten unintentionally.  OK the thinking is a bit GIT-centric but
> can be expanded to other VCS also.  Doesn't everything start by
> supporting a limited set before aiming for world domination...

Sorry, I didn't follow you here. Could you elaborate ?

> The way I see it Buildroot is used both by developers ("I want to change
> source code") and by those who just want a repeatable way to make a
> bootable system ("just give me a burnable image").  It would be ideal if
> the same system could be used by both camps.
> Keeping the source code outside BUILD_DIR through your OVERRIDE_SRC_DIR
> seems like a big step towards this.  "make clean" just deletes
> BUILD_DIR, not the OVERRIDE dirs.

Yes, that's the plan.

> >  * It is only valid for components for which sourcing from git/svn is
> >    done.
> 
> But didn't someone post a BZR patch recently and can't it be extended to
> any other VCS with an equivalent DOWNLOAD_$(VCS) macro?  Or am I missing
> your point?

What I meant here is that components that are fetched from tarballs are
not being handled by Sonic's approach.

> I did, but it's really dirty, invloving a cautious rsync at build-time
> between the working copy and BUILD_DIR.  Your OVERRIDE_DIR is vastly
> superior and glaringly obvious now that it's mentioned.
> One nice feature of my approach was that it needed no modifications in
> the package makefiles, if a VCS method was specified (in a file similar
> to your "local.mk") the location and variables there override the
> package makefile.

The approach I propose also shouldn't require any modification to the
package makefiles. It should only require modifications at the package
infrastructure level.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
