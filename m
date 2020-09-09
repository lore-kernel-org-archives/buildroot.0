From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 9 Sep 2020 13:35:49 -0700
Subject: [Buildroot] [PATCH] libcap: disable GOLANG
In-Reply-To: <87y2lubx7j.fsf@dell.be.48ers.dk>
References: <1f3d9456-9ca2-75f4-7e15-d851e65005ea@aliyun.com>
 <873642deyy.fsf@dell.be.48ers.dk>
 <d1e0d62f-098d-4dbb-037a-8f827772dd1e@aliyun.com>
 <87y2lubx7j.fsf@dell.be.48ers.dk>
Message-ID: <CAMWSM7jgmC6godtgYtGZ9dutsCrgzfYMDQ7xWzwQPpbW2CHTrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Aug 31, 2020 at 9:24 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Tian" == Tian Yuanhao via buildroot <buildroot@busybox.net> writes:
>
>  > This patch is for the next branch.
>
> Ahh, then please mention that. An easy way to do that is using the
> --subject-prefix argument to git send-email, E.G.:
>
> git send-email --subject-prefix='PATCH-NEXT' ..
>
>  > Recently, the go infrastructure has changed, and libcap has been
>  > upgraded to 2.42. libcap introduced golang in 2.28, see:
>
>  > https://git.kernel.org/pub/scm/linux/kernel/git/morgan/libcap.git/commit/Make.Rules?id=0615d996379dceedefcd65a114f93fefd81c208f
>
>  > When you compile host-go and then compile host-libcap, GOLANG will be
>  > automatically set to yes. Because libcap.mk lacks golang support,
>  > compilation will fail.
>

This fixes a build issue with libcap 2.42 when ccache is enabled.

https://gist.github.com/jakogut/3675b4a692da1b87b59056fec71575b4

Minor suggestion, but perhaps we should move these flags to
HOST_LIBCAP_MAKE_FLAGS to mirror how the target package is built?

Regardless,
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
