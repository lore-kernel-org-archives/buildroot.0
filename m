From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 19 Oct 2007 18:37:45 +1000
Subject: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails
	to	build due to missing execinfo.h
In-Reply-To: <47188770.1070704@promwad.com>
References: <e73b1f587b0c993034a1396b7e2cc5d3@bugs.uclibc.org>
	<47188770.1070704@promwad.com>
Message-ID: <20071019083745.GA19263@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 19, 2007 at 09:31:12AM -0100, Kuten Ivan wrote:
> > Description: 
> > During the gcc-4.1.2-final build, libmudflap files to compile due to
> > missing execinfo.h. configure detects that execinfo.h exists but is
> > unusable, but that's because it used the wrong cpp and found the host
> > version instead.
> > 
> > The fix is to pass CPP=<target_cpp>, as in the attached patch.
> 
> Is that bug specific to "gcc-4.1.2 + oabi + soft float" configuration?
> Because I remember to build&run all correctly with "gcc-4.1.2 + eabi + no soft float".

Hi Ivan,

I have no idea - I did not try EABI. I wasted too much time with 4.2.1
with EABI to try it again. Maybe this patch is not required for everyone
but it was required for me.

Soft float does not compile for OABI for other reasons (see the other
bug I submitted) too so who knows.

I had 4.2.1 OABI working, but a kernel I compiled with it does not boot.
4.1.2 compiles the same kernel with a working result.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
