Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A9BC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 10:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFBDE80E0C;
	Sun, 18 Aug 2024 10:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5wfuz1fGby-M; Sun, 18 Aug 2024 10:14:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE2F280F14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2F280F14;
	Sun, 18 Aug 2024 10:14:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 946BD1BF297
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E70D80F14
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 10:14:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trDVVvI4u48J for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 10:13:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50D1480E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50D1480E0C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50D1480E0C
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 10:13:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 25BE113F88D;
 Sun, 18 Aug 2024 12:13:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 12:13:54 +0200
Date: Sun, 18 Aug 2024 12:13:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsHJYituMwcHRyBg@landeda>
References: <20240818090346.947914-1-thomas.petazzoni@bootlin.com>
 <20240818090346.947914-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240818090346.947914-3-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723976037;
 bh=PSnYMthxwPGlqnmUj7f6/WrFzwryE4FHS3QsZz+OrXc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M8TUyH8fS0uognOSO817ojYKtMn3F6zxJbu/2MkCspf/b9tHVSBGdlN9Z0SBeOf+r
 KsDE0Ld2/Ys75hdZm9PnmdBxsP3+jDQ4KHvK9tzCbFdqFoqO2laHsMxrJJX7gFvjZQ
 lwCaJXqM9Z4u1H5pmlDh4whL6mfcNDQixroVKuXzAoh3Io5gSRILeRLXQeNK4WnYYI
 1mejMEyObhYLtCea2sp9tjAzAl8wQpKJ+pFcQpzva1j9cGl4T/IN0H3yb/kIJzVpR6
 5fkARv2qS26M/zNyVWBMEffqwzm2v+1cwkl+0aLjWA7TxzWaheYvm13dnyYfXXl/Yi
 b5tuUpdzGBtmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M8TUyH8f
Subject: Re: [Buildroot] [PATCH v2 2/5] utils/genrandconfig: remove support
 for toolchain CSV
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-18 11:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> Now that the support for generating a fully random configuration has
> been well-tested, the whole mechanism based on a toolchain CSV isn't
> really useful anymore, so let's drop it to simplify the logic.

As discussed on IRC, the autobuilder code still uses
--{,no-}toolchains-csv, so dopping those flags would instaly break the
autobuilders.

So, I've kept them and docuemnted them to be legacy.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  utils/genrandconfig | 99 +--------------------------------------------
>  1 file changed, 2 insertions(+), 97 deletions(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index cefc3dca12..ee094824fd 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -20,7 +20,6 @@
>  
>  from binascii import hexlify
>  import asyncio
> -import csv
>  import os
>  from random import randint
>  import sys
> @@ -100,73 +99,6 @@ class SystemInfo:
>          return not missing_requirements
>  
>  
> -def get_toolchain_configs(toolchains_csv, buildrootdir):
> -    """Fetch and return the possible toolchain configurations
> -
> -    This function returns an array of toolchain configurations. Each
> -    toolchain configuration is itself an array of lines of the defconfig.
> -    """
> -
> -    with open(toolchains_csv) as r:
> -        # filter empty lines and comments
> -        lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
> -        toolchains = lines
> -    configs = []
> -
> -    (_, _, _, _, hostarch) = os.uname()
> -    # ~2015 distros report x86 when on a 32bit install
> -    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
> -        hostarch = 'x86'
> -
> -    for row in csv.reader(toolchains):
> -        config = {}
> -        configfile = row[0]
> -        config_hostarch = row[1]
> -        keep = False
> -
> -        # Keep all toolchain configs that work regardless of the host
> -        # architecture
> -        if config_hostarch == "any":
> -            keep = True
> -
> -        # Keep all toolchain configs that can work on the current host
> -        # architecture
> -        if hostarch == config_hostarch:
> -            keep = True
> -
> -        # Assume that x86 32 bits toolchains work on x86_64 build
> -        # machines
> -        if hostarch == 'x86_64' and config_hostarch == "x86":
> -            keep = True
> -
> -        if not keep:
> -            continue
> -
> -        if not os.path.isabs(configfile):
> -            configfile = os.path.join(buildrootdir, configfile)
> -
> -        with open(configfile) as r:
> -            config = r.readlines()
> -        configs.append(config)
> -    return configs
> -
> -
> -async def is_toolchain_usable(configfile, config):
> -    """Check if the toolchain is actually usable."""
> -
> -    with open(configfile) as configf:
> -        configlines = configf.readlines()
> -
> -    # Check that the toolchain configuration is still present
> -    for toolchainline in config:
> -        if toolchainline not in configlines:
> -            print("WARN: toolchain can't be used", file=sys.stderr)
> -            print("      Missing: %s" % toolchainline.strip(), file=sys.stderr)
> -            return False
> -
> -    return True
> -
> -
>  async def fixup_config(sysinfo, configfile):
>      """Finalize the configuration and reject any problematic combinations
>  
> @@ -581,24 +513,11 @@ async def fixup_config(sysinfo, configfile):
>  
>  async def gen_config(args):
>      """Generate a new random configuration
> -
> -    This function generates the configuration, by choosing a random
> -    toolchain configuration and then generating a random selection of
> -    packages.
>      """
>  
>      sysinfo = SystemInfo()
>  
> -    if args.toolchains_csv:
> -        # Select a random toolchain configuration
> -        configs = get_toolchain_configs(args.toolchains_csv, args.buildrootdir)
> -
> -        i = randint(0, len(configs) - 1)
> -        toolchainconfig = configs[i]
> -    else:
> -        toolchainconfig = []
> -
> -    configlines = list(toolchainconfig)
> +    configlines = list()
>  
>      # Combine with the minimal configuration
>      minimalconfigfile = os.path.join(args.buildrootdir,
> @@ -658,9 +577,6 @@ async def gen_config(args):
>      if ret:
>          return ret
>  
> -    if not await is_toolchain_usable(configfile, toolchainconfig):
> -        return 2
> -
>      # Now, generate the random selection of packages, and fixup
>      # things if needed.
>      # Safe-guard, in case we can not quickly come to a valid
> @@ -676,7 +592,7 @@ async def gen_config(args):
>              "make", "O=%s" % args.outputdir, "-C", args.buildrootdir,
>              "KCONFIG_SEED=0x%s" % hexlify(os.urandom(4)).decode("ascii").upper(),
>              "KCONFIG_PROBABILITY=%d" % randint(1, 20),
> -            "randpackageconfig" if args.toolchains_csv else "randconfig")
> +            "randconfig")
>          ret = await proc.wait()
>          if ret:
>              return ret
> @@ -711,17 +627,6 @@ if __name__ == '__main__':
>                          help="Buildroot directory (relative to current directory)",
>                          type=str, default='.')
>  
> -    toolchains_csv = parser.add_mutually_exclusive_group(required=False)
> -    toolchains_csv.add_argument("--toolchains-csv",
> -                                dest="toolchains_csv",
> -                                help="Path of the toolchain configuration file",
> -                                type=str)
> -    toolchains_csv.add_argument("--no-toolchains-csv",
> -                                dest="toolchains_csv",
> -                                help="Generate random toolchain configuration",
> -                                action='store_false')
> -    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> -
>      args = parser.parse_args()
>  
>      # We need the absolute path to use with O=, because the relative
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
