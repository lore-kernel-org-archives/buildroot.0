From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:03:40 +0100
Subject: [Buildroot] [PATCH 1/1] json-for-modern-cpp: use include.zip
In-Reply-To: <20181231222206.69527-1-aduskett@gmail.com>
References: <20181231222206.69527-1-aduskett@gmail.com>
Message-ID: <20190101110340.6600f4de@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Happy New Year!

On Mon, 31 Dec 2018 17:22:06 -0500, aduskett at gmail.com wrote:

> diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> index cff01db74c..254e513035 100644
> --- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
> +++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
> @@ -1,3 +1,3 @@
> -# Locally computed
> -sha256	e0b1fc6cc6ca05706cce99118a87aca5248bd9db3113e703023d23f044995c1d	json-v3.5.0.tar.gz
> -sha256	7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd	LICENSE.MIT
> +# From https://github.com/nlohmann/json/releases
> +sha256	3564da9c5b0cf2e032f97c69baedf10ddbc98030c337d0327a215ea72259ea21	include.zip
> +sha256	8e118538f66f1f13c78a215ddb7f9c1b83e835702fcd5a8586f77bb7455a1b99	json.hpp

While this looks really nice, a file named "include.zip" with no
version in the name, is going to be very annoying to handle. Indeed,
every time you will bump the version, the file name will be the same.
Thanks to the hash, the right version of the file will be
re-downloaded, but this will entirely break sources.buildroot.net, in
the sense that they will not be able to provide include.zip for older
Buildroot versions, that use an older version of json-for-modern-cpp.

So at this point, I prefer to keep the existing situation. I encourage
you to get in touch with upstream to see if they are willing to fix the
name of include.zip into something more sensible, that includes the
version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
