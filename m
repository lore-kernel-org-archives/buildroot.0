From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 17:19:42 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: use
 --no-check-certificate in wget by default
In-Reply-To: <20171011085340.48fe6e73@windsurf.lan>
References: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
 <20171010222543.0beed48d@windsurf.lan>
 <f8f82c6a-f51a-8fe6-dc3a-dfc061dd7955@mind.be>
 <20171011085340.48fe6e73@windsurf.lan>
Message-ID: <9825929c-9eaa-3d92-892b-90bf5637dd52@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-10-17 08:53, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 10 Oct 2017 23:25:03 +0200, Arnout Vandecappelle wrote:
[snip]
>>> We recently bump dbus to 1.10.24, and look how the autobuilders are
>>> "polluted" by this certificate issue:
>>> http://autobuild.buildroot.net/?reason=dbus-1.10.24.  
>>
>>  But once Peter updates sources.buildroot.org that should be OK again, no?
> 
> Yes, but this pollution happens again and again and again every time we
> bump a package that is fetched from https://, with a certificate too
> recent for those old systems. This creates useless noise in the
> autobuilders. And this noise is useless because we are really not going
> to do anything about this.

 Even though this problem hasn't occurred again in the last half year AFAIK,
your explanation does make sense so I've applied to master, thanks.

 Regards,
 Arnout

> But perhaps it's an issue more unique to my autobuilder instance, and
> therefore something I should fix locally? Perhaps just an autobuild-run
> feature that allows to append a custom config option to the config file
> being built, so that people can locally add some tweaks?

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
