From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:14:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcpdump: fix build without
 pod2man
In-Reply-To: <20200914204239.3456222-1-fontaine.fabrice@gmail.com>
References: <20200914204239.3456222-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919211427.4194b0e2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 22:42:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use dhcpdump target to avoid building dhcpdump.8 as it will raise the
> following build failure if pod2man is not available:
> 
> pod2man --section 8 \
> 	--date "23 June 2008" \
> 	--name "DHCPDUMP" \
> 	--center "User Contributed Software" \
> 	dhcpdump.pod dhcpdump.8
> /bin/sh: pod2man: command not found
> make[1]: *** [Makefile:11: dhcpdump.8] Error 127
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/db3be149ec71de8376f685a6a9f027191d9bccc9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dhcpdump/dhcpdump.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
