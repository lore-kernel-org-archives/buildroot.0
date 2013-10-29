From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Oct 2013 19:43:31 +0100
Subject: [Buildroot] [PATCH 2/4] pkg-infra: introduce pre/post-step hooks
In-Reply-To: <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
References: <a356a9112eac610a00a35e48fa9a04a81a460fe0.1382894622.git.yann.morin.1998@free.fr>
 <cover.1382894622.git.yann.morin.1998@free.fr>
 <a89033d9a1639d8899191cae05b772b1646b6ddd.1382894622.git.yann.morin.1998@free.fr>
 <867c8550-360d-40e7-96d1-9391ed121afc@email.android.com>
Message-ID: <20131029184331.GG3411@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-10-27 22:40 +0100, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >This hooks will let us instrument the build process in many ways:
[--SNIP--]
> >diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >index 4bba4b5..799555c 100644
> >--- a/package/pkg-generic.mk
> >+++ b/package/pkg-generic.mk
> >@@ -21,6 +21,29 @@
> > ################################################################################
> > 
> > ################################################################################
> >+# Helper functions to catch start/end of each steps
> 
> each step
> 
> >+################################################################################
> >+
> >+# Those two functions are called by each steps below.
> 
> each step

Both: OK.

> >+# They are responsible for calling all hooks defined in $(STEP_HOOKS)
> 
> I personally find the name STEP_HOOKS pretty vague, if you don't know
> the context you have no clue what it could be. The other hooks
> POST_EXTRACT etc are clear from their name.
> Maybe, GLOBAL_INSTRUMENTATION_HOOKS?

I'm on the side of Ryan here: it is way too long. :-p
I'll try to see if I can come with a better name, though.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
