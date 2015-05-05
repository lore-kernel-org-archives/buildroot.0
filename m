From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:43:08 +0200
Subject: [Buildroot] [PATCHv2] package/at: fix glibcism
In-Reply-To: <1430848668-12897-1-git-send-email-yann.morin.1998@free.fr>
References: <1430848668-12897-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150505224308.1ec6e4b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue,  5 May 2015 19:57:48 +0200, Yann E. MORIN wrote:
> at needs __isleap() which is in (e)glibc and uClibc, but not in musl.
> 
> Add a patch (from Open Embedded) that removes use of the macros, and
> directly expands the corresponding code in lieu of the macro calls.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/6f2/6f25e80e8aedec91323ef9b67576b550d7abee60/
>     http://autobuild.buildroot.org/results/da5/da5bb779f3077b079203fcbdb2533dd790963cd4/
>     http://autobuild.buildroot.org/results/8a6/8a6ce608c6f46d08ed77049f796e98e6e10a1709/
>     ...
> 
> Thanks to J?rg for pointing to the OE patch! :-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  .../at/0008-remove-glibc-__isleap-assumption.patch | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/at/0008-remove-glibc-__isleap-assumption.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
