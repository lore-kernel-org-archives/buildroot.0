From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Thu, 28 Mar 2019 07:27:40 +0000
Subject: [Buildroot] Buildroot autobuilder failures with Temporary failure
 in name resolution [was RE: [arc-buildroot] [autobuild.buildroot.net] Your
 build results for 2019-03-27]
Message-ID: <4881796E12491D4BB15146FE0209CE6468239BF0@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Giulio,

> -----Original Message-----
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Sent: Thursday, March 28, 2019 10:01 AM
> To: ARC Maintainers <arc-buildroot@synopsys.com>
> Subject: [arc-buildroot] [autobuild.buildroot.net] Your build results for 2019-03-27
> 
> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2019-03-27, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Results for the 'master' branch
> ===============================
> 
> Build failures related to your architectures:
> 
>          arc |      glibc-arc-2018.09-release | https://urldefense.proofpoint.com/v2/url?u=http-
> 3A__autobuild.buildroot.net_results_bb2e4bb000c8f7d31cf37c7d765d3554e7dfe3ea&d=DwICAg&c=DPL6_X_6JkXFx7
> AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=KIjN8ZuI7quOdxJac99HJF91IPK3FjIVahOw8y1Orck&s
> =DBGosorH5qwAs9Ub7ZaB8KCwYLCOeLB5uOeWyzNTaZU&e=

[snip]

>          arc |                  uclibc-1.0.31 | https://urldefense.proofpoint.com/v2/url?u=http-
> 3A__autobuild.buildroot.net_results_d26a913230855ae549280d0db3e589e2bacba0bf&d=DwICAg&c=DPL6_X_6JkXFx7
> AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=KIjN8ZuI7quOdxJac99HJF91IPK3FjIVahOw8y1Orck&s
> =gQyiosPdIeIZMW1eLl8jkChd48HZI933eCqr_mydKgA&e=

Some builds on your server are failing due to DNS problems, like that:
------------------------->8-----------------------
>>> uclibc 1.0.31 Downloading
--2019-03-27 04:35:45--  https://downloads.uclibc-ng.org/releases/1.0.31/uClibc-ng-1.0.31.tar.xz
Resolving downloads.uclibc-ng.org (downloads.uclibc-ng.org)... failed: Temporary failure in name resolution.
------------------------->8-----------------------
and
------------------------->8-----------------------
>>> glibc arc-2018.09-release Downloading
--2019-03-27 04:36:26--  https://github.com/foss-for-synopsys-dwc-arc-processors/glibc/archive/arc-2018.09-release/glibc-arc-2018.09-release.tar.gz
Resolving github.com (github.com)... failed: Temporary failure in name resolution.
wget: unable to resolve host address 'github.com'
--2019-03-27 04:36:56--  http://sources.buildroot.net/glibc/glibc-arc-2018.09-release.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... failed: Temporary failure in name resolution.
------------------------->8-----------------------

Is it a known problem?

-Alexey
