From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Nov 2017 10:00:02 +0100
Subject: [Buildroot] [PATCH v2] util-linux: security bump to version 2.31
In-Reply-To: <232020389.16019836.1509500098756.JavaMail.zimbra@datacom.ind.br>
 (Carlos Santos's message of "Tue, 31 Oct 2017 23:34:58 -0200 (BRST)")
References: <1509446871-25076-1-git-send-email-casantos@datacom.ind.br>
 <87zi87ezym.fsf@dell.be.48ers.dk>
 <232020389.16019836.1509500098756.JavaMail.zimbra@datacom.ind.br>
Message-ID: <87r2thf431.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

 >> Do you know if there's any reason to prefer this version over our
 >> existing rfkill package? The fact that it isn't available on nommu
 >> probably means we cannot get rid of the separate package, but we may
 >> want to add it to UTIL_LINUX_DEPENDENCIES so the util-linux version
 >> "wins".

 > I think this one is preferable because util-linux is actively maintained
 > while the original rfkill seems to be abandoned (the last commit in its
 > git repository is from Jan 8 2015).

Ok.

 > How many nommu architectures does Buildroot support? The only boards I
 > found without BR2_USE_MMU were qemu_{arm_versatile,xtensa_lx60}_nommu,
 > which obviously do not even have RF radios to turn on/off.

It is indeed probably a quite rare combination. Perhaps we should get
rid of the separate rfkill package then and add Config.in.legacy
handling for it selecting the util-linux option?

Volkov, you added the rfkill package. Any issues with moving to the
util-linux variant instead?

-- 
Bye, Peter Korsgaard
