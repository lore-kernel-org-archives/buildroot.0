From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Jan 2017 13:43:51 +0100
Subject: [Buildroot] [PATCH] mysql: propagate common dependencies to
	toplevel config
In-Reply-To: <20170109121645.porogilr3dlfaqgu@tarshish> (Baruch Siach's
 message of "Mon, 9 Jan 2017 14:16:45 +0200")
References: <20170109105654.14562-1-peter@korsgaard.com>
 <20170109121645.porogilr3dlfaqgu@tarshish>
Message-ID: <87mvf0o12w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Mon, Jan 09, 2017 at 11:56:54AM +0100, Peter Korsgaard wrote:
 >> Commit 3d707d2b (mysql: rename package to oracle-mysql, make a virtual
 >> package) introduced a user selectable virtual BR2_PACKAGE_MYSQL package, but
 >> didn't propagate the (common) dependencies of the two variants to it, so the
 >> virtual package can now be selected even though neither of the variants are
 >> available.
 >> 
 >> As several packages enable mysql support when BR2_PACKAGE_MYSQL is selected,
 >> this causes a number of autobuilder issues:
 >> 
 >> http://autobuild.buildroot.net/results/7fe/7fe0d0a3e7ed0430852dc42b718dd037557207e8/
 >> http://autobuild.buildroot.net/results/cc4/cc4c2d936f3e1ba6c0a9782b2218de54a4ff75d2/
 >> 
 >> Fix it by propagating the common dependencies of the two variants to the
 >> virtual package to ensure it cannot be enabled unless at least one of them
 >> are available.
 >> 
 >> Also move the toolchain comment outside the conditional so it is visible
 >> when mysql isn't available.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > This is similar to http://patchwork.ozlabs.org/patch/709670/, but more 
 > comprehensive. Looks good to me.

Ups, I somehow missed your patch - Sorry about that!

Committed, thanks.

-- 
Bye, Peter Korsgaard
