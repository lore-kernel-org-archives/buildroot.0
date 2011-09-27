From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Sep 2011 08:18:36 +0200
Subject: [Buildroot] [PATCH] linux custom tarball: automatically detect
	a change in tarball configuration
In-Reply-To: <CAAXf6LWbsf0WP-A_n3DkV2mdRn54CiL=3AWFckDeuF=L2-Y31A@mail.gmail.com>
References: <7ee0d57e0b0bbf8917e2.1316595354@localhost6.localdomain6>
 <20110922215817.1bba4c82@skate>
 <CAAXf6LWbsf0WP-A_n3DkV2mdRn54CiL=3AWFckDeuF=L2-Y31A@mail.gmail.com>
Message-ID: <201109270818.37828.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Friday 23 September 2011 08:16:09, Thomas De Schampheleire wrote:
> > I agree that their is a minor inconvenience in having the directory
> > always named linux-custom/, but I don't have a good solution in mind.
> 
> The other solution that I implemented in buildroot-2010.11 is to make
> the download step depend on the tarball, instead of on a stamp file.
> Since linux now uses gentargets, this would require a change in the
> whole of gentargets as well.
> Essentially, the .stamp_downloaded file would be no longer needed, and
> the tarball would serve as stamp file.
> 
> Would you prefer such a solution?

 I certainly would.

 I never really understood why the dependencies are between the phony targets 
instead of the stamp files.  Otherwise, I could just touch a stamp file to 
force all subsequent build steps to run.  However, I guess the buildroot 
masters must have their reasons :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110927/54579cfd/attachment-0001.html>
