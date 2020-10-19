From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 19 Oct 2020 21:11:23 +0200
Subject: [Buildroot] OpenSSL & Mosquitto on ARM Cortex M7
In-Reply-To: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>
References: <01b901d6a5ad$95b9df00$c12d9d00$@gmail.com>
Message-ID: <20201019211123.320af01b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rob,

On Mon, 19 Oct 2020 02:20:00 +0200, <rob.r374@gmail.com> wrote:

> Hello,
>
>
>
> I'm trying to include Mosquitto with OpenSSL support on Buildroot.
>
>
>
> On working Buildroot basic build, I've added packages and setup static libs
> :
>
> BR2_PACKAGE_LIBOPENSSL=y
>
> BR2_PACKAGE_MOSQUITTO=y
>
> BR2_PACKAGE_MBEDTLS=y
>
> BR2_STATIC_LIBS=y
>
> If I try to run Mosquitto tools (and MbedTLS test), I get :
>
> ~ # mosquitto_pub
>
> binfmt_flat: reference 0xffb4d0 to shared library 127, killing
> mosquitto_pub!
>
> SEGV
>
> ~ # mosquitto_sub
>
> Error: You must specify a topic to subscribe to.
>
> Use 'mosquitto_sub --help' to see usage.
>
>
>
> ~ # ssl_client2
>
> sh: can't execute 'ssl_client2': No such file or directory
>
>
>
> It's weird, because mosquitto_pub complains about shared lib, but I have
> defined static libraries only (at least I think so).
>
> In addition, mosquitto_sub works, but it seems it doesn't receive SSL
> related arguments - seems like it was not compiled with OpenSSL lib.
>
> Also, ssl_client2 or other tools from MbedTLS cannot be found.
>
>
>
> How to solve those problems ?
>
>
>
> Also I'm not sure how to check for each package - compilation, installation,
> errors, warnings etc.

Did you do/try a full rebuild after changing your config ([1])?

If the problem still exists after a full rebuild please provide your
.config or defconfig file and the buildroot version your are using...

Regards,
Peter

[1] https://buildroot.org/downloads/manual/manual.html#full-rebuild

>
>
>
> Regards,
>
> Rob.
>
>
>
>
>
>
>
