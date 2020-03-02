From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Mon, 2 Mar 2020 20:05:29 +0100
Subject: [Buildroot] [PATCH] package/mini-snmpd: bump to version 1.5
In-Reply-To: <20200229180345.1791229-1-alexander.sverdlin@gmail.com>
References: <20200229180345.1791229-1-alexander.sverdlin@gmail.com>
Message-ID: <53cd957b-996e-75fd-84dc-093d891fd47b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

please ignore the patch, I've sent version 1.6 update patch already.

On 29/02/2020 19:03, Alexander Sverdlin wrote:
> v1.5 changelog:
> 
> Major feature release.  Support for TCP-MIB, UDP-MIB, IP-MIB,
> ifXTable with 64-bit counters.
> 
> - Majority of new features from [NDM Systems][]
> - CVE fixes from [Cisco Talos Intelligence Group][talos]
> 
> - Add support for ifXTable (64-bit counters), from NDM Systems
> - Add support for TCP-MIB, from NDM Systems
> - Add support for UDP-MIB, from NDM Systems
> - Add support for IP-MIB, from NDM Systems
> - Add support for ifType
> - Add support for ifMtu
> - Binary and man page renamed: `mini_snmpd` --> `mini-snmpd`
> - New command line option `-l LEVEL` replaces `--verbose`
> - New command line option `-v` to show program version
> - Create PID file when daemon is ready to receive signals
> - Add support for systemd unit file on Linux
> - Add support for /etc/mini-snmpd.conf, disabled by default
> 
> - CVE-2020-6060: Fix stack overflow in client connection handler
> - CVE-2020-6059: Fix out-of-bounds read in parsing of SNMP packet
> - CVE-2020-6058: Fix out-of-bounds read in parsing of SNMP packet
> - Let `-s` flag control use of syslog, when running in foreground
> - Removed all (known) GNU:isms; i.e., `__progname` and `%m`
> 
> Post-release fixes:
> 
> Fix #16: Regression in ifTable for non-Ethernet
> Remove developer debug messsages
> Fix #17: Missing freeifaddrs() causing major memory leak
> Remove a few unnecessary strdup()
> Initialize stack variables to zero to not confuse inet_ntop()
> Use consistent timeout setting between command line and config file
> Fix duplicate DISTCLEANFILES
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  ...n-in-ifTable-for-non-Ethernet-interf.patch | 77 ++++++++++++++++++
>  ...d-zero-byte-before-unsigned-integers.patch | 31 -------
>  ...002-Remove-developer-debug-messsages.patch | 40 ++++++++++
>  ...igned-integers-to-have-an-extra-byte.patch | 28 -------
>  ...reeifaddrs-causing-major-memory-leak.patch | 29 +++++++
>  ...0004-Remove-a-few-unnecessary-strdup.patch | 80 +++++++++++++++++++
>  ...-variables-to-zero-to-not-confuse-in.patch | 58 ++++++++++++++
>  ...imeout-setting-between-command-line-.patch | 56 +++++++++++++
>  .../0007-Fix-duplicate-DISTCLEANFILES.patch   | 32 ++++++++
>  package/mini-snmpd/mini-snmpd                 |  2 +
>  package/mini-snmpd/mini-snmpd.hash            |  2 +-
>  package/mini-snmpd/mini-snmpd.mk              | 10 ++-
>  package/mini-snmpd/mini-snmpd.service         | 12 ---
>  13 files changed, 382 insertions(+), 75 deletions(-)
>  create mode 100644 package/mini-snmpd/0001-Fix-16-Regression-in-ifTable-for-non-Ethernet-interf.patch
>  delete mode 100644 package/mini-snmpd/0001-Prepend-zero-byte-before-unsigned-integers.patch
>  create mode 100644 package/mini-snmpd/0002-Remove-developer-debug-messsages.patch
>  delete mode 100644 package/mini-snmpd/0002-mib.c-allow-unsigned-integers-to-have-an-extra-byte.patch
>  create mode 100644 package/mini-snmpd/0003-Fix-17-Missing-freeifaddrs-causing-major-memory-leak.patch
>  create mode 100644 package/mini-snmpd/0004-Remove-a-few-unnecessary-strdup.patch
>  create mode 100644 package/mini-snmpd/0005-Initialize-stack-variables-to-zero-to-not-confuse-in.patch
>  create mode 100644 package/mini-snmpd/0006-Use-consistent-timeout-setting-between-command-line-.patch
>  create mode 100644 package/mini-snmpd/0007-Fix-duplicate-DISTCLEANFILES.patch
>  create mode 100644 package/mini-snmpd/mini-snmpd
>  delete mode 100644 package/mini-snmpd/mini-snmpd.service

[...]
