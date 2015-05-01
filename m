From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 May 2015 23:13:05 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
In-Reply-To: <55428A75.7000401@mind.be> (Arnout Vandecappelle's message of
 "Thu, 30 Apr 2015 22:03:01 +0200")
References: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
 <87zj5pvgba.fsf@dell.be.48ers.dk>
 <CANQCQpaw-Ft7NFRCHYns6em8GU78+LBvU-2yhZapqOMxzH_VFg@mail.gmail.com>
 <87vbgdvezw.fsf@dell.be.48ers.dk> <55428A75.7000401@mind.be>
Message-ID: <87a8xouhlq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > Sorry, I can add that.  In general, it adds the leases functionality
 >> > that mimics full dhclient behavior.  This file can then be used at a
 >> > system level to know least expiration and other server provided
 >> > information.
 >> 
 >> Ok, good. Is that really something we want to enforce for everyone using
 >> udhcpc with Buildroot?

 >  I don't see why not. It's creating a small file in /tmp, that's all. Except for
 > the appending, of course, otherwise a long-running system could just fill up
 > /tmp with leases. Overwriting has the disadvantage that there's a race condition
 > when the file is truncated at the same time that another process is reading from
 > it, but I don't think the complexity of fixing that race is worth the bother.

True. I would like to see this (and other non-essential things like
E.G. avahi-autoipd) move to hooks though.

I wonder if the dhclient format is a sensible choice. Is that something
any "standard" programs can work with? It doesn't seem very easy to
parse in shell scripts. Maybe just shell compatible NAME="<val>" strings
would be better?

-- 
Venlig hilsen,
Peter Korsgaard 
