From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:48:49 +0100
Subject: [Buildroot] [PATCH] Don't disable dependency tracking if using
 <pkg>_OVERRIDE_SRCDIR.
In-Reply-To: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
References: <20170201135310.3ghqvpqww25jfzm2@zenon.in.qult.net>
Message-ID: <20170305224849.5f5c75a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Feb 2017 14:53:10 +0100, Ignacy Gaw?dzki wrote:
> Include the --disable-dependency-tracking option in
> <pkg>_CONFIGURE_CMDS only on the condition that <pkg>_OVERRIDE_SRCDIR
> is empty.  Dependency tracking is very welcome while developing in
> order to properly rebuild when calling make <pkg>-rebuild for
> instance.
> 
> Signed-off-by: Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr>
> ---
>  package/pkg-autotools.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Applied to master, with a slight tweak to the commit title, and putting

	$$(if $$($$(PKG)_OVERRIDE_SRCDIR),,--disable-dependency-tracking) \

even if it's 83 characters wide. I find that more readable this way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
