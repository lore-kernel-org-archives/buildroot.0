From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2015 11:28:21 +0100
Subject: [Buildroot] [PATCH 1/2] ruby: do not overwrite RUBY_CONF_ENV
In-Reply-To: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 9 Nov 2015 21:25:10 +0100")
References: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d1viqhbu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > In commit 53bf889cdca77979814bc6b74170e2f104fc3b70 ("ruby: should not
 > use dl_iterate_phdr() on Blackfin") we added
 > ac_cv_func_dl_iterate_phdr=no to RUBY_CONF_ENV when building on the
 > Blackfin architecture.

 > However, while doing so, we overwrote the previous value of
 > RUBY_CONF_ENV, which was defined to have custom CFLAGS:

 > RUBY_CONF_ENV = CFLAGS="$(RUBY_CFLAGS)"

 > This has no visible effect because the custom CFLAGS are only used on
 > SuperH/SuperH 64, while the overwrite of RUBY_CONF_ENV takes place on
 > Blackfin.

 > However, it doesn't look very pretty, and future additions to
 > RUBY_CONF_ENV may break this subtle behavior.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
