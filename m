From: John O'Sullivan <John.OSullivan@BlackBox.com>
Date: Thu, 9 Mar 2017 16:05:34 +0000
Subject: [Buildroot] Using  CFLAGS_MODULE in linux.mk
Message-ID: <1489075532553.82021@BlackBox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am trying to build a kernel module that can have a number of conditional compile options depending on the product variant I am building.
Outside of buildroot I can do



make ARCH=arm modules CFLAGS_MODULE=-DVARIANT_PPG


The module picks up the VARIANT_PPG and I can conditionally build the module.
I am trying to do something similar in buildroot (2013-05). To test this out I tried amending the linux.mk file as follows:


LINUX_MAKE_FLAGS+=CFLAGS_MODULE=-DVARIANT_PPG




However when I add this line to linux.mk the variable VARIANT_PPG never seems to be seen in the module.
Has anyone any suggestions? Is there a reason its not working in the .mk file.
Is there a better way of doing this?


regards
John


________________________________

This email and any files transmitted with it are confidential and are intended for the sole use of the individual to whom they are addressed. Black Box Corporation reserves the right to scan all e-mail traffic for restricted content and to monitor all e-mail in general. If you are not the intended recipient or you have received this email in error, any use, dissemination or forwarding of this email is strictly prohibited. If you have received this email in error, please notify the sender by replying to this email.
