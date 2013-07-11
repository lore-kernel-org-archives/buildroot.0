From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 12:56:01 +0200
Subject: [Buildroot] Issue with iconv_open and Linaro toolchain
In-Reply-To: <51DE78F4.9050705@wanadoo.fr>
References: <51DE78F4.9050705@wanadoo.fr>
Message-ID: <20130711125601.75b219f6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thierry Bultel,

On Thu, 11 Jul 2013 11:20:52 +0200, Thierry Bultel wrote:

> The /usr/lib/arm-linux-gnueabihf does not exist at all on the target, 
> but only in the sysroot.
> Copying it manually solves the issue, but I do not feel comfortable with 
> having a piece
> of the toolchain path on my system...
> 
> What is your point of view about this ? What would be the right way to do ?

The right way is to add a Buildroot option that copies certain gconv
modules, which are needed on (e)glibc toolchains to make iconv work
properly, and maybe generates the gconv-modules.cache (this is done
using iconvconfig, we'd have to see how to get this tool, or package
it).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
