From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:45:28 +0200
Subject: [Buildroot] [PATCH v2 2/4] libssl: new virtual package
In-Reply-To: <20170624172900.3610-2-Adamduskett@outlook.com>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <20170624172900.3610-2-Adamduskett@outlook.com>
Message-ID: <20170624214528.15f8cc18@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Jun 2017 13:28:58 -0400, Adam Duskett wrote:
> libressl is API compatible with OpenSSL 1.0.1 and is almost API
> compatible with OpenSSL 1.0.2.  As such, a new virtual package is needed
> to handle having both libressl and openssl.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Removed final "." in commit title. (Thomas)
>   - Fixed indentation issues in commit message.

I still don't get what is the plan for this virtual package. We have
two options:

 - Make it a regular virtual package, like package/opengl/libgles/.
   However in this case, we must change all packages that need
   OpenSSL/LibreSSL to use a "depends on BR2_PACKAGE_LIBSSL", which is
   a bit annoying.

 - Make it a virtual package like package/jpeg/, where it has a choice
   to define which jpeg implementation should be used. This nicely
   allows packages to "select BR2_PACKAGE_LIBSSL".

Also, how are we going to handle the fact that some packages support
only OpenSSL, while some support both OpenSSL and LibreSSL.

Even if all of this doesn't get implemented in the first series, I
still would like to understand what the plan is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
