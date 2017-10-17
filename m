From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 23:06:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcpprestsdk: new package
In-Reply-To: <20171017205308.28529-1-Adamduskett@outlook.com>
References: <20171017205308.28529-1-Adamduskett@outlook.com>
Message-ID: <20171017230652.0f8b95f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 16:53:08 -0400, Adam Duskett wrote:

> +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL

Meh:

package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
package/libressl/Config.in:1:	symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL
package/openssl/Config.in:1:error: recursive dependency detected!
package/openssl/Config.in:1:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBRESSL
package/libressl/Config.in:1:	symbol BR2_PACKAGE_LIBRESSL depends on BR2_PACKAGE_OPENSSL

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
