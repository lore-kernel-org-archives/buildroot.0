From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 20:12:07 +0100
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <20151225200059.48ac8dd7@free-electrons.com>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
 <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
 <20151224214645.GA3738@free.fr>
 <CAGm1_kvud8TAWddmadKqMi+=Mpcfzx=XJ3KMgt2yB-otDq-DpQ@mail.gmail.com>
 <20151225200059.48ac8dd7@free-electrons.com>
Message-ID: <20151225191207.GA3878@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yegor, All,

On 2015-12-25 20:00 +0100, Thomas Petazzoni spake thusly:
> On Thu, 24 Dec 2015 23:12:49 +0100, Yegor Yefremov wrote:
> > Target variant doesn't need pycparser. cffi's setup.py seems to
> > distinguish, if we install real package or cross-compiled one:
> > 
> >         install_requires=[
> >             'pycparser',
> >         ] if cpython else [],
> 
> I don't understand how this "if cpython" is relevant to make the
> different between the native (host) variant or the cross-compiled
> (target) variant. cpython is defined as is:
> 
>     cpython = ('_cffi_backend' not in sys.builtin_module_names)
> 
> Can you give some more details?

Yegor and I briefly discussed this on IRC yesterday, but I'm not really
convinced by this reply either. I forgot to reply yesterday...

What I understand, however, is that they want to differentiate between
cpython (the 'ofiicial' native Python interpreter), and PyPy (the Python
interpreter written in Python).

Of course, I don't see how this all works. It seems in
cross-compilation. there differentiation criterai beliveves it is
running under PyPy amd thus they do not need pycparser.

But thtat's just incorrect, because we may have a host-python with
cffi_backend at one point, and thus the check above will eventually
differentiate toward cpython, and we'd nreak again.

So, two things:
  - their check is wrong,
  - we probably need host-pycparser

At least, that's what I understood...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
