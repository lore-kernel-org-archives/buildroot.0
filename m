From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Oct 2009 13:03:07 -0300
Subject: [Buildroot] [git commit master] libnl: handle all
	installed	libraries
In-Reply-To: <20091021082035.4DB3A7777B@busybox.osuosl.org>
References: <20091021082035.4DB3A7777B@busybox.osuosl.org>
Message-ID: <4AE5C83B.7020101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:

> commit: http://git.buildroot.net/buildroot/commit/?id=61901bd74a622450139358ea0c0f37d4568ad570
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> libnl does not only install libnl.so, but also libnl-nf.so,
> libnl-genl.so and libnl-route.so. Change the post-install
> and uninstall hooks to handle these libraries as well.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

This broke the current version of the libnl package in buildroot since
libnl-* doesn't exist for libnl-1.1 (it's all in libnl.so) thus the
strip fails miserably.
Sven: Using git/libnl2 snapshot?
Regards.
