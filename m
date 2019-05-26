From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 13:53:49 +0200
Subject: [Buildroot] [PATCH] package/uclibc: fix preadv/pwritev offset
 argument type
In-Reply-To: <20190513184811.20461-1-jcmvbkbc@gmail.com> (Max Filippov's
 message of "Mon, 13 May 2019 11:48:11 -0700")
References: <20190513184811.20461-1-jcmvbkbc@gmail.com>
Message-ID: <87v9xxjusy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > preadv/pwritev don't provide separate version for 64-bit wide off_t,
 > and default to 32-bit wide off_t, which results in a mismatch between
 > declaration and definition for user programs built with
 > -D_FILE_OFFSET_BITS=64.

 > Backported from: 423e49023eeb ("preadv/pwritev: fix offset argument type")
 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
