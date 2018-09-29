From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 29 Sep 2018 10:24:32 +0300
Subject: [Buildroot] [PATCH 15/23] python-txtorcon: bump to version
 18.0.2
In-Reply-To: <5baf0f9879876_62ce3fdd0e0b1e2431918@ultri5.mail>
References: <20180926153505.3411-16-asafka7@gmail.com>
 <5baf0f9879876_62ce3fdd0e0b1e2431918@ultri5.mail>
Message-ID: <CALFsTFVpz1PfCcxWCLPMLfQh8cnBhpSoJeuqEqo9VEoXVMuD1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Sep 29, 2018 at 8:37 AM Ricardo Martincoski
<ricardo.martincoski@gmail.com> wrote:
>
> Hello,
>
> + Thomas
>
> On Wed, Sep 26, 2018 at 12:34 PM, Asaf Kahlon wrote:
>
> [snip]
> > -PYTHON_TXTORCON_VERSION = 0.19.3
> > +PYTHON_TXTORCON_VERSION = 18.0.2
>
> In the upstream code there is an issue with Python 2:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/102483482
> |# python -c 'import txtorcon'
> |Traceback (most recent call last):
> |  File "<string>", line 1, in <module>
> |  File "usr/lib/python2.7/site-packages/txtorcon/__init__.py", line 16, in <module>
> |  File "usr/lib/python2.7/site-packages/txtorcon/controller.py", line 43, in <module>
> |ImportError: No module named controller_py3
> |# echo $?
> |1
>
> Here is the relevant code:
> |try:
> |    from .controller_py3 import _AsyncOnionAuthContext
> |    HAVE_ASYNC = True
> |except SyntaxError:
> |    HAVE_ASYNC = False
>
> The upstream has a patch related to this (I did not tested it):
> https://github.com/meejah/txtorcon/commit/c160531e885a3695ec1627070b6f48dfc443f3c8
> and also there is a new release 18.1.0 containing it.
>
> Assuming the patch solves the issue, what would be the best approach in this
> case?
> - resend the remaining patches of the series, bumping directly to 18.1.0;
> - resend the remaining patches of the series, adding the upstream patch to the
>   bump to 18.0.2;
> - apply the remaining patches of the series, and later add a followup patch
>   to solve the runtime issue either by adding the patch file or by bumping to
>   18.1.0.
Regarding 18.0.2 with a patch vs. 18.1.0 - I would go with 18.1.0. If
we can use a newer version and don't use a patch on Buildroot, so in
my opinion it's preferred.
Regarding the other patches of the series - it's possible to send the
patches again, but since only one of them will be changed I would
prefer applying the series (with or without that one), and then send a
patch for 18.1.0.

>
>
> Regards,
> Ricardo

Asaf
