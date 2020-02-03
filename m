From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 15:38:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/network-manager-openvpn: new
 package
In-Reply-To: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
 (Michel Alex's message of "Fri, 17 Jan 2020 07:46:25 +0000")
References: <8b51f7b227fd3cef7bc968a0c4f0eebd018d6655.camel@wiedemann-group.com>
Message-ID: <87h8073fdt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michel" == Michel Alex <Alex.Michel@wiedemann-group.com> writes:

Hello,

Sorry for the slow response!

 > From: Alex Michel <alex.michel@wiedemann-group.com>
 > This package provides OpenVPN plugin for network manager

 > Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
 > ---
 >  package/network-manager-openvpn/Config.in     |  5 ++++
 >  .../network-manager-openvpn.hash              |  4 ++++
 >  .../network-manager-openvpn.mk                | 23 +++++++++++++++++++
 >  package/network-manager/Config.in             |  3 +++
 >  4 files changed, 35 insertions(+)
 >  create mode 100644 package/network-manager-openvpn/Config.in
 >  create mode 100644 package/network-manager-openvpn/network-manager-openvpn.hash
 >  create mode 100644 package/network-manager-openvpn/network-manager-openvpn.mk

 > diff --git a/package/network-manager-openvpn/Config.in b/package/network-manager-openvpn/Config.in
 > new file mode 100644
 > index 0000000000..8f13d78d48
 > --- /dev/null
 > +++ b/package/network-manager-openvpn/Config.in
 > @@ -0,0 +1,5 @@
 > +config BR2_PACKAGE_NETWORK_MANAGER_OPENVPN
 > +	bool "OpenVPN support"
 > +	depends on BR2_PACKAGE_NETWORK_MANAGER

What about openvpn? Looking at the code, it seems to execute
/usr/bin/openvpn - So it should depend on BR2_PACKAGE_OPENVPN


 > +	help
 > +	  This option enables OpenVPN plugin

It would be good with an upstream URL here.


 > +++ b/package/network-manager-openvpn/network-manager-openvpn.mk
 > @@ -0,0 +1,23 @@
 > +################################################################################
 > +#
 > +# network-manager-openvpn
 > +#
 > +################################################################################
 > +
 > +NETWORK_MANAGER_OPENVPN_VERSION_MAJOR = 1.8
 > +NETWORK_MANAGER_OPENVPN_VERSION = $(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR).10
 > +NETWORK_MANAGER_OPENVPN_SOURCE = NetworkManager-openvpn-$(NETWORK_MANAGER_OPENVPN_VERSION).tar.xz
 > +NETWORK_MANAGER_OPENVPN_SITE = https://download.gnome.org/sources/NetworkManager-openvpn/$(NETWORK_MANAGER_OPENVPN_VERSION_MAJOR)
 > +NETWORK_MANAGER_OPENVPN_INSTALL_STAGING = YES

Why? Does this provide a library?


 > +++ b/package/network-manager/Config.in
 > @@ -61,6 +61,9 @@ config BR2_PACKAGE_NETWORK_MANAGER_OVS
 >  	help
 >  	  This option enables support for OpenVSwitch
 
 > +# source the OpenVPN plugin
 > +	source "package/network-manager-openvpn/Config.in"
 > +
 >  endif

Elsewhere in Buildroot we simple add such extra/optional components
after the main package instead of including them from the Config.in of
the main package. Can you please do that as well here?

-- 
Bye, Peter Korsgaard
