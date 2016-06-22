From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Jun 2016 22:38:38 +0200
Subject: [Buildroot] [PATCH] glibc: bump default to version 2.23
In-Reply-To: <877fdhw8ek.fsf@dell.be.48ers.dk>
References: <1466590187-21862-1-git-send-email-gustavo@zacarias.com.ar>
 <87r3bpwa02.fsf@dell.be.48ers.dk>
 <42d8119e5e64c7a67018770b3f029146@zacarias.com.ar>
 <20160622171317.79fbea7e@free-electrons.com>
 <312f3b85fab01ed234da9ff79ac982d0@zacarias.com.ar>
 <877fdhw8ek.fsf@dell.be.48ers.dk>
Message-ID: <57d9d2a6-9bcc-c512-4e09-6eb8f8958c76@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-06-16 17:27, Peter Korsgaard wrote:
>>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:
> 
>  > On 2016-06-22 12:13, Thomas Petazzoni wrote:
>  >> Default to n-1 has been our tradition for gcc/binutils/glibc for ages.
>  >> 
>  >>> We're using latest uclibc-ng if it's suitable/for example.
>  >> 
>  >> Cause uclibc-ng doesn't evolve much beyond bug fixes at the moment, so
>  >> there's not really a good reason to not use the latest version.
>  >> 
>  >> Thomas
> 
>  > Hi.
>  > There are outstanding security bugs that haven't been patched in
>  > buildroot for 22/23 yet which are fixed in the upcoming 24 release,
>  > and 22 has fixes on top of 23 already.
>  > And these patches need rebasing between 22 and 23, so i'd rather keep
>  > moving forward with them than backward.
>  > By introducing 23 as stable sooner in the development cycle rather
>  > than later we can spot issues quicker while also avoiding unnecessary
>  > work in backporting security patches across a broader spectrum.
>  > Regards.
> 
> I don't have an issue as such with us more aggressively following glibc
> development if we decide to do so, but this kind of information should
> be included in the commit message.

 My take on this: we should follow the stable branch of upstream. Since glibc
has no concept of stable branches (in fact, none of the libc's do), we really
should follow upstream releases aggressively.

 In fact, I think it's quite unreasonable that we don't have stable updates for
glibc (or any other libc). As a distro, it's our responsibility to make sure our
users get stable updates, particularly for something as important as glibc.
Since we (currently) don't have the bandwidth to do that, and since there simply
is no viable upstream to rely on [*], we should probably consider dropping the
multi-version glibc... Topic for discussion at the next BR developer meeting.


 Regards,
 Arnout

 [*] I've checked if we could use another distro, but most are on glibc 2.19...
Debian would be an option for glibc 2.22, but for 2.23 and 2.24 there will
probably no viable distro.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
