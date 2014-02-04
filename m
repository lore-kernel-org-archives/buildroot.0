From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 18:10:26 +0100
Subject: [Buildroot] [PATCH] Strip *.so* and not only executable files
In-Reply-To: <1391528178-2115-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 16:36:18 +0100")
References: <1391528178-2115-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k3da4xdp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Our current stripping strategy requires that shared libraries have the
 > executable permission. However, this is by far not something
 > recognized as a standard behavior: Debian/Ubuntu distributions for
 > example do not have executable permissions on their
 > libraries. Therefore, pushing to upstream packages fixes that add the
 > executable permissions is not easy.

 > As a result, this commit improves the stripping logic so that it not
 > only strips the files that are executable, but also the ones that
 > match '*.so*', which should match both the shared libraries and the
 > dlopen()'able plugins, as long as they have a .so extension.

 > Thanks to this addition, a number of manual "chmod +x" done by various
 > packages can be removed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
