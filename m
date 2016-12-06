From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 6 Dec 2016 23:26:23 +0100
Subject: [Buildroot] LibreSSL support?
In-Reply-To: <CAGduivzjh5WNn_0do-A5L0FvoNh7hDEOxN1SiXH0HZya12YYAA@mail.gmail.com>
References: <20161205223300.GA5002@itchy>
 <CAGduivzjh5WNn_0do-A5L0FvoNh7hDEOxN1SiXH0HZya12YYAA@mail.gmail.com>
Message-ID: <20161206222623.GA21878@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-12-05 23:36:51, Maxime Hadjinlian wrote:
> Hi Eric, all
>
> On Mon, Dec 5, 2016 at 11:33 PM, Eric Le Bihan
> <eric.le.bihan.dev@free.fr> wrote:

> > Are there any plans for adding support for LibreSSL?
> >
> > I've found a patch [1] in patchwork, from M. Hadjinlian, posted two
> > years ago. The review concludes with the need for the introduction of a
> > virtual package, as LibreSSL uses the same names for its binaries and
> > libraries as OpenSSL (openssl, libcrypto, libssl and libtls).
> Well the problem is that LibreSSL is *NOT* a real drop in replacement
> of OpenSSL, so you would need to add a new package and we need to
> figure a way to have a generic way to say that a package provide SSL,
> like we have for GLES or others, and change/replace everything in the
> package that needs ssl *but* since LibreSSL is not a perfect drop-in,
> some package won't build with it. So it's on a case by case.

Thanks for pointing this compatibility issue out. The Alpine project
made the switch from OpenSSL to LibreSSL [1], so this can be used to get
a list of packages which are compatible with either LibreSSL, OpenSSL or
both.

[1] http://lists.alpinelinux.org/alpine-devel/5463.html

Best regards,

--
ELB
