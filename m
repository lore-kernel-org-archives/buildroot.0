From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Wed, 22 Aug 2007 16:43:15 -0400
Subject: [Buildroot] Hiding non-buildable packages
References: <1187728137.6145.48.camel@86-115-11-152><20070822191320.GU11697@aon.at>
	<1187814296.4321.37.camel@86-115-11-28>
Message-ID: <002801c7e4fd$109b9900$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I juste want to tell you that i will need to use both arch. ARM9 (RM9200) 
and AVR32 (NGW100). So i probably try both setup. For the AVR32 should be 
easier for me to try it. For the RM9200 it's a custom board based on the 
RM9200-EK or DK i don't remember. SO this one should be not soon before i 
can get my board up and running.

Jonathan


----- Original Message ----- 
From: "Ulf Samuelsson" <ulf@atmel.com>
To: "Bernhard Fischer" <rep.dot.nop@gmail.com>
Cc: "Buildroot" <buildroot@uclibc.org>
Sent: Wednesday, August 22, 2007 4:24 PM
Subject: Re: [Buildroot] Hiding non-buildable packages


> ons 2007-08-22 klockan 21:13 +0200 skrev Bernhard Fischer:
>> On Tue, Aug 21, 2007 at 10:28:57PM +0200, Ulf Samuelsson wrote:
>> >A lot of the packages does not build.
>> 
>> Fixing them is the right thing to do.
> 
> Yes, the goal is to have all packages working for all architectures.
> We are not there by far.
> 
>> 
>> >Some only build for some targets.
>> 
>> Certain packages (think specific HW support) should depend on a specific
>> arch. Which are these?
> 
> I do not have this list.
> 
>> >I think it would be nice to have the possibility
>> >to set a config item, which resulted in that only
>> >packages which seems to build are really visible.
>> 
>> I object to this if you just want to avoid helping to provide patches to
>> upstream that do fix the respective packages that are ment to work fine.
> 
> No.
> Do you think I have been too passive submitting patches during the last
> 2 months :-)
> 
> I see this as a help to quickly determine what I can do and cannot do 
> at a certain point of time. The goal is to remove the restrictions.
> 
> I am mostly interested in ARM and AVR32.
> There are a lot of packages, which needs an active porting effort to 
> build on the AVR32, since those packages explicitly state which 
> architectures are supported, and the AVR32 might not be listed.
> It would be very good if people would know up front what can be done at
> the moment.
> 
> On the ARM, the problem is different. 
> Packages, not involving direct access to architecure specific H/W
> (mostly PC stuff) should build, but for various reasons they do not.
> If people starting using buildroot had this help, then they could
> spend their time first building a working filesystem, and then select
> a specific, non-working package, to debug.
> Today endless hours can be spent on trying to build stuff which ends in
> a failure.
> If it is known not to build, it is good to communicate this to others.
> 
> 
> With this fix, it will be easy to grep package/*/Config.in 
> for a list of non-working packages, and then prioritize
> what to work on.
> 
> 
> 
> -- 
> Best Regards,
> Ulf Samuelsson
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
