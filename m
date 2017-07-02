From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 00:06:25 +0200
Subject: [Buildroot] [PATCH 00/20] Do not download auto-generated patches
In-Reply-To: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 2 Jul 2017 18:53:22 +0200")
References: <20170702165342.29522-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87y3s68pem.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Patch https://patchwork.ozlabs.org/patch/782927/ sent by Julien
 > Boibessot made us realize that auto-generated patches such as the ones
 > provided by Github are not guaranteed to be stable over time. Indeed,
 > the "index" line of the patches contains short git hashes, and when
 > new commits are made to the Git repository, additional commits are
 > made, which can have short hashes conflicting with older ones, in
 > which case git increase the length of the "short hashes" to avoid the
 > conflict. This means the patch contents change, therefore its sha256
 > hash changes, and it breaks the download in Buildroot.

 > Since there is no solution to this problem, we simply decided that
 > auto-generated patches should not be downloaded by Buildroot using
 > <pkg>_PATCH, and should instead be stored in the tree.

 > This series:

 >  1. Updates the documentation about the hash file.

 >  2. Changes all packages that download Github.com patches. All
 >     packages that have a non-empty <pkg>_PATCH variable have been
 >     inspected, and only the ones downloading patches from Github are
 >     problematic.

Committed series, thanks.

 >   scrub: don't download patch from Github

Notice: Something (patchwork?) wrapped the very long line in this patch, so I
had to fix it up manually.

-- 
Bye, Peter Korsgaard
