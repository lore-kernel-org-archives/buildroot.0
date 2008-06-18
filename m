From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 18 Jun 2008 10:54:14 -0300
Subject: [Buildroot] Problems building nbd.
In-Reply-To: <874p7r86p3.fsf@macbook.be.48ers.dk>
References: <d6cda7730806172112l67de57b4s3d5923bda024c8f1@mail.gmail.com>
	<874p7r86p3.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730806180654xdfc1fb9m9d66ab668c4cbc3a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 5:53 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>  Thiago>   The other option to fix nbd would be to downgrade to something below
>  Thiago> 2.8, but then we would still be unable to support the next package
>  Thiago> that requires glib.
>
>  Thiago>   Any thoughts?
>
>  Thiago>   I'm appending my glibc.mk for reference at the end.
>
> We DO have glib packages in buildroot (1.2.x and 2.x.x) -
> package/libglib12 and package/libglib2.

Ops, I missed that :(

I've added the dependency to nbd.mk and it seams to be working fine now.

Anyway, is that a valid concern (skipping configure tests which
results might be platform dependent?) or perhaps that's not worth to
worry about? I see that the libglib2.mk does set the same variables
that I mentioned earlier.
