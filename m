From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 22:41:52 +0200
Subject: [Buildroot] [V2] 4th: new package
In-Reply-To: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
References: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160705224152.2e1e3161@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

When doing a new iteration of a patch, please add a changelog that
indicates what has been changed.

On Tue,  5 Jul 2016 21:05:20 +0200, Francois Perrad wrote:

> +4TH_VERSION = 3.62.4
> +4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
> +4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
> +4TH_LICENSE = GPLv3, LGPLv3
> +4TH_LICENSE_FILES = COPYING

Did you resolve the licensing issue? That was the main point of my
previous review:

"""
I was about to apply your patch, with some minimal changes (see
http://code.bulix.org/i2s65n-101064), but there is one fundamental
license issue here.

The COPYING file, as well as documentation/license.txt contain the
license text of the LGPLv3. But the source code (sources/*.c) all claim
to be licensed under the GPLv3. Only the .4th files are under LGPLv3.

This is clearly not good. Could you talk with upstream to get this
situation resolved?
"""

At least some reply from you about this would have been useful to
understand what's going on.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
