From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Jul 2015 23:38:34 +0200
Subject: [Buildroot] [PATCH 2/2] openssl: always build apps
In-Reply-To: <20150702232228.0ad1a03b@free-electrons.com>
References: <1434711274-49716-1-git-send-email-benoit@wsystem.com>
 <1434711274-49716-2-git-send-email-benoit@wsystem.com>
 <20150701111411.1dab82cc@free-electrons.com> <55950B29.9090200@wsystem.com>
 <20150702120402.4e4e3b9d@free-electrons.com> <5595A520.6090903@mind.be>
 <20150702232228.0ad1a03b@free-electrons.com>
Message-ID: <5595AF5A.9010500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/15 23:22, Thomas Petazzoni wrote:
> Arnout,
> 
> On Thu, 2 Jul 2015 22:54:56 +0200, Arnout Vandecappelle wrote:
> 
>>> We generally try to not clutter menuconfig with too many
>>> comments/options: we can't make visible in menuconfig every little
>>> possible dependency. That's why we use a lot of "automatic optional
>>> dependencies": a package automatically uses another package if it is
>>> available, without having this dependency visible from a
>>> menuconfig/Config.in point of view.
>>
>>  We (or at least, I) do like to have such a thing mentioned in the help text,
>> however. The help text does not clutter the menus so there is no reason to be
>> terse there.
> 
> I am perfectly fine with having more details in the Config.in help text.
> 
> However, do we really want to explicitly list all automatic optional
> dependencies in the Config.in help text? I believe it would definitely
> be hard to maintain. 

 Why is it hard to maintain? When you add an automatic dependency to the .mk
file, add it to the Config.in as well. No biggie.

 That said, I didn't mean that it should necessarily be added for everything.
But certainly for things that are not immediately obvious. E.g. python support
obviously requires python, openssl support is also pretty obvious. Although even
there I wouldn't mind mentioning it in the help text.

 In this case, on the other hand, it's a tool called 'tsget' that needs perl -
not so obvious.

> So the Config.in help text should probably be
> mostly used for things that aren't clearly visible by reading the .mk
> file. And automatic optional dependencies are usually pretty explicit
> by looking at the .mk file.

 Ugh, I wouldn't like it if we expect from our users that they not only read all
the .mk files of the packages they want to use, but also understand what it all
means.


 Regards,
 Arnout

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
