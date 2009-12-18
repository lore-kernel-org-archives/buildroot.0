From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 18 Dec 2009 14:31:34 -0600
Subject: [Buildroot] Strange behavior with shell redirection
In-Reply-To: <4B2BD851.1000902@free.fr>
References: <4B2B7141.90804@free.fr> <20091218190354.5302ccfe@surf>
	<4B2BD851.1000902@free.fr>
Message-ID: <200912181431.37650.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 18 2009, Cyril HAENEL wrote:
> 
> > In the default Buildroot target skeleton, /var/log is a symbolic link
> > to /tmp, and /tmp is mounted as a tmpfs (the contents of the filesystem
> > are stored into memory).
> >
> > So with the default Buildroot configuration, the contents of /var/log
> > (and many other /var directories) are lost when you reboot.
> >
> > Cheers,
> >
> > Thomas
> >   
> Yesss ! Thank, It is the problem ! Thus it's a big problem because what 
> will be the result when the memory will be full !?
> 

tmpFS uses swap as its backing store.  How much swap do you have?  By
default tmpFS will only use 50% of it.

Also, you can limit the amount of ram used by tmpFS on the mount command and/or fstab.

Mike
> Regards,
> Cyril
> 
