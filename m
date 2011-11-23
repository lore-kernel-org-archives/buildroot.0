From: Michael S. Zick <minimod@morethan.org>
Date: Wed, 23 Nov 2011 09:05:52 -0600
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
	no suitable tar can be found
In-Reply-To: <20111123152440.0fef75ca@skate>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108> <20111123152440.0fef75ca@skate>
Message-ID: <201111230905.55751.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed November 23 2011, Thomas Petazzoni wrote:
> Le Wed, 23 Nov 2011 14:59:59 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> 
> > Some toolchains, like the one built with buildroot itself, use
> > hardlinks (for example to link between the c++ and g++ binary).
> > Unpacking such a toolchain with the --strip-components options does
> > not work correctly if the system tar is too old (<1.17). Even recent
> > releases of RedHat/CentOS still ship with tar 1.15.
> > 
> > This patch checks for a suitable tar version (tar 1.17+) on the host
> > system, and adds host-tar to the host dependencies if none can be
> > found.
> > 
> > TAR is redefined to HOST_TAR, except when extracting host-tar (this
> > is a chicken-and-egg problem), so that all packages use the host-tar
> > if no suitable tar was found.
> 
> I am still puzzled by the fact that tar is needed to extract this
> host-tar, so there's like a chicken-and-egg problem. I understand that
> the real host tar is used to extract the host-tar, which is then use to
> extract all other packages. But that sounds really nasty to me.
> 

Maybe:
ftp://ftp.gnu.org/gnu/tar/tar-1.26.cpio.gz

Then you only need the more stable cpio and gzip utilities.
Even Busybox can provide those.

Mike
> Thomas
