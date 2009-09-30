From: Igor Serebryany <igor47@moomers.org>
Date: Wed, 30 Sep 2009 02:26:29 -0500
Subject: [Buildroot] multiple architectures
In-Reply-To: <20090930090102.0189852d@surf>
References: <20090930062658.GG25852@moomers.org> <20090930090102.0189852d@surf>
Message-ID: <20090930072629.GH25852@moomers.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 30, 2009 at 09:01:02AM +0200, Thomas Petazzoni wrote:
> Of course, when you make a change to one of the .config, make sure that
> you update the corresponding config.{x86,x86_64}.

This is the problem that I've been using svn to solve, by 
* running 'make saveconfig', 
* committing the resulting local/myproject directory to a repository
* running 'svn update' in another local/myproject64 directory that
points at the same repository but the working copy has been customized for
64bit architecture. 

svn update then merges the config changes, leaving the local
modifications (especially to the kernel .config) in place.

i was hoping there was some kind of magical make flag that would use the
same config files but do some kind of 'oh edit it for this other
architecture' magic.

--igor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090930/6f0db4ca/attachment.pgp>
