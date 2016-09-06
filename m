From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 23:18:57 +0200
Subject: [Buildroot] [PATCH v2,1/1] gtest: retrieve package from github
In-Reply-To: <1472660994-23034-1-git-send-email-fabrice.fontaine@orange.com>
References: <1472660994-23034-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160906231857.60082e09@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Aug 2016 18:29:54 +0200, Fabrice Fontaine wrote:
> https://googletest.googlecode.com/files is no more available, so update
> gtest.mk and gtest.hash to retrieve googletest source code as a tar.gz
> (and not a zip) from github as https://googletest.googlecode.com is now
> a redirection to https://github.com/google/googletest.
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
> ---
> Changes v1 -> v2:
>  - Fix patch number (6/6 to 1/1)

Applied to master, thanks. I've tried to do the same for the gmock
package (the 1.7.0 release is available from
https://github.com/google/googlemock/releases. However, since it's
fetched from Github, it doesn't have the configure script
pre-generated, and GMOCK_AUTORECONF = YES doesn't work.

I guess moving to using the CMake based build system would make more
sense, but that's a bigger task.

Patches welcome :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
