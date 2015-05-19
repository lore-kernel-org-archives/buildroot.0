From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:36:49 +0200
Subject: [Buildroot] [PATCH 0/2] xtensa fixes for jasper
In-Reply-To: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Tue, 19 May 2015 21:28:58 +0300")
References: <1432060140-13611-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87617o5pgu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Hi,
 > There are two patches: one makes jasper configure script preserve CFLAGS
 > when --enable-debug is specified.

 > I was hoping that that'd be enough for jasper to build on xtensa, but
 > unfortunately no: a bunch of one kind of literal-out-of-range errors is gone
 > but a smaller bunch of other kind of the same error appeared. Xtensa gcc
 > does nothing to place literals closer to their corresponding literal load
 > instructions in functions with huge code size generated with -O0.

 > So the second patch disables debug for jasper when building for xtensa.

 > Max Filippov (2):
 >   jasper: Don't overwrite CFLAGS when configured with --enable-debug
 >   jasper: Disable debugging when building for xtensa

Committed both, thanks.

-- 
Bye, Peter Korsgaard
