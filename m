From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 22:24:14 +0100
Subject: [Buildroot] [PATCH 1/2] lua: remove built dependencies
In-Reply-To: <1355564002-14490-1-git-send-email-francois.perrad@gadz.org>
References: <1355564002-14490-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20130304222414.17c0fce3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat, 15 Dec 2012 10:33:21 +0100, Francois Perrad wrote:
> runtime dependencies are handled in Config.in
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

If those are runtime dependencies only, then you need to update the
Config.in file to add a comment explaining that it's a runtime
dependency. Generally, when a package selects another one in its
Config.in, we expect the .mk file to have this dependency as well. When
it's not the case, we want a comment that explains why.

	# Runtime dependency only	
	select BR2_PACKAGE_LUAFILESYSTEM

Could you post an updated version of your [PATCH 1/2] with this change?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
