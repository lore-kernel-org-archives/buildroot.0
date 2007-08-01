From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Wed, 01 Aug 2007 09:48:35 +0200
Subject: [Buildroot] [PATCH] staging_dir/usr/lib vs staging_dir/lib
In-Reply-To: <1185947996.20419.8.camel@localhost.localdomain>
References: <07c301c7d3a1$ebb2fdc0$2600a8c0@engineering5>
	<1185947996.20419.8.camel@localhost.localdomain>
Message-ID: <1185954515.32541.15.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2007-08-01 at 07:59 +0200, Hans-Christian Egtvedt wrote:
> On Tue, 2007-07-31 at 13:38 -0500, Christopher Reder wrote:
> > It seems like there may be some confusion over what directories to use
> > when installing/hosting/storing libs.
> 
> Probably my bad (-:

I cleaned up libpng, libungif and fbv. Although my upstream snapshot is
some days old.

> > I just pulled down the latest and enabled fbv which selected libungif.
> > In doing so, it fails when it tries to remove libs from
> > staging_dir/lib because the libs are actually in
> > staging_dir/usr/lib.  
> 
> Weird, because staging_dir/usr is a symlink to staging_dir/.

Actually, removing libungif.la is not something that should have been
done when installing (I think, anybody know the reason?). I have
replaced it with a SED fixing the libdir in the included patch.

<snipp>

-- 
With kind regards,
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br2-clean-libpng-libungif-and-fbv.patch
Type: text/x-patch
Size: 3855 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070801/5be1e4ce/attachment.bin 
