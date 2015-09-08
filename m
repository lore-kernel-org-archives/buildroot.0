From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 23:50:39 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/gdb: host-texinfo needed for
 full gdb
In-Reply-To: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
References: <1441740443-7280-1-git-send-email-brendanheading@gmail.com>
Message-ID: <55EF582F.1090407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 21:27, Brendan Heading wrote:
> Fixes :
> http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/

 So, we now have three versions to fix this:

Romain patches gdb to avoid recursing in the doc directory [1][2]
Vicente does the same but with a sed instead of patch [3].
Brendan adds host-texinfo to dependencies (this patch) [4].

 Which one do we choose?

 host-texinfo takes a bit of time to build because it also depends on
host-ncurses, but it's not a huge problem.

 The best solution is adding an upstreamable --disable-doc, but that will take a
bit of work still (esp. because we can't easily autoreconfigure).

 So for me Brendan's patch is fine. What do the others think?


 Regards,
 Arnout


[1] http://patchwork.ozlabs.org/patch/514907/
[2] http://patchwork.ozlabs.org/patch/514908/
[3] http://patchwork.ozlabs.org/patch/515401/
[4] http://patchwork.ozlabs.org/patch/515527/

> 
> .. and many others.
> 
> when building the full gdb (ie not just gdbserver) on the host or target
> the "make install" phase seems to expect makeinfo (from texinfo) to be
> present.
> 
> Added a dependency so that the host always depends on host-texinfo, and
> the target depends on it if the full GDB is being built. No need to set
> ac_cv_prog_MAKEINFO anymore as it doesn't seem to achieve the desired
> effect.
> 
> Signed-off-by: Brendan Heading <brendanheading@gmail.com>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
