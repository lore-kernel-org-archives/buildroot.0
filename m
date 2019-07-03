From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2019 00:18:46 +0200
Subject: [Buildroot] [git commit] utils/check-package: Add a quiet flag
In-Reply-To: <20190703213520.D843B815A2@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 3 Jul 2019 23:34:58 +0200")
References: <20190703213520.D843B815A2@busybox.osuosl.org>
Message-ID: <87wogy2249.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=44af8386f83ed042591fa089dbf01e373c8424ad
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > When running in a CI system, stat messages become white noise. Introduce
 > an option to suppress non-error, non-warning, messages.

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  utils/check-package | 7 +++++--
 >  1 file changed, 5 insertions(+), 2 deletions(-)

 > diff --git a/utils/check-package b/utils/check-package
 > index ce1fe98d67..f09aaeea03 100755
 > --- a/utils/check-package
 > +++ b/utils/check-package
 > @@ -33,6 +33,7 @@ def parse_args():
 >                          default="http://nightly.buildroot.org/",
 >                          help="default: %(default)s")
 >      parser.add_argument("--verbose", "-v", action="count", default=0)
 > +    parser.add_argument("--quiet", "-q", action="count", default=0)

As we don't have multiple level of quietness, action="store_true" would
probably have made mode sense:

https://docs.python.org/3/library/argparse.html#action

-- 
Bye, Peter Korsgaard
