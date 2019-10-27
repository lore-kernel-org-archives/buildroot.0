From: Anisse Astier <anisse@astier.eu>
Date: Sun, 27 Oct 2019 22:31:19 +0100
Subject: [Buildroot] [PATCH] package/go: security bump to version 1.13.3
In-Reply-To: <20191027212729.1687-1-peter@korsgaard.com>
References: <20191027212729.1687-1-peter@korsgaard.com>
Message-ID: <CALUN=q+KEDOr_XAVFRYhx4tTOqc+WmoPLUGXEuGOtkUGQ7_2fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 27 oct. 2019 ? 22:27, Peter Korsgaard <peter@korsgaard.com> a
?crit :

> Fixes the following security issues (1.33.2):
>
> - CVE-2019-17596: Invalid DSA public keys can cause a panic in dsa.Verify.
>   In particular, using crypto/x509.Verify on a crafted X.509 certificate
>   chain can lead to a panic, even if the certificates don?t chain to a
>   trusted root.  The chain can be delivered via a crypto/tls connection to
> a
>   client, or to a server that accepts and verifies client certificates.
>   net/http clients can be made to crash by an HTTPS server, while net/http
>   servers that accept client certificates will recover the panic and are
>   unaffected.
>
> Additionally, 1.13.3 fixes a number of issues. From the release notes:
>
> Fixes to the go command, the toolchain, the runtime, syscall, net,
> net/http,
> and crypto/ecdsa packages
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>

Thanks Peter,

Anisse
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191027/c7e502bb/attachment.html>
