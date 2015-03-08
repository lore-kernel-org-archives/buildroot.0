From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:18:43 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option
 --stop-on-virtual
In-Reply-To: <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
 <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150308221843.2d6fbf7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sat,  3 Jan 2015 15:29:13 +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  docs/manual/common-usage.txt  |  3 +++
>  support/scripts/graph-depends | 11 +++++++++++
>  2 files changed, 14 insertions(+)

I'm still not convinced by this one. Shouldn't we instead have a more
generic mechanism such as --exclude=<foo>,<bar>, which would allow to
exclude packages? And maybe one of the possible values would be a
magical value to exclude virtual packages?

There are some cases where ignoring host-pkgconf, or
host-automake/host-autoconf/host-libtool may be interesting, for
example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
