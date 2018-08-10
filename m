From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Aug 2018 08:29:07 +0200
Subject: [Buildroot] [2018.02.x 1/2] makedevs: allow leading whitespace
 for capabilities
In-Reply-To: <5b6cf5f93b22_57833f926e0c8bdc217d4@ultri5.mail> (Ricardo
 Martincoski's message of "Thu, 09 Aug 2018 23:18:33 -0300")
References: <20180809234235.47a45e5f@windsurf>
 <5b6cf5f93b22_57833f926e0c8bdc217d4@ultri5.mail>
Message-ID: <87zhxuenv0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Hello,
 > On Thu, Aug 09, 2018 at 06:42 PM, Thomas Petazzoni wrote:

 >> On Mon,  6 Aug 2018 00:17:14 -0300, Ricardo Martincoski wrote:
 >>> Currently makedevs silently ignores extended attributes with leading
 >>> whitespace, for example those added to a <PACKAGE>_PERMISSIONS following
 >>> the recommended style from check-package.
 >>> 
 >>> Makedevs already ignores leading whitespace for normal entries (file
 >>> permission changes and device files creation). Do the same for extended
 >>> attributes.
 >>> 
 >>> Fixes: #11191.
 >>> 
 >>> Reported-by: Jean-pierre Cartal <jpcartal@free.fr>
 >>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 >>> Cc: Arnout Vandecappelle <arnout@mind.be>
 >>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> 
 >> It is not clear to me why you have the "2018.02.x" prefix in your patch
 >> title. I would assume this patch is needed in master, not just in
 >> 2018.02.x. We generally include 2018.02.x in the patch title when
 >> the patch should only be applied to 2018.02.x. For patches going in
 >> master, and needing a backport, we normally rely on Peter being smart
 >> and realizing that the patch is a fix that makes sense for 2018.02.x.
 >> 
 >> Could you clarify what was your intention with this 2018.02.x prefix ?

 > I developed and runtime tested the patch for 2018.02.x.
 > But now I tested the patch (by temporarily adding a printf to makedevs) in the
 > master branch too. It works well.

 > This patch can/should be applied to master.

 > In the branch 2018.02.x this patch unbreaks xattr with leading whitespace.
 > In the master branch (and also 2018.05.x), which use a per-fs target dir, there
 > are other issues with xattr, this patch is only part of the solution to unbreak
 > xattrs, see #11216.

Ok, thanks.

Committed to master, and then backported to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
