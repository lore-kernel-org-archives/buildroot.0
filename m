From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 22:31:54 +0200
Subject: [Buildroot] [PATCH 01/14] pkg-cmake.mk: replace "echo -en" with
	printf
In-Reply-To: <53597380.30308@mind.be> (Arnout Vandecappelle's message of "Thu, 
 24 Apr 2014 22:26:40 +0200")
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
 <1398293313-17580-2-git-send-email-s.martin49@gmail.com>
 <53597380.30308@mind.be>
Message-ID: <87d2g61nb9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 24/04/14 00:48, Samuel Martin wrote:
 >> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 >> Cc: Arnout Vandecappelle <arnout@mind.be>

 >  Commit message could have been clarified with

 > printf is POSIX-compliant, echo -e is not.

Committed with that added, thanks.

It would also be good to get rid of the other instances of this in the
tree:

git grep -l 'echo -e'
package/acpid/acpid.mk
package/eudev/S10udev
package/pkg-utils.mk
package/udev/S10udev

-- 
Bye, Peter Korsgaard
