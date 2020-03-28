From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Sat, 28 Mar 2020 14:04:29 +0000
Subject: [Buildroot] [PATCH v5 1/1] package/nodejs: Use zlib headers
 from HOST_ZLIB_SRCDIR for host-nodejs
In-Reply-To: <20200218031521.32988-1-james.hilliard1@gmail.com>
References: <20200218031521.32988-1-james.hilliard1@gmail.com>
Message-ID: <d3898ddf-7c4e-d282-fa9a-68d125ef12b9@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18.02.2020 05:15, James Hilliard wrote:

> The nodejs configure.py file orders zlib headers before the bundled ICU
> headers. The zlib headers happen to be located in the system include
> directory, next to some system ICU headers (not bundled). If these are
> built before nodejs is, nodejs will get confused and try to use the
> system ICU headers instead of the bundled ones.
> 
> Fix this by using headers from HOST_ZLIB_SRCDIR so that the ICU headers
> in the system include directory are not used.
> 
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Hello,

Just FYI , we had issues building our distro based on 2020.02 buildroot, 
but this patch fixes the host node-js build problem.

So thanks for fixing it,

Eugen
