From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 09:39:30 +0100
Subject: [Buildroot] [PATCH v5 4/5] dependencies.sh: XBMC needs java on
 the host
In-Reply-To: <1392332394-27935-5-git-send-email-maxime.hadjinlian@gmail.com>
References: <1392332394-27935-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1392332394-27935-5-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140214093930.02727f8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Thu, 13 Feb 2014 23:59:53 +0100, Maxime Hadjinlian wrote:

> +if grep -q ^BR2_PACKAGE_XBMC=y $BUILDROOT_CONFIG ; then
> +	for prog in java; do

Since you're checking for only one program, there's no point in having
a loop here. Just do:

	if ! which java > /dev/null ; then

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
