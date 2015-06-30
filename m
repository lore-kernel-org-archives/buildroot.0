From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:44:50 +0200
Subject: [Buildroot] [PATCH 1/2] openssl: support building the binary
 without MMU
In-Reply-To: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150630164450.7c9c0db0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Fri, 19 Jun 2015 12:54:33 +0200, Beno?t Th?baudeau wrote:
> The commit 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable
> apps for NOMMU" prevented the openssl binary from being built without
> MMU in order to fix a build failure without fork(). However, openssl is
> designed to support the lack of fork() with -DHAVE_FORK=0, so allow the
> openssl binary to be enabled without MMU thanks to this option.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  package/openssl/Config.in  | 3 ---
>  package/openssl/openssl.mk | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
