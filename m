From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Feb 2012 17:01:10 +0100
Subject: [Buildroot] [git commit branch/next] DOWNLOAD_WGET: use -O
	instead of -P to set output file
In-Reply-To: <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
 (Alvaro Gamez's message of "Tue, 14 Feb 2012 16:55:22 +0100")
References: <20120214115140.4C70390A99@busybox.osuosl.org>
 <CA+appbOppm780+jAe6LKqGR9mendwqdtvfTEB=Cntrz=5RynSQ@mail.gmail.com>
 <CAM+bi4uo_s_xMy-XVfNhSBwwm70jMxmz5UXB71fbV+=pROYdNQ@mail.gmail.com>
Message-ID: <87sjidv1yx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:

 Alvaro> Maybe it's possible to escape them?
 Alvaro> TOOLCHAIN_EXTERNAL_SITE="http://git.xilinx.com/?p=xldk/microblaze_v2.0.git\;a=
 Alvaro> blob;f="

Yes, or use single quotes (') instead of double quotes (").

 >> ? ? ? ?test -e $(DL_DIR)/$(2) || \
 >> - ? ? ? $(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
 >> + ? ? ? $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)

We should probably change it to:

$(WGET) -O $(DL_DIR)/$(2) '$(call qstrip,$(1))/$(2)'

-- 
Bye, Peter Korsgaard
