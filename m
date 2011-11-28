From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 28 Nov 2011 11:39:34 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111128165422.49361aed@skate>
 <002001ccade8$e03e9f00$0400a8c0@dspcgrnzks9p98>
Message-ID: <201111281139.37028.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon November 28 2011, Jeff Krasky wrote:
> > Woops, you're right, my bad. The manual is obvisouly correct.
> > 
> > You should use :
> >
> > ETHERCAT_VERSION = 3.3
> > ETHERCAT_SITE = http://foobar.com/somewhere/
> > ETHERCAT_SOURCE = ethercat-$(ETHERCAT_VERSION).tar.bz2
> > 
> > Why are you using a local directory ? You *really* should be using a
> > tarball available from http or ftp so that you can later contribute
> > your package to Buildroot.
> 
> Because I don't want just the default source of EtherCAT built into the
> Linux image.  Lets say I want to modify something in the examples directory
> of EtherCAT.  For instance, I had to modify the sample code and rebuild.  So
> what I want is this "rebuilt" version of EtherCAT, with customized example
> code, as part of the Linux image.  If I point at the EtherCAT website, that
> won't be the correct version.  The EtherCAT examples development will occur
> on the same machine that Buildroot is on, hence why I like the local
> filesystem solution.
>

The typical way to handle that is to create a patch of the difference
between your local version and the download version;
Then let the build system apply the patch.
 
> So any thoughts on why it is not finding the file?
> 

Try a "make clean" then try again.
The missing file was reported to be the downloaded (*/dl/* directory)
the system may have that marked as already downloaded.

Mike
> Thanks.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
