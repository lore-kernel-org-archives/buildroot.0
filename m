From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 02:43:13 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <5572265D.4060204@mind.be>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <5572265D.4060204@mind.be>
Message-ID: <20150606024313.51afc7ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 06 Jun 2015 00:44:45 +0200, Arnout Vandecappelle wrote:
> On 06/04/15 17:05, Thomas Petazzoni wrote:
> > Now that we have <fs>_POST_GEN_HOOKS, there is nothing that prevents
> > the iso9660 filesystem logic from using the common filesystem
> > infrastructure.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  However, instead of doing the cleanup in a _POST_GEN_HOOK, I would skip the
> cleanup completely. We normally don't clean up any build artefact, so why should
> we do it here?

That's actually true. The only advantage by cleaning up is that if you
redo a build and the contents of the temporary directory have changed,
it's properly accurate. But we could also do:

	remove temp dir
	create empty temp dir
	do stuff
	create image

and that's it.

Do you want to change it in this direction?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
