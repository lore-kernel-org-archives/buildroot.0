From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 10:50:53 +0200
Subject: [Buildroot] [PATCH v3 1/4] support/scripts/get-developers: add
	new script
In-Reply-To: <87eg4dzqds.fsf@dell.be.48ers.dk>
References: <1473713695-2611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1473713695-2611-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <87eg4dzqds.fsf@dell.be.48ers.dk>
Message-ID: <20160921105053.751ff924@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 09:03:11 +0200, Peter Korsgaard wrote:

>  > A few files are recognized specially:  
> 
>  >  - .mk files are parsed, and if they contain $(eval
>  >    $(<something>-package)), the developer is assumed to be looking after
>  >    the corresponding package. This way, autobuilder failures for this
>  >    package can be reported directly to this developer.  
> 
>  >  - arch/Config.in.<arch> files are recognized as "the developer is
>  >    looking after the <arch> architecture". In this case, get-developer
>  >    parses the arch/Config.in.<arch> to get the list of possible BR2_ARCH
>  >    values. This way, autobuilder failures for this package can be
>  >    reported directly to this developer.  
> 
>  >  - pkg/pkg-<infra>.mk are recognized as "the developer is looking after
>  >    the <infra> package infrastructure. In this case, any patch that adds
>  >    or touches a .mk file that uses this infrastructure will be sent to
>  >    this developer.  
> 
> Committed, thanks. Care to send a followup patch fixing the issues
> Arnout pointed out?

Yes. I already started working on some of them. However, some
suggestions from Arnout are not working directly, especially the
argparse related suggestions around using mutually exclusive groups.
Patches from Arnout welcome :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
