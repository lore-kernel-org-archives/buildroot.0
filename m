From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 15:15:07 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: fix wrong install
 step
In-Reply-To: <CA+TH9V=cyeKKhvVtrjM0EowOUVrPqZjE8zADizy8F3Nr0__Eig@mail.gmail.com>
References: <1467756127-30393-1-git-send-email-angelo.compagnucci@gmail.com>
 <20160706144623.4015111f@free-electrons.com>
 <CA+TH9Vk4NMSP67dBpKjYTs9KRCrSBviZeCeo4NGXZzCdTxcWYg@mail.gmail.com>
 <20160706150549.34ff0441@free-electrons.com>
 <CA+TH9V=cyeKKhvVtrjM0EowOUVrPqZjE8zADizy8F3Nr0__Eig@mail.gmail.com>
Message-ID: <20160706151507.11769b9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 15:09:26 +0200, Angelo Compagnucci wrote:

> > Ah, ok. Thanks for the explanation. I hate to say I dislike what the
> > python-pillow package needs to do, but there isn't a better option for
> > now with the current python-package infrastructure. We'll live with
> > that for now, and potentially improve the python-package infrastructure
> > in the future if more packages have similar requirements.  
> 
> Well, yes, I proposed a solution on a thread months ago, but for now
> we a have such a requirement only for this package, so I convey with
> you that the problem not arises.

Agreed.

It is not clear to me if it is legal for a Python package to build only
with "build_ext" and not "build". According to the Python documentation
"build" should do everything, and "build_ext" is a sub-command to build
just the "extensions".

Maybe the problem should be reported upstream?

> > Ditto for the install target commands.  
> 
> Will do!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
