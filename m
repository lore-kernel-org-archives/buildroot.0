From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Dec 2015 20:00:59 +0100
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <CAGm1_kvud8TAWddmadKqMi+=Mpcfzx=XJ3KMgt2yB-otDq-DpQ@mail.gmail.com>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
 <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
 <20151224214645.GA3738@free.fr>
 <CAGm1_kvud8TAWddmadKqMi+=Mpcfzx=XJ3KMgt2yB-otDq-DpQ@mail.gmail.com>
Message-ID: <20151225200059.48ac8dd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Thu, 24 Dec 2015 23:12:49 +0100, Yegor Yefremov wrote:

> Target variant doesn't need pycparser. cffi's setup.py seems to
> distinguish, if we install real package or cross-compiled one:
> 
>         install_requires=[
>             'pycparser',
>         ] if cpython else [],

I don't understand how this "if cpython" is relevant to make the
different between the native (host) variant or the cross-compiled
(target) variant. cpython is defined as is:

    cpython = ('_cffi_backend' not in sys.builtin_module_names)

Can you give some more details?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
