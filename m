From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 10:09:08 +0200
Subject: [Buildroot] [PATCH] iperf: bump to version 2.0.9
In-Reply-To: <20160731043853.GA3620@tarshish>
References: <0fe5e4e62f4093b8d30fd1155d8832cd2482a57e.1469784407.git.baruch@tkos.co.il>
 <20160730143139.10ffbed2@free-electrons.com>
 <20160731043853.GA3620@tarshish>
Message-ID: <20160731100908.1fdf64d6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 07:38:53 +0300, Baruch Siach wrote:

> >     [Thomas:
> >      - change the download location to use downloads.sourceforge.net  
> 
> What is the advantage of downloads.sourceforge.net? Many packages still use 
> just sourceforge.net:

Consistency amongst all packages? There are 181 packages that use
downloads.sourceforge.net...

> 
> $ git grep _SITE[^\.]*sourceforge -- package/ |wc -l
> 20

... which is a lot more than 20 packages.

> >      - turn the patch into a Git-formatted one, since upstream uses Git as
> >        its version control system  
> 
> Where have you found a link to that repo? Only after googling for "iperf2 git" 
> I found an indication to its existence in https://github.com/daynix/iperf2.

From https://sourceforge.net/projects/iperf2/, click on "Code".

(Yes the SourceForge UI is terrible).

> >      - as noticed by Khem Raj, a C99 compiler is needed for the bool type,
> >        so added AC_PROG_CC_C99 to configure.ac, and consequently added
> >        IPERF_AUTORECONF = YES.
> >      - removed two <pkg>_CONF_ENV variables related to the bool type, they
> >        were added by an older commit
> >        e13ac0ec8788092c6508636da94fe0198c18dffd back when we had a
> >        config.cache shared between packages (which is no longer the case
> >        today)]
> > 
> > If you could submit the updated patch upstream, it would be good.  

Well, I was hoping you would do it :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
