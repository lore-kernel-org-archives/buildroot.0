From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Jan 2015 16:46:38 +0100
Subject: [Buildroot] [PATCH v2 7/7] Adding janus-gateway
In-Reply-To: <1418398967-2183-8-git-send-email-gregd72002@gmail.com>
References: <1418398967-2183-1-git-send-email-gregd72002@gmail.com>
 <1418398967-2183-8-git-send-email-gregd72002@gmail.com>
Message-ID: <20150101164638.66901cd9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Fri, 12 Dec 2014 15:42:47 +0000, Gregory Dymarek wrote:
> Signed-off-by: Gregory Dymarek <gregd72002@gmail.com>
> ---
>  package/Config.in                                  |  1 +
>  package/janus-gateway/Config.in                    | 13 +++++++++++
>  .../janus-gateway-0001-disable-ssp.patch           | 12 ++++++++++
>  package/janus-gateway/janus-gateway.hash           |  1 +
>  package/janus-gateway/janus-gateway.mk             | 27 ++++++++++++++++++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 package/janus-gateway/Config.in
>  create mode 100644 package/janus-gateway/janus-gateway-0001-disable-ssp.patch
>  create mode 100644 package/janus-gateway/janus-gateway.hash
>  create mode 100644 package/janus-gateway/janus-gateway.mk

Thanks, applied, with a number of changes:

    [Thomas:
      - Rename patch to the proper naming convention, and add a
        description to it.
      - Add mandatory dependency to OpenSSL.
      - Make the dependency on libwebsock optional.
      - Remove select of host-gengetopt, since this package no longer has
        a menuconfig option.
      - Add missing toolchain option dependencies inherited from selected
        packages.
      - Add proper Config.in help text.
      - Fix the .mk comment header to the proper format.
      - Use the github function and remove the unneeded SITE_METHOD
        variable.
      - Add support for optional Opus and Libogg support.
      - Remove hash file, since the package is fetched from github.]

See the final commit at
http://git.buildroot.net/buildroot/commit/?id=f95c7e6fb9c0cf30eb769a8f0e272e76f36c5eae.

Also, could you:

 * Submit the SSP patch to the upstream project, and ask them to create
   the m4/ directory?

 * Create a followup patch for Buildroot that adds a working example of
   janus.cfg configuration file and an init script to start the janus
   daemon? This way users of the package at least have a working
   starting point.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
