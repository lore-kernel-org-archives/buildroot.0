From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 10:23:10 +1300
Subject: [Buildroot] [V2 03/10] janus-gateway: Make audio bridge plugin
 optional.
In-Reply-To: <20170124203139.15919-3-aduskett@codeblue.com>
References: <20170124203139.15919-1-aduskett@codeblue.com>
 <20170124203139.15919-3-aduskett@codeblue.com>
Message-ID: <20170125102310.5f050cf1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Jan 2017 15:31:32 -0500, Adam Duskett wrote:
> Currently janus-gateway is built by default with the audio bridge plugin.
> This causes a example config file to be placed on the target filing system
> that the user may not need or want.

I'm not sure to understand this config file story. Why does it matter?
Are these plugin options only installing a config file, or also a
plugin library or something like this?

What is the filesystem size contribution of each plugin? Is it
significant enough to justify having all those additional plugin
options?

> +config BR2_PACKAGE_JANUS_PLUGIN_AUDIO_BRIDGE
> +	bool "janus audio bridge plugin"
> +	default n

Remove "janus" from the prompt: those options are already indented
under the main janus option, so there is no point in repeating that.

And remove the "default n", as it's the default.

I'm just wondering if we shouldn't use "default y" instead, in order to
preserve backward compatibility. But that kind of violates the general
Buildroot rule of "let's build a minimal thing by default". Since I'm
not too strict on backward compatibility, I'd say leave them disabled
by default (but others might disagree).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
