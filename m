From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 15:07:12 +0100
Subject: [Buildroot] [PATCH v4 1/3] ustream-ssl: new package
In-Reply-To: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
References: <1476702145-25280-1-git-send-email-Rahul.Jain@imgtec.com>
Message-ID: <20161204150712.1ab60e17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 16:32:23 +0530, Rahul Jain wrote:
> ustream-ssl has support for polarssl and cyassl
> but since polarssl is made obsolete by mbedtls and cyassl
> is not present in buildroot, we have not added support for it.
> 
> Signed-off-by: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
> Signed-off-by: Rahul Jain <Rahul.Jain@imgtec.com>

This new package is causing a bunch of build failures:

   http://autobuild.buildroot.net/?reason=ustream-ssl-ec80adaa1b47f28d426fa19c692011ce60b992d6

They all look like this:

In file included from /home/test/autobuild/run/instance-0/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/mbedtls/net.h:32:0,
                 from /home/test/autobuild/run/instance-0/output/build/ustream-ssl-ec80adaa1b47f28d426fa19c692011ce60b992d6/ustream-mbedtls.h:22,
                 from /home/test/autobuild/run/instance-0/output/build/ustream-ssl-ec80adaa1b47f28d426fa19c692011ce60b992d6/ustream-internal.h:25,
                 from /home/test/autobuild/run/instance-0/output/build/ustream-ssl-ec80adaa1b47f28d426fa19c692011ce60b992d6/ustream-ssl.c:25:
/home/test/autobuild/run/instance-0/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/usr/include/mbedtls/ssl.h:545:5: error: unknown type name 'mbedtls_time_t'
     mbedtls_time_t start;       /*!< starting time      */

Could you have a look and submit a patch to fix this issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
