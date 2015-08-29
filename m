From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 16:46:58 +0200
Subject: [Buildroot] [PATCH 1/1] ibrcommon: new package
In-Reply-To: <1439037734-10302-1-git-send-email-tom_a_sparks@yahoo.com.au>
References: <1439037734-10302-1-git-send-email-tom_a_sparks@yahoo.com.au>
Message-ID: <20150829164658.32312d79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tom Sparks,

On Sat,  8 Aug 2015 22:42:14 +1000, Tom Sparks wrote:
> Signed-off-by: Tom Sparks <tom_a_sparks@yahoo.com.au>
> ---
>  package/ibrcommon/Config.in    | 17 +++++++++++++++++
>  package/ibrcommon/ibrcommon.mk | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 package/ibrcommon/Config.in
>  create mode 100644 package/ibrcommon/ibrcommon.mk

Thanks for your contribution! I applied your patch to the next branch
(so this patch will be part of the 2015.11 release in november, but
not of the upcoming 2015.08 release).

However, I had to do quite a few changes compared to your submission:

    [Thomas:
      - add package in package/Config.in, to make it visible in menuconfig
      - make the openssl, libnl and libxml2 dependencies optional, since
        they are definitely not mandatory
      - add README to the license files, since it contains useful
        licensing related information.
      - remove custom INSTALL_STAGING_OPTS and INSTALL_TARGET_OPTS since
        the package uses automake.
      - add missing final newline in Config.in and .mk file.]

You can look at the final commit at:

  http://git.buildroot.net/buildroot/commit/?h=next&id=d45e6bf09d0413742457b371762b09e69cf22829

and compare it to your original submission, to see the changes that
have been made. The most important issues were: 1/ that
package/ibrcommon/Config.in was not included in package/Config.in and
2/ that the openssl, libxml2 and libnl dependencies were optional not
mandatory.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
