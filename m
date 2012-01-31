From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 23:33:09 +0100
Subject: [Buildroot] [PATCH 2/8] liburcu: new package
In-Reply-To: <94b9aa2c3fde80442947c2cf28564b121db8e8bb.1328038759.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 31 Jan 2012 20:40:00 +0100")
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <94b9aa2c3fde80442947c2cf28564b121db8e8bb.1328038759.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87lionijtm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/Config.in          |    1 +
 Thomas>  package/liburcu/Config.in  |    9 +++++++++
 Thomas>  package/liburcu/liburcu.mk |    8 ++++++++
 Thomas>  3 files changed, 18 insertions(+), 0 deletions(-)
 Thomas>  create mode 100644 package/liburcu/Config.in
 Thomas>  create mode 100644 package/liburcu/liburcu.mk

 Thomas> diff --git a/package/Config.in b/package/Config.in
 Thomas> index eb3abe8..31bee7f 100644
 Thomas> --- a/package/Config.in
 Thomas> +++ b/package/Config.in
 Thomas> @@ -375,6 +375,7 @@ source "package/libffi/Config.in"
 Thomas>  source "package/libglib2/Config.in"
 Thomas>  source "package/libnspr/Config.in"
 Thomas>  source "package/libsigc/Config.in"
 Thomas> +source "package/liburcu/Config.in"

This no longer applied because libical has been added, but I fixed that
up and committed, thanks.

 Thomas> +++ b/package/liburcu/liburcu.mk
 Thomas> @@ -0,0 +1,8 @@
 Thomas> +LIBURCU_VERSION = 0.6.7
 Thomas> +LIBURCU_SITE    = http://lttng.org/files/bundles/20111214/
 Thomas> +LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 Thomas> +
 Thomas> +LIBURCU_INSTALL_STAGING = YES
 Thomas> +
 Thomas> +$(eval $(call AUTOTARGETS))
 Thomas> +

Heh, you used to forget the final newlines, and now you're added too
many ;)

-- 
Bye, Peter Korsgaard
