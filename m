From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:43:14 +0100
Subject: [Buildroot] [PATCH v4] package/python-web2py: cleaning for
 space saving
In-Reply-To: <1438070683-2109-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1438070683-2109-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20160223234314.7d391cbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Tue, 28 Jul 2015 10:04:43 +0200, Angelo Compagnucci wrote:
> This patch removes from web2py folder welcome, examples application
> and a bunch of other files uneeded in production,
> furthermore, it removes the admin interface if unneeded.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

I saw this old patch having Reviewed-by from Arnout and Yann and was
therefore tempted to apply it. However, I believe Arnout and Yann made
some very valuable comments before giving their Reviewed-by, and I
would prefer to see those comments be implemented rather than applying
the patch as-is.

To sum-up, the comments are:

 * Split in three patches: 1/ clean-up the installation, 2/ add option
   to remove the admin interface, 3/ move the admin password generation
   from install time to build time. This will also mean you'll have
   more detailed commit log, which will also fulfill a comment made by
   Yann.

 * Use rsync with exclude to copy only the useful files

Could you rework this patch to take into account those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
