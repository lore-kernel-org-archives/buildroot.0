From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 18:32:41 +0200
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper: let recent GCC
 handle SOURCE_DATE_EPOCH
In-Reply-To: <20200626154927.3185266-1-john@metanate.com> (John Keeping's
 message of "Fri, 26 Jun 2020 16:49:27 +0100")
References: <20200626154927.3185266-1-john@metanate.com>
Message-ID: <87o8ofs9na.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > When using precompiled headers, changing any macros defined on the
 > command line will invalidate the precompiled header.  With
 > toolchain-wrapper adding __DATE__ and __TIME__, any commits to Buildroot
 > will invalidate incremental builds regardless of whether the precompiled
 > header actually uses those values (affecting _OVERRIDE_SRCDIR).

 > GCC-7 and later support SOURCE_DATE_EPOCH and use it to define __DATE__
 > and __TIME__ internally, avoiding any impact on precompiled headers.

 > Disable the custom handling in toolchain-wrapper if GCC is version 7 or
 > newer.

 > Signed-off-by: John Keeping <john@metanate.com>

Seems pretty safe to add, so:

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
