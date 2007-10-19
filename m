From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 19 Oct 2007 18:47:13 +1000
Subject: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails
	to	build due to missing execinfo.h
In-Reply-To: <00db01c8122b$71720290$01c4af0a@Glamdring>
References: <e73b1f587b0c993034a1396b7e2cc5d3@bugs.uclibc.org>
	<47188770.1070704@promwad.com>
	<00db01c8122b$71720290$01c4af0a@Glamdring>
Message-ID: <20071019084713.GA19784@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 19, 2007 at 10:36:36AM +0200, Ulf Samuelsson wrote:
> ----- Original Message ----- 
> From: "Kuten Ivan" <ivan.kuten@promwad.com>
> To: <buildroot@uclibc.org>
> Sent: Friday, October 19, 2007 12:31 PM
> Subject: Re: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails to 
> build due to missing execinfo.h
> 
> >> During the gcc-4.1.2-final build, libmudflap files to compile due to
> >> missing execinfo.h. configure detects that execinfo.h exists but is
> >> unusable, but that's because it used the wrong cpp and found the host
> >> version instead.
> >>
> >> The fix is to pass CPP=<target_cpp>, as in the attached patch.
> >
> > Is that bug specific to "gcc-4.1.2 + oabi + soft float" configuration?
> > Because I remember to build&run all correctly with "gcc-4.1.2 + eabi + no 
> > soft float".
> 
> The patch affects soft-float only, but is currently only in the 4.2.1 
> subdir.

Are we talking about the same bug? I submitted two close together.

#1543 affects the libmudflap build within gcc-4.1.2-final. I don't know
if that's soft-float or OABI specific, as I did not try any other
configuration. It does not affect gcc-4.2.1.

#1542 affects soft-float gcc-4.1.2 only: it needs the same patch as
I submitted for 4.2.1 earlier this week (and Ulf applied).


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
