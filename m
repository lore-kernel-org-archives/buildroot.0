From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:04:37 +0100
Subject: [Buildroot] [PATCH 1/1] apache sbindir
In-Reply-To: <20180227114033.7746-1-chrismcc@gmail.com>
References: <20180227114033.7746-1-chrismcc@gmail.com>
Message-ID: <20180227220437.5691b327@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title should be:

	apache: pass explicit sbindir

On Tue, 27 Feb 2018 03:40:33 -0800, Christopher McCrory wrote:

> The apache configure script help indicates that the sbindir is PREFIX/sbin , but it actually uses PREFIX/bin. I suspect most people would expect httpd to be /usr/sbin/httpd , not /usr/bin/httpd.

This needs to be wrapped at 72 characters. Also, it's good avoid first
person sentences. So instead of "I suspect" you could say: "Most people
probably expect httpd to be located in /usr/sbin/httpd".

> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index e1b1a209cb..010ec31c33 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -29,6 +29,7 @@ APACHE_MPM = worker
>  endif
>  
>  APACHE_CONF_OPTS = \
> +	--sbindir=/usr/sbin \

Perhaps a quick comment would be appropriate above APACHE_CONF_OPTS,
like:

# Explicitly pass sbindir, because apache configure script defines it
# to PREFIX/bin, which doesn't make much sense

Or something like that.

Could you respin an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
