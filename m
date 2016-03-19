From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 16:14:07 +0100
Subject: [Buildroot] [PATCH 12/16 v5] core/legal-info: also save extra
 downloads
In-Reply-To: <0e4f63ef1f47edce58214cd21d9e5f177731979f.1457718289.git.yann.morin.1998@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <0e4f63ef1f47edce58214cd21d9e5f177731979f.1457718289.git.yann.morin.1998@free.fr>
Message-ID: <20160319161407.5194685e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 11 Mar 2016 18:49:25 +0100, Yann E. MORIN wrote:
> Some packages, like perl, download extra files that end up as part of
> the source that Buildroot builds. Up until now, those files were not
> saved in the legal-info output.
> 
> Add those files to the legal-info output.
> 
> The unfortunate side-effect is that we will also save the secondary
> archive for the external blackfin toolchains; however, we already do
> save the binary release of some external toolchains when they do not
> provide actual source archives.
> 
> This is inherently bad, as those are not source archives, but solving
> this is a bigger concern, for another series...

I see two possible ways around this:

 - Have two separate variables, like <pkg>_EXTRA_SOURCE (to be used for
   perl, contains real source code that needs to be saved during
   legal-info), and <pkg>_EXTRA_DOWNLOADS (to be used for external
   toolchains).

 - Just like you don't copy <pkg>_SOURCE to legal-info when
   <pkg>_ACTUAL_SOURCE is defined, don't copy <pkg>_EXTRA_DOWNLOADS
   when <pkg>_ACTUAL_SOURCE is defined.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
