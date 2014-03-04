From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Mar 2014 07:35:39 +0100
Subject: [Buildroot] [git commit] packages infra: add function to get a
	Kconfig option
In-Reply-To: <20140303212320.ED3369BCBE@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Mon, 3 Mar 2014 22:21:56 +0100")
References: <20140303212320.ED3369BCBE@busybox.osuosl.org>
Message-ID: <87r46i79ok.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > commit: http://git.buildroot.net/buildroot/commit/?id=c28a28eed1943c1efb958448a87a2e8f0baf48d6
 > branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > We so far have no mean to get the value from a Kconfig option from the
 > .config file of a package (eg. linux, busybox...).

 > Add a new function that returns the unmangled value of an option.
 > It expect two arguments:
 >   - the Kconfig option name (complete, with leading CONFIG if necessary)
 >   - the .config file to get it from

 > Note that, if the Kconfig option is a string, the returned value will
 > contain the leading and trailing double-quotes.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/pkg-utils.mk |    2 ++
 >  1 files changed, 2 insertions(+), 0 deletions(-)

 > diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
 > index 91a1981..99fefe6 100644
 > --- a/package/pkg-utils.mk
 > +++ b/package/pkg-utils.mk
 > @@ -52,6 +52,8 @@ define KCONFIG_DISABLE_OPT
 >  	echo "# $(1) is not set" >> $(2)
 >  endef
 
 > +KCONFIG_GET_OPT = $(shell sed -e 's/^$(1)=//p' $(2))

I believe this should be 'sed -n'

-- 
Bye, Peter Korsgaard
