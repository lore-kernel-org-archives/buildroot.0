From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 19:22:01 +0200
Subject: [Buildroot] [PATCH v2] python3: use stdlib UUID backend
In-Reply-To: <1539879728-29581-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Thu, 18 Oct 2018 11:22:08 -0500")
References: <1539879728-29581-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87ftwz5i6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Python3 at runtime identifies the uuid backend to use to implement
 > functions like uuid_generate_time. This search includes libc first
 > and then other options like util-linux's libuuid.  There is also an
 > option to use an extension module, however it looks like that requires
 > the libuuid and headers to be present (./Modules/_uuidmodule.c).  The
 > extension isn't required to make this work.

 >  - This was runtime tested by updating the python3-3.7.0/Lib/uuid.py
 >    to include debug information in the def _load_system_functions():
 >    to print "libname".  Then at runtime it was observed that libc
 >    was the selected backend.

 >  - At build time, to prevent a dependency not being reflected on
 >    the use of the util-linux backend (some builds may use it if
 >    util-linux builds first, others not), the 0031-* patch was kept
 >    and the support to auto-detect was explicitly disabled. This
 >    has not affect on the runtime use of the libc backend.

 > Ref:
 > http://lists.busybox.net/pipermail/buildroot/2018-October/233113.html
 > http://lists.busybox.net/pipermail/buildroot/2018-September/231060.html
 > http://lists.busybox.net/pipermail/buildroot/2018-October/233079.html

 > CC: Adam Duskett <aduskett@greenlots.com>
 > CC: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Tested-by: Carlos Santos <casantos@datacom.com.br>
 > ---
 > Changes
 > v1 -> v2
 > [Thomas P
 >  - Suggested keeping the patch and adding the explicit disable as
 >    util-linux being built before or after python3 would have resulted
 >    in different behavior

Committed, thanks.

-- 
Bye, Peter Korsgaard
