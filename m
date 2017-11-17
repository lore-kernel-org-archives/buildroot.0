From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 16 Nov 2017 16:03:32 -0800
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
In-Reply-To: <87zi7m8yqq.fsf@dell.be.48ers.dk>
References: <20171115194509.78132-1-code@mmayer.net>
 <74751d46-877e-ef18-ce79-0e7c6f46e5d9@mind.be>
 <CAGt4E5uZzBjfTqQh9RAN+wek9B+31PgWn3XJwSrDYz-sg6yFCA@mail.gmail.com>
 <a34d3f69-8595-0d2b-1728-c0fdcfe676ad@mind.be>
 <87zi7m8yqq.fsf@dell.be.48ers.dk>
Message-ID: <CAGt4E5sajn8+gBfuKrWPJ9CjZnvcdLPJ7BdTK2v+aeN-UAAr1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15 November 2017 at 23:32, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  >  I still don't think that your solution in the init script is very elegant. I
>  > think it's rather exceptional that you want only an RSA host key in your rootfs
>  > and not an ECDSA and/or DSS key. If you really want that, you can put a custom
>  > init script in your fs overlay that removes -R completely. Or you can add a
>  > DROPBEAR_POST_EXTRACT_HOOK in your local.mk that removes DROPBEAR_ECDSA from
>  > options.h.
>
> Agreed, don't enable ecdsa support (in your client and in dropbear) if
> you don't want it.

Sure. I have no problem using a different solution. I was just
surprised that dropbear wouldn't look for all key types before
generating a new one. But that's not a buildroot issue.

Regards,
-Markus
