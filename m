From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 18:28:54 +1300
Subject: [Buildroot] [V2 1/2] sngrep: fix dependency error.
In-Reply-To: <20170126213931.9987-1-aduskett@codeblue.com>
References: <20170126213931.9987-1-aduskett@codeblue.com>
Message-ID: <20170127182854.7c0fa91f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 16:39:30 -0500, Adam Duskett wrote:
> sngrep will complain if libgcrypt isn't compiled. I am not sure
> how or why I didn't notice this issue to begin with, but
> I added it as a dependency and select it in the Config.in file now.
> I also added 'depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS' as per
> baruch's suggestion.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

sngrep builds just fine for me without libgcrypt, so clearly this isn't
needed.

What however is needed is that libgcrypt is needed when gnutls support
is enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
