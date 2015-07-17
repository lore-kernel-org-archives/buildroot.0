From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jul 2015 08:17:46 -0300
Subject: [Buildroot] [PATCH] Update from polarssl to mbed 1.3.11
In-Reply-To: <55A8E2D4.7080108@mind.be>
References: <1437080329-96500-1-git-send-email-eswierk@skyportsystems.com>
 <20150716231142.6486d101@free-electrons.com> <55A8311B.30503@mind.be>
 <20150717095210.223e90bb@free-electrons.com>
 <55A8D954.8020703@zacarias.com.ar> <55A8E2D4.7080108@mind.be>
Message-ID: <55A8E45A.3000804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/15 08:11, Arnout Vandecappelle wrote:

>   So the tarball called mbedtls installs a library called polarssl? Or does it
> install a library called mbedtls with a symlink from polarssl?

The 1.3 series installs as polarssl for compatbility purposes.
I haven't looked at the 2.0 tarball but according to the release notes 
it should install as mbedtls since they broke API anyway (unless they're 
too shortsighted).

>   Either way, since there's an API change, I still think it makes sense to make
> it a new package - that's what we do with webkitgtk24 as well. If side-by-side
> is not possible, we can just make it depend on !polarssl or vice versa. It's a
> bit of a pain while we have both polarssl and mbedtls because of the extra
> select/depends stuff in the packages using it, but anyway most packages only
> have automatic dependencies in the .mk file.
>
>   With the API breakage in mbedtls 2.0 in mind, it's probably best to call the
> new package mbedtls13 so we can eventually (when everything has migrated to 2.0
> API) end up with just a single package mbedtls.

Question is, Ed, are you using mbedtls for your project?
Because that would make 2.0 more reasonable, in general we prefer the 
latest versions unless there's a special need in the form of BR packages 
that can't work with the latest version.
Regarding openvpn killing 1.2 would leave it in just-openssl ground, 
which isn't too ideal since openvpn+polarssl is probably smaller than 
openssl alone.
The openvpn 2.4 milestone/branch contains 1.3 support but it's no easy 
backport, in general we tend to avoid that and there's no release date 
set either. It also remains to be seen if that works with 2.0.

>   All this for a TLS library that has simplicity as its USP :-)

Heh, don't mention it, even openssl kept the API compatible (not ABI 
though, arguably that's it's main bloat problem).
Regards.
