From: Stefan Becker <chemobejk@gmail.com>
Date: Tue, 29 May 2018 09:43:49 +0300
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180503200415.GC2453@scaer>
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
Message-ID: <CAOJ2eMdO5yY70sHdxCHWvWWjcOQzjMSKA=i8ju1aADyCuuNGug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Thu, May 3, 2018 at 11:04 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Stefan, All,

> Although in the long run, I believe it might be preferrable that we
> ditch our own bundled version, and switch to making our whois package a
> hot pacakge, and use that as the provider for mkpasswd.

> Stefan, would you want to do that? ;-)

I poked around in package/whois this morning to add host-whois. IMHO that
package is not much of an improvement over package/mkpasswd. Everything is
hard-coded there too, i.e. the build does not detect if the build host
needs crypt.h/-lcrypt or not.

Just my $0.02,

Stefan
