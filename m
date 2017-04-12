From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 09:49:09 +0200
Subject: [Buildroot] [PATCH v2 0/9] A checkpackage script that verifies
 a package coding style
In-Reply-To: <58ed60aaf1a9c_4e388d340c84161@ultri3.mail>
References: <20170408162114.6e6c8899@free-electrons.com>
 <58ed60aaf1a9c_4e388d340c84161@ultri3.mail>
Message-ID: <20170412094909.66ea1ada@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 20:03:06 -0300, Ricardo Martincoski wrote:

> > However, there are two things that bothered me a little bit:
> > 
> >  - The number of files added in support/scripts/. Should we have
> >    support/scripts/check-package as a script, and the rest in a
> >    subdirectory?  
> 
> Sure. I will send a followup patch.
> 
> I am inclined to change to this:
>  support/scripts/
>  ...
>  |-- check-package
>  |-- checkpackage
>  |   |-- __init__.py
>  |   |-- base.py
>  |   |-- lib.py
>  |   |-- lib_config.py
>  |   |-- lib_hash.py
>  |   |-- lib_mk.py
>  |   |-- lib_patch.py
>  |   `-- readme.txt
>  ...

Looks good to me. I'm wondering what is best between checkpackage and
check-packagelib for the folder, but I don't have a strong opinion here.

> >  - Between every function/method/class, you put two empty lines. The
> >    Buildroot coding style is generally to have only one empty line.  
> 
> Sorry, the series got contaminated by my habit of using pep8 with default
> options.

Ah, but then if PEP8 suggests this, perhaps we should follow it? It's
just that we don't do this anywhere else in Buildroot. Anyway, that's
really a minor detail.

Thanks again for this work!

Have you seen that http://autobuild.buildroot.net/stats/ has a new
column "Warnings", which indicates for each package the number of
check-package warnings reported?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
