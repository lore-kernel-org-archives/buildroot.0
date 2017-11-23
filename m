From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Nov 2017 23:59:42 +0100
Subject: [Buildroot] [PATCH] package/google-breakpad: replace references
 to 'struct ucontext' with 'ucontext_t'
In-Reply-To: <20171122224529.5190424d@windsurf.lan>
References: <20171122210828.19311-1-romain.naour@gmail.com>
 <20171122224529.5190424d@windsurf.lan>
Message-ID: <04e7418d-735d-c9b3-3087-dbe78529cc48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-11-17 22:45, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for working on this topic!
> 
> On Wed, 22 Nov 2017 22:08:28 +0100, Romain Naour wrote:
>> Glibc change:
>> https://sourceware.org/git/?p=glibc.git;h=251287734e89a52da3db682a8241eb6bccc050c9
> 
> This commit log is very, very terse. Could you explain in more details
> what's going on?
> 
> Also, what is the effect if you use an older glibc version than 2.26 ?

 The ucontext_t type name is POSIX and has existed in glibc since 1997, in
uClibc and musl forever.

 I've extended the commit log with this and more explanation, and applied to
master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
