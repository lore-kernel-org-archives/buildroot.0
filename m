From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 07:43:48 -0800
Subject: [Buildroot] [PATCH 17/33] matchbox packages: fix broken urls
In-Reply-To: <1353543503-8952-18-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 22 Nov 2012 01:18:07 +0100")
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-18-git-send-email-s.martin49@gmail.com>
Message-ID: <87fw3rayff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> ---
 Samuel>  package/matchbox/matchbox-common/matchbox-common.mk     | 6 +++---
 Samuel>  package/matchbox/matchbox-desktop/matchbox-desktop.mk   | 5 +++--
 Samuel>  package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
 Samuel>  package/matchbox/matchbox-lib/matchbox-lib.mk           | 2 +-
 Samuel>  package/matchbox/matchbox-panel/matchbox-panel.mk       | 6 +++---
 Samuel>  package/matchbox/matchbox-wm/matchbox-wm.mk             | 2 +-
 Samuel>  6 files changed, 12 insertions(+), 11 deletions(-)

 Samuel> diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
 Samuel> index 2e3cdff..993590c 100644
 Samuel> --- a/package/matchbox/matchbox-common/matchbox-common.mk
 Samuel> +++ b/package/matchbox/matchbox-common/matchbox-common.mk
 Samuel> @@ -3,10 +3,10 @@
 Samuel>  # MatchBox Common
 Samuel>  #
 Samuel>  #############################################################
 Samuel> -
 Samuel> -MATCHBOX_COMMON_VERSION = 0.9.1
 Samuel> +MATCHBOX_COMMON_VERSION_MAJOR = 0.9
 Samuel> +MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
 Samuel>  MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
 Samuel> -MATCHBOX_COMMON_SITE = http://matchbox-project.org/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION)
 Samuel> +MATCHBOX_COMMON_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)

Hmm, projects.o-hand.com doesn't seem to exist?

host -a projects.o-hand.com
Trying "projects.o-hand.com"
Received 105 bytes from 64.71.0.60#53 in 59 ms
Trying "projects.o-hand.com"
Host projects.o-hand.com not found: 3(NXDOMAIN)

-- 
Bye, Peter Korsgaard
