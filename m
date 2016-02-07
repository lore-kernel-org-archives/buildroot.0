From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:04:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/procps-ng: Fix install,
 procps-ng does not use /usr/bin anymore
In-Reply-To: <1454365287-4697-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454365287-4697-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207220445.79787a46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon,  1 Feb 2016 23:21:27 +0100, Bernd Kuhls wrote:
> We do not need to move binaries around anymore since this commit:
> https://gitlab.com/procps-ng/procps/commit/430b559ba2826f80dffa840622ae0fc744000b13
> 
> Removing PROCPS_NG_CONF_OPTS completely leads to binaries being
> installed to /usr/bin, we have to keep an empty --exec-prefix to have
> binaries in /bin:
> 
> libtool: install: /usr/bin/install -c free /home/bernd/buildroot/output/target/bin/free
> libtool: install: /usr/bin/install -c pgrep /home/bernd/buildroot/output/target/bin/pgrep
> libtool: install: /usr/bin/install -c pkill /home/bernd/buildroot/output/target/bin/pkill
> libtool: install: /usr/bin/install -c pmap /home/bernd/buildroot/output/target/bin/pmap
> libtool: install: /usr/bin/install -c pwdx /home/bernd/buildroot/output/target/bin/pwdx
> libtool: install: /usr/bin/install -c tload /home/bernd/buildroot/output/target/bin/tload
> libtool: install: /usr/bin/install -c uptime /home/bernd/buildroot/output/target/bin/uptime
> libtool: install: /usr/bin/install -c vmstat /home/bernd/buildroot/output/target/bin/vmstat
> libtool: install: /usr/bin/install -c w /home/bernd/buildroot/output/target/bin/w
> libtool: install: /usr/bin/install -c pidof /home/bernd/buildroot/output/target/bin/pidof
> libtool: install: /usr/bin/install -c kill /home/bernd/buildroot/output/target/bin/kill
> libtool: install: /usr/bin/install -c slabtop /home/bernd/buildroot/output/target/bin/slabtop
> libtool: install: /usr/bin/install -c watch /home/bernd/buildroot/output/target/bin/watch
> libtool: install: /usr/bin/install -c top/top /home/bernd/buildroot/output/target/bin/top
> 
> Fixes
> http://autobuild.buildroot.net/results/ab7/ab7ed83d60823c1b023c7b76fcbe9c20d537ed4c//
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: Removed unneeded options from PROCPS_NG_CONF_OPTS (Thomas)

I've applied, after changing the empty exec-prefix to use
--exec-prefix=/ instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
