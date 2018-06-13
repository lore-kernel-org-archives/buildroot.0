From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:52:21 +0200
Subject: [Buildroot] [PATCH] perl: add upstream security fix for
 CVE-2018-12015
In-Reply-To: <20180612152130.32491-1-peter@korsgaard.com>
References: <20180612152130.32491-1-peter@korsgaard.com>
Message-ID: <20180613225221.5f41e5ee@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Jun 2018 17:21:30 +0200, Peter Korsgaard wrote:
> Fixes CVE-2018-12015 - In Perl through 5.26.2, the Archive::Tar module
> allows remote attackers to bypass a directory-traversal protection
> mechanism, and overwrite arbitrary files, via an archive file containing a
> symlink and a regular file with the same name.
> 
> Patch from
> https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5
> with path rewritten to match perl tarball.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ve-existing-files-before-overwriting-them.patch | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/perl/0001-PATCH-Remove-existing-files-before-overwriting-them.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
