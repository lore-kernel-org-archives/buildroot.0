From: Mitch Davis <mjd+buildroot@afork.com>
Date: Mon, 19 Jul 2010 11:50:54 +1000
Subject: [Buildroot] [PATCH 5/5] toolchain: rename base target for
	external toolchains
In-Reply-To: <1278967576-11399-6-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
	<1278967576-11399-6-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <AANLkTimlLPyUd1RuH0ReU45-4m_r7CANO8Rk7ERht22W@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 13, 2010 at 6:46 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> It is misleeading to name the external toolchain make target 'uclibc', as
> external toolchains can be based on other C libraries (eg. glibc or eglibc).

I understand your point about uclibc not being a suitable generic
name, but I'm not sure toolchain-prepare is the ideal name.  To me,
what this target does is guarantees the presence of the C run time
library (whether that be uClibc, glibc, etc).  Might "c-rtl" or
similar be a better name?  (Of course, in order to generate the RTL,
the toolchain will need to be there, as usual).

I can also imagine a scenario where one is building such a minimal
system that one needs the toolchain, but not the RTL.  What are good
target names to guarantee the toolchain, and the RTL, as separate
targets?

Mitch.
