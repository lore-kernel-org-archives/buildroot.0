From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 21:45:38 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: protect against zip-slip
 vulnerability in zip/tar handling
In-Reply-To: <20190212203343.GQ3079@scaer> (Yann E. MORIN's message of "Tue,
 12 Feb 2019 21:33:43 +0100")
References: <20190211222202.10786-1-peter@korsgaard.com>
 <20190212203343.GQ3079@scaer>
Message-ID: <87r2ccspl9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > As I said on IRC: I would really prefer if we could reject archive that
 > do have paths merely containiug /../ components, because those are
 > already fishy, even if they still point in-tree, e.g. foo/../bar is
 > still technically OK, but why the heck would it be constructed that way
 > to begin with? Normal archivers do not do that.

Agreed, but that code seems somewhat more complicated to me, and I
wanted the simplest possible solution.


 > But making the path canonical with relpath() is already better than the
 > current situation, so:

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > Yet, a little tiny comment, below:

 >> +        if evil:
 >> +            print('ERROR: Refusing to extract {} with suspicious members {}'.format(
 >> +                self.filename, evil))

 > I would have sent that to stderr: print(..., file=sys.stderr)

Correct, but scanpypi sems (almost all) error messages to stdout, so I
kept it like this for consistency.

-- 
Bye, Peter Korsgaard
