From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Mar 2019 23:06:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/mongodb: disable on powerpc64
In-Reply-To: <20190309211236.15682-1-fontaine.fabrice@gmail.com>
References: <20190309211236.15682-1-fontaine.fabrice@gmail.com>
Message-ID: <20190311230648.2909295d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Mar 2019 22:12:36 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> As stated in SConstruct, the altivec runtime test breaks
> cross-compilation: "This checks for an altivec optimization we use in
> full text search. Different versions of gcc appear to put output bytes
> in different parts of the output vector produced by vec_vbpermq.  This
> configure check looks to see which format the compiler produces. NOTE:
> This breaks cross compiles, as it relies on checking runtime
> functionality for the environment we're in."
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/162198617979a83b66f70ed6013251942ed04d67
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mongodb/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
