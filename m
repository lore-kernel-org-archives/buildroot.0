From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jun 2016 21:27:06 +0200
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be> (Arnout
 Vandecappelle's message of "Wed, 22 Jun 2016 22:38:38 +0200")
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
 <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
 <877fdhw8ek.fsf@dell.be.48ers.dk>
 <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
Message-ID: <8737nyqvp1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I don't have an issue as such with us more aggressively following glibc
 >> development if we decide to do so, but this kind of information should
 >> be included in the commit message.

 >  My take on this: we should follow the stable branch of upstream. Since glibc
 > has no concept of stable branches (in fact, none of the libc's do), we really
 > should follow upstream releases aggressively.

Yes, I generally agree (unless there's typically issues with using the
absolutely latest version, like there is for gcc).

 > In fact, I think it's quite unreasonable that we don't have stable updates for
 > glibc (or any other libc). As a distro, it's our responsibility to make sure our
 > users get stable updates, particularly for something as important as glibc.

I wouldn't call Buildroot a distro, but yeah - Bugfix releases would be
nice.

 > Since we (currently) don't have the bandwidth to do that, and since
 > there simply is no viable upstream to rely on [*], we should probably
 > consider dropping the multi-version glibc... Topic for discussion at
 > the next BR developer meeting.

In general I think we should only do version selection for tools where
it is needed (E.G. hardware dependent stuff like kernel/bootloaders, or
"unstable" projects where going with the latest version isn't trivial
for api/regression reasons).

I don't know if glibc belongs to that group or not.


 >  [*] I've checked if we could use another distro, but most are on glibc 2.19...
 > Debian would be an option for glibc 2.22, but for 2.23 and 2.24 there will
 > probably no viable distro.

Do you have any idea why these other distributions stick to those older
versions?

-- 
Venlig hilsen,
Peter Korsgaard 
