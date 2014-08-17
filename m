From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual/getting started: rework 'Community
	resources' section
Message-ID: <20140817191115.F3B369D427@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=713134fc9297a5e6331a950e21c3196e0227737a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch reworks the section 'Community resources' as follows:
- use a labeled list instead of subsections, as the content of each section
  is so small that it does not deserve a real section.
  Related to this, the anchors for each of these subsections are removed, as
  referencing such anchors that do not correspond to a section boundary are
  not displayed nicely.
- move the part about applying patches from patchwork to the Contributing
  section in the Developer Guide
- reword some parts of the text
- add link texts to some links, instead of showing the URL directly, to make
  the HTML / PDF display nicer.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt   |   35 +++++++++--
 docs/manual/get-involved.txt |  132 ++++++++++++++++--------------------------
 2 files changed, 79 insertions(+), 88 deletions(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index c8e819d..dd6fc8b 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -14,7 +14,7 @@ If you are interested in contributing to Buildroot, the first thing you
 should do is to subscribe to the Buildroot mailing list. This list is
 the main way of interacting with other Buildroot developers and to send
 contributions to. If you aren't subscribed yet, then refer to
-xref:mailing-list-subscribe[].
+xref:community-resources[] for the subscription link.
 
 If you are going to touch the code, it is highly recommended to use a
 git repository of Buildroot, rather than starting from an extracted
@@ -142,6 +142,29 @@ Buildroot's Patchwork website can be used to pull in patches for testing
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
+[[apply-patches-patchwork]]
+==== Applying Patches from Patchwork
+
+The main use of Buildroot's Patchwork website for a developer is for
+pulling in patches into their local git repository for testing
+purposes.
+
+When browsing patches in the patchwork management interface, an +mbox+
+link is provided at the top of the page. Copy this link address and
+run the following commands:
+
+---------------------
+$ git checkout -b <test-branch-name>
+$ wget -O - <mbox-url> | git am
+---------------------
+
+Another option for applying patches is to create a bundle. A bundle is
+a set of patches that you can group together using the patchwork
+interface. Once the bundle is created and the bundle is made public,
+you can copy the +mbox+ link for the bundle and apply the bundle
+using the above commands.
+
+
 === Work on items from the TODO list
 
 If you want to contribute to Buildroot but don't know where to start,
@@ -278,13 +301,13 @@ $ git format-patch --subject-prefix "PATCH v4" \
 [[reporting-bugs]]
 === Reporting issues/bugs or getting help
 
-Before reporting any issue, please check
-xref:mailing-list-subscribe[the mailing list archive] in case someone has
-already reported and fixed a similar problem.
+Before reporting any issue, please check in
+xref:community-resources[the mailing list archive] whether someone has
+already reported and/or fixed a similar problem.
 
 However you choose to report bugs or get help, either by
-xref:bugtracker[opening a bug] or by
-xref:mailing-list-subscribe[sending a mail to the mailing list], there are
+opening a bug in the xref:community-resources[bug tracker] or by
+xref:community-resources[sending a mail to the mailing list], there are
 a number of details to provide in order to help people reproduce and
 find a solution to the issue.
 
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 622597d..b11053e 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -1,54 +1,59 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
+[[community-resources]]
 == Community resources
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
 
-One piece of it is the document you are currently reading ;-).
-
 Each of those ways may interest you if you are looking for some help,
 want to understand Buildroot or contribute to the project.
 
-=== Mailing List
-
-Buildroot has a mailing list
-http://lists.busybox.net/pipermail/buildroot[] for discussion and
-development.
-
-[[mailing-list-subscribe]]
-
-==== Subscribing to the mailing list
-
-You can subscribe by visiting
-http://lists.busybox.net/mailman/listinfo/buildroot[].
+Mailing List::
++
+Buildroot has a mailing list for discussion and development. It is the
+main method of interaction for Buildroot users and developers.
++
 Only subscribers to the Buildroot mailing list are allowed to post to
