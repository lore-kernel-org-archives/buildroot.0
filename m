From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Sep 2014 23:47:03 +0200
Subject: [Buildroot] [PATCH] strace: upgrade to 4.9, supports ARC
In-Reply-To: <1409644247-11683-1-git-send-email-vgupta@synopsys.com> (Vineet
 Gupta's message of "Tue, 2 Sep 2014 13:20:47 +0530")
References: <1409644247-11683-1-git-send-email-vgupta@synopsys.com>
Message-ID: <87ha0pk84o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vineet" == Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:

 > Also get rid of the backport patches which are already present upstream.
 > Tested on ARC with LFS

It indeed seems to have problems with !LFS (on ARM atleast):

file.c: In function ?sys_getdents64?:
file.c:2155:6: error: dereferencing pointer to incomplete type
file.c:2156:6: error: dereferencing pointer to incomplete type
file.c:2158:28: error: dereferencing pointer to incomplete type
file.c:2161:6: error: dereferencing pointer to incomplete type
file.c:2161:19: error: dereferencing pointer to incomplete type
file.c:2163:9: error: dereferencing pointer to incomplete type
file.c:2167:9: error: dereferencing pointer to incomplete type

Do you know if this is fixable, or should we just make it depend on
BR2_LARGEFILE?

-- 
Bye, Peter Korsgaard
