From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 27 Feb 2012 13:54:51 +0100
Subject: [Buildroot] [Bug 4796] New: apply-patches.sh reorders patches
 given on the command line
In-Reply-To: <20120227082616.GJ23707@ldesroches-Latitude-E6320>
References: <bug-4796-163@https.bugs.busybox.net/>
 <20120227082616.GJ23707@ldesroches-Latitude-E6320>
Message-ID: <20120227125451.GC12248@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09:26 Mon 27 Feb     , Ludovic Desroches wrote:
> Hello,
> 
> Sorry I don't know if it's the good way to answer on the mailing list
> instead of bugzilla.
> 
> Since my goal is to discuss about sorting or not sorting in relation with
> the patch is sent, I choose the mailing list.
> 
> > When support/scripts/apply-patches.sh is given an explicit list of patches
> > instead of a template, they are sorted by name before being applied. This is
> > bad as sometimes the order of patches is important, e.g. if one patch depends
> > on another one. This happens e.g. when applying Debian patches whose order is
> > explicitly described in the file debian/patches/series.
> > 
> > The culprit is a "ls -d" which has to be changed to "ls -dU" in order to
> > prevent sorting to take place. I have attached a corresponding patch.
> 
> 
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
I agree with you maybe the best way is to use a quilt

I use this ofen and it's great it will allow also to have different patch
series depending on the version of the package

convert a git patch series in a quilt is quite easy

Best Regards,
J.
