From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 8 Oct 2014 10:44:17 +0100
Subject: [Buildroot] [PATCH] package/trinity: New package
In-Reply-To: <874mvffs2a.fsf@dell.be.48ers.dk>
References: <1412594507-48779-1-git-send-email-Vincent.Riera@imgtec.com>
 <874mvffs2a.fsf@dell.be.48ers.dk>
Message-ID: <54350771.9000208@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On 10/07/2014 11:11 PM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>
>   > Adding the Trinity Linux System call fuzz tester.
>   > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> Thanks, but a quick test build with uClibc fails:
>
> make[1]: Entering directory '/home/peko/source/buildroot/output/build/trinity-c02034ec08d951cde3429905e64afe450cbc47db'
>    CC    arg-decoder.o
>    CC    blockdevs.o
>    CC    child.o
>    CC    debug.o
>    CC    devices.o
> debug.c:5:22: fatal error: execinfo.h: No such file or directory
> compilation terminated.
> Makefile:96: recipe for target 'debug.o' failed
> make[1]: *** [debug.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make[1]: Leaving directory '/home/peko/source/buildroot/output/build/trinity-c02034ec08d951cde3429905e64afe450cbc47db'
>
> execinfo.h is only available if uClibc is built with
> UCLIBC_HAS_BACKTRACE=y (which it isn't by default).
>
> Perhaps the backtrace() stuff can get #ifdef'ed out if not available?

It looks like a change to be made upstream. Maybe it needs to include a 
header check in the configure.sh script, then defining a macro if the 
header is present, and then modify the source code to take that macro 
into account to do things like "#ifdef USE_EXECINFO"...

So, what do you propose by now for the Buildroot package? Disabling it 
for uClibc until upstream fixes that?

-- 
Vincent
