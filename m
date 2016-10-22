From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:04:13 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
 PRIMARY/SECONDARY
In-Reply-To: <20161021202715.16528-1-arnout@mind.be>
References: <20161021202715.16528-1-arnout@mind.be>
Message-ID: <20161022150413.25a85c1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There is nothing named "SECONDARY" in Buildroot, it's called "BACKUP".
This can be fixed when applying the patch.

On Fri, 21 Oct 2016 22:27:15 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Some packages download files (especially patches) with a ? in the
> URL. The ? marks the query part of the URL. However, the downloaded
> file still contains the ? but from then on it doesn't designate a
> query part anymore. Therefore, when fetching from PRIMARY or
> SECONDARY site over http, the server will report a 404 Not Found.
> 
> To fix, we need to replace the ? with %3F. Obviously, this should
> be done only when fetching from PRIMARY or SECONDARY. For fetching
> from the real upstream, the ? really does designate the query part.

One thing I'm wondering is if the '?' character is the only one that
needs to be escaped like this, or not.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
