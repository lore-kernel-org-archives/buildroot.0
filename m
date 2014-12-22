From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Dec 2014 15:16:40 +0100
Subject: [Buildroot] [PATCH v4 02/17] package/erlang-rebar: new host
 package
In-Reply-To: <1418135662-773-3-git-send-email-johan.oudinet@gmail.com>
References: <1418135662-773-1-git-send-email-johan.oudinet@gmail.com>
 <1418135662-773-3-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20141222151640.44be2db5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue,  9 Dec 2014 15:34:07 +0100, Johan Oudinet wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> rebar is used to compile Erlang packages.
> 
> We need  host variant so as to be able to provide it to Erlang packages
> that do not bundle their own version, or bundle a broken version.
> 
> Since this is a host-only package, used only internally, we do not
> provide a Kconfig option for it. Packages that need it will depend on
> it.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> [yann.morin.1998 at free.fr: extract host-rebar to its own patch]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Thanks, patch applied.

There's one thing I've noticed though: trying to run the 'rebar' binary
doesn't work:

$ LANG=C ./output/host/usr/bin/rebar 
/usr/bin/env: escript: No such file or directory

This is obviously due to:

#!/usr/bin/env escript

at the beginning of the rebar binary, and the fact that
output/host/usr/bin is not in my PATH.
Executing ./output/host/usr/bin/escript ./output/host/usr/bin/rebar
works fine. This is not a problem for Buildroot packages, as
$(HOST_DIR)/usr/bin will be in the PATH. Not sure if it's worth fixing
for other use cases.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
