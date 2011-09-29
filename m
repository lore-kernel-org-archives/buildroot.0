From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Sep 2011 11:58:49 +0200
Subject: [Buildroot] [PATCH 2/2] add libfcgi to buildroot
In-Reply-To: <1317285917-2134-1-git-send-email-bachmann@tofwerk.com>
References: <add libfcgi to buildroot>
 <1317285917-2134-1-git-send-email-bachmann@tofwerk.com>
Message-ID: <20110929115849.73cbefaa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 29 Sep 2011 10:45:17 +0200,
Rico Bachmann <bachmann@tofwerk.com> a ?crit :

> added the patches, still not working
> could be a problem with the filepath in the patch?

I'm sorry to say so, but: please read my e-mails. I said:

"""
Simply add them in package/fcgi/, under a name like
fcgi-2.4.0-some-useful-description.patch.
"""

So link_math_cgifcgi.patch should be fcgi-2.0.4-link_math_cgifcgi.patch
if you want the patch to be applied.

Also, here you have only sent PATCH 2/2, and this patch should be
merged into the previous one to create a single patch that adds the
package and its associated patches. To do so, you can do:

 git rebase -i master

When the editor pops up, on the second line that corresponds to the
second commit, replace "pick" by "fixup", and exit your editor. This
will instruct git to merge your second commit into your first commit.

Also:

 * Your two patches link_math_cgifcgi.patch and link_math_example.patch
   should be just one patch.

 * This patch should have a description and a Signed-off-by line.

 * Patching the Makefiles in an autotools-based package is really
   wrong, it's the Makefile.am that should be patched. I think your
   LDFLAGS = -lm is more a workaround than a correct fix.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
