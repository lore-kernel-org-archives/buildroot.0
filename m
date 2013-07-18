From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 00:32:16 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E812BF.9060808@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 18 Jul 2013 13:07:27 -0300")
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
 <87zjtkwao1.fsf@dell.be.48ers.dk> <51E812BF.9060808@zacarias.com.ar>
Message-ID: <87mwpjwlcf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 07/18/2013 05:10 AM, Peter Korsgaard wrote:
 >> FYI, I just did a test build (arm926/thumb1/internal uclibc), and the
 >> build dies in NPTL when it runs out of registers. Without threads it
 >> builds and seems to work.

 Gustavo> I regularly build -mthumb (via CFLAGS) projects without issues for an
 Gustavo> arm920t, but that doesn't force those flags for uclibc, just catched the
 Gustavo> breakage after you fixed my patch (mine was a no-op, d'oh!)
 Gustavo> Seems uclibc is broken for thumb builds, even with
 Gustavo> COMPILE_IN_THUMB_MODE=y in its config (which the only thing it does is
 Gustavo> add -mthumb to the compile flags).

Actually the uClibc breakage seems to only be in the NPTL stuff. A test
build without threads worked OK.

-- 
Bye, Peter Korsgaard
