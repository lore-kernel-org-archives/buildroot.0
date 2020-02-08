From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 09:02:27 +0100
Subject: [Buildroot] [PATCH 0/3] packages/exim: fix build failures
In-Reply-To: <20200207151427.12475-1-luca@lucaceresoli.net> (Luca Ceresoli's
 message of "Fri, 7 Feb 2020 16:14:24 +0100")
References: <20200207151427.12475-1-luca@lucaceresoli.net>
Message-ID: <87tv41v758.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > exim is failing on the autobuilders since the version bump to 4.93 (commit
 > 6038c3232acfdb: "package/exim: bump version to 4.93.0.3").

 > Commit 2c692e81a844b30b ("package/exim: fix host build") fixed one failure
 > when building the host tools, but we still have a similar ("'for' loop
 > initial declarations are only allowed in C99 mode") one when cross-building
 > target files.

 > In patch 1 I applied a similar fix (add -std=c99), but more failures
 > started appearing later in the build process.

 > I have not completely understood the new failures, yet with a couple of
 > patches it is now building. This is done in patch 2 but I'm not sure it is
 > a correct solution.

 > Finally another failure appeared. It is yet another
 > for-loop-initial-declaration error, but happens later in the install
 > step. This is fixed in patch 3 adding another -std=c99.

 > I cannot work on this issue for the next few days, so here are my patches,
 > as-is, in case anybody wants to have a look before 2020.02.

Thanks, the patches looks sensible to me. Did you submit them upstream?
We normally add a link to that in the patches.

-- 
Bye, Peter Korsgaard
