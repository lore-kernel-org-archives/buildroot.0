From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 12 Apr 2010 19:48:49 +0200
Subject: [Buildroot] [PATCH 03/21] udpcast: convert to the autotools
	infrastructure
In-Reply-To: <b7fe41a1f4c9fc78ea89fe332a7d98d2922ed83f.1271077873.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 12 Apr 2010 15:11:15 +0200")
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<cover.1271077873.git.thomas.petazzoni@free-electrons.com>
	<b7fe41a1f4c9fc78ea89fe332a7d98d2922ed83f.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87d3y4k1dq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/udpcast/udpcast.mk |   93 +++++++-------------------------------------

 Thomas> -UDPCAST_CAT:=$(ZCAT)
 Thomas> -UDPCAST_DIR:=$(BUILD_DIR)/udpcast-$(UDPCAST_VERSION)
 Thomas> +UDPCAST_INSTALL_TARGET_OPT=DESTDIR=$(TARGET_DIR) install
 Thomas> +UDPCAST_CONF_ENV = ac_cv_type_stat64=yes

 Thomas> -		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \

Why are you now forcing 64bit here?

 Thomas> +
 Thomas> +$(eval $(call AUTOTARGETS,package,udpcast))
 Thomas> \ No newline at end of file

Not a big deal, but you seem to forgot the final newline in several
files - Is there any reason why?

-- 
Bye, Peter Korsgaard
