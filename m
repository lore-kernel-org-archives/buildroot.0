From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 23:13:10 +0200
Subject: [Buildroot] [PATCH 2/7] janus-gateway: add transports section
 to config.
In-Reply-To: <20170615121314.1485-2-aduskett@codeblue.com>
References: <20170615121314.1485-1-aduskett@codeblue.com>
 <20170615121314.1485-2-aduskett@codeblue.com>
Message-ID: <20170620231310.570b2ba4@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Jun 2017 08:13:09 -0400, Adam Duskett wrote:
> janus-gateway supports many different transports, and currently
> there is no implicit way to turn them off or on.  Instead, if the
> dependency happens to be built, then the transport is enabled.
> 
> Create a transports section in the config file and add
> BR2_PACKAGE_JANUS_REST as the first transport.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/janus-gateway/Config.in        | 6 ++++++
>  package/janus-gateway/janus-gateway.mk | 7 +++++++
>  2 files changed, 13 insertions(+)

I've applied patches 2 to 7. However, it would be nice to be a little
bit more careful in the patches. I had to fix a few things:

 * The title had a typo in most of the commits: gatway -> gateway

 * Inconsistent ending of the titles: some ending with a final dot,
   some not. The latter being the preferred choice.

 * You forgot to propagate the dependencies of the packages being
   selected, and adding the corresponding Config.in comment.

 * You forgot to use alphabetic ordering where appropriate.

All those are minor nits, but they add up, and need to be fixed before
applying the patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
