From: Samuel MARTIN <s.martin49@gmail.com>
Date: Wed, 21 Mar 2012 00:09:50 +0100
Subject: [Buildroot] [PATCH 00/11] RFC: Manual content reorganization
Message-ID: <1332285001-12881-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series aims to reorganize the manual content, as well as
complete it... thought there are still lacks here and there after that ;-)

This work intends to make the manual:
- understable and clear for new comers, even if they are not familiar with
embedded development;
- useful for developers, contributors, even people that may want to redistribute
third-party SDK/BSP based on Buildroot
- as the entry point (anyone discovering/needing/using Buildroot should find
its way out straight forward reading the manual)

Although I am well aware that these are ambitious goals and this patch series
does not acheive nor address all these points, at least, it is a starting point.


Let's talk about the new organization.


Overview of the new table of content:
1.  About Buildroot
2.  Starting up
      Think this chapter like a tutorial.
      Includes system requirements, how to get Buildroot and the first steps
      using it.
3.  Working with Buildroot
      Intends to present basics to make Buildroot fitting your needs using
      the available customization knobs.
4.  Troubleshooting
5.  Going further in Buildroot's innards
      Explains some topics like about embedded development, cross-compilation,
      etc, and gives more advanced tips about Buildroot usages.
6.  Developer Guidelines
      Intends to provide all relevant information for anyone wanting to hack in
      Buildroot.
7.  Getting involved
      Provides all the way to keep informed about the Buildroot development.
8.  Contibuting to Buildroot
      Gives tips about patch submission.
9.  Legal notice
      Intends to give legal/license details about Buildroot itself, software
      used/built by Buildroot, how to redistribute SDK based on, etc.
10. Appendix


From this plan, one can easily distinguish two parts.

As I thought this work, chapters 1 to 4 mainly address people starting with
Buildroot, people not necessarily familiar with embedded development,
cross-compilation and others scary big words. They just want to use a reliable
environment which automatically does things for them.

OTOH, chapters 5 to 10 explain how Buildroot works, is organized and so on, to
allow anyone interested in a deeper understanding of the issues of the embedded
systems for which Buildroot is for; for people who want to develop, and perhaps
at the end contribute to Buildroot.


BTW, over the last days, some other topics came out of my mind, but I have
intentionally omitted them, letting their respective authors writing
documentation about them. For example:
- patches policy/howto, for which some great changes are on their way to be
integrated;
- init system, maybe a paragraph about systemd (that is in the queue) and/or a
comparative between the others available init systems could be added:
- package's license explaination;
- ... anything else i missed ;-)


Right now, I'm not happy with everything I did.
For example, now I use a deeper toc (4 title levels in this patch set vs. 3 on
the current git master). This has a side effect on the html manual, indeed the
toc only shows the first two level, this reduce the readability, IOW the fact
that one can quickly find the relevant piece of information he/she is looking
for.

So, IOW, I'd like to know whether I'm on right path, the one the Buildroot
community want to take.


Happy review!
Looking forward to read your comments, suggestions, critics, blames...


Regards,

Sam


Samuel MARTIN (11):
  manual: rework the whole documentation stub
  manual: rework introduction.txt and update embedded-basics.txt
  manual: update prerequisite.txt
  manual: rework using.txt and update common-usage.txt
  manual: update make-tips.txt
  manual: update working-with.txt
  manual: update troubleshooting.txt
  manual: rework the intro of customize-rootfs.txt
  manual: update writing-rules.txt
  manual: update get-involved.txt
  manual: update contribute.txt

 docs/manual/adding-packages-autotargets.txt  |    6 +-
 docs/manual/adding-packages-cmaketargets.txt |    6 +-
 docs/manual/adding-packages-conclusion.txt   |    2 +-
 docs/manual/adding-packages-directory.txt    |   11 ++-
 docs/manual/adding-packages-gentargets.txt   |    6 +-
 docs/manual/adding-packages-gettext.txt      |    2 +-
 docs/manual/adding-packages-handwritten.txt  |    4 +-
 docs/manual/adding-packages.txt              |    3 +-
 docs/manual/advanced.txt                     |   10 +++
 docs/manual/board-support.txt                |    3 +-
 docs/manual/ccache-support.txt               |    3 +-
 docs/manual/common-usage.txt                 |   81 ++++++++++++++++++
 docs/manual/contribute.txt                   |   63 ++++++++++++++
 docs/manual/customize-busybox-config.txt     |    6 +-
 docs/manual/customize-kernel-config.txt      |    3 +-
 docs/manual/customize-rootfs.txt             |    7 +-
 docs/manual/customize-toolchain.txt          |   10 +--
 docs/manual/customize-uclibc-config.txt      |    4 +-
 docs/manual/customize.txt                    |    2 +-
 docs/manual/developer-guide.txt              |    8 ++
 docs/manual/download-location.txt            |    2 +-
 docs/manual/embedded-basics.txt              |   67 +++++++++++++++
 docs/manual/external-toolchain.txt           |    4 +-
 docs/manual/get-involved.txt                 |   67 +++++++++++++++
 docs/manual/getting.txt                      |    4 +-
 docs/manual/going-further.txt                |    8 ++
 docs/manual/how-buildroot-works.txt          |    2 +-
 docs/manual/introduction.txt                 |   74 +++-------------
 docs/manual/legal-notice.txt                 |    4 +
 docs/manual/make-tips.txt                    |   48 +++++++++++
 docs/manual/manual.txt                       |   21 ++---
 docs/manual/prerequisite.txt                 |   69 +++++++++++++++
 docs/manual/rebuilding-packages.txt          |    6 +-
 docs/manual/starting-up.txt                  |    9 ++
 docs/manual/troubleshooting.txt              |   46 ++++++++++
 docs/manual/using-buildroot-toolchain.txt    |    2 +-
 docs/manual/using.txt                        |  105 ++++-------------------
 docs/manual/working-with.txt                 |   22 +++++
 docs/manual/writing-rules.txt                |  119 ++++++++++++++++++++++++++
 39 files changed, 716 insertions(+), 203 deletions(-)
 create mode 100644 docs/manual/advanced.txt
 create mode 100644 docs/manual/common-usage.txt
 create mode 100644 docs/manual/contribute.txt
 create mode 100644 docs/manual/developer-guide.txt
 create mode 100644 docs/manual/embedded-basics.txt
 create mode 100644 docs/manual/get-involved.txt
 create mode 100644 docs/manual/going-further.txt
 create mode 100644 docs/manual/legal-notice.txt
 create mode 100644 docs/manual/make-tips.txt
 create mode 100644 docs/manual/prerequisite.txt
 create mode 100644 docs/manual/starting-up.txt
 create mode 100644 docs/manual/troubleshooting.txt
 create mode 100644 docs/manual/working-with.txt
 create mode 100644 docs/manual/writing-rules.txt

--
1.7.9.4
