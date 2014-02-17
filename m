From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Feb 2014 23:57:06 +0100
Subject: [Buildroot] [PATCH 1/6] toolchain: introduce a toolchain knob
 for NPTL
In-Reply-To: <5302884F.9020402@mind.be>
References: <1392297727-17627-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392297727-17627-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <5302884F.9020402@mind.be>
Message-ID: <20140217235706.3be4e482@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 17 Feb 2014 23:08:15 +0100, Arnout Vandecappelle wrote:
> On 13/02/14 14:22, Thomas Petazzoni wrote:
> > +config BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL
> > +	bool "Toolchain has NPTL threads support?"
> > +	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS
> > +	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
> > +	default y
> > +	help
> > +	  Select this option if your external toolchain uses the NPTL
> > +	  (Native Posix Thread Library) implementation of Posix
> > +	  threads. If you don't know, leave the default value,
> > +	  Buildroot will tell you if it's correct or not.
> 
>  Where exactly does buildroot check if the external toolchain has NPTL?

In the patch you're replying to, look at the chunk that modifies
toolchain/helpers.mk:

+	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS_NATIVE__,BR2_TOOLCHAIN_HAS_THREADS_NPTL,$${UCLIBC_CONFIG_FILE},NPTL thread support) ;\

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
