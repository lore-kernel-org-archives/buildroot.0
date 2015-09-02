From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed,  2 Sep 2015 13:54:34 +1000
Subject: [Buildroot] [PATCH v2 0/4] Handle generated kconfig defconfigs
Message-ID: <cover.1441166076.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


See the first patch in this set for a description of the issue.


Changes v1 -> v2:
This version incorporates various improvements suggested by Arnout
Vandecappelle <arnout@mind.be>.

* The initial fix is now separated from it's first use.

* Some make error messages are now reported via $(error ...) which is simpler
  and provides better (IMHO) feedback than echo and exit and there are a few
  other minor makefile tweaks.

* Two other places (in boot/) now make use of the new method.

Please note that the changes to the boot targets are not tested (I included
them because Arnout indicated that they needed this fix), although they look
simple enough. I had a quick look at testing them but couldn't work out how to
do it. I'll test them if someone can give me instructions (including which
defconfigs are missing config files and which versions of the packages they
occur in if they differ from the default buildroot versions) or they could be
dropped.


Sam Bobroff (4):
  Handle kconfig generated defconfigs
  package/linux: Handle generated defconfigs
  boot/at91bootstrap3: Handled generated defconfigs
  boot/barebox: Handle generated defconfigs

 boot/at91bootstrap3/at91bootstrap3.mk |  9 ++++-----
 boot/barebox/barebox.mk               | 10 ++++------
 linux/linux.mk                        | 10 ++++------
 package/pkg-kconfig.mk                | 26 ++++++++++++++++++++------
 4 files changed, 32 insertions(+), 23 deletions(-)

-- 
2.1.4
