From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Aug 2010 17:34:15 +0200
Subject: [Buildroot] [PATCH 14/20] netcat: prevent build system from
	adding a prefix to binaries
In-Reply-To: <86047c4c4a4d951bfe590291c88a3d5b3f911180.1282471311.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sun, 22 Aug 2010 12:52:06 +0200")
References: <cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<cover.1282471311.git.thomas.petazzoni@free-electrons.com>
	<86047c4c4a4d951bfe590291c88a3d5b3f911180.1282471311.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87r5hpuyvc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Fixes bug #2239.
 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/netcat/netcat.mk |    1 +
 Thomas>  1 files changed, 1 insertions(+), 0 deletions(-)

 Thomas> diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
 Thomas> index 31f6b71..c8b2a02 100644
 Thomas> --- a/package/netcat/netcat.mk
 Thomas> +++ b/package/netcat/netcat.mk
 Thomas> @@ -10,5 +10,6 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 Thomas>  NETCAT_AUTORECONF:=NO
 Thomas>  NETCAT_INSTALL_STAGING:=NO
 Thomas>  NETCAT_INSTALL_TARGET:=YES
 Thomas> +NETCAT_CONF_OPT=--program-prefix=

Does that work? Elsewhere we always use --program-prefix=''.

While we're at it a bit of whitespace would increase readability, imho.

-- 
Bye, Peter Korsgaard
