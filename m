From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Jul 2015 11:12:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/upmpdcli: Add patch to fix
 OPEN_MAX build error
In-Reply-To: <1437293332-4918-1-git-send-email-joerg.krause@embedded.rocks>
References: <1437293332-4918-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150719111238.5a4f3a34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 19 Jul 2015 10:08:52 +0200, J?rg Krause wrote:
> When building upmpdcli with certain toolchains using the compiler flag
> -std=c++0x let gcc not define "linux" or "__linux", but "__linux__". Therefore,
> the Linux-specific code in closefrom.cpp is not used and the build fails.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d66/d660a9409552b3e1ad9e3ed716386fd0a67fd8db
> http://autobuild.buildroot.net/results/f19/f19e843cdcc968a72919ca3792a90dd40552bd59
> http://autobuild.buildroot.net/results/a77/a776001dae51c4dae1f25b3a9bf9a9fe2ca69003
> http://autobuild.buildroot.net/results/3e7/3e7590566ed3cc7a1dd412fb66b7b987e847aa25
> 
> and many more.
> 
> Pull request is open on github [1].
> 
> [1]
> https://github.com/medoc92/upmpdcli/pull/15
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> Changes v1 -> v2:
>   - revised patch (suggested by Thomas)
> ---
>  .../0001-Add-conditional-check-for-__linux__.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
