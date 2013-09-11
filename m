From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 11 Sep 2013 08:36:31 -0700
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install
	to target
In-Reply-To: <CANbLAv=Z6t7RuxrRm+uodNS55WXSKt1Raui8XLcQyoMjqk6mkw@mail.gmail.com>
References: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
 <20130911092734.2c4bee5f@skate> <874n9rsiti.fsf@dell.be.48ers.dk>
 <5230757A.10201@gmail.com> <87vc27qw22.fsf@dell.be.48ers.dk>
 <CANbLAv=Z6t7RuxrRm+uodNS55WXSKt1Raui8XLcQyoMjqk6mkw@mail.gmail.com>
Message-ID: <52308DFF.1080508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/2013 07:23 AM, Ryan Coe wrote:
>
> I will try it without the second instance and report back.
>
> On Sep 11, 2013 7:20 AM, "Peter Korsgaard" <jacmet@uclibc.org 
> <mailto:jacmet@uclibc.org>> wrote:
>
>     >>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com
>     <mailto:bluemrp9@gmail.com>> writes:
>
>     Hi,
>
>      Ryan> Without the depmod in the target install, I do not get the
>     necessary
>      Ryan> files installed to the target.  I am unable to load modules
>     until I
>      Ryan> manually run depmod -a.
>
>     Really? LINUX_MAKE_FLAGS expands to .. DEPMOD=$(HOST_DIR)/sbin/depmod,
>     so we ended up passing 2x DEPMOD= to modules_install.
>
>     --
>     Bye, Peter Korsgaard
>
I can confirm that this does work.  The second time that depmod was 
passed was causing trouble.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/8c1d3b3b/attachment.html>
