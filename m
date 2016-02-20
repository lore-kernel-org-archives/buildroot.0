From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Feb 2016 23:26:42 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/libsoil: fix build using old
	versions of patch
In-Reply-To: <20160125233511.57daa120@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 25 Jan 2016 23:35:11 +0100")
References: <1453641593-31129-1-git-send-email-ricardo.martincoski@gmail.com>
 <1453641593-31129-2-git-send-email-ricardo.martincoski@gmail.com>
 <20160125233511.57daa120@free-electrons.com>
Message-ID: <87vb5jc925.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Ricardo Martincoski,
 > On Sun, 24 Jan 2016 11:19:52 -0200, Ricardo Martincoski wrote:
 >> Well-formed patch fails to apply
 >> - patch v2.6:
 >> Hunk #1 FAILED at 1.
 >> Hunk #2 FAILED at 23.
 >> - patch v2.6.1:
 >> can't find file to patch at input line 11
 >> Perhaps you used the wrong -p or --strip option?
 >> [snip]
 >> No file to patch.  Skipping patch.
 >> 2 out of 2 hunks ignored
 >> Patch failed!  Please fix 0001-fix-makefile.patch!
 >> 
 >> Old versions of the tool "patch" cannot handle spaces in filenames.
 >> The same does not occur using "patch" v2.7 or any later.
 >> 
 >> Workaround: when a file with space in the name needs to be patched,
 >> one or two hooks must be used.
 >> A pre-patch or post-extract hook renames the file to replace spaces
 >> with underscores.
 >> The patch file must be generated using diff between two source-trees
 >> that have the file renamed with spaces replaced by underscores.
 >> A post-patch hook could rename the file to its original name if needed.
 >> 
 >> Fixes:
 >> http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
 >> http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/
 >> 
 >> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 >> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > Applied, thanks.

I think we should add a comment in the .mk to explain why we're doing
this odd rename. I'll do so now.

-- 
Bye, Peter Korsgaard
