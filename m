From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Dec 2009 00:20:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	remove-external-toolchain
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 15 Dec 2009 00:04:32 +0100")
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fx7dqh23.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> This patchset removes the external source toolchain feature from
 Thomas> Buildroot. It was used to build AVR32 toolchains because the AVR32
 Thomas> architecture is unfortunately not supported by upstream
 Thomas> gcc/binutils/gdb/uClibc. So the whole external source toolchain
 Thomas> infrastructure was implemented to allow to get these components from
 Thomas> other places than the normal mirrors.

 Thomas> However, this infrastructure is far more complicated than it needs to
 Thomas> be. This patchset replaces it by integrated the avr32 special versions
 Thomas> as normal gcc/binutils/gdb/uClibc versions. The respective .mk files
 Thomas> detect whether the version name contains avr32, and if it does, then
 Thomas> it switches to the AT91 mirror. Only the latest versions of
 Thomas> binutils/gcc/uClibc/gdb for AVR32 were kept (they are already fairly
 Thomas> ancient).

 Thomas> I've compiled tested an AVR32 toolchain + BusyBox and an ARM toolchain
 Thomas> + Busybox.

Thanks a lot, pulled and pushed! It's much appreciated.

-- 
Bye, Peter Korsgaard
