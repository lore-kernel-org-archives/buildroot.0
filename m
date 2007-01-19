From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 19 Jan 2007 20:44:53 +0100
Subject: [Buildroot] install uClibc daily snapshot failes
In-Reply-To: <200701191651.07462.claus.klein@arcormail.de>
References: <200701170833.04970.claus.klein@arcormail.de>
	<200701172114.08730.claus.klein@arcormail.de>
	<20070118102927.GB6515@aon.at>
	<200701191651.07462.claus.klein@arcormail.de>
Message-ID: <20070119194453.GB19990@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 19, 2007 at 04:51:07PM +0100, Claus Klein wrote:
>On Thursday 18 January 2007 11:29, Bernhard Fischer wrote:
>> >> What is your echo $LD_LIBRARY_PATH ?
>> >> 
>> >> 
>> >claus at P3linux:~/src/buildroot> echo $LD_LIBRARY_PATH
>> >/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:/usr/lib/qt3/lib:
>> --------------------------------------------------------------------^
>> 
>> fix your LD_LIBRARY_PATH, no patch needed.
>> 
>> HTH,
>> 
>> 
>Hi,
>
>thanks for your help, you are right.
>
>I din't know that the tailing ':' is the same as ':.'

^: == :$ == :: == :.:
Same for PATH.
>
>I'm working with OpenSuse 10.1 and I can't find the config file, which writes this LD_LIBRARY_PATH.
>While about 2 years working with buildrout I had no problem with my LD_LIBRARY_PATH!

.profile, .bashrc and /etc/sysconfig come to mind.

IMO it is hazardous to have CWD in PATH and the same holds true for the
ld lib path. If you can convince anybody else to apply your patch, then
ok, but i will not apply it since this just means that you risk breakage
anywhere else that may trigger trouble like the one you experienced.
>
>I would like to hear that the Makefile will be changed to my version. 
>This works always!
>
>
>PS: There is no note about LD_LIBRARY_PATH in the buildroot docu!

I've added checks to dependencies.sh as you may have seen.
Please fix your pathes. Thanks for your understanding and kind regards,
