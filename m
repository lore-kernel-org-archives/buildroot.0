From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jan 2021 22:39:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh: drop cmake workaround
In-Reply-To: <20210104171231.1621110-1-fontaine.fabrice@gmail.com>
References: <20210104171231.1621110-1-fontaine.fabrice@gmail.com>
Message-ID: <20210125223930.0066b5e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Jan 2021 18:12:31 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop workaround for cmake < 3.10 (not needed since commit
> d4773b610a40be1d3ac7d793033abaf4eb2491ed)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libssh/libssh.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

However, a quick git grep shows:

package/exiv2/exiv2.mk:EXIV2_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/i2pd/i2pd.mk:# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
package/i2pd/i2pd.mk:I2PD_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/librtlsdr/librtlsdr.mk:LIBRTLSDR_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/paho-mqtt-cpp/paho-mqtt-cpp.mk:PAHO_MQTT_CPP_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
package/poppler/poppler.mk:POPPLER_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/rabbitmq-c/rabbitmq-c.mk:# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
package/rabbitmq-c/rabbitmq-c.mk:RABBITMQ_C_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/uvw/uvw.mk:UVW_CONF_OPTS = -DTHREADS_PTHREAD_ARG=OFF
package/xerces/xerces.mk:# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
package/xerces/xerces.mk:XERCES_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
package/znc/znc.mk:# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
package/znc/znc.mk:ZNC_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF

So there's perhaps some more cleaning that is possible ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
