From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Oct 2017 16:10:07 +0200
Subject: [Buildroot] [PATCH] toolchain/wrapper: fake __DATE_ and
	__TIME__ for older gcc
In-Reply-To: <20171021203102.14520-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 21 Oct 2017 22:31:02 +0200")
References: <20171021203102.14520-1-arnout@mind.be>
Message-ID: <871slvb7eo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

Hi,

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Starting with version 7, gcc automatically recognises and enforces the
 > environment variable SOURCE_DATE_EPOCH, and fakes __DATE__ and __TIME__
 > accordingly, to produce reproducible builds (at least in regards to date
 > and time).

 > However, older gcc versions do not offer this feature.

 > So, we use our toolchain wrapper to force-feed __DATE__ and __TIME__ as
 > macros, which will take precedence over those that gcc may compute
 > itself. We compute them according to the specs:
 >     https://reproducible-builds.org/specs/source-date-epoch/
 >     https://gcc.gnu.org/onlinedocs/cpp/Standard-Predefined-Macros.html

 > Since we define macros otherwise internal to gcc, we have to tell it not
 > to warn about that. The -Wno-builtin-macro-redefined flag was introduced
 > in gcc-4.4.0. Therefore, we make BR2_REPRODUCIBLE depend on GCC >= 4.4.

 > gcc-7 will ignore SOURCE_DATE_EPOCH when __DATE__ and __TIME__ are
 > user-defined. Anyway, this is of no consequence: whether __DATE__ and
 > __TIME__ or SOURCE_DATE_EPOCH takes precedence, it would yield the
 > exact same end result since we use the same logic to compute it. Note
 > that we didn't copy the code for it from gcc so using the same logic
 > doesn't imply that we're inheriting GPL-3.0.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: J?r?me Pouiller <jezz@sysmic.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > [Arnout: rewrite commit message]
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
