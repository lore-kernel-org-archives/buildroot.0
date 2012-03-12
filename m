From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Mar 2012 09:07:21 -0300
Subject: [Buildroot] [PATCH 1/3] intltool: no business defining PERLLIB
In-Reply-To: <20120312123322.230c968b@skate>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-2-git-send-email-gustavo@zacarias.com.ar>
 <20120312075840.648c0cba@skate>
 <3fb8fff01011dbe187d729419e8c6156@zacarias.com.ar>
 <20120312123322.230c968b@skate>
Message-ID: <2d02f9f1661afd713dab493379f7d8b8@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-12 08:33, Thomas Petazzoni wrote:

> Yes, of course, I missed the fact that you were using a 
> host-microperl,
> which I guess it built to look in $(HOST_DIR)/usr/lib/perl by 
> default.
> This PERLLIB option is needed if you want to use the Perl provided by
> the distro, and you need it to look into this specific place for Perl
> modules.
>
> As said in my other mail, I am not convinced we need host-microperl.

I'm aware of what PERLLIB does.
It's just a matter of which path to choose, if we ditch 
host-(micro)perl we loose all ability to build target modules in a sane 
way.
Also it's not that host-(micro)perl is built every time someone builds 
any package, it's just used for intltool which usually implies a 
medium/big target project, and perl doesn't take that long to build on 
modern hardware.
The other intermediate solution is to make $(HOST_DIR)/usr/bin/perl 
$(HOST_DIR)/usr/bin/host-perl and make the libxml-perl-parser module a 
bizarre contraption that means host-perl -> distro-perl since the host 
variant will not work with host-(micro)perl in many scenarios.
IMHO not so nice, that's just my $.01
Regards.
