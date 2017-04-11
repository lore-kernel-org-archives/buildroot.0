From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 11 Apr 2017 20:03:06 -0300
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies
 a package coding style
References: <20170408162114.6e6c8899@free-electrons.com>
Message-ID: <58ed60aaf1a9c_4e388d340c84161@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, Apr 08, 2017 at 11:21 AM, Thomas Petazzoni wrote:

> Since there was no feedback to your patch series since 1.5 months, I've
> applied all of it, except PATCH 1/9. I'm not sure we want to have the

Thanks.

> bad examples/test cases inside the Buildroot tree.

OK.

> However, there are two things that bothered me a little bit:
> 
>  - The number of files added in support/scripts/. Should we have
>    support/scripts/check-package as a script, and the rest in a
>    subdirectory?

Sure. I will send a followup patch.

I am inclined to change to this:
 support/scripts/
 ...
 |-- check-package
 |-- checkpackage
 |   |-- __init__.py
 |   |-- base.py
 |   |-- lib.py
 |   |-- lib_config.py
 |   |-- lib_hash.py
 |   |-- lib_mk.py
 |   |-- lib_patch.py
 |   `-- readme.txt
 ...

>  - Between every function/method/class, you put two empty lines. The
>    Buildroot coding style is generally to have only one empty line.

Sorry, the series got contaminated by my habit of using pep8 with default
options.

I will fix that in another followup patch.

Regards,
Ricardo
