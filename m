From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 May 2020 11:29:10 +0200
Subject: [Buildroot] Merge window
In-Reply-To: <C2X3WUENL8J0.LDI01N83RW9L@luthien> (Joachim Nilsson's message of
 "Fri, 22 May 2020 10:14:38 +0200")
References: <C2X3WUENL8J0.LDI01N83RW9L@luthien>
Message-ID: <87eercl3mh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joachim" == Joachim Nilsson <troglobit@gmail.com> writes:

 > Hi,
 > I'm new to the Buildroot community and am curious to learn more about
 > the development process, in particular if there is any merge window to
 > consider when submitting patches?  I've combed through the (fantastic)
 > documentation, but not found any mention of this.  Seeing as there are
 > a few brave souls who seem to do much of the legwork in this project,
 > I worry about the timing of patches and questions as to not wear down
 > or disturb at the wrong time.

We indeed don't really have it written down anywhere, but the process
is:

Releases every 3 months (.02, .05, .08, .11), with montly bugfix
releases (2020.02.1, 2020.02.2, ..). Normal releases are supported until
the first bugfix release of the next release (E.G. 2020.05.x is EOL when
2020.08.1 is released), and the first release of each year
(E.G. 2020.02) is a long term release which is supported until the first
bugfix release of the next LTS (E.G. 2021.02.1).

Development happens on the master git branch. Within each 3 month
development cycle we have ~2 months of development, followed by
RC1. After that point no new features are added to master, only
bugfixes. To handle new features / version bumps during the
stabilization phase we create a next branch where these are added. Once
the release has been made, next is merged into master and the new
development continues on master.

It would be good to add something like this to the manual. Would you be
interested in working on that?

 > I recently submitted my first patch to add support for the EspressoBin
 > which has not yet gotten any response.  So I'm thinking my timing was
 > bad, considering you seem to be preparing a new release, or maybe I
 > missed Cc:ing someone.  Should I resend the patch at a better time?

As explained above, new features can be added at any time (master or
next depending on where we are in the cycle). Patches are tracked in
patchwork:

https://patchwork.ozlabs.org/project/buildroot/list/

The reason why your patch has not gotten any feedback is simply that we
get a lot of patches. The backlog is currently at 470 patches.

-- 
Bye, Peter Korsgaard
