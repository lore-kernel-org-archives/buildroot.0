From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Dec 2016 10:22:00 +0100
Subject: [Buildroot] [RFC PATCH] util-linux: fix build with ncurses
In-Reply-To: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
 (Rahul Bedarkar's message of "Thu, 22 Dec 2016 21:57:07 +0530")
References: <1482424027-9369-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <878tr7yp8n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rahul" == Rahul Bedarkar <rahul.bedarkar@imgtec.com> writes:

 > util-linux version 2.29 changed ncurses handling a lot. pkg-config
 > support to detect ncurses is removed from configure.ac and
 > ncurses-config is used to detect it. But it even didn't allow to
 > change config file for cross compilation. However, it is fixed in
 > upstream later and pkg-config support is added back.

 > This commit adds two patches from upstream that adds pkg-config support
 > and allows specifying ncurses-config file as well. However preference is
 > first given to pkg-config and later nucrses-config file. It also first checks
 > for version 6 and later 5.

 > Config option that changed are, ncursesw is enabled by default and ncurses
 > is disabled by default. So we need to explicilty specify with/without wide
 > char support now. This new version also allows disabling widechar support.
 > But it can't be enabled if ncurses without widechar support is enabled.

 > While building ncurses package, we explicitly enable pkg-config support,
 > so we don't need to specify ncurses-config file, but it is specified for
 > completeness.

 > Fixes:
 >   http://autobuild.buildroot.net/results/4a2/4a25fb0d4546391d5dbbaa6cde17c45aeddb3549

 > Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
 > Cc: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks!

-- 
Bye, Peter Korsgaard
