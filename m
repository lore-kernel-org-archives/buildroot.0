From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Wed, 3 Sep 2014 13:39:18 +0000
Subject: [Buildroot] [PATCH] strace: upgrade to 4.9, supports ARC
References: <1409644247-11683-1-git-send-email-vgupta@synopsys.com>
 <87ha0pk84o.fsf@dell.be.48ers.dk>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230753C5CF960@IN01WEMBXA.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

+CC Noam too who has faced strace !LFS issues /

On Wednesday 03 September 2014 03:17 AM, Peter Korsgaard wrote:
>>>>>> "Vineet" == Vineet Gupta <Vineet.Gupta1@synopsys.com> writes:
>  > Also get rid of the backport patches which are already present upstream.
>  > Tested on ARC with LFS
>
> It indeed seems to have problems with !LFS (on ARM atleast):
>
> file.c: In function ?sys_getdents64?:
> file.c:2155:6: error: dereferencing pointer to incomplete type
> file.c:2156:6: error: dereferencing pointer to incomplete type
> file.c:2158:28: error: dereferencing pointer to incomplete type
> file.c:2161:6: error: dereferencing pointer to incomplete type
> file.c:2161:19: error: dereferencing pointer to incomplete type
> file.c:2163:9: error: dereferencing pointer to incomplete type
> file.c:2167:9: error: dereferencing pointer to incomplete type
>
> Do you know if this is fixable, or should we just make it depend on
> BR2_LARGEFILE?

It seems patch-01 (which I didn't remove) would already handle the !LFS case, but
that apparently is not case as u show above.

Can u please check if the 4.8 strace builds OK w/o !LFS. If so that would mean
something in upstream strace renders the patch-01 as useless or needing modification.

Otherwise the quick fix is to just make strace depend on LFS.

Thx,
-Vineet
