From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 23:09:02 +0100
Subject: [Buildroot] [PATCH v1 1/1] coreutils: allow selection of
	installed programs
In-Reply-To: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
 (Romain Izard's message of "Wed, 3 Feb 2016 12:14:48 +0100")
References: <1454498088-20233-1-git-send-email-romain.izard.pro@gmail.com>
Message-ID: <877fhxaf7l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Izard <romain.izard.pro@gmail.com> writes:

 > As the recent revisions of coreutils use a single multi-call executable,
 > it is not possible to reduce the installed size of coreutils by removing
 > the unused programs. But the list of installed programs can be passed
 > when configuring the package, and it is possible ensure that only
 > required programs are embedded into the multi-call executable.

 > A global configuration option selects either the default set of
 > programs, or a configurable set. In the latter case, each coreutil
 > program has its own option.

 > Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>

Are you really using a setup where this detailed tweaking of coreutils
is needed?

Coreutils isn't super huge:

ls -lh target/usr/bin/coreutils
-rwxr-xr-x 1 peko peko 933K Feb 21 23:01 target/usr/bin/coreutils

And if you are using coreutils instead of busybox you are probably not
very interested in saving every last byte of rootfs size anyway, so I'm
not sure we should have 500+ lines of Config.in for this.

-- 
Bye, Peter Korsgaard
