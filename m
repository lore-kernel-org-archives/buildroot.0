From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:32:43 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix loops relaxation in
 bare sections
In-Reply-To: <20190411205549.7259-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Thu, 11 Apr 2019 13:55:49 -0700")
References: <20190411205549.7259-1-jcmvbkbc@gmail.com>
Message-ID: <87ef5r6t5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > The commit 197b5f9d1c23 ("package/binutils: fix loops relaxation in
 > xtensa gas") changed the way loop opcodes are relaxed resulting in build
 > failures in hand-made assembly code that has loops in sections without
 > .literal_position pseudo op or equivalent construct. This e.g. breaks
 > xtensa linux kernel build.

 > Fix that by adding literal position to the beginning of every section.

 > Fixes: 197b5f9d1c23 ("package/binutils: fix loops relaxation in xtensa
 > gas")
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
