From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 16:20:00 +0200
Subject: [Buildroot] [PATCH 07/24 v4] manual: document dependencies on
 atomic operations
In-Reply-To: <38612d6b-068a-4a68-8f97-a595df32e458@email.android.com>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
 <4061c3ce3e322eed4f6a91e635133d0e0dd2e2f4.1408279142.git.yann.morin.1998@free.fr>
 <5dc49087-92a9-4ec1-a145-bcc77ecbad46@email.android.com>
 <20140817131527.GE5274@free.fr>
 <38612d6b-068a-4a68-8f97-a595df32e458@email.android.com>
Message-ID: <20140817142000.GH5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-17 15:25 +0200, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >Thomas, All,
> >
> >On 2014-08-17 15:01 +0200, Thomas De Schampheleire spake thusly:
> >> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >> >From: Anton Kolesov <anton.kolesov@synopsys.com>
> >> >
> >> >Add atomic operations to the list of generic dependencies.
> >> >
> >> >Since this is an architecture option, there is no comment string to be
> >> >added.
> >> >
> >> >Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> >> >[yann.morin.1998 at free.fr: use the new arch-option; remove comment string]
> >> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> >---
> >> > docs/manual/adding-packages-directory.txt | 4 ++++
> >> > 1 file changed, 4 insertions(+)
> >> >
> >> >diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> >> >index 93e6a3e..40a81d5 100644
> >> >--- a/docs/manual/adding-packages-directory.txt
> >> >+++ b/docs/manual/adding-packages-directory.txt
> >> >@@ -219,6 +219,10 @@ use in the comment.
> >> > ** Dependency symbol: +BR2_USE_MMU+
> >> > ** Comment string: no comment to be added
> >> > 
> >> >+* Atomic operations
> >> >+** Dependency symbol: +BR2_ARCH_HAS_ATOMICS+
> >> >+** Comment string: no comment to be added
> >> >+
> >> 
> >> Should we provide a brief explanation, reference, or
> >>  name of these functions to make it a bit clearer what
> >> is meant with 'atomic operations'?
> >
> >Well, the atomics are all named differently in different architectures.
> >
> >For example, armv6+ has LDREX and STREX (amon others):
> >    http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dht0008a/ch01s02s01.html
> >
> >While on x86, I don't think there are corresponding instructions, but
> >you can prefix some intructions with the LOCK prefix to achieve a
> >similar result.
> >
> >So, I would not know what to put in here. Also, we do not explain what
> >the other options are (like MMU, for example). Why would we do that for
> >this specific option, and not others?
> 
> Because MMU is a widely known acronym for anyone in the embedded world,
> but 'atomics' or 'atomic operations' is a much more general term that
> is less obvious, IMHO.

Weird how different people, even from the same field, would consider one
thing as a fundamentals and not some other thing, or the opposite. :-)

> Maybe the description can clarify that we're talking about a dependency
> on _CPU_ atomic _instructions_?

OK, let's strike a deal: I keep the option name as-is (I like it), but I
add a bit of explanations in the manual. Deal? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
