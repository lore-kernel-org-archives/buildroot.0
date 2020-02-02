From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:56:53 +0100
Subject: [Buildroot] [PATCH] package/erlang-p1-xmpp: fix host build
In-Reply-To: <20200122103401.21596-1-johan.oudinet@gmail.com>
References: <20200122103401.21596-1-johan.oudinet@gmail.com>
Message-ID: <20200202095653.1311254f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 22 Jan 2020 11:34:01 +0100
Johan Oudinet <johan.oudinet@gmail.com> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/3e594350131994df53b20d5113fefbba2e747836
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Thanks, I've applied, but I have a question below.

>  ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
>  	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
> +HOST_ERLANG_P1_XMPP_DEPENDENCIES = host-erlang-p1-xml

It is weird that there is no symmetry between the target dependencies
and host dependencies. Why don't we have the same set of packages ?

Also, it is really normal/correct for the target variant to depend on
host-erlang-p1-xml ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
