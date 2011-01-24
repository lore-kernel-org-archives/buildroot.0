From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 17:25:25 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <20110124171132.6baad50c@surf> (Thomas Petazzoni's message of
	"Mon, 24 Jan 2011 17:11:32 +0100")
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
	<20110124171132.6baad50c@surf>
Message-ID: <87pqrmtgju.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Completely unrelated to Mike's change, but still spotted while looking
 Thomas> at the patch context:

 Thomas> On Wed, 19 Jan 2011 22:10:29 -0500
 Thomas> Mike Frysinger <vapier@gentoo.org> wrote:

 >> LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \

 Thomas> Both libpcap and tcpdump use this and I never noticed, but this
 Thomas> is completely broken with external toolchains and the
 Thomas> Crosstool-NG backend, since BR2_DEFAULT_KERNEL_HEADERS is only
 Thomas> set with internal toolchains.

 Thomas> I haven't thought of what the right fix would be, but it's definitely
 Thomas> not that one.

True. The question is why they need this info? Perhaps we can just lie
and simply say 2.6.x?

-- 
Bye, Peter Korsgaard
