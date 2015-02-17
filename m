From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Feb 2015 14:00:45 +0100
Subject: [Buildroot] [PATCH] gnutls: make sure librt detection doesn't
 poison the linker flags
In-Reply-To: <1423948731-24850-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423948731-24850-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150217140045.65757771@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Feb 2015 22:18:51 +0100, Thomas Petazzoni wrote:
> Just like we're passing --with-libpthread-prefix, we also need to pass
> --with-librt-prefix in order to avoid having the gnutls build system
> detect the librt in /usr/lib, and pass -L/usr/lib to the linker flags.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/fa5/fa58602cb78ffe3ae4ee389ef5cf5a37b7657c4c/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gnutls/gnutls.mk | 1 +
>  1 file changed, 1 insertion(+)

Since the issue occurred again in the autobuilder, I applied this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
