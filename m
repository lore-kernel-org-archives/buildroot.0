From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 13:27:58 +0200
Subject: [Buildroot] [PATCH 12/23] qt: respect silent mode instead non
	existing verbose mode
In-Reply-To: <20091007130206.1a6f9821@surf> (Thomas Petazzoni's message of
	"Wed\, 7 Oct 2009 13\:02\:06 +0200")
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
	<1254907246-5650-13-git-send-email-mroth@nessie.de>
	<20091007115741.4f5e44df@surf> <200910071230.48080.mroth@nessie.de>
	<20091007130206.1a6f9821@surf>
Message-ID: <87ljjnmojl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Wed, 7 Oct 2009 12:30:43 +0200,
 Thomas> Michael Roth <mroth@nessie.de> a ?crit :

 >> Commit 89464a96015e89da07b87d18b31f4b25b4c890ba introduced QUIET.

 Thomas> Hum correct. My tree was in branch not rebased against the very latest
 Thomas> Buildroot git.

FYI, that commit just reintroduced it, as it got lost in the
reorganization. We've had it for ~1 year before that (43af3d3578(.

 >> But you're right. I overlooked VERBOSE. Maybe this should be split
 >> into two ifs?

 Thomas> I think we should make a formal decision on the respective semantic of
 Thomas> VERBOSE and QUIET, because the difference between these two variables
 Thomas> is not clear to me.

Yes, it's a bit of a mess. Is there anything using VERBOSE yet? The
complains with BR has historically been that it has been TOO verbose,
not too less.

Maybe this would be a good subject for the dev day?

-- 
Bye, Peter Korsgaard
