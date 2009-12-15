From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Dec 2009 09:10:30 +0100
Subject: [Buildroot] [PATCH 05/23] uclibc: add avr32 special version
In-Reply-To: <20091215081809.071a009e@hcegtvedt.norway.atmel.com>
	(Hans-Christian Egtvedt's message of "Tue, 15 Dec 2009 08:18:09
	+0100")
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
	<3a24927a0e6f041a018085b5a7fc50312001fddc.1260831891.git.thomas.petazzoni@free-electrons.com>
	<20091215081809.071a009e@hcegtvedt.norway.atmel.com>
Message-ID: <876388r72h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "HcE" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

Hi,

 HcE> On Tue, 15 Dec 2009 00:04:37 +0100
 HcE> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

 >> 
 >> * Add a new 0.9.30-avr32-2.1.5 version of uClibc in Config.in
 >> 

 HcE> Huh? That version does not exist... Please just use the upstream
 HcE> release.

Thomas?

 HcE> This patch 'uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch' does not
 HcE> sound AVR32 specific to me. You only need one uClibc patch from an
 HcE> AVR32 point of view, the "fix-varargs-in-prctl-syscall.patch"

I guess it's just a copy of the normal getline -> get_line fix to get
unifdef working on modern glibc's (that also define a getline function).

 >> * Select a different UCLIBC_SITE for avr32 versions in uclibc.mk
 >> 
 >> * Add the LINKRELAX=y configuration option to the uClibc .config file
 >> in uclibc.mk
 >> 

 HcE> Good, does the generic uClibc configuration enable optimized string
 HcE> functions?

If not, we can probably tweak it.

-- 
Bye, Peter Korsgaard
