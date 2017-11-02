From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 21:23:04 +0100
Subject: [Buildroot] [PATCH 1/1] packages/gpm: Fix FTBFS with glibc 2.26
In-Reply-To: <20171102194834.30515-1-petr.vorel@gmail.com>
References: <20171102194834.30515-1-petr.vorel@gmail.com>
Message-ID: <20171102212304.00451a37@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for providing a fix for this problem!

On Thu,  2 Nov 2017 20:48:34 +0100, Petr Vorel wrote:
> Use sigemptyset API instead of __sigemptyset
> __sigemptyset has been removed from glibc public
> API headers in upcoming (2.26) release onwards
> 
> Patch taken from
> https://github.com/telmich/gpm/pull/20/commits/fdc42770596e25749f7e2ce0ea97882177397167
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Patch also has been adopted by Fedora:
> http://pkgs.fedoraproject.org/cgit/rpms/gpm.git/commit/?id=dbf661f05db3f83ed1f3e9d86a368a4811d3a971
> ---
>  ...-sigemptyset-API-instead-of-__sigemptyset.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/gpm/0004-Use-sigemptyset-API-instead-of-__sigemptyset.patch

A few things were not entirely correct:

 - The commit log should not have a Signed-off-by from Khem

 - The patch description should have had your Signed-off-by

 - The commit log should have included a reference to an autobuilder
   failure

I've applied after fixing those minor nits.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
