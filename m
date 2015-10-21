From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 21:24:50 +0200
Subject: [Buildroot] [PATCH 1/1] Add more options to eudev package.
In-Reply-To: <CAOcYpt3FL4sTBF-Edk4ShGX2vE2wGYX4gp7jHmsfDMxxA=03DA@mail.gmail.com>
References: <CAOcYpt2ah7+P2ZJyzN+i0DjxE+x9LiDZPWwg6zqMxzi-x7BhKQ@mail.gmail.com>
 <20151020203326.GA31310@free.fr>
 <CAOcYpt1nwhHC7d_rpG3G5J+u8z8FaXykSntgp85NBQ1ziCy7ww@mail.gmail.com>
 <CAOcYpt3=T60_0NWWaCPsidFOC_vcZrCcGv5s9VH+AHJnb0ckjw@mail.gmail.com>
 <CAOcYpt3FL4sTBF-Edk4ShGX2vE2wGYX4gp7jHmsfDMxxA=03DA@mail.gmail.com>
Message-ID: <20151021212450.1c6fc5b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Wed, 21 Oct 2015 13:50:17 +0200, David Kosir wrote:

> I've tried to make second patch better, but realized that it is more
> complicated than I thought.
> Best solution I came with to add --libdir=/lib to EUDEV_CONF_OPTS
> I see that we already specify --libexecdir=/lib
> That option would allow to use separate /usr, at least to start udev
> normaly at boot, before /usr is mounted.
> I think that is good option as it would not break anything (at least
> what I see).
> Do you have better idea?

While I understand what you are trying to do, I am not sure we can
support this in Buildroot upstream. You want eudev to be in / and
not /usr, but maybe the next person will want this other package to be
in / and not /usr. How do we handle this ? Add one more option to all
packages ? Doesn't seem really maintainable.

I don't really have a good suggestion on how to solve this problem, but
I'm pretty sure that adding an option to the eudev package is the right
solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
