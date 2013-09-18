From: Jason Rennie <jason.rennie@rftechnology.com.au>
Date: Wed, 18 Sep 2013 11:50:28 +1000
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916200135.1724084e@skate>
References: <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <20130916170815.GB3293@free.fr>
 <F9C551623D2CBB4C9488801D14F864C639ACE1F5@ex-mb1.corp.adtran.com>
 <20130916200135.1724084e@skate>
Message-ID: <523906E4.8080404@rftechnology.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I may be missing something here and feel free to call me names if I am, 
also IANAL.

That being said, wouldn't building a system with buildroot be 
essentially the same case to using GCC to compile a program? The final 
libraries you link with (or packages you include in the case of 
buildroot) may be encumbered with all manner of licenses but the license 
of the buildtool doesn't make any difference to the license status of 
the final product.

If you were making changes to buildroot and redistributing those then 
the license would apply but not otherwise.

Jason

On 17/09/2013 4:01 AM, Thomas Petazzoni wrote:
> Dear ANDY KENNEDY,
>
> On Mon, 16 Sep 2013 17:45:00 +0000, ANDY KENNEDY wrote:
>
>>>    - on an embedded system, the probability that there is a GPL
>>> program is rather high (eg. busybox, the Linux kernel);
>> Not always.  There is still a high contingent in the States that use
>> VXWorks, and then a lesser population use a home-grown kernel without
>> every touching GPL code.
> I believe Yann was implicitly saying "embedded Linux system". Buildroot
> is of no-use for VxWorks based systems or other non-Linux operating
> systems.
>
>> I agree with Yann on this point.  I don't see a valid reason to change
>> the license of BuildRoot (even if you wanted to make it a less
>> restrictive license for the main package/*.mk files).  In my current
>> company, I have discussed in great detail exactly what must be done
>> in order to comply with the GPL.  The team I'm on has taken great
>> care to isolate the code into two sections:  Open Sourced code
>> (including MIT license stuff, etc) and IP code.  I have stressed the
>> importance of carefully considering how applications are made, what
>> dependencies we have on the applications, etc.  My company is
>> on-board with (when we get to the point in which we are shipping
>> Linux as the OS on a product) releasing all the non-company code.
> Sure. But in Buildroot, things are more complicated: within Buildroot
> *itself* there may be parts that you have to redistribute (i.e package
> recipes for GPL programs), and some other parts you may not be willing
> to redistribute (i.e package recipes for your own applications, or your
> root filesystem overlay). This makes it quite difficult for a company
> using Buildroot to easily separate what must be distributed from what
> shouldn't be distributed.
>
> Thomas
