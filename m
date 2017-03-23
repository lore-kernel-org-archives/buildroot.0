From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 10:00:41 +0100
Subject: [Buildroot] [PATCH 4/6] python-mwscrape: use documented license
 abbreviation
In-Reply-To: <3e6647c5-8b47-d1c1-a0fa-3cbf120759ec@mind.be>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1490204935-13172-4-git-send-email-rahul.bedarkar@imgtec.com>
 <20170322213900.3ace3cc4@free-electrons.com>
 <20170322223212.GA3591@free.fr>
 <3e6647c5-8b47-d1c1-a0fa-3cbf120759ec@mind.be>
Message-ID: <20170323100041.45149296@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 09:25:11 +0100, Arnout Vandecappelle wrote:

> >> I think our idea was to keep using GPLv2/LGPLv2.1/GPLv3, but for all
> >> other licenses, use the SPDX code as much as possible.
> >>
> >> Maybe we should bite the bullet, and migrate all packages to use SPDX
> >> license codes?  
> > 
> > That would have my approval, yes.  
> 
>  Indeed, I've been thinking about doing this.

OK, so let's just do it :)

The only thing that we might consider is the impact of this change for
our users. Are people parsing the CSV output, and checking if there is
no GPLv3 for example? Such checks would no longer match.

But longer term, I believe we will give our users a much more
logical/stable situation if we use SPDX codes everywhere rather than
the clunky mix we have today.

>  Now we just have to find a volunteer to construct the necessary sed magic :-)
> 
>  BTW I would propose to do this in one mega-patch that does mechanical
> substitution in all the .mk files (make sure the commit log contains the
> scriptlet that does it), and a second patch to fix the documentation. If it
> makes things easier, the mega-patch could be split up into separate patches for
> the different versions.

One patch for each license change would be nice IMO.

>  Oh, and for the documentation update: perhaps we should remove the list of
> licenses from our documentation, and instead refer only to spdx.org? I just
> notice now: we currently don't refer to SPDX at all in the documentation! That
> would explain Rahul's confusion about the proper license string...

Agreed.

>  Oh, and scancpan and scanpypi have to be updated as well.

Agreed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
