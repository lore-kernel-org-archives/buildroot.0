From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Mar 2012 14:20:59 +0100
Subject: [Buildroot] [PATCH 1/1] libatomic_ops: make it available only
	on supported architectures
In-Reply-To: <a1b971e7c697905b1a05aea2e005f00626c42ee1.1332241780.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 20 Mar 2012 12:11:04 +0100")
References: <cover.1332241780.git.thomas.petazzoni@free-electrons.com>
 <cover.1332241780.git.thomas.petazzoni@free-electrons.com>
 <a1b971e7c697905b1a05aea2e005f00626c42ee1.1332241780.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vclzjtms.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> libatomic_ops build fails on architectures such as MIPS or SuperH that
 Thomas> are not supported. So we make it possible to select the libatomic_ops
 Thomas> package only for the architectures that are known to be supported.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libatomic_ops/Config.in |    1 +
 Thomas>  package/libdrm/Config.in        |    5 ++++-
 Thomas>  2 files changed, 5 insertions(+), 1 deletions(-)

 Thomas> diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
 Thomas> index b9f14d1..c24cf46 100644
 Thomas> --- a/package/libatomic_ops/Config.in
 Thomas> +++ b/package/libatomic_ops/Config.in
 Thomas> @@ -1,4 +1,5 @@
 Thomas>  config BR2_PACKAGE_LIBATOMIC_OPS
 Thomas>  	bool "libatomic_ops"
 Thomas> +	depends on BR2_arm || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64

It seems like you forgot BR2_armeb - I've added that and committed,
thanks.

-- 
Bye, Peter Korsgaard
