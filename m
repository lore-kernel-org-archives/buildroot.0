From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:01:02 +0100
Subject: [Buildroot] [PATCH] package/ola: fix missing numpy
In-Reply-To: <20161124211818.14096-1-joerg.krause@embedded.rocks>
References: <20161124211818.14096-1-joerg.krause@embedded.rocks>
Message-ID: <20161125220102.0e613094@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 22:18:18 +0100, J?rg Krause wrote:
> OLAs RDM test option needs NumPy.
> 
> Note that we need to pass `ac_cv_have_pymod_numpy=yes` as NumPy builds some
> shared libraries and ola checks for NumPy using a host Python test program
> which fails with 'wrong ELF class'.
> 
> Fixes:
> http://autobuild.buildroot.net/results/750/750c9bcc753e2c1b7b05d6c43fabf4c405e15f04/
> http://autobuild.buildroot.net/results/24a/24ada1e0ec695cb12028048728a9d1e2bcf75a03/
> http://autobuild.buildroot.net/results/111/111c5f3eed6a5931de27a1b0b02be6e2114198e6/
> .. and more.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/ola/Config.in | 2 ++
>  package/ola/ola.mk    | 4 ++++
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
