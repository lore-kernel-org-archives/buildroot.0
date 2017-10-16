From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:54:34 +0200
Subject: [Buildroot] [PATCH] package/gcc: fix ICE on xtensa,
	PR target/82181
In-Reply-To: <1505187463-14375-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Mon, 11 Sep 2017 20:37:43 -0700")
References: <1505187463-14375-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87infesqqt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > Memory references to DI mode objects could incorrectly be created at
 > offsets that are not supported by instructions l32i/s32i, resulting in
 > ICE at a stage when access to the object is split into access to its
 > subwords:
 >   drivers/staging/rtl8188eu/core/rtw_ap.c:445:1:
 >      internal compiler error: in change_address_1, at emit-rtl.c:2126

 > Fixes: https://lkml.org/lkml/2017/9/10/151
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
