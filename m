From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 23 Feb 2017 22:08:05 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <20170223215442.368ece35@free-electrons.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170223215442.368ece35@free-electrons.com>
Message-ID: <CA+TH9VkW5hdUHCU26w0bswKspdN-geT5me_2_pPOF=a=jzTKXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2017-02-23 21:54 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Wed, 22 Feb 2017 23:52:36 +0100, Angelo Compagnucci wrote:
>> Currently the buildroot website is not leveraging common
>> techniques to have a better loading speed (browser caching,
>> gzip compression, deflating).
>> This commit provides an .htaccess files with all the needed to
>> enable mentioned features. This .htaccess only works if the
>> webserver has deflate, expires and headers modules enabled.
>>
>> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> Thanks for your proposal. Since this needs to work with the Apache
> configuration on the server side, I've mailed the OSUOSL folks to ask
> them if this is going to work. You are in Cc to this e-mail.

My patch doesn't necessary requires a server side configuration
change, usually the module I used in htaccess are enabled in common
apache configuration. BTW the use of the modules by a virtualhost is
not enabled by default and .htaccess simply enables it.
On a shared webserver with hundres of websites for example, changing
the cache control setting doesn't require the server sysadmin
intervention, cause the htaccess is used to accomodate user
preferences on a per site base.
Buildroot is probably served by a shared webserver with the required
modules enabled, but they are not correctly configured for the
buildroot.org virtualhost.
So simply dropping the .htaccess in the buildroot virtualhost root
directory should do the trick and enable that configuraion.

>
> Regarding your other patch crunching and resizing the PNG files, it
> didn't make it to the list because of the size of the patch. However,
> while I understand the crunching, I do not understand why you
> arbitrarily reduced the size of the pictures by 60%. Could you explain
> the reasoning behind this?

Pngcrush is a software for reducing the size of png images without
affecting quality. That means that we have to use less bandwidth to
serve the same content as before.

Sincerely, Angelo

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
