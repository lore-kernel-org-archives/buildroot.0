From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 17:51:37 +0200
Subject: [Buildroot] [PATCH v2 1/1] openzwave: fix compilation of MinOZW
In-Reply-To: <1477245551-46216-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477245551-46216-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161024175137.4e26fc16@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 19:59:11 +0200, Fabrice Fontaine wrote:
> LIBDIR was used in cpp/examples/MinOZW/Makefile to add dynamic
> libraries. However, as it was unset by default, the cross-compilation
> could fail if the host had a library such as libnss3.so in /.
> To fix this issue, this patch sets LIBDIR to top_buildir if it is unset
> 
> Fixes:
>   http://autobuild.buildroot.net/results/68719fdf1320a69310bada6d3c47654dacdb5898
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Download patch from upstream

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
