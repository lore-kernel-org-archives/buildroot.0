From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Dec 2013 20:05:22 +0100
Subject: [Buildroot] [PATCH] bluez_utils: broken for static builds
In-Reply-To: <1386093039-56954-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1386093039-56954-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20131203200522.589c0e30@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 3 Dec 2013 17:50:39 +0000, Vicente Olivert Riera wrote:
> The bluez_utils package requires shared library support
> unconditionally. We can't fix it to make it build on static because,
> for instance, "plugin.c" file uses dlfcn and it's a basic prereq for
> bluetoothd, so add "depend on !BR2_PREFER_STATIC_LIB" to it and
> recursively to all packages that selects BR2_PACKAGE_BLUEZ_UTILS.
> 
> Fixes:
> 
>    http://autobuild.buildroot.net/results/d81/d81970024649c1e89c01da491c63760afdad6cb6/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Looks good, but please read
http://buildroot.org/downloads/manual/manual.html#dependencies-target-toolchain-options,
which tells you that when a package depends on dynamic library support,
a corresponding comment should be added to inform the user of why the
package is not available.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
