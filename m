From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 02:09:22 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100727020922.CE03281810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651

--- Comment #8 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #7)
> Mitch, with the merge of the linux-cleanup work, the module-init-tools package
> has been upgraded and migrated to the autotools infrastructure. So it is
> possible that the problem you're seeing has been fixed.
> 
> Can you give a try at the latest Buildroot git ?

Hi, I'm getting this error:
make[2]: Entering directory
`buildroot/output/build/host-module-init-tools-3.11/build'
/usr/lib64/ccache/gcc  -Ibuildroot/output/host/include
-Ibuildroot/output/host/usr/include -Wunused -Wall -static
-Lbuildroot/output/host/lib -Lbuildroot/output/host/usr/lib
-Wl,-rpath,buildroot/output/host/usr/lib -o insmod.static insmod.o
libmodtools.a 
/usr/bin/ld: cannot find -lc
collect2: ld returned 1 exit status

with git and ccache enabled , and  yum install glibc-static , fixes the
problem.


but what should I do ? disable CCACHE or use glibc-static  ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
