From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Mar 2013 18:19:10 +0100
Subject: [Buildroot] [PATCH v4 05/21] qt5base: add glib support
In-Reply-To: <20130320093556.197f9966@skate>
References: <1363721394-14973-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1363721394-14973-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <871ubbt7l8.fsf@dell.be.48ers.dk> <20130320093556.197f9966@skate>
Message-ID: <51532A0E.10805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/03/13 09:35, Thomas Petazzoni wrote:
> But admittedly, the boundary between automatic enabling/disabling
> support and explicit suboptions is a bit fuzzy. It's sometimes a bit
> strange to have a suboption for something very small, and automatic
> enabling/disabling for something rather "big". I don't really have a
> good idea on how to clearly draw the line between the two solutions.
> One radical solution is: whenever it can be automatic, it should be.
> Don't know if it's reasonable, though. I'm open to suggestions on this,
> and we should probably update the documentation with details on this
> topic.

  For me, the default is to have automatic  enable/disable, with the 
following exceptions:

- the "wrapper library" is rather large, so you want to be able to build 
without the wrapper library. I can't actually find an example of this. 
Even the QtDbus example: the QtDbus+QtXml libraries total 650K 
(stripped), which is not that much compared to 3M for QtCore.

- it's not obvious to the user that the dependency should be selected. 
BR2_PACKAGE_DIRECTFB_MULTI is a good example: you wouldn't have the idea 
that you have to select linux-fusion in order to get multi-application 
support on DirectFB.


  That said, I don't think it every hurts to have a Config.in option when 
it is not strictly required. It increases our code size, but there's no 
important maintenance effort (at least if it's a simple bool option). So 
I would say it's mostly up to the contributors.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
