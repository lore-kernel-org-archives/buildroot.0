From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Aug 2015 12:07:19 +0200
Subject: [Buildroot] [PATCH 1/1] Fix umask settings for non-bash shells
 for root user
In-Reply-To: <20150829092037.GA4857@free.fr>
References: <1434378026-15007-1-git-send-email-vorel@jablocom.com>
 <20150829105707.3d5e0fec@free-electrons.com> <20150829092037.GA4857@free.fr>
Message-ID: <55E18457.3080302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-08-15 11:20, Yann E. MORIN wrote:
> Petr, All,
> 
> On 2015-08-29 10:57 +0200, Thomas Petazzoni spake thusly:
[snip]
>> Well, actually, I am wondering if we need to bundle a .profile file at
>> all. Our system/skeleton/root/ directory contains:
>>
>> -rw-r--r--  1 thomas thomas    0 oct.   4  2014 .bash_history
>> -rw-r--r--  1 thomas thomas  175 oct.   4  2014 .bash_logout
>> -rw-rw-r--  1 thomas thomas   78 mars   5 15:40 .bash_profile
>>
>> I don't really see why we need any of those three files in our default
>> skeleton. Maybe we should simply remove them, use the default behavior
>> of whatever shell is installed, and let users provide their own custom
>> configuration if needed through a post-build script or rootfs overlay.
>>
>> Yann, Arnout, Peter, your thoughts?
> 
> My opinion? Here's what I'd do ;-)
> 
>     git rm system/skeleton/root/.bash_*

 +1

 Even when bash is the default shell, none of these are needed IMHO.


 Regards,
 Arnout

> 
> And maybe provide a simple .profile *iff* needed.
> 
> As for bash, our bash.mk may install those .bash_* files in /root/ .
> 
> Furthermore, I'd also like /etc/profile be cleaned-up of all the mess,
> moving each (interesting) parts to separate files in /etc/profile.d/ .
> 
> And while at it:
> 
>     git rm system/skeleton/root/.empty
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
