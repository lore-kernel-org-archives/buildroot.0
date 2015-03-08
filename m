From: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Date: Sun, 8 Mar 2015 15:53:09 -0300
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <20150308184730.5b821dfa@free-electrons.com>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
 <20150308184730.5b821dfa@free-electrons.com>
Message-ID: <20150308185309.GA7162@fox>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

On Sun, Mar 08, 2015 at 06:47:30PM +0100, Thomas Petazzoni wrote:
> Dear Guido Mart?nez,
> 
> On Fri, 26 Sep 2014 20:22:54 -0300, Guido Mart?nez wrote:
> > Currently, if we run "make linux-rebuild", the device tree blob gets
> > appended twice to the kernel image, rendering the latter append useless.
> > 
> > Fix this by removing the zImage before building, so the DTB append runs
> > on a fresh kernel image. This is not optimal as the final Linux linking
> > step is run again, but at least we get sensible results.
> > 
> > Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> First of all, sorry for the slow response. I could indeed reproduce the
> problem.
No problem at all.

> However, I am not entirely happy with the solution you proposed. I'd
> prefer to fix the real problem: the fact that we are overwriting the
> kernel zImage file.
Yes, I don't like that either.

> I believe we should rather concatenate zImage and the DTB into a file
> named maybe zImage.appended-dtb or something like that, and install
> this file to $(BINARIES_DIR) and $(TARGET_DIR)/boot/ (if requested).
I had done exacly this a while ago, but never finished it since some
configurations failed to build (I don't remeber why exactly).

> Or, another possibility is to name the file zImage.<name-of-dtb>, which
> would later on allow to generate multiple zImage with various appended
> DTBs.
This sounds better! In fact a feature to append different DTBs to the
image would be useful for myself.

> Doing this however requires reworking quite a bit the
> LINUX_IMAGE_NAME / LINUX_TARGET_NAME logic. Would you be willing to
> work on something like this?
Yes, give me a while and I'll try to send a patch.

Cheers!

-- 
Guido Mart?nez, VanguardiaSur
www.vanguardiasur.com.ar
