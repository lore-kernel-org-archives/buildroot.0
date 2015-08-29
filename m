From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 18:16:45 +0200
Subject: [Buildroot] [PATCH 1/1] ibrcommon: new package
In-Reply-To: <20150829164658.32312d79@free-electrons.com>
References: <1439037734-10302-1-git-send-email-tom_a_sparks@yahoo.com.au>
 <20150829164658.32312d79@free-electrons.com>
Message-ID: <20150829181645.3e20fdd1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2015 16:46:58 +0200, Thomas Petazzoni wrote:

> However, I had to do quite a few changes compared to your submission:
> 
>     [Thomas:
>       - add package in package/Config.in, to make it visible in menuconfig
>       - make the openssl, libnl and libxml2 dependencies optional since
>         they are definitely not mandatory
>       - add README to the license files, since it contains useful
>         licensing related information.
>       - remove custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS since
>         the package uses automake.
>       - add missing final newline in Config.in and .mk file.]
> 
> You can look at the final commit at:
> 
>   http://git.buildroot.net/buildroot/commit/?h=next&id=d45e6bf09d0413742457b371762b09e69cf22829
> 
> and compare it to your original submission, to see the changes that
> have been made. The most important issues were: 1/ that
> package/ibrcommon/Config.in was not included in package/Config.in and
> 2/ that the openssl, libxml2 and libnl dependencies were optional not
> mandatory.

There were in fact two other issues, which I fixed in follow up commits:

 - The hash file was missing.

 - The "depends on" logic for the "comment" in the Config.in file was
   incorrect. The comment should be displayed either when thread
   support is not available *OR* when C++ support is not available.
   While in your implementation, the comment would only be shown if
   both are unavailable.

See:

   http://git.buildroot.net/buildroot/commit/?h=next&id=8bb79ac97d152a4e611357564eebf370e947a57e
   http://git.buildroot.net/buildroot/commit/?h=next&id=f1e2419753990744eb9d5d06e8661c9713d9a629

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
