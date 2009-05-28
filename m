From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 May 2009 13:18:56 +0200
Subject: [Buildroot] kernel module dir following move to git
In-Reply-To: <4A1E5F5F.1040600@carallon.com> (Will Wagner's message of "Thu\,
	28 May 2009 10\:54\:39 +0100")
References: <4A1E5E07.2000403@carallon.com> <4A1E5F5F.1040600@carallon.com>
Message-ID: <871vq98ogv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

Hi,

 Will> Think I have worked this out now. It is because I have
 Will> CONFIG_LOCALVERSION_AUTO=y set in my kernel config file. Still seems
 Will> odd that it is finding buildroot git rather than a kernel git but
 Will> think I can fix it now.

Well, it's because the kernel's scripts/setlocalversion checks if your
kernel is in a git repo (which it technically is if you build in the
tree and have buildroot from git).

Another workaround is to simply build out of tree (make O=<somewhere>)

-- 
Bye, Peter Korsgaard
