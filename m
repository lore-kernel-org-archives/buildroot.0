From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 15:33:26 +0200
Subject: [Buildroot] [PATCH 5/5] package/python-mwscrape: new package
In-Reply-To: <20161006044858.27768-5-bernd.kuhls@t-online.de>
References: <20161006044858.27768-1-bernd.kuhls@t-online.de>
 <20161006044858.27768-5-bernd.kuhls@t-online.de>
Message-ID: <20161007153326.576d6e64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Oct 2016 06:48:58 +0200, Bernd Kuhls wrote:

> +config BR2_PACKAGE_PYTHON_MWSCRAPE
> +	bool "python-mwscrape"
> +	select BR2_PACKAGE_PYTHON_COUCHDB
> +	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_MWCLIENT
> +	select BR2_PACKAGE_PYTHON_PYLRU

I suspect some of those are runtime dependencies. Could you double
check this?

> +PYTHON_MWSCRAPE_DEPENDENCIES = python-couchdb \
> +	$(if $(BR2_PACKAGE_PYTHON),python-futures,) \
> +	python-mwclient \
> +	python-pylru

And update this accordingly?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
