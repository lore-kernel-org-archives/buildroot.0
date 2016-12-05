From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 5 Dec 2016 23:36:51 +0100
Subject: [Buildroot] LibreSSL support?
In-Reply-To: <20161205223300.GA5002@itchy>
References: <20161205223300.GA5002@itchy>
Message-ID: <CAGduivzjh5WNn_0do-A5L0FvoNh7hDEOxN1SiXH0HZya12YYAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric, all

On Mon, Dec 5, 2016 at 11:33 PM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Hi all!
>
> Are there any plans for adding support for LibreSSL?
>
> I've found a patch [1] in patchwork, from M. Hadjinlian, posted two
> years ago. The review concludes with the need for the introduction of a
> virtual package, as LibreSSL uses the same names for its binaries and
> libraries as OpenSSL (openssl, libcrypto, libssl and libtls).
Well the problem is that LibreSSL is *NOT* a real drop in replacement
of OpenSSL, so you would need to add a new package and we need to
figure a way to have a generic way to say that a package provide SSL,
like we have for GLES or others, and change/replace everything in the
package that needs ssl *but* since LibreSSL is not a perfect drop-in,
some package won't build with it. So it's on a case by case.

Of course, a good first step, would be to simply add the package and
include it with a few packages that works and see how it goes.
>
> So, what would be the best solution:
>
> a)
>   1. introduce the virtual package openssl-compat.
>   2. make libressl and openssl provide openssl-compat.
>   3. update all packages depending on/selecting openssl to depend on/select
>      openssl-compat.
>
> b)
>   1. rename openssl to openssl-genuine.
>   2. introduce virtual package openssl.
>   3. make openssl-genuine and libressl provide openssl.
>
> Comments and suggestions welcome.
>
> [1] https://patchwork.ozlabs.org/patch/398963/
>
> --
> ELB
