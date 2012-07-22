From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 18:32:34 +0200
Subject: [Buildroot] [PATCH v2-resend2] Package downloads: allow
 restricting to primary site only
In-Reply-To: <119fa03d4dfc91ef89e7.1340343423@beantl019720>
References: <119fa03d4dfc91ef89e7.1340343423@beantl019720>
Message-ID: <20120722183234.3f56d303@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 22 Jun 2012 07:37:03 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> This patch adds a new config option BR2_PRIMARY_SITE_ONLY that, when set,
> restricts package downloads to the specified BR2_PRIMARY_SITE. If the package
> is not present on the primary site, the download fails.
> 
> This is useful for project developers who want to ensure that the project can
> be built even if the upstream tarball locations disappear.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks, applied with minor changes:

 * Added more details in the configuration option help text, coming
   from your commit log. I thought that mentioning the possible use
   case for the option was useful.

 * Added a dependency on BR2_PRIMARY_SITE != "", which hides this new
   option in the general case of having no primary site at all.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
