From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 11:45:53 +0200
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <6362092b-e799-47b1-9066-97b8118d27b5@cesnet.cz>
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
 <6362092b-e799-47b1-9066-97b8118d27b5@cesnet.cz>
Message-ID: <20180823114553.31dca123@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Aug 2018 11:24:47 +0200, Jan Kundr?t wrote:

> Are you sure that this is a correct fix? From reading the 
> FindThreads.cmake, passing OFF looks like it results in not feeding the 
> -pthread option to the compiler. That breaks some scenarios such as ASAN, 
> see [1] for details.

At least, we are doing it in a number of other packages:

package/exiv2/exiv2.mk:EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/i2pd/i2pd.mk:I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/librtlsdr/librtlsdr.mk:LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/rabbitmq-c/rabbitmq-c.mk:RABBITMQ_C_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

It doesn't mean it's correct, but at least that's how we are working
around this problem at the moment. If it's not the correct way, then we
should fix it globally :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
