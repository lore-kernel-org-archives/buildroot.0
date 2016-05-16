From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 May 2016 11:38:01 +0200
Subject: [Buildroot] [PATCH 0/3] OrangePi Plus: Add support
In-Reply-To: <7B019F86-2725-4B09-854C-592B85C9FDD1@dack.com.au> (Troy Dack's
 message of "Mon, 16 May 2016 12:17:13 +1000")
References: <1463268790-1076-1-git-send-email-troy@dack.com.au>
 <87d1ongh8f.fsf@dell.be.48ers.dk>
 <7B019F86-2725-4B09-854C-592B85C9FDD1@dack.com.au>
Message-ID: <87zirqfime.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Troy" == Troy Dack <troy@dack.com.au> writes:

 >> On 16 May 2016, at 07:10, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >>>>>>> "Troy" == Troy Dack <troy@dack.com.au> writes:
 >> 
 >>> Add support for the OrangePi Plus board.
 >> 
 >> In what way does this differ from our existing orangepipc support? Can
 >> anything be shared between them?

 > More than likely yes.  Although the OrangePi PC support does rename the
 > Plus .dts as U-boot doesn?t generate one for the PC yet.

 > Thanks for the comments on the patches themselves.

Ok, good - And you're welcome.

 > The intent was to create a minimal system that could be used either by
 > putting it onto an SD card, or boot via fel with a usable initrd - without
 > needing to create an SD card. This was mainly because network support in
 > mainline on the H3 based OrangePi?s isn?t the best at the moment.

Ahh, yes - The plus has a onboard eMMC? The PC variant doesn't, so
that's not really an option there.

Still, the easiest is probably to just go with the sdcard image for now.

 > Is it possible to have a generic configuration (say OrangePi-H3) that is
 > shared and then configs that include the specifics for the OrangePi
 > Plus/PC etc?

We can have multiple defconfigs sharing the same board files, or a
single config working on multiple boards (if u-boot can detect the board
variant), but there's currently no support for having a base defconfig
that gets included/overridden by other defconfigs.

-- 
Venlig hilsen,
Peter Korsgaard 
