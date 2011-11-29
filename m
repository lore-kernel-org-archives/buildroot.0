From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 29 Nov 2011 08:54:19 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111129153619.4f080721@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
Message-ID: <201111290854.22348.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue November 29 2011, Thomas Petazzoni wrote:
> Le Tue, 29 Nov 2011 08:28:56 -0600,
> "Jeff Krasky" <jeff.krasky@dspcg.com> a ?crit :
> 
> > #############################################################
> > #
> > # EtherCAT
> > #
> > #############################################################
> > ETHERCAT_VERSION = 1.0
> > ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
> > ###ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
> > ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/
> 
> That will work, but you still seem to not understand how to do this
> properly. I've already explained in the past e-mails. You should do 
> 
> ETHERCAT_SITE = http://www.ethercat.org/somedirectory/
> 

And if you want more recent than version 1.4, either
switch to Buildroot 2011.11(-rc?) and use the hg methods for download
or
use the direct hg link to the tarball of the stable version 1.5 tag
that I posted.

The hg setup installed at SourceForge is set to provide a *.tar.bz2
of any tag in the repository, down to a specific file level.
Other hg repositories may be setup differently (the one I run provides
zip and *.tar.gz).

The Buildroot hg method will clone and tar-ball the entire repository,
which may take more than a few cpu cycles.  ;-)
But that is the more general method.

Hardcoding the URL displayed by the "tar-ball button(s)" when browsing
an hg repository leaves you with a strangely named file but it may
be a much smaller download.
Although not as general, that only needs the http methods available
in the older Buildroot versions.

Mike
> And then if you really need to hack EtherCAT locally, use the source
> override feature.
> 
> > Regarding how the EtherCAT build system works, how do I answer this for you?
> > Are there some Makefiles that would explain it?  Some other file I can post
> > that will explain it?
> 
> I'll try to look at the EtherCAT build system, but I'm quite busy at
> the moment. The INSTALL file has some details, but to build within
> Buildroot, probably quite a few environment variables have to be passed.
> 
> Regards,
> 
> Thomas
