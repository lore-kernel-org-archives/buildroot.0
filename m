From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Jul 2016 21:21:42 +0200
Subject: [Buildroot] [PATCH v3] asciidoc: use absolute path for resources
In-Reply-To: <1469642568-26660-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Wed, 27 Jul 2016 13:02:48 -0500")
References: <1469642568-26660-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <877fc6yji1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
 > One of the "features" of a2x is that the '-r|--resource' flag imports
 > resources relative to the [SOURCE_FILE], not the CWD. The current
 > implementation tries to import resources from the destination dir $(@D),
 > which works fine for out-of-tree builds because $(@D) is an absolute
 > path, however in-tree builds treat $(@D) as a relative path, which breaks
 > because a2x treats $(@D) relative to SOURCE_FILE.

 > Use the make command $(abspath names...) to convert the dest dir to an
 > absolute path before passing it as a resource.

 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
 > Signed-off-by: Atul Singh Mandla <atul.singh.mandla@rockwellcollins.com>
 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

Like Yann, I also cannot reproduce any errors without it. How do you
trigger it?

-- 
Bye, Peter Korsgaard
