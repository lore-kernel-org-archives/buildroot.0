From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:39:13 +0100
Subject: [Buildroot] [PATCH v2] size-stats: don't count hard links
In-Reply-To: <1477319799-13570-1-git-send-email-fhunleth@troodon-software.com>
References: <1477319799-13570-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20170206193913.25f86b2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 10:36:39 -0400, Frank Hunleth wrote:
> This change adds inode tracking to the size-stats script so that hard
> links don't cause files to be double counted. This has a significant
> effect on the size computation for some packages. For example, git has
> around a dozen hard links to a large file. Before this change, git would
> weigh in at about 170 MB with the total filesystem size reported as
> 175 MB. The actual rootfs.ext2 size was around 16 MB. With the change,
> the git package registers at 10.5 MB with a total filesystem size of
> 15.8 MB.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - Moved hardlink check to build_package_size() so that hardlinks
>     could also be detected in files belonging to no package
>   - The v1 patch had the effect of listing all but one hardlinked
>     files as having 0 size in file-size-stats.csv. This no longer
>     happens anymore. All files have their listed size.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
