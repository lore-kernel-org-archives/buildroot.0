From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 10:15:58 +1300
Subject: [Buildroot] [V2 02/10] janus-gateway: Make sofia-sip a optional
 dependency.
In-Reply-To: <20170124203139.15919-2-aduskett@codeblue.com>
References: <20170124203139.15919-1-aduskett@codeblue.com>
 <20170124203139.15919-2-aduskett@codeblue.com>
Message-ID: <20170125101558.1b2dcfdf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 15:31:31 -0500, Adam Duskett wrote:

> +if BR2_PACKAGE_JANUS_GATEWAY
> +
> +comment "janus-gateway plugins"
> +
> +config BR2_PACKAGE_JANUS_PLUGIN_SIP
> +	bool "janus sip gateway plugin"

You should select the SOFIA_SIP package here, and inherit its
dependencies.

> +	default n

Not needed, this is the default (applies to all other patches).

Also, since you no longer select the SOFIA_SIP package from the
top-level janus-gateway option, you may want to double check if all the
janus-gateway "depends on" are still necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
