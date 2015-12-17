From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:08:46 +0100
Subject: [Buildroot] [PATCH 1/4] package/dnsmasq: do not select Lua,
	depend on it
In-Reply-To: <42b88076d63c1a1043ee22090f819d1ad09df1d0.1450389598.git.yann.morin.1998@free.fr>
References: <cover.1450389598.git.yann.morin.1998@free.fr>
 <42b88076d63c1a1043ee22090f819d1ad09df1d0.1450389598.git.yann.morin.1998@free.fr>
Message-ID: <20151217230846.729a6caa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Dec 2015 23:06:33 +0100, Yann E. MORIN wrote:

>  config BR2_PACKAGE_DNSMASQ_LUA
>  	bool "Lua scripting support"
> -	select BR2_PACKAGE_LUA
> +	depends on BR2_PACKAGE_LUA
>  	help
>  	  Enable Lua scripting for dnsmasq
>  
> +comment "Lau scripting support needs the Lua interpreter"

Lau -> Lua

But I believe this comment is useless. It is obvious that if we want to
do Lua stuff, you must enable Lua.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
