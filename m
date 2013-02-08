From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 08 Feb 2013 07:17:07 -0300
Subject: [Buildroot] crda and m2crypto
In-Reply-To: <5114BF4B.7080007@siganos.org>
References: <5114BF4B.7080007@siganos.org>
Message-ID: <5114D0A3.7000501@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/08/2013 06:03 AM, Dimitrios Siganos wrote:

> Hi,
> 
> I am integrating crda with buildroot and I have run into a problem that
> I'd like some feedback on.

Any particular reason you don't want the static db integrated in the kernel?
Basically copy db.txt from wireless-regdb to linux-*/net/wireless/db.txt
and enable CONFIG_CFG80211_INTERNAL_REGDB=y.
Bam! No need for CRDA and all that.
Making a kernel extension for this should be relatively simple, or
alternatively just provide a patch for the kernel you're using.
Regards.
