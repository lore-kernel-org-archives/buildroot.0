From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Nov 2017 08:32:45 +0100
Subject: [Buildroot] [PATCH] dropbear: change start-up script to honour
 pre-existing keys
In-Reply-To: <a34d3f69-8595-0d2b-1728-c0fdcfe676ad@mind.be> (Arnout
 Vandecappelle's message of "Wed, 15 Nov 2017 23:29:30 +0100")
References: <20171115194509.78132-1-code@mmayer.net>
 <74751d46-877e-ef18-ce79-0e7c6f46e5d9@mind.be>
 <CAGt4E5uZzBjfTqQh9RAN+wek9B+31PgWn3XJwSrDYz-sg6yFCA@mail.gmail.com>
 <a34d3f69-8595-0d2b-1728-c0fdcfe676ad@mind.be>
Message-ID: <87zi7m8yqq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  I still don't think that your solution in the init script is very elegant. I
 > think it's rather exceptional that you want only an RSA host key in your rootfs
 > and not an ECDSA and/or DSS key. If you really want that, you can put a custom
 > init script in your fs overlay that removes -R completely. Or you can add a
 > DROPBEAR_POST_EXTRACT_HOOK in your local.mk that removes DROPBEAR_ECDSA from
 > options.h.

Agreed, don't enable ecdsa support (in your client and in dropbear) if
you don't want it.

-- 
Bye, Peter Korsgaard
