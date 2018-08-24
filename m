From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:43:13 +0200
Subject: [Buildroot] [PATCH] libfuse: security bump to version 2.9.8
In-Reply-To: <20180817070121.17733-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 17 Aug 2018 09:01:21 +0200")
References: <20180817070121.17733-1-peter@korsgaard.com>
Message-ID: <87h8jkjgta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2018-10906 - In fuse before versions 2.9.8 and 3.x before 3.2.5,
 > fusermount is vulnerable to a restriction bypass when SELinux is active.
 > This allows non-root users to mount a FUSE file system with the
 > 'allow_other' mount option regardless of whether 'user_allow_other' is set
 > in the fuse configuration.  An attacker may use this flaw to mount a FUSE
 > file system, accessible by other users, and trick them into accessing files
 > on that file system, possibly causing Denial of Service or other unspecified
 > effects.

 > And additionally:

 > - libfuse no longer segfaults when fuse_interrupted() is called outside the
 >   event loop.

 > - The fusermount binary has been hardened in several ways to reduce
 >   potential attack surface.  Most importantly, mountpoints and mount options
 >   must now match a hard-coded whitelist.  It is expected that this whitelist
 >   covers all regular use-cases.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
