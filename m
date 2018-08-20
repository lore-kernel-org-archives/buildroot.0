From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:51:53 +0200
Subject: [Buildroot] [[PATCH v2 02/14] package/mender: provide sane
 values in mender.conf
In-Reply-To: <20180820130914.22377-3-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-3-mirza.krak@northern.tech>
Message-ID: <20180820165153.693ca843@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:02 +0200, Mirza Krak wrote:
> The current values that are in mender.conf will actually
> cause the Mender client to fail to start because of invalid
> values.
> 
> Provide sane default values that at least allow the Mender client
> to parse the configuration options and start running.
> 
> The values provided will actually work in a "Demo Environment",
> see https://docs.mender.io/getting-started/create-a-test-environment.
> 
> Though an entry is required in /etc/hosts to resolve the URL to the
> local IP address of the running demo server.
> 
> Example:
> 
>     echo "192.168.0.10 docker.mender.io s3.docker.mender.io" >> \
>          /etc/hosts
> 
> Above is required because the demo certificate
> (/etc/mender/server.crt) is created for https://docker.mender.io.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---
>  package/mender/mender.conf | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
