From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 22:02:01 +0200
Subject: [Buildroot] [PATCH 1/2] python: add patch to fix logic to get
	gcc paths
In-Reply-To: <1432932744-27818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 29 May 2015 22:52:23 +0200")
References: <1432932744-27818-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zj4kv7ly.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The Python setup.py has a function called add_gcc_paths(), which
 > executes gcc -E -v to get the list of header paths searched by
 > gcc. However, the logic of setup.py is only valid with the normal
 > english output of gcc: it doesn't work if a non-english locale is
 > set. This causes setup.py to not find certain headers (such as zlib.h)
 > and therefore disabling the build of such extensions.

 > Reported-by: Bruno Coudoin <bruno.coudoin@gcompris.net>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
