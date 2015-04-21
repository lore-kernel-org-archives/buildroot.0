From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 22:43:02 +0200
Subject: [Buildroot] [PATCH 2/3] package/cache-calibrator: add hash
In-Reply-To: <20150421172246.GB4262@free.fr> (Yann E. MORIN's message of "Tue, 
 21 Apr 2015 19:22:46 +0200")
References: <1429583936-13335-1-git-send-email-fabio.porcedda@gmail.com>
 <1429583936-13335-2-git-send-email-fabio.porcedda@gmail.com>
 <87iocqt0wq.fsf@dell.be.48ers.dk> <20150421172246.GB4262@free.fr>
Message-ID: <87oamhrz55.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

>> This will cause issues when/if that file ever gets updated - But then
 >> atleast we know and can update the hash.

 > It also means that Buildroot 2015.05 will stop working at some point
 > when this file is updated. The problem is not much about Buildroot
 > master , which is easily fixable, but about our releases, that get
 > broken as soon as upstream changes that file.

 > I am not really happy with either solutions: either add a hash and break
 > releases in the future, or not add a hash file, and miss updates,
 > especially in the autobuilders (even though they do remove downloads
 > from time to time.

True - I don't really think there's any good solution to this (besides
maybe convincing upstream to version their releases).

 > One case for the adding the hash, too, is that it will tell people that
 > their local copy in their local cache (e.g. my ~/src/ ) is out-of-date.

 > Still, I'm not convinced we want that hash...

Maybe not. Perhaps the breakage from wrong hash is worse than the
potential breakage from newer versions. Also notice that the download
support falls back to our local copy on sources.buildroot.net if the
hash doesn't match.

 > Do we have other such packages (I think I read there was another
 > version-less package for now)?

Yes, we do:

git grep 'SOURCE =.*\.c$'
package/cache-calibrator/cache-calibrator.mk:CACHE_CALIBRATOR_SOURCE = calibrator.c
package/devmem2/devmem2.mk:DEVMEM2_SOURCE = devmem2.c
package/whetstone/whetstone.mk:WHETSTONE_SOURCE = whetstone.c

-- 
Venlig hilsen,
Peter Korsgaard 
