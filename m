From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 07:21:28 +0100
Subject: [Buildroot] [PATCH] qt5base: support OVERRIDE_SRCDIR
In-Reply-To: <5654EC26.8070401@mind.be> (Arnout Vandecappelle's message of
 "Wed, 25 Nov 2015 00:00:54 +0100")
References: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
 <20151124224053.GC3904@free.fr> <5654EC26.8070401@mind.be>
Message-ID: <87mvu2zjiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 24-11-15 23:40, Yann E. MORIN wrote:
 >> Peter, All,
 >> 
 >> On 2015-11-24 22:21 +0100, Peter Korsgaard spake thusly:
 >>> With OVERRIDE_SRCDIR we don't apply any of the qt5base patches, but the
 >>> custom specs files are needed to be able to build - So install these in the
 >>> configure step instead of having them as a patch.
 >> 
 >> IMHO, it make more sense to install them at post-patch (or post-extract)
 >> rather than at the beginning of the configure step.

 >  But that wouldn't solve the issue, that it is not applied for OVERRIDE_SRCDIR.
 > With OVERRIDE_SRCDIR, no extract or patch step is done, instead the rsync step
 > is done.

 >  We could add it in a POST_PATCH _and_ a POST_RSYNC hook, however.

But would it have any real advantage over just doing it in the configure
step? It would be more code, and this is arguable about configuring
qt5base, and we already do so for the QT5BASE_CONFIGURE_CONFIG_FILE
stuff.

-- 
Venlig hilsen,
Peter Korsgaard 
