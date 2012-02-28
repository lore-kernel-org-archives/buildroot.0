From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 21:19:38 +0000
Subject: [Buildroot] [Bug 4796] New: apply-patches.sh reorders patches
	given on the command line
In-Reply-To: <20120227082616.GJ23707@ldesroches-Latitude-E6320>
References: <bug-4796-163@https.bugs.busybox.net/>
 <20120227082616.GJ23707@ldesroches-Latitude-E6320>
Message-ID: <201202282119.38907.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 27 February 2012 08:26:16 Ludovic Desroches wrote:
> Hello,
> 
> Sorry I don't know if it's the good way to answer on the mailing list
> instead of bugzilla.
> 
> Since my goal is to discuss about sorting or not sorting in relation with
> the patch is sent, I choose the mailing list.

 Good choice; however, you should have included the reported in CC (he may
not be subscribed to the list).  I've done that now.

[snip]
> This patch contradicts the patches I have done to manage archive containing
> several patches in a proper way.
> 
> For instance, we have an archive containing patches (from a git branch) whose
> names should be 0001-patch1, 0002-patch2, etc. If we don't use sorting they
> would not be applied in the good order.
> 
> I was suspecting that we would have some issues with some kind of patches as
> debian ones.
> 
> What should be the good solution? Changing patch naming rules? Managing in a
> specific way some kind of patch? Don't sort a list of patches but sort the
> patches extracted into a directory?

 We actually had a very brief discussion about this on the developer day.
From the report:

Series files: we don't accept it in our tree, but we would accept support for
it in apply-patches.sh.  The latter is useful because some board vendors supply
the kernel patches as an unordered tarball with a series file.


 Bottom line: if there is a series file (in the directory or in the 
tarball), it should be used to set the ordering.  If there is no series 
file, use ls for sorting.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
