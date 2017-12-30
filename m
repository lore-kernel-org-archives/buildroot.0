From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 21:35:28 +0100
Subject: [Buildroot] [PATCH v2] wolfssl: new package
In-Reply-To: <1514046735-14732-1-git-send-email-sergio.prado@e-labworks.com>
References: <1514046735-14732-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171230213528.75330a5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Dec 2017 14:32:15 -0200, Sergio Prado wrote:
> The wolfSSL embedded SSL library is a lightweight and portable
> SSL/TLS library.
> 
> Tested on Beaglebone Black using a tool called testsuite that
> comes with wolfssl source code inside the testsuite/ directory.
> To build it, we have to pass --enable-examples in the configure,
> and then manually copy the binary to the rootfs. Also, to use
> this tool, you will we need to copy the certs/* directory to the
> rootfs.
> 
> Build-tested with test-pkg script.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
> Changes v1 -> v2:
>   - bump to version 3.13.0
>   - new version needs a toolchain with threads support
>   - added two new menu options to enable all wolfssl features
>     and SSv3 support
>   - added an explanation on why we need autoreconf
>   - removed options related to nginx, wpa_supplicant and lighttpd
> ---
>  DEVELOPERS                   |  1 +
>  package/Config.in            |  1 +
>  package/wolfssl/Config.in    | 27 +++++++++++++++++++++++++++
>  package/wolfssl/wolfssl.hash |  6 ++++++
>  package/wolfssl/wolfssl.mk   | 38 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 73 insertions(+)
>  create mode 100644 package/wolfssl/Config.in
>  create mode 100644 package/wolfssl/wolfssl.hash
>  create mode 100644 package/wolfssl/wolfssl.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
