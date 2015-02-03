From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:56:29 +0100
Subject: [Buildroot] [PATCH v6 16/16] ejabberd: new package.
In-Reply-To: <1421055140-5092-17-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-17-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203105629.0abbbe46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:20 +0100, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Applied, with a number of changes, please check the result is correct.

    [Thomas:
     - Adjust the comment about the dependency on erlang
     - Fix license to be 'GPLv2+ with OpenSSL exception' and not just 'GPLv2+'
     - Use double quotes instead of simple quotes in the .mk file.
     - Don't use the EJABBERD_MAKE_ENV variable, since it's not defined
       anywhere.
     - Remove the 0007-fix-init.patch patch, since we're not using the
       init script provided by ejabberd, and rename
       0008-fix-install-permissions.patch to
       0007-fix-install-permissions.patch.]

One question below.


> +EJABBERD_DEPENDENCIES = openssl host-erlang-lager erlang-lager \

I'm interested in hearing a bit more about the host-erlang-lager
dependency. Why would ejabberd need a logging framework built for the
host? This seems weird.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
