From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 May 2017 15:52:05 +0200
Subject: [Buildroot] Altera SoC Buildroot external toolchain
 incompatible error
In-Reply-To: <1494594693346-164814.post@n4.nabble.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
 <20170511225147.7466e9ff@free-electrons.com>
 <1494535599131-164758.post@n4.nabble.com>
 <20170511232316.693f8e6c@free-electrons.com>
 <1494594693346-164814.post@n4.nabble.com>
Message-ID: <20170512155205.526ea00c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 06:11:33 -0700 (PDT), lemonoje wrote:
> You have selected to download the toolchain whereas I already have it
> downloaded, so my config is not using the EXTERNAL_URL.  (Note the path is
> not set below as I pass that in when I build).

Doesn't make any meaningful difference here. In one case, Buildroot
will download+extract the toolchain tarball in
output/host/opt/ext-toolchain/, while in the other case, it will simply
leave the toolchain where specified by the configuration.

> But now I see once I choose to enable VFP, I can then choose Target
> ABI=EABIhf.  And then the Linaro custom toolchain option (2016.11) appears
> in the Toolchain External Options.  That would then mean I have to already
> have 2016.11 installed and use BR2_TOOLCHAIN_EXTERNAL_PATH to tell BR where
> it's at, right?

You have two choices:

 - Ask Buildroot to download+extract the toolchain for you
 - Tell Buildroot to use a locally available toolchain

> So, the external Linaro toolchains you can select differ between versions of
> Buildroot.  Is there a listing of which ones support which toolchains?

Why does it matter? If you want a specific Linaro toolchain version,
just tell Buildroot you're using a "Custom external toolchain". The
existing profiles for various toolchains are just here to make things a
bit easier for users: Buildroot will already know where to download the
toolchain from, and what the toolchain configuration is. But using a
"Custom external toolchain" is doing exactly the same, except that you
have to tell Buildroot by yourself where is the toolchain and what is
its configuration.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
