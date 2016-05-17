From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 13:23:09 +0200
Subject: [Buildroot] [PATCH] assimp: disable on Microblaze
In-Reply-To: <1463436199-15509-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 17 May 2016 00:03:19 +0200")
References: <1463436199-15509-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8760udc4iq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This package triggers an infinite loop bug in gcc on the Microblaze
 > architecture when the optimization level is O1, O2 or O3. This bug has
 > been reported at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124.

 > While Buildroot by default uses an Os optimization level, assimp's build
 > system overrides that by O3 by default.

 > This problem is causing timeouts in the autobuilders that make them
 > consume 100% of CPU during 8 hours (the timeout used by the autobuilder
 > scripts).

It would be good if some CMake person could figure out how to drop this
hardcoded -O3 so it uses our CFLAGS - But until then:

Committed, thanks.

-- 
Bye, Peter Korsgaard
