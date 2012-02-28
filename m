From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Feb 2012 20:46:40 +0000
Subject: [Buildroot] [PATCH V2] openocd: fetch package from git
	repository and update version
In-Reply-To: <20120226043705.GD10670@game.jcrosoft.org>
References: <20120224190112.GB10670@game.jcrosoft.org>
 <CAAAP30E8ijhxYh05evremPG9fpkyySo8fjJv18Wc4J2eKuf8rw@mail.gmail.com>
 <20120226043705.GD10670@game.jcrosoft.org>
Message-ID: <201202282046.41124.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 26 February 2012 04:37:06 Jean-Christophe PLAGNIOL-VILLARD wrote:
> On 00:06 Sun 26 Feb     , Alexandre Pereira da Silva wrote:
[snip]
> > The openocd release is 6 months old and they made many improvements
> > since then. And I don't see any plans for them to release a new
> > version any time soon.
> I will release a new version of openocd in time, today the current version is
> not stable enough

 That's a good reason to NACK the use of the git commit.  Thank you for
the explanation, Jean-Christophe.


> > This is a special package like u-boot and the kernel because in many
> > occasions you have to tweak the package to suit your own hardware.
> The NACK stand
> 
> You can do it for your local but for mainline no, barebox/ u-boot, linux are
> based on release

 Difference being that all of those release quite frequently :-)

> > Other option would be to use 0.5.0 version from git, so people who run
> > into this kind of issue, can override the version more easily.
> NACK
> 
> git is very slow to download it's NOT an option at all for default version

 Good point as well.

 With the need for local patches and the occasional local need for a git 
version rather than a release, you could consider adding git and patches
support to openocd's Config.in, like is the case for U-Boot and linux.


> > Another comment on this issue is about git submodule fetching. Do you
> > think that could be useful to other packages? If so, I can prepare a
> > new patch to fetch all submodules, if any.

 I'm not too keen on that.  Although I could be convinced.  Such a
feature would definitely have to be verified with all current git-based
packages.

 Regards,
 Arnout

 
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
