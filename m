From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 18 Jun 2014 23:38:40 +0200
Subject: [Buildroot] [PATCH 5/5] legal-info: properly error out on
 missing license file
In-Reply-To: <8c742a7155e0b24c14ae90f7be00c1043eceb848.1402758331.git.yann.morin.1998@free.fr>
References: <cover.1402758331.git.yann.morin.1998@free.fr>
 <8c742a7155e0b24c14ae90f7be00c1043eceb848.1402758331.git.yann.morin.1998@free.fr>
Message-ID: <53A206E0.9000506@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann,

Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> When saving the license files, if a declared license file is missing,
> print a proper error message, instead of the sometime-criptic error
> message from 'cp'.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> ---
> Note: when I wrote this back in March 2014, I had a concrete example of
> a criptic error message (the name of the license did not make it obvious
> we were saving a license file?), but today I can't remember what it was
> exactly.
>
> Since I believe showing a properly-formatted error message to the user
> is anyway a good thing, I kept that patch. Feel free to ditch it if you
> don't like it.

I may be missing something, but I wonder what cryptic error you had
seen. I tried removing a license file and got, before your patch:

   cat: 
/home/murray/devel/buildroot-test/output/build/busybox-1.22.1/LICENSE: 
No such file or directory

Except for the "cat: " prefix, it's quite understandable IMHO.

With your patch applied:

   ERROR: busybox: license file LICENSE not found

This is much more concise, but gives a less info about where the
LICENSE file should be found. To the inexperienced user, the path might
be a useful hint.
OTOH, the "ERROR: busybox: " prefix is very informative.

How about changing your message to:
   ERROR: busybox: license file LICENSE not found in /.../busybox-1.22.1/
or
   ERROR: busybox: license file /.../busybox-1.22.1/LICENSE not found

-- 
Luca
