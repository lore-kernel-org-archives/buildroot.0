From: Hamish Moffatt <hamish@cloud.net.au>
Date: Fri, 25 Jul 2008 10:12:43 +1000
Subject: [Buildroot] Makefile.autotools.in does not work well
	with	projects
In-Reply-To: <1216910589.29392.18.camel@localhost>
References: <1216910589.29392.18.camel@localhost>
Message-ID: <20080725001242.GB25141@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 24, 2008 at 04:43:09PM +0200, Hans-Christian Egtvedt wrote:
> The Makefile.autotools.in uses a rule which touches a
> stamp_target_installed file, this does not work well with projects.
> 
> The Makefile should depend on a file on the target root file system,
> file not there => install to target again.

Indeed - install stamps are pure evil. They don't work with multiple
projects and they mean you can't "rm -rf
project_build_$(ARCH)/$(PROJECT)/root".


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
