From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 15 Apr 2021 11:34:01 +0200
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/1=5D_package/avahi=3A__allow_di?=
 =?utf-8?q?sabling_default_services?=
In-Reply-To: <20201204174507.8483-1-fl@n621.de>
Message-ID: <101e-60780880-3-3d17a340@6714720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Florian, All

On Friday, December 04, 2020 18:45 CET, Florian Larysch <fl@n621.de> wrote: 
 
> By default, Avahi installs service definitions for SSH and SFTP, but
> those might not be present on all systems. Add an option for disabling
> them.
> 

I have this removal in all my post-build scripts. So it would be great to have it as an option.
I would even suggest to always remove the .service files and make it optional. I think an embedded system should
explicitly enable services.

>  
> +config BR2_PACKAGE_AVAHI_DEFAULT_SERVICES
> +	bool "install default service definitions"
> +	depends on BR2_PACKAGE_AVAHI_DAEMON
> +	default y

If kept as an Option: default this to n?


Regards,
Michael
