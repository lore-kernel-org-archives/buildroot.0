From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Sep 2016 19:58:28 +0200
Subject: [Buildroot] [PATCH 2/4] glibc: add FTBFS fix patch for recent
	binutils
In-Reply-To: <1473297447-8804-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 7 Sep 2016 22:17:25 -0300")
References: <1473297447-8804-1-git-send-email-gustavo@zacarias.com.ar>
 <1473297447-8804-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8737la6zp7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > See: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=827477
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  .../2.22/0004-fix-FTBFS-recent-binutils.patch      | 67 ++++++++++++++++++++++
 >  .../2.23/0003-fix-FTBFS-recent-binutils.patch      | 67 ++++++++++++++++++++++
 >  2 files changed, 134 insertions(+)
 >  create mode 100644 package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
 >  create mode 100644 package/glibc/2.23/0003-fix-FTBFS-recent-binutils.patch

 > diff --git a/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
 > b/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
 > new file mode 100644
 > index 0000000..598dda8
 > --- /dev/null
 > +++ b/package/glibc/2.22/0004-fix-FTBFS-recent-binutils.patch
 > @@ -0,0 +1,67 @@
 > +With recent binutils versions the GNU libc fails to build on at least
 > +MISP and SPARC, with this kind of error:

s/MISP/MIPS/

This has now been applied upstream, so I would prefer to use the git
formatted patch:

https://sourceware.org/git/?p=glibc.git;a=commit;h=43c29487

The email thread also talks about a followup patch, shouldn't we add
that as well?

https://sourceware.org/ml/libc-alpha/2016-06/msg00827.html

-- 
Bye, Peter Korsgaard
