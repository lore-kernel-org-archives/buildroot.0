From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 22:59:04 +0100
Subject: [Buildroot] [PATCH] iftop: new package
In-Reply-To: <1358800841-20820-1-git-send-email-bogdan@nimblex.net> (Bogdan
 Radulescu's message of "Mon, 21 Jan 2013 20:40:41 +0000")
References: <20130121184853.0174d33d@skate>
 <1358800841-20820-1-git-send-email-bogdan@nimblex.net>
Message-ID: <87txqa8afr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bogdan" == Bogdan Radulescu <bogdan@nimblex.net> writes:

 Bogdan> Added the iftop package which is really usefull to see quickly
 Bogdan> what uses the bandwidth on your machine.

 Bogdan> Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
 Bogdan> ---
 Bogdan>  package/Config.in       |  1 +
 Bogdan>  package/iftop/Config.in | 15 +++++++++++++++
 Bogdan>  package/iftop/iftop.mk  | 15 +++++++++++++++
 Bogdan>  3 files changed, 31 insertions(+)
 Bogdan>  create mode 100644 package/iftop/Config.in
 Bogdan>  create mode 100644 package/iftop/iftop.mk

 Bogdan> diff --git a/package/Config.in b/package/Config.in
 Bogdan> index ba03b3c..9e2dd8b 100644
 Bogdan> --- a/package/Config.in
 Bogdan> +++ b/package/Config.in
 Bogdan> @@ -772,6 +772,7 @@ endif
 Bogdan>  source "package/bwm-ng/Config.in"
 Bogdan>  source "package/cpuload/Config.in"
 Bogdan>  source "package/htop/Config.in"
 Bogdan> +source "package/iftop/Config.in"

I find it more sensible to have it under Networking applications
together with E.G. iperf, so I've moved it.

 Bogdan> +++ b/package/iftop/iftop.mk
 Bogdan> @@ -0,0 +1,15 @@
 Bogdan> +#############################################################
 Bogdan> +#
 Bogdan> +# iftop
 Bogdan> +#
 Bogdan> +#############################################################
 Bogdan> +
 Bogdan> +IFTOP_VERSION = 1.0pre2
 Bogdan> +IFTOP_SITE = http://www.ex-parrot.com/pdw/iftop/download/
 Bogdan> +
 Bogdan> +IFTOP_DEPENDENCIES = ncurses libpcap
 Bogdan> +
 Bogdan> +IFTOP_LICENSE = GPL
 Bogdan> +IFTOP_LICENSE_FILES = COPYING

License is GPLv2+

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
