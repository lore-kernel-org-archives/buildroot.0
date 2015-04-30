From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2015 16:59:31 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
In-Reply-To: <CANQCQpaw-Ft7NFRCHYns6em8GU78+LBvU-2yhZapqOMxzH_VFg@mail.gmail.com>
 (Matthew Weber's message of "Thu, 30 Apr 2015 09:48:13 -0500")
References: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
 <87zj5pvgba.fsf@dell.be.48ers.dk>
 <CANQCQpaw-Ft7NFRCHYns6em8GU78+LBvU-2yhZapqOMxzH_VFg@mail.gmail.com>
Message-ID: <87vbgdvezw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> > +            # Based on http://sourceforge.net/p/kboot/mailman/message/1168535/
 >> 
 >> A more detailed commit message would be good. After looking at that URL
 >> I'm still not quite sure what this is needed for? It doesn't seem to be
 >> read again anywhere.

 > Sorry, I can add that.  In general, it adds the leases functionality
 > that mimics full dhclient behavior.  This file can then be used at a
 > system level to know least expiration and other server provided
 > information.

Ok, good. Is that really something we want to enforce for everyone using
udhcpc with Buildroot?

 >>> +             } >> /var/lib/misc/udhcpc-$interface.leases
 >> 
 >> Are you sure this should append the file and not overwrite it? Why would
 >> you want to keep older lease info around when you receive a new one?

 > I just mimic'd dhclient but I could see in a embedded space you might
 > only want to keep the latest and when a lease expires, removing this
 > file.  I think the full client usually used this file to set an
 > interface after reboot to the previous lease if one was still valid.
 > I wasn't going to keep this behavior since for embedded devices it
 > doesn't make sense.

Ok.

 >> 
 >> Perhaps this belongs in a hook in your rootfs overlay?

 > Right now there isn't any way to get dhcp lease information after a
 > lease is provided.  It seemed this should be a standard capability of
 > the script.  I do agree I should make it not append and clean up when
 > there isnt' a lease.

I'm still not convinced this isn't something that belongs in a project
specific rootfs overlay instead. That's part of the reason why we now
support custom hooks in the udhcpc script.

-- 
Venlig hilsen,
Peter Korsgaard 
