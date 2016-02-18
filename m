From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Feb 2016 15:07:53 +0100
Subject: [Buildroot] [PATCH] binutils: fix .init/.fini literals moving
	in xtensa gas
In-Reply-To: <1455745813-28854-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 18 Feb 2016 00:50:13 +0300")
References: <1455745813-28854-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87bn7ew1qe.fsf@dell.be.48ers.dk>
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
