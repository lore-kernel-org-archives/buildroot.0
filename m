From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:52:34 +0200
Subject: [Buildroot] [PATCH 1/5] support/script/scancpan: add support
 PREFER_STATIC_LIB
In-Reply-To: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140717205234.610cfe1b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 17 Jul 2014 18:32:58 +0200, Francois Perrad wrote:
> Perl extensions are loaded at runtime with dlopen(), so it does not
> make sense to even build extensions that are written in C.
> 
> Perl module written in C or with a dependency on a module written in C
> is not available when doing a static build.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/scancpan | 32 ++++++++++++++++++++++++++------
>  1 file changed, 26 insertions(+), 6 deletions(-)

Applied, with an improved commit log. The commit log was not explaining
what the commit was doing (i.e changing scancpan to automatically
generate a !BR2_PREFER_STATIC_LIB dependency).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
