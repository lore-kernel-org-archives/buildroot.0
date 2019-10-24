From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2019 10:05:34 +0200
Subject: [Buildroot] [PATCH] package/dbus-python: Fix build with python
 3.8
In-Reply-To: <20191023211924.950430-1-grzegorz@blach.pl>
References: <20191023211924.950430-1-grzegorz@blach.pl>
Message-ID: <20191024100534.73b352bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 21:19:21 +0000
Grzegorz Blach <grzegorz@blach.pl> wrote:

> test/import-repeatedly.c uses an embedded python interpreter
> and PYTHON_EXTRA_LIBS is used only for building this test case,
> so set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
> to build this test case and don't link the module with libpython3.so.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b30/b308eeb5c5d95ab9f1dbfc19f9183f2ba3ba0ce3/
>  - http://autobuild.buildroot.org/results/0dd/0dd9203f859b97ee5a3b6358644c26f8ab784ed8/
>    and many similar failures.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
> ---
> Changes v1 -> v2:
>  - Set PYTHON_EXTRA_LIBS with `python3-config --libs --embed`
>    instead of appending --embed to PYTHON_LIBS

This doesn't change the fix, which I think still isn't correct (but I
haven't checked in details). A Python extension should not need the
--embed option.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
