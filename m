From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 4 Nov 2013 08:18:54 -0600
Subject: [Buildroot] [PATCH v2] Makefile: fix out-of-tree builds with
 multiple targets with 'all'
In-Reply-To: <1383474181-4372-1-git-send-email-yann.morin.1998@free.fr>
References: <1383474181-4372-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <OF6D0F4B79.3FF51701-ON86257C19.004D284E-86257C19.004EA170@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

"Yann E. MORIN" <yann.morin.1998@gmail.com> wrote on 11/03/2013 04:23:01 
AM:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> For out-of-tree builds, this use-case fails to build:
>     $ make clean all
> 
> This is because 'all' is filtered-out in the Makefile wrapper, since
> the wrapper itself has a 'all' target.
> 
> The 'all' target is just the usual naming for the default target in a
> Makefile. In fact, the first target is the default one, so we can name
> it whatever we want.
> 
> Rename the Makefile wrapper 'all' target to avoid name-clashing.

Could you please add a comment about fixing the bug I reported? I'll even 
make it easy for you with having the comment below so you can copy and 
paste :)

Fixes bug #6644 

If you add the comment above, I will give you this:

Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

> Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
> Changes v1->v2:
>   - fix one missed 'all' occurence
> 
