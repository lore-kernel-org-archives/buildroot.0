From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Jun 2017 22:30:30 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
In-Reply-To: <20170526151414.11f2d47a@free-electrons.com>
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-3-romain.naour@gmail.com>
 <20170526151414.11f2d47a@free-electrons.com>
Message-ID: <6c88ceb4-94f7-6018-6d3a-ae3e99c8d44e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I though this one was already applied, but apparently I still have the chance
to speak up...

On 26-05-17 15:14, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 May 2017 20:34:57 +0200, Romain Naour wrote:
>> We're already using 6.x as default, and have 5.x on the lower side
>> together with 7.x (7.1) on the higher side.
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Dagg Stompler <daggs@gmx.com>
> 
> I'll wait a little bit for additional feedback on this one. If nobody
> complains in the next few days, I'm going to apply it.

 GCC 4.9 (or rather, GCC 5) is a bit a special case: libstdc++ had heavy
ABI-incompatible changes. E.g. at the time Debian switched to it, it was the
only time I had major breakage in sid. So, the switch from gcc 4.9 to gcc 5
means that any binary-only C++ program will no longer be usable.

 On top of that, gcc 5 introduces many errors (for non-standard-compliant code)
that were accepted before in gcc 4.9, which makes existing codebases sometimes
difficult to get built. This, however, happens with each version bump so less of
an argument against removal.

 You could say that users with such requirements should keep using their own
toolchain, but there are useful (security) fixes in libc as well. They could use
an external toolchain, but then how to build it? Crosstool-NG is a *lot* more
complicated to use than Buildroot.

 Bottom line: I'd tend to keep gcc 4.9 around for a while. If breakage occurs we
can disallow it for some architectures. There shouldn't be much more maintenance
effort than that, I think.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
