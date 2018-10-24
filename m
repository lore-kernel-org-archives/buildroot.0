From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 13:46:40 +0200
Subject: [Buildroot] [PATCH] ustr: remove source code from target
In-Reply-To: <20181011201135.25219-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 11 Oct 2018 22:11:35 +0200")
References: <20181011201135.25219-1-thomas.petazzoni@bootlin.com>
Message-ID: <87r2gfbm8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > For some reason, ustr installs its own source code, which means we end
 > up with 448 KB of source code in /usr/share in the target filesystem:

 > $ tree output/target/usr/share/
 > output/target/usr/share/
 > ??? ustr-1.0.4
 >     ??? malloc-check.h
 >     ??? ustr-b-code.h
 >     ??? ustr-b-dbg-code.c
 >     ??? ustr-b-opt-code.c
 >     ??? ustr-cmp-code.h
 >     ??? ustr-cmp-dbg-code.c
 >     ??? ustr-cmp-internal.h
 >     ??? ustr-cmp-opt-code.c
 >     ??? ustr-cntl-code.h
 >     ??? ustr-fmt-code.h
 >     ??? ustr-fmt-dbg-code.c
 >     ??? ustr-fmt-internal.h
 >     [...]

 > $ du -sh output/target/usr/share/ustr-1.0.4/
 > 448K	output/target/usr/share/ustr-1.0.4/

 > So let's drop this source code in a post-install target hook.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
