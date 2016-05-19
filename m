From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 15:52:01 -0300
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <573E0B51.7010000@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/05/16 10:36, Thomas Petazzoni wrote:

>>       powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/163fbc2ccd88282be2f5d5354b125429bfb4ff4b/
>
> Gustavo, another _restgpr_29_x issue, and this is with a Buildroot
> toolchain, so we can't blame an old CT-NG or Sourcery toolchain here :)

Hi.
No no no, the other was a _restgpr_31_x issue ;)
The recurring problem is that gcc targetting powerpc has bugs when using 
-Os.
We could override per-package given this condition, or simply switch to 
-O2 as default for powerpc. I'm more inclined for the second option.
I believe there are patches floating around the internets to fix this 
but they were never committed upstream.
Regards.
