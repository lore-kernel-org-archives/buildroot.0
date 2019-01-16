From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 14:25:38 +0100
Subject: [Buildroot] [PATCH v2 5/7] tpm2-abrmd: fix build with
 BR2_FORTIFY_SOURCE_1
In-Reply-To: <20190115101522.21042-5-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 15 Jan 2019 11:15:20 +0100")
References: <20190115101522.21042-1-peter@korsgaard.com>
 <20190115101522.21042-5-peter@korsgaard.com>
Message-ID: <87a7k0enu5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The configure script passes -U FORTIFY_SOURCE -D FORTIFY_SOURCE=2 by
 > default, which conflicts with BR2_FORTIFY_SOURCE_1 as -Werror is used:

 > <cross>-gcc ..  -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 .. -D_FORTIFY_SOURCE=1
 > <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

 > Disable this so the FORTIFY_SOURCE flags in TARGET_CFLAGS (if any) is used
 > instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
