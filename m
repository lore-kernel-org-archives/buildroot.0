From: Christian Stewart <christian@paral.in>
Date: Thu, 10 Sep 2020 15:33:08 -0700
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200904080612.GG14354@scaer>
References: <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer> <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer> <20200903181334.1a25642b@windsurf.home>
 <20200903191841.GC14354@scaer>
 <CA+h8R2rNmRJUor9CDjyNzsgGPCmpE3XPjtkFdjzCeMGYenWKxA@mail.gmail.com>
 <20200903204341.GE14354@scaer>
 <CA+h8R2ooPOmJeE0dK7bQ+AyHG+ZT3ZRtYG80RjUdpBf78Q4aHw@mail.gmail.com>
 <20200904080612.GG14354@scaer>
Message-ID: <CA+h8R2p=3KN=11jmkKg4AOToGhJ+BX+F8yx5-OOUyPO1yBD9fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, Sep 4, 2020 at 1:06 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Ah, because you store all the go vendored dependencies "away" of the
> package.
>
> I am not sure I like that, because it breaks the semantics of the dl/
> directory: all the csource needed by one package is in dl/foo/ and the
> vendored dependencies *are* part of the package.
>
> So I am absolutely not in favour of storing the go modules on the side.

I've thought about this quite a bit and I think you're probably right,
for a v1 implementation in Buildroot we most likely should do the
approach of "go mod vendor" just before compressing the source file
for "make source." It should work fine for Go (can't speak for node or
others) because the vendor/ tree is always consistent.

Best regards,
Christian
