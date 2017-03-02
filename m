From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 16:36:48 +0100
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
In-Reply-To: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
References: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
Message-ID: <20170302163648.7c7f6105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Oct 2016 10:34:23 -0500, Chris Frederick wrote:
> Added Config.in options to enable/disable the option, and check options
> in sudo.mk to add openldap as a dependancy and compile with --with-ldap.
> 
> When sudo is built with ldap, /etc/sudoers is only read in for defaults,
> all rules need to be provided via ldap which is configured by the user
> in /etc/ldap.conf.
> 
> Since the user explicitly has to provide /etc/ldap.conf, we use 'depends
> on' so that the user is obliged to explicitly enable openldap before the
> option becomes visible.
> 
> Signed-off-by: Chris Frederick <cdf123@cdf123.net>

The sudo/ldap support causes some build failures in static linking
configurations. See:
http://autobuild.buildroot.net/results/483/4830c69cc6a62080e1516f0d9009c2ba619c23c1/build-end.log
for an example.

From a quick look, it seems like sudo doesn't use pkg-config to
discover the ldap library, and therefore doesn't know that ldap needs
to be linked with openssl. But that's really a 5 seconds look at the
build error.

Could you have a closer look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
