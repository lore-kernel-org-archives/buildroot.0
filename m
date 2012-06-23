From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 23:32:34 +0200
Subject: [Buildroot] [PATCH resend3] source-check: change behavior to
	check only selected packages / add source-check-all
In-Reply-To: <fef39461f25270f81f06.1340343522@beantl019720> (Thomas De
 Schampheleire's message of "Fri, 22 Jun 2012 07:38:42 +0200")
References: <fef39461f25270f81f06.1340343522@beantl019720>
Message-ID: <878vfdbtot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The original 'source-check' target first selects all packages,
 Thomas> and then checks whether the package tarballs can be found. This
 Thomas> is useful for Buildroot maintainers, but less useful for
 Thomas> developers working on a specific project. The latter only care
 Thomas> about the packages used in that project.

 Thomas> This patch removes the allyesconfig dependency to source-check
 Thomas> so that only selected packages are checked. The original
 Thomas> behavior is moved to a new target 'source-check-all'.

Committed, thanks - But as we don't have the 'select-all-packages'
functionality for 'make source' which is the parallel of 'make
source-check', I decided to just get rid of source-check-all
completely.

People can always do make allyesconfig; make source-check if they want
the old behaviour.

-- 
Bye, Peter Korsgaard
