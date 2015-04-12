From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:58:40 +0200
Subject: [Buildroot] [PATCH v3 2/3] libsigrok: add host-doxygen
 dependency for C++ bindings
In-Reply-To: <1428659399-28620-3-git-send-email-bgolaszewski@baylibre.com>
References: <1428659399-28620-1-git-send-email-bgolaszewski@baylibre.com>
 <1428659399-28620-3-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150412185840.2f07e37e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Fri, 10 Apr 2015 11:49:58 +0200, Bartosz Golaszewski wrote:
> Doxygen is required to generate xml files required by libsigrokcxx
> build system.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/libsigrok/libsigrok.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied, after adding host-python (or host-python3) in the
dependencies when building the C++ bindings. Otherwise, the creation of
the C++ bindings fail, due to Python being too old: some autobuilders
only have Python 2.6, while libsigrok requires at least Python 2.7.

Committed with this fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
