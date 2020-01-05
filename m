From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 5 Jan 2020 22:49:56 +0100
Subject: [Buildroot] [PATCH 05/11] support/scripts/pkg-stats: parse and
 set developers info
In-Reply-To: <546f5cf1-f0d5-7a58-9fb4-0f8e231158aa@mind.be>
References: <20200103151849.10956-1-heiko.thiery@gmail.com>
 <20200103151849.10956-6-heiko.thiery@gmail.com>
 <20200103162625.093ff7b2@windsurf>
 <CAEyMn7aPCiLX-RB8vYm_-OnhrjXXrxJg+ufYgPUx5cRcjSW0tw@mail.gmail.com>
 <20200103173909.70596709@windsurf>
 <546f5cf1-f0d5-7a58-9fb4-0f8e231158aa@mind.be>
Message-ID: <CAEyMn7YcG6=TC8T10QTFAgOhgiUoTXXer9ZtyyG7+PrT2ONBjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 5. Jan. 2020 um 20:18 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
>
> On 03/01/2020 17:39, Thomas Petazzoni wrote:
> > One idea is to add ../../utils to the Python path used to search for
> > modules.
>
>  The reverse would actually make more sense: move the libs to support/scripts
> (or support/python) and add that to the path of the stuff in utils.
>
> > I think it can be tweaked from inside a Python script. Not
> > sure if it's the nicest thing to do, though.
>
> import sys
> sys.path.extend(...)

I think with that the script can only be executed from a distinct
location. On the other hand this is already a hard requirement because
the search for packages is done from toplevel.

>  I'm not sure though how it deals with relative paths.
>
>  A much simpler approach is to move the python scripts entirely to
> support/scripts and symlink them from utils. That works.

With doing that with a symlink the above-mentioned could be avoided.

>  Regards,
>  Arnout
