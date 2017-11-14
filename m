From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 14:04:34 +0100
Subject: [Buildroot] [PATCH] package/glibc: switch to downloading a
 tarball
In-Reply-To: <20171113213017.19371-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Mon, 13 Nov 2017 22:30:17 +0100")
References: <20171113213017.19371-1-yann.morin.1998@free.fr>
Message-ID: <8760ad2eql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, we do a full git clone of the repository, which takes quite
 > some time, especially on slow networks.

 > This was done like that because the initial patch was using the official
 > repository as the source of the download, and that repository did not
 > offer remotely-generated tarballs.

 > But now we've switched to using a mirror on github, which does provide
 > such a tarball, which provides faster downloads.

 > Use that.

 > However, the tarball from github differs from the one we were generating
 > locally, because the paths inside are different. WE used to create a
 > archive with paths starting with glibc-glibc-2.26-73-g4b692dfb95[...],
 > while github does away with the git-describe prefix, and generates paths
 > that start with just glibc-4b692dffb95[...]. The content are exactly
 > identicall (checked with a diff), though.

 > Update the hash accordingly.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
