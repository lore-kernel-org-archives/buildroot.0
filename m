From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:18:40 +0200
Subject: [Buildroot] [PATCH v3] nc: new virtual package providing
 "netcat" functionality
In-Reply-To: <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
References: <20170917214558.11061-1-casantos@datacom.ind.br>
 <1506953582-12965-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20171002211840.104aa3df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Oct 2017 11:13:02 -0300, Carlos Santos wrote:
> Add the "nc" virtual package and modify netcat, netcat-openbsd and nmap
> to become providers.
> 
> Make the nmap recipe install "ncat" (with a symbolic link to nc) if the
> BR2_PACKAGE_NMAP_NCAT option is set. Other programs (ncat, ndiff, etc.)
> are still chosen via BR2_PACKAGE_NMAP, in the "Networking applications"
> menu.
> 
> So far the "nc" options available to build with uClibc were the ancient
> GNU netcat and its Busybox double. Both lack features available in more
> modern netcats like IPv6, proxies, and Unix sockets.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

What is the benefit of having a virtual package for this ?

Virtual packages are mainly useful when several variants of a given
library provide the same API, but different implementations, and we
have N consumers of this API. In such a case, a virtual package avoids
having each consumer explicitly handle every possible provider of the
API.

However, in the case of netcat, I don't see the point. Yes, you can
currently enable several packages that provide the netcat
functionality, and they will step on each other in some combinations.

But you can also enable several Web servers that will try to listen on
port 80 at boot time, leaving only one functional, and still we're not
going to have a "webserver" virtual package.

So, I don't see where the problem is, and therefore I don't think a
solution is necessary :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
