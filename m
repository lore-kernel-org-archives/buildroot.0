From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 3 Mar 2016 21:35:39 +0000 (UTC)
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
References: <bug-8736-163@https.bugs.busybox.net/>
 <bug-8736-163-ImR2b9Yvou@https.bugs.busybox.net/>
 <nba94j$m0k$1@ger.gmane.org> <87povb6z6z.fsf@dell.be.48ers.dk>
Message-ID: <nbaanb$k0e$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2016-03-03, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Grant" == Grant Edwards <grant.b.edwards@gmail.com> writes:
>
> Hi,
>
> > I agree that IPv6 support (if broken) needs to be fixed.  But I think
> > it's also important to restore the ability to disable IPv6 support.
> > I have customers who explicity state that they want no IPv6 support
> > in their products.
>
> I btw must say that I find such requirements quite sad in 2016 :/

Well, these are products which are often installed on small,
air-gapped networks which are never connected to "The Interwebs" and
have nothing but a handful of static, non-routable IPv4 addresses.
The people who set up and maintain these systems often don't
understand even IPv4 network addressing and just blindly follow
recipes. IPv6 is new and scary and could make heads explode.

It's still sort of sad, because with a little forethought, switching
to IPv6 could make setup and comissioning many of these setups _way_
simpler: everything could just run with auto-discovered link-local
addresses.  The phrase "plug and play" comes to mind, but historically
that phrase is too closely associated with Microsoft to be used in
polite company.

OTOH, there are other product lines where IPv6 is absolutely required
because of feature checklists handed down from on-high.  Still, nobody
ever enables IPv6 or uses it. I actually had to add some code to the
network stack to allow IPv6 to be completely disabled at boot time
based on user-configuration [these products don't run Linux, so that's
a moot point for this discussion]. :)

-- 
Grant Edwards               grant.b.edwards        Yow! Boys, you have ALL
                                  at               been selected to LEAVE th'
                              gmail.com            PLANET in 15 minutes!!
