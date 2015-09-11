From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Sep 2015 11:42:20 +0200
Subject: [Buildroot] [RFC v2] support/misc: Adding Vagrant file for
	provisioning
In-Reply-To: <20150911113414.5826a5af@free-electrons.com>
References: <1441919530-5421-1-git-send-email-angelo.compagnucci@gmail.com>
 <CAHsRNLj0ogoFvjapJoCix9=7Cv4yv53VeASYG70+_CF2wXrgLQ@mail.gmail.com>
 <20150911113414.5826a5af@free-electrons.com>
Message-ID: <CA+TH9Vkhb3nC0xd0AvjRO4zBKqwsitZAPYb11Wr+DTcGwFGsBA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-09-11 11:34 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Gabe, Angelo,
>
> On Thu, 10 Sep 2015 14:56:45 -0700, Gabe Evans wrote:
>
>> > +require 'open-uri'
>> > +open("http://git.buildroot.net/buildroot/plain/CHANGES") do |f|
>> > +  BUILDROOT_VERSION=f.read.lines.first.split(",")[0]
>> > +end
>>
>> As it is now, CHANGES will be redownloaded every time a vagrant
>> command is issued. Can this be moved into $script so that it's only
>> executed once during provisioning? This bit could be written in shell
>> with something like:
>>
>>     curl -s http://git.buildroot.net/buildroot/plain/CHANGES | head -1
>> | awk -F ',' '{print $1}'
>>
>> Though, I'm not sure if there's a better way to determine the current
>> released Buildroot version.
>
> Does it make sense for this provisioning script to randomly pick-up the
> latest Buildroot version? Angelo is selling this provisioning script as
> a way for several users to have an identical, reproducible, build
> environment. But if it randomly picks up the latest Buildroot version,
> it kind of defeats that purpose.

I have a script in the workings that downloads and install the latest
buildroot version only on provisioning phase and only if forced to
redo.

> So shouldn't the Buildroot version simply be hardcoded in the script
> and/or passed as argument in some way?

Having the version hardcoded is better, but we should keep it updated
each new buildroot version.

Vagrantfile is a textfile, you can use as base for your own
personalization. If a corporate environment wants to stick with some
options, they usually copy and modify it to accommodate their needs.

IMO Vagrantfile shipped with buildroot should give the fastest way to
have a working buildroot setup, then changing here and there is up to
the user.

Sincerely, Angelo.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
