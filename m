From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Feb 2017 22:54:16 +0100
Subject: [Buildroot] [PATCH] openswan: fix autobuild failures with
 uClibc-ng
In-Reply-To: <20170213213045.GA13499@waldemar-brodkorb.de>
References: <20170213213045.GA13499@waldemar-brodkorb.de>
Message-ID: <20170213225416.73d2521f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 22:30:45 +0100, Waldemar Brodkorb wrote:
> Add patch to fix following autobuild failures:
> 
> Fixes:
>   http://autobuild.buildroot.net/results/31cf680c48bec8ba4450a6fe2156cb441c4dd660
>   http://autobuild.buildroot.net/results/95220f231810cb12ba97a6b44af79f84af706c82
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-uClibc-ng-is-compatible-to-glibc.patch    | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/openswan/0001-uClibc-ng-is-compatible-to-glibc.patch

Thanks for the patch. While it is nice to fix this warning, there are
plenty of other warnings spit out by the openswan build process. I
believe the real thing to fix is the usage of -Werror by openswan.
Maybe passing WERROR=' ' on the command line is enough?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
