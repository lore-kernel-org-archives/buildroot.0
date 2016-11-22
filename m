From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2016 11:16:16 +0100
Subject: [Buildroot] [PATCH] ptpd2: fix bfin compile by avoiding gcc bug
In-Reply-To: <20161122101219.GT27313@waldemar-brodkorb.de>
References: <20161121183217.GA1046@waldemar-brodkorb.de>
 <20161121220442.77263bd3@free-electrons.com>
 <20161122101219.GT27313@waldemar-brodkorb.de>
Message-ID: <20161122111616.4cdfdd67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 11:12:20 +0100, Waldemar Brodkorb wrote:

> > However, I continue to dislike such hacks: when the problem gets fixed
> > by gcc, how will we notice?  
> 
> Either when we get notice that the PR is closed, this time I need to
> create one. But we have similar issues where we already have PR's.
> Or we check when a new gcc release come out, if the results from
> "grep bfin package/*/*mk" are still required.

Maybe we need to have some kind of convention of a specific string to
include in the comment on such hacks, in order to more easily grep?

Like:

# Workaround gcc-prXYZ

or

# Workaround binutils-prXYZ

This way, we can grep for "gcc-pr" and "binutils-pr" and easily check
the status of those PRs.

> I think better then never ending autobuild failures.

For sure, I'm not claiming we should keep things as-is. It's good to
add temporary hacks, but it's also good to think about how we can at
some point remove those hacks.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
