From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 19:20:20 +0200
Subject: [Buildroot] [PATCH 1/1] Allow svn tags and branches notation in
 $(PKG)_VERSION variable.
In-Reply-To: <2228068.y4thvyPt1K@portaka>
References: <2228068.y4thvyPt1K@portaka>
Message-ID: <20130918192020.2ea7cb7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ra?l S?nchez Siles,

On Wed, 18 Sep 2013 07:11:43 +0200, Ra?l S?nchez Siles wrote:

> According to user manual "generic-package Reference" section, LIBFOO_VERSION
> could refer to a branch or tag. This patch adds supports for this in the svn
> method case for the repositories following the branches/tags/trunk layout.
> 
> Examples:
> LIBFOO_VERSION = tags/v3.2.1
> LIBFOO_SITE = svn://svn.server.net/myproject
> 
> LIBFOO2_VERSION = branches/featureA
> LIBFOO2_SITE = http://svn.happyserver.net/theproject
> LIBFOO2_SITE_METHOD = svn
> 
> Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>

Hum, I am not sure. In the SVN world, a version is really a revision
number that you get with 'svn checkout -r'.

I believe to get a specific branch or tag with SVN, one should instead
use:

LIBFOO2_VERSION = <some revision number>
LIBFOO2_SITE = http://svn.happyserver.net/theproject/branches/featureA

I do understand the wish to make things 'like other VCS', but I am not
entirely convinced it's a good idea. But I can probably be convinced
with good arguments :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
