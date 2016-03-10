From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Mar 2016 15:36:26 +0100
Subject: [Buildroot] [PATCH] binutils: backport xtensa .init/.fini
	literals moving fix to 2.26
In-Reply-To: <1457584364-20968-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 10 Mar 2016 07:32:44 +0300")
References: <1457584364-20968-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <878u1qo0wl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Despite the documentation and the comment in xtensa_move_literals, in
 > the presence of --text-section-literals and --auto-litpools literals are
 > moved from the separate literal sections into .init and .fini, because
 > the check in the xtensa_move_literals is incorrect.

 > This fixes build errors seen with projects that have .init/.fini and use
 > text-section-literals.

 > Backported from: 4111950f363221c4641dc2f33bea61cc94f34906
 > Reported-by: Waldemar Brodkorb <mail@waldemar-brodkorb.de>
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
