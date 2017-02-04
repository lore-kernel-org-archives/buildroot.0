From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 09:39:18 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-generic: include symbolic links to
	files in packages-file-list.txt
In-Reply-To: <20170203212752.4016-1-patrickdepinguin@gmail.com> (Thomas De
 Schampheleire's message of "Fri, 3 Feb 2017 22:27:52 +0100")
References: <20170203212752.4016-1-patrickdepinguin@gmail.com>
Message-ID: <87o9yiz6x5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Using the package instrumentation hooks, a file packages-file-list.txt is
 > created containing the list of files installed by a package with their size.

 > Due to the use of 'find -type f', symbolic links to files are not included
 > in this file list. Since the original purpose of this file was to calculate
 > the total size of a package and symbolic links have file size 0, this was
 > not a problem.

 > However, if packages-file-list.txt is reused for other purposes, for example
 > to get a complete list of files installed by a package regardless of size,
 > symbolic links are important.
 > Using 'find -xtype f' instead solves the problem.

So what about directories and symlinks to directories?

-- 
Bye, Peter Korsgaard
