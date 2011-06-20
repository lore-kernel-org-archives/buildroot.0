From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jun 2011 17:59:51 +0200
Subject: [Buildroot] [PATCH 24/26] Improve TARGETS handling for
 bootloaders and kernel
In-Reply-To: <4DFF60C7.3010802@lucaceresoli.net>
References: <cover.1306782275.git.thomas.petazzoni@free-electrons.com>
 <c1adbad069c35089a9ff5d9c8fc930e483b4b3d4.1306782275.git.thomas.petazzoni@free-electrons.com>
 <4DFF60C7.3010802@lucaceresoli.net>
Message-ID: <20110620175951.5dfbc4b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 20 Jun 2011 17:01:27 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> This breaks all packages in subdirectories, such as
> package/multimedia/ffmpeg, for which $(4) == "package/multimedia".
> 
> This can be fixed as:
> 
> -else ifeq ($(4),package)
> +else ifeq ($(firstword $(subst /, ,$(4))),package)
> 
> or, even more simply:
> 
> -else ifeq ($(4),package)
> +else

Ah, good catch. I indeed didn't test those packages. Thanks for the
review and testing, this is very much appreciated!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
