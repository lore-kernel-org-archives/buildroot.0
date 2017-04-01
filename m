From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 16:50:59 +0200
Subject: [Buildroot] [PATCH v5 08/19] reproducible: try to detect most
 common errors
In-Reply-To: <1482241596-31688-9-git-send-email-jezz@sysmic.org>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-9-git-send-email-jezz@sysmic.org>
Message-ID: <20170401165059.1f3f9ad5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Dec 2016 14:46:25 +0100, J?r?me Pouiller wrote:
> Some package includes some information from build environment in their results.
> This practice is incompatible with reproducible builds.
> 
> This patch scans final target to research most common patterns.
> 
> Since we only search fixed strings (grep is called with -F), this search is
> fast (on my station, 60ms for a target of 40MB).
> 
> Note, it could be a good idea to also match current user name. However, build
> path often contains username and, until now, we do not try to avoid build path
> in result.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I am not entirely convinced it makes sense to grep more or less
randomly in all files specifically for those strings.

Or perhaps, we should have a separate shell scripts that checks for
several classes of obviously non-reproducible behaviors?

Arnout, Peter, Yann, what do you think?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