-this list.
-
-The list is also available through _Gmane_ http://gmane.org[], at
-+gmane.comp.lib.uclibc.buildroot+
-http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[].
-
-==== Searching the List Archives
-
-Please search the mailing list archives before asking questions on the
-mailing list, since there is a good chance someone else has asked the
-same question before. Checking the archives is a great way to avoid
-annoying everyone on the list with frequently asked questions...
-
-=== IRC
-
-The Buildroot IRC is irc://freenode.net/#buildroot[].
-The channel +#buildroot+ is hosted on Freenode
-http://webchat.freenode.net[].
-
+this list. You can subscribe via the
+http://lists.busybox.net/mailman/listinfo/buildroot[mailing list info
+page].
++
+Mails that are sent to the mailing list are also available in the
+http://lists.busybox.net/pipermail/buildroot[mailing list archives] and
+via http://gmane.org[Gmane], at
+http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[+gmane.comp.lib.uclibc.buildroot+].
+Please search the mailing list archives before asking questions, since
+there is a good chance someone else has asked the same question before.
+
+IRC::
++
+The Buildroot IRC channel irc://freenode.net/#buildroot[#buildroot] is
+hosted on http://webchat.freenode.net[Freenode]. It is a useful place to
+ask quick questions or discuss on certain topics.
++
 When asking for help on IRC, share relevant logs or pieces of code
-using a code sharing website.
-
-[[patchwork]]
-=== Patchwork
-
+using a code sharing website, such as http://code.bulix.org.
++
+Note that for certain questions, posting to the mailing list may be
+better as it will reach more people, both developers and users.
+
+Bug tracker::
++
+Bugs in Buildroot can be reported via the mailing list or alternatively
+via the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot
+bugtracker]. Please refer to xref:reporting-bugs[] before creating a bug
+report.
+
+Wiki::
++
+http://elinux.org/Buildroot[The Buildroot wiki page] is hosted on
+the http://elinux.org[eLinux] wiki. It contains some useful links, an
+overview of past and upcoming events, and a TODO list.
+
+Patchwork::
++
 Patchwork is a web-based patch tracking system designed to facilitate
 the contribution and management of contributions to an open-source
 project. Patches that have been sent to a mailing list are \'caught' by
@@ -56,50 +61,13 @@ the system, and appear on a web page. Any comments posted that
 reference the patch are appended to the patch page too. For more
 information on Patchwork see
 http://jk.ozlabs.org/projects/patchwork[].
-
++
 Buildroot's Patchwork website is mainly for use by Buildroot's
-maintainer to ensure patches aren't missed. The website however,
-exposes patches and their corresponding review comments in a clean
-and concise web interface.
-
+maintainer to ensure patches aren't missed. It is also used by Buildroot
+patch reviewers (see also xref:apply-patches-patchwork[]).
+However, since the website exposes patches and their corresponding
+review comments in a clean and concise web interface, it can be useful
+for all Buildroot developers.
++
 The Buildroot patch management interface is available at
 http://patchwork.buildroot.org[].
-
-[[apply-patches-patchwork]]
-==== Applying Patches from Patchwork
-
-The main use of Buildroot's Patchwork website for a developer is for
-pulling in patches into their local git repository for testing
-purposes.
-
-When browsing patches in the patchwork management interface, an +mbox+
-link is provided at the top of the page. Copy this link address and
-run the following commands:
-
----------------------
-$ git checkout -b <test-branch-name>
-$ wget -O - <mbox-url> | git am
----------------------
-
-Another option for applying patches is to create a bundle. A bundle is
-a set of patches that you can group together using the patchwork
-interface. Once the bundle is created and the bundle is made public,
-you can copy the +mbox+ link for the bundle and apply the bundle
-using the above commands.
-
-[[bugtracker]]
-=== Bugtracker
-
-The Buildroot bugtracker is at https://bugs.busybox.net[].
-
-To open a bug, see xref:reporting-bugs[].
-
-=== Buildroot wikipage
-
-After the Buildroot developer day on February 3, 2012,
-a page dedicated to Buildroot has been created on
-http://elinux.org[elinux.org].
-
-This page is reachable at http://elinux.org/Buildroot[].
-
-Currently, this page is mainly used as a _todo-list_.
