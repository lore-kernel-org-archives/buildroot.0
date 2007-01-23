From: Ulf Samuelsson <ulfs@dof.se>
Date: Tue, 23 Jan 2007 10:06:16 +0100
Subject: [Buildroot] microcom broken with latest uclibc snapshot.
References: <049801c73e80$cf0bedf0$01c4af0a@atmel.com>
	<20070123001856.GA10178@aon.at>
Message-ID: <004a01c73ed1$21643210$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Tue, Jan 23, 2007 at 12:32:37AM +0100, Ulf Samuelsson wrote:
>> When using the latest uClibc snapshot to build the toolchain,
>> It looks like the high speeds are not acceptable (> 1151200)
>> and the generated <staging_dir>/arm-linux/sys-include/bits/termios.h
>> has higher speeds commented away.
>>
>> #if 0 /* limited on uClibc, keep in sync w/ cfsetspeed.c */
>> #define B230400 0010003
>> ...
>> #endif
>>
>> This is not a good idea, if the MCU can handle higher speed!
>>
>> It also breaks microcom-1.02.
>
> I'm pretty sure that i fixed microcom, please update and confirm
> since i only compile tested it..

My Buildroot copy is from 2007-01-16.

But why limit the UART speed?
An AT91RM9200 can do 460kBAUD.
Have several customer which would like to avoid
such artificial limitation.
Isn't it better to make the max speed a configuration item?

Best Regards,
Ulf Samuelsson
ulf at atmel.com
GSM:  +46 (706) 22 44 57
Tel:     +46  (8) 441 54 22
Fax:     +46 (8) 441 54 29
Mail: Box 2033  174 02 Sundbyberg
Visit: Kavalleriv?gen 24
          174 58 Sundbyberg'
Sweden
