From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 08:59:46 +0200
Subject: [Buildroot] [git commit] python: new module cffi
In-Reply-To: <CAAwwcmRiN_Co4qiVzEUvZwmjmWreSaEsKX9Pb2xWZRTZ0MActA@mail.gmail.com>
References: <20140729193207.299669D333@busybox.osuosl.org>
 <CAAwwcmRiN_Co4qiVzEUvZwmjmWreSaEsKX9Pb2xWZRTZ0MActA@mail.gmail.com>
Message-ID: <20140730085946.674c9fb8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oli Vogt,

On Wed, 30 Jul 2014 11:10:56 +1200, Oli Vogt wrote:

> Thank's for accepting the patch and making sure that it builds with Python3.
> 
> By the way, LIBFFI is already selected from 'python' which of course
> 'python-cffi' depends on.

Yes, indeed.

> ---------
> python/Config.in-2-    bool "python"
> python/Config.in-3-    depends on BR2_USE_WCHAR
> python/Config.in-4-    # uses fork()
> python/Config.in-5-    depends on BR2_USE_MMU
> python/Config.in:6:    select BR2_PACKAGE_LIBFFI
> python/Config.in-7-    help
> python/Config.in-8-      The python language interpreter.
> python/Config.in-9-
> python/Config.in-10-      http://www.python.org/
> --------
> 
> I agree that it is better do 'double-up' the dependency since a future
> version of Python could drop its dependency on libffi.

That was the intention: since python-cffi itself depends on libffi, I
preferred to make the dependency completely explicit. Even though, as
you said, it's technically not needed because python already depends on
it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
