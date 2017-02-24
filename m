From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Feb 2017 10:12:08 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <20170223221556.5e152293@free-electrons.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170223215442.368ece35@free-electrons.com>
 <CA+TH9VkW5hdUHCU26w0bswKspdN-geT5me_2_pPOF=a=jzTKXw@mail.gmail.com>
 <20170223221556.5e152293@free-electrons.com>
Message-ID: <9678efaa-0621-fc45-de15-1f2f0fc534a1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-02-17 22:15, Thomas Petazzoni wrote:
> On Thu, 23 Feb 2017 22:08:05 +0100, Angelo Compagnucci wrote:
> 
>> My patch doesn't necessary requires a server side configuration
>> change, usually the module I used in htaccess are enabled in common
>> apache configuration. BTW the use of the modules by a virtualhost is
>> not enabled by default and .htaccess simply enables it.
>> On a shared webserver with hundres of websites for example, changing
>> the cache control setting doesn't require the server sysadmin
>> intervention, cause the htaccess is used to accomodate user
>> preferences on a per site base.
>> Buildroot is probably served by a shared webserver with the required
>> modules enabled, but they are not correctly configured for the
>> buildroot.org virtualhost.
>> So simply dropping the .htaccess in the buildroot virtualhost root
>> directory should do the trick and enable that configuraion.
> Right. I want to see what the admins of the webserver have to say
> though.

 Angelo is right though: this .htaccess file basically checks what the server
supports and enables features in the webserver if they are available. So even if
the osuosl webserver currently doesn't have one of these modules installed, it
still makes sense to have it in the .htaccess file so it will be used when they
do install the module.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
