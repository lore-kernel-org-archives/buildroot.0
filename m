From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 19:54:01 +0100
Subject: [Buildroot] [PATCH 1/1] sudo: Add ldap support for sudoers rules
In-Reply-To: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
References: <1477323263-6689-1-git-send-email-cdf123@cdf123.net>
Message-ID: <20170206195401.11ccbee3@free-electrons.com>
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
> ---
>  package/sudo/Config.in | 13 +++++++++++++
>  package/sudo/sudo.mk   |  7 +++++++
>  2 files changed, 20 insertions(+)

I've applied, after removing the explicit Config.in option and instead
relying on whether BR2_PACKAGE_OPENLDAP is enabled or not to decide if
ldap support should be enabled or not in sudo.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
