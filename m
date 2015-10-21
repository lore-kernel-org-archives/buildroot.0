From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Oct 2015 22:00:35 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <20151021212450.1c6fc5b4@free-electrons.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
 <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
 <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
 <CAOcYpt3FL4sTBF-Edk4ShGX2vE2wGYX4gp7jHmsfDMxxA=03DA@mail.gmail.com>
 <20151021212450.1c6fc5b4@free-electrons.com>
Message-ID: <5627EEE3.3010302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21-10-15 21:24, Thomas Petazzoni wrote:
> Hello David,
> 
> On Wed, 21 Oct 2015 13:50:17 +0200, David Kosir wrote:
> 
>> I've tried to make second patch better, but realized that it is more
>> complicated than I thought.
>> Best solution I came with to add --libdir=/lib to EUDEV_CONF_OPTS
>> I see that we already specify --libexecdir=/lib
>> That option would allow to use separate /usr, at least to start udev
>> normaly at boot, before /usr is mounted.
>> I think that is good option as it would not break anything (at least
>> what I see).
>> Do you have better idea?
> 
> While I understand what you are trying to do, I am not sure we can
> support this in Buildroot upstream. You want eudev to be in / and
> not /usr, but maybe the next person will want this other package to be
> in / and not /usr. How do we handle this ? Add one more option to all
> packages ? Doesn't seem really maintainable.

 Actually, it makes sense to me to install it completely in / instead of /usr -
that would also remove the need to have all the --libdir etc. options that we
currently pass. The way it's currently done, eudev's install anyway adds
symlinks back from /lib/libudev.so to /usr/lib/libudev.so.

 Of course, includes and pkgconfig still have to be put in /usr.


 Regards,
 Arnout

> 
> I don't really have a good suggestion on how to solve this problem, but
> I'm pretty sure that adding an option to the eudev package is the right
> solution.
> 
> Best regards,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
