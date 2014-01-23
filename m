From: Chris Packham <judge.packham@gmail.com>
Date: Fri, 24 Jan 2014 11:47:46 +1300
Subject: [Buildroot] [PATCH] tcpreplay: cross-compile with tcpdump
	support
In-Reply-To: <87zjmm9yhp.fsf@dell.be.48ers.dk>
References: <87txcvb13p.fsf@dell.be.48ers.dk>
 <1390468034-7430-1-git-send-email-judge.packham@gmail.com>
 <87ppnjaqam.fsf@dell.be.48ers.dk> <52E176D9.6040101@barkynet.com>
 <87zjmm9yhp.fsf@dell.be.48ers.dk>
Message-ID: <CAFOYHZA-wWx2ET2ibXNukvVX0rrsnK85H7+X+YR9oD=0WqNm1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 24, 2014 at 10:31 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
> Hi,
>
>  >> > +ifeq ($(BR2_PACKAGE_TCPDUMP),y)
>  >> > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
>  >>
>  >> The problem here is that the configure script checks if /usr/bin/tcpdump
>  >> (on the build machine) is executable, and otherwise errors out - So this
>  >> breaks if you try to build it on a machine without tcpdump.
>
>  > I think the patch is actually OK.  Looking at the configure script
>  > when ac_cv_path_tcpdump_path is set it does not check if the
>  > executable exists.  It only checks when using the --with-tcpdump
>  > option.
>
>  > I tested the patch and choose tcpdump and tcpreplay with no
>  > /usr/sbin/tcpdump on the host.  The code builds and I see in the
>  > configure output the lines
>
>  > checking for tcpdump... (cached) /usr/sbin/tcpdump
>
>  > and
>
>  > tcpdump binary path:        /usr/sbin/tcpdump
>
>  > So i think this patch will work.
>
> Ups, you're right - Sorry.
>
> Committed patch, thanks.
>

Thanks. I was about to say the same thing.

On the build error front are we concerned about the failures? I
haven't heard anything from upstream yet. We probably want to move to
tcpreplay 4.0.2 before the buildroot 2014.02 release.
