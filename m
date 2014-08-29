From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 09:21:50 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-autotools: use
 --disable-dependency-tracking
In-Reply-To: <87tx4vrcg8.fsf@dell.be.48ers.dk>
References: <1409259825-619-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87tx4vrcg8.fsf@dell.be.48ers.dk>
Message-ID: <20140829092150.04986069@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 29 Aug 2014 09:18:15 +0200, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > By default, automake does "dependency tracking", which allows the
>  > generated Makefile to contain the necessary dependencies to
>  > automatically rebuild the appropriate C files when included header
>  > files are changed. This dependency tracking is nice when doing active
>  > development on the package, but not really useful when doing a
>  > one-time build of the package. According to automake's
>  > documentation[1], disabling the dependency tracking provides a small
>  > speed-up.
> 
>  > In some very unscientific measurements (i.e repeated only once), we
>  > have noticed a ~3.6% reduction of the total build time of a Buildroot
>  > toolchain after applying this patch.
> 
>  > [1] http://www.gnu.org/software/automake/manual/html_node/Dependency-Tracking.html
> 
> 3% isn't much, but OK - Committed both to next, thanks.

Well, I was indeed a bit disappointed by the small difference. But I
believe it anyway makes more sense than having a few random packages
pass --disable-dependency-tracking.

Also, as we say in French, "les petits ruisseaux font les grandes
rivi?res", which could roughly be translated as "the small streams make
the big rivers". Everything counts :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
