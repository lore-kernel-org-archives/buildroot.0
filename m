From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:15:56 +0100
Subject: [Buildroot] [PATCH] docs/website: Improving website speed
In-Reply-To: <CA+TH9VkW5hdUHCU26w0bswKspdN-geT5me_2_pPOF=a=jzTKXw@mail.gmail.com>
References: <1487803956-24668-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170223215442.368ece35@free-electrons.com>
 <CA+TH9VkW5hdUHCU26w0bswKspdN-geT5me_2_pPOF=a=jzTKXw@mail.gmail.com>
Message-ID: <20170223221556.5e152293@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 22:08:05 +0100, Angelo Compagnucci wrote:

> My patch doesn't necessary requires a server side configuration
> change, usually the module I used in htaccess are enabled in common
> apache configuration. BTW the use of the modules by a virtualhost is
> not enabled by default and .htaccess simply enables it.
> On a shared webserver with hundres of websites for example, changing
> the cache control setting doesn't require the server sysadmin
> intervention, cause the htaccess is used to accomodate user
> preferences on a per site base.
> Buildroot is probably served by a shared webserver with the required
> modules enabled, but they are not correctly configured for the
> buildroot.org virtualhost.
> So simply dropping the .htaccess in the buildroot virtualhost root
> directory should do the trick and enable that configuraion.

Right. I want to see what the admins of the webserver have to say
though.

> Pngcrush is a software for reducing the size of png images without
> affecting quality. That means that we have to use less bandwidth to
> serve the same content as before.

I'm OK with what pngcrush does, but in your commit log, you said "The
images resized to ~60% of the original size.". To me it means that you
have reduced the size (in pixel) of the images to make them smaller in
size (in bytes).

Or is the 60% number just the saving (in bytes) thanks to using
pngcrush?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
