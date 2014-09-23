From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Sep 2014 17:13:11 -0300
Subject: [Buildroot] [PATCH] gnuplot: bump to version 4.6.6
In-Reply-To: <20140923215610.0e46e6b7@free-electrons.com>
References: <1411483294-9742-1-git-send-email-gustavo@zacarias.com.ar>
 <20140923215610.0e46e6b7@free-electrons.com>
Message-ID: <5421D457.2090708@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/23/2014 04:56 PM, Thomas Petazzoni wrote:

> Could you have a look at http://patchwork.ozlabs.org/patch/375696/, and
> give some Tested-by/Acked-by if applicable? The patch is gnuplot
> related.

I'll take a look, but the patch is incorrect so it needs some fixing.
The offending library there is fontconfig which has optional usage of
libpthread, which in turn is also optional for libgd so forcing
-lpthread in isn't correct.
Regards.
