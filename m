From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 22:19:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcoap: add openssl and gnutls
 optional dependencies
In-Reply-To: <20200213221510.2343763-1-fontaine.fabrice@gmail.com>
References: <20200213221510.2343763-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412221948.68d62c0f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2020 23:15:10 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> openssl and gnutls are optional dependencies since version 4.2.0 and
> https://github.com/obgm/libcoap/commit/4cef54f15190a42b6d3ad7a17ed71331e50a1bdf
> 
> Prefer gnutls over openssl has done by upstream in their configure.ac
> when the user does not provide any option (which is the case currently)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcoap/libcoap.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Instead of just handling them as optional dependencies, I slightly
improved your patch by handling --enable-dtls/--disable-dtls, which is
really what gnutls or openssl are used for. See:

  https://git.buildroot.org/buildroot/commit/?id=8b14f6b49b962d4d8f7135d85afa15658ea8f94b

So, your patch is basically applied to master, with some changes.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
