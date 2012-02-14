From: Spenser Gilliland <spenser309@gmail.com>
Date: Tue, 14 Feb 2012 10:14:52 -0600
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
 instead of -P to set output file
In-Reply-To: <87sjidv1yx.fsf@macbook.be.48ers.dk>
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
 <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
 <87sjidv1yx.fsf@macbook.be.48ers.dk>
Message-ID: <CA+appbNv_c0r_uDZWw=x3WiHtykt3xX9qrQUTA4YMFq-AUgZ4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This workaround works; however, the default is to prepend a / to the
front of the source name.  This leads to the following being
downloaded.

--2012-02-14 10:10:40--
http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;f=/microblaze-unknown-linux-gnu.tgz

instead of

--2012-02-14 10:10:40--
http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;f=microblaze-unknown-linux-gnu.tgz

Without the slash the download should work. Peter should the patch
remove the prepended slash as well?

Spenser

On Tue, Feb 14, 2012 at 10:01 AM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
>>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:
>
> ?Alvaro> Maybe it's possible to escape them?
> ?Alvaro> TOOLCHAIN_EXTERNAL_SITE="http://git.xilinx.com/?p=xldk/microblaze_v2.0.git\;a=
> ?Alvaro> blob;f="
>
> Yes, or use single quotes (') instead of double quotes (").
>
> ?>> ? ? ? ?test -e $(DL_DIR)/$(2) || \
> ?>> - ? ? ? $(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> ?>> + ? ? ? $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
>
> We should probably change it to:
>
> $(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))/$(2)'
>
> --
> Bye, Peter Korsgaard



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
