From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 15:30:25 +0200
Subject: [Buildroot] [PATCH 3 of 4] manual generation: check
	dependencies first
In-Reply-To: <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
References: <patchbomb.1379587632@argentina>
 <246bed054da59d6508dc.1379587635@argentina>
 <CAHXCMMJ2oSqF_MoyDJYjxCKKZukwg6vr2ewP+TUFy9kaDrwcoA@mail.gmail.com>
Message-ID: <CAAXf6LW=7dUUEjGHp6xVFy9-SEXVuUyiK8Lvom2imyCX=s+3oQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 19, 2013 at 1:43 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Thomas, all,
>
[..]
>
> To generate the pdf manual, you need dblatex too.

dblatex was installed by default, it seems, on my Ubuntu-based system.
How would you like to check this? We can add it to the proposed
manual-check-dependencies rule, but this means that even if you're
only interested in the text manual you need to install dblatex.
Alternatively, we can add an explicit dependency like:
manual-pdf: manual-check-pdf-dependency
but this kind of conflicts with the generic gendoc principle currently used.

> Also, to update the lists of the manual, you need python with argparse
> package.
>

For python, should we check and bail out, or rather skip the package
list generation? In fact, why is the package list generation coupled
to the manual?
If we do want to check for python, should we simply check for the
python version 2.7+ or 3.2+ in which argparse was introduced, or are
you thinking about a more elaborate check on argparse?

Thanks,
Thomas
