From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Apr 2019 08:37:32 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix loops relaxation in
 xtensa gas
In-Reply-To: <20190403022019.31752-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Tue, 2 Apr 2019 19:20:19 -0700")
References: <20190403022019.31752-1-jcmvbkbc@gmail.com>
Message-ID: <87r2ajfvbn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Loop relaxation logic in xtensa gas may produce code in which LEND
 > register doesn't match actual zero overhead loop end. Fix relaxation
 > code so that it produces a literal or a pair of const16 instructions
 > with associated relocation record that works correctly in the presence
 > of other relaxations. This fixes crash in X11 server caused by window
 > movement.

 > Loop relaxation has limited of 32K range, this fix removes this
 > limitation.

 > Fixes:
 > http://autobuild.buildroot.net/results/e05522ce540f4ac23f9a3a8fec724694d9a23101/

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
