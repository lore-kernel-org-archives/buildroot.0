From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:31:34 +0100
Subject: [Buildroot] [PATCH 01/16 v5] toolchain/external: add hashes for
 actual sources
In-Reply-To: <cbb39a5e2943be9229cfc9629d0e878ec6892688.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <cbb39a5e2943be9229cfc9629d0e878ec6892688.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319163134.0231c8a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 18:49:14 +0100, Yann E. MORIN wrote:
> As we currently download the actual sources as part of saving the
> legal-info, we do not check the hashes of those downloads.
> 
> That's because, during legal-info, there is not package involved, and
> thus there's no path to an actual .hash file.
> 
> However, this precludes legal-info from working in off-line mode. A
> subsequent patch will make it possible to do so, and actual sources will
> be downloaded as another classical package download.
> 
> This will have two consequences:
> 
>   - first, we will be able to add hashes for actual sources, so we can
>     ensure their integrity,
> 
>   - second, and as a direct consequence of the above, when a .hash file
>     is present, it would have to list all the hashes for that package,
>     or that would be treated as an error.
> 
> Currently, the only package that falls in this case is the external-
> toolchain, for which we have means to retrieve the sources for some of
> the toolchains.
> 
> So we just add hashes for those actual external-toolchain sources we may
> have to download.
> 
> Those hashes are not used for now, but they'll come into play a few
> patches down.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain-external/toolchain-external.hash | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
