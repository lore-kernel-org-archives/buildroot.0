From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Sep 2011 08:31:04 +0200
Subject: [Buildroot] [PATCH 01/15] package: show complete URL for
	external-deps
In-Reply-To: <9a55925fbd5588fb01890a48d15a46b06c93fed4.1314826231.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2011 23:31:09 +0200")
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <9a55925fbd5588fb01890a48d15a46b06c93fed4.1314826231.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87zki3wuhj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The WGET helper that is used for the "make external-deps" target was
 Thomas> only showing the filename, and not the complete download URL, which
 Thomas> was inconsistent with the SVN, BZR and GIT helpers that all show the
 Thomas> complete URL of the upstream project.

Hmm, the uses case for external-deps were:

 - What files from the dl/ dir do I need to copy over to new machine to
   be able to build this config without internet connectivity?

 - What files do I need to archive (next to buildroot) to ensure I can
   rebuild this config in years to come?

- What files do I need to provide to customers in addition to buildroot
  for GPL compliance?

For all of those the upstream URL isn't really interesting - Perhaps we
should fix the svn/bzr/git helpers instead?

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Makefile.package.in |    2 +-
 Thomas>  1 files changed, 1 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
 Thomas> index 868bf28..6dae8f7 100644
 Thomas> --- a/package/Makefile.package.in
 Thomas> +++ b/package/Makefile.package.in
 Thomas> @@ -168,7 +168,7 @@ define SOURCE_CHECK_WGET
 Thomas>  endef
 
 Thomas>  define SHOW_EXTERNAL_DEPS_WGET
 Thomas> -  echo $(2)
 Thomas> +  echo $(1)/$(2)
 Thomas>  endef

-- 
Bye, Peter Korsgaard
