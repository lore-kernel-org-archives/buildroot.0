From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:16:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/exim: fix build error with
 external arc toolchain due to missing libnsl
In-Reply-To: <1427574832-20384-1-git-send-email-bernd.kuhls@t-online.de>
References: <1427574832-20384-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150329141652.7e3fcf79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Alexey,

On Sat, 28 Mar 2015 21:33:52 +0100, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/331/331ed781b422448205fb9e7c9730ec0c438d6306/
> http://autobuild.buildroot.net/results/402/402d64965ac7ac6e1d4e1990080394958802fe8c/
> http://autobuild.buildroot.net/results/960/9605bac2972d3e3d3fb91947ae6921e89210247b/
> http://autobuild.buildroot.net/results/6b6/6b61ea80a3a6dcead233c4b408eba8b8d647e841/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/exim/exim.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

Alexey, could you please enable UCLIBC_HAS_LIBNSL_STUB=y in the uClibc
configuration used for the ARC external toolchains? Generally speaking,
if you could have a look at the differences between the uClibc
configuration you're using, and the default Buildroot one, it would be
useful. We cannot support all the little variations of the uClibc
configuration, so if you could use a configuration that is at least a
super-set of the features enabled in the uClibc configuration used by
default in Buildroot, it would really make things easier.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
