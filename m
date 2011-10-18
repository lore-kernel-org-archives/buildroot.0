From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2011 23:38:59 +0200
Subject: [Buildroot] [PATCH 1/2] package infra: add mirror support
In-Reply-To: <bd3650393bb885ae632b4e1963278d3f@zacarias.com.ar>
References: <1318947295-24677-1-git-send-email-gustavo@zacarias.com.ar>
 <20111018192708.68b1ba88@skate>
 <bd3650393bb885ae632b4e1963278d3f@zacarias.com.ar>
Message-ID: <201110182339.00295.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 18 October 2011 20:01:14, Gustavo Zacarias wrote:
> On 18.10.2011 14:27, Thomas Petazzoni wrote:
> 
> > Le Tue, 18 Oct 2011 13:00:28 -0300,
> > Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
> >
> >> Also contemplating how to properly do PKG_SIZE (for file size) and
> >> PKG_HASH (MD5 and/or SHA1) for source consistency.
> >
> > Do we actually want that ? I know OE does this, but tarball size and
> > hashes will be a pain to keep updated.
> >
> > Thomas
> 
> In a non-mandatory way it may be desirable.
> That is if a package doesn't define it then we don't care.
> Most of the time tarballs shouldn't change size & hash, though it 
> doesn't hold true for every project around.

 Size and hash should only change when you bump the version, and in that case you anyway download the new tar file for testing so it shouldn't be too hard to recompute the hash.  And of course, the hash should be the same regardless of which mirror it is downloaded from...

 I'm not sure what good size would do, however.

> It could also be an option to completely disable it.

 Definitely!

 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
