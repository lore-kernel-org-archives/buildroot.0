From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Mar 2021 23:12:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/openblas: fix build failure due
 to forced FFLAGS
In-Reply-To: <20210305134839.30612-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 5 Mar 2021 14:48:36 +0100")
References: <20210305134839.30612-1-patrickdepinguin@gmail.com>
Message-ID: <875z1qzr15.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Buildroot specifies a value for FFLAGS on the make command-line.
 > While the openblas makefiles allowed this principle for the most part by
 > using 'override FFLAGS += ....', the make.inc file generated for the shipped
 > 'lapack' sources just used a 'FFLAGS = ...' statement, whose value is then
 > eclipsed by the command-line FFLAGS.

 > This meant that -fPIC may be passed to the link step but not to all relevant
 > source files, causing relocation failures.

 > Fixes: http://autobuild.buildroot.net/results/d530db0f37e1e0462e3af1e1787e15f94ff21884/
 > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
