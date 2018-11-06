From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:59:38 +0100
Subject: [Buildroot] [PATCH v2,1/6] wireshark: bump to version 2.6.4
In-Reply-To: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
References: <20181104101030.14402-1-fontaine.fabrice@gmail.com>
Message-ID: <ba990ffa-9913-6a0b-3bf7-eac4b216e31f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/11/18 11:10, Fabrice Fontaine wrote:
> - Remove first patch (inet_pton test removed since version 2.5.0 and
>   https://github.com/wireshark/wireshark/commit/12d63c428f973b1f7e04ad58d432d778e2035a9a)
> - Remove second patch (already in version, since
>   https://github.com/wireshark/wireshark/commit/3761ef378537f6a9e0424f7cbded7e7403ba425c)
> - Remove WIRESHARK_AUTORECONF=yes as configure.ac is not patched anymore
> - gcrypt is a mandatory dependency since version 2.4.0 and
>   https://github.com/wireshark/wireshark/commit/6b84ddee83e70aff944da084129624226b7a32fa
> - geoip support has been replaced by maxminddb since version 2.5.0 and
>   https://github.com/wireshark/wireshark/commit/a1da75c554881667dd92e11f098630f2d604872b
> - Drop includedir "hack", this is not needed anymore and wireshark is
>   now installing files in target. With this hack, build fails on:
>   wireshark: installs files in /home/fabrice/buildroot/output/target//home/fabrice/buildroot/output
>   package/pkg-generic.mk:310: recipe for target '/home/fabrice/buildroot/output/build/wireshark-2.6.4/.stamp_target_installed' failed
> - Disable all new optional features
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks. I made some small changes.

 There is currently no developer for wireshark. Are you volunteer?

 Also, upstream is converting to CMake. I looked into that myself a while ago,
but you need to build a host tool which is not really supported with cmake, so
it's a bit complicated.

 Regards,
 Arnout
