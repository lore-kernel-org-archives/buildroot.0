From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 14:15:09 +0100
Subject: [Buildroot] [PATCH v2] package/proftpd: prevent openssl pthread
 detection
In-Reply-To: <e524cd32-35c3-ce10-5bc9-68a438d71d3e@mind.be> (Arnout
 Vandecappelle's message of "Fri, 22 Feb 2019 00:20:06 +0100")
References: <1550782347-31389-1-git-send-email-matthew.weber@rockwellcollins.com>
 <e524cd32-35c3-ce10-5bc9-68a438d71d3e@mind.be>
Message-ID: <87pnrkj76q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 21/02/2019 21:52, Matt Weber wrote:
 >> Openssl cmdline executable can be used as a config test which
 >> results in either the host-openssl or host system's openssl
 >> being used to detect the linking with -pthread. This is an
 >> issue as a system maybe building with a toolchain without
 >> thread support. (To review the detection logic, see proftpd
 >> configure.in and search for pr_use_pthread_for_openssl)

 >  I noticed a potential issue: now pthread never gets linked in, even if openssl
 > is built with thread support and when linking statically.

 >  However, it turns out that that is not a problem because openssl (at least in
 > the version we use) doesn't pull in its thread support automatically.

 >  So, I completely rewrote the commit message and applied to master, thanks.

Committed to 2018.02.x and 2018.11.x, thanks.

I did a test build on 2018.02.x to verify.

-- 
Bye, Peter Korsgaard
