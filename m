From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 11:10:56 +0100
Subject: [Buildroot] [PATCH v3 1/1] libcpprestsdk: fix building as a
 static library
In-Reply-To: <20180213231451.41f46d44@windsurf.lan> (Thomas Petazzoni's
 message of "Tue, 13 Feb 2018 23:14:51 +0100")
References: <20180212172350.5697-1-aduskett@gmail.com>
 <20180213231451.41f46d44@windsurf.lan>
Message-ID: <873722o95b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > On Mon, 12 Feb 2018 12:23:50 -0500, Adam Duskett wrote:
 >> Use pkg-config to find OpenSSL. This will automatically find any
 >> dependent libraries and put them in the correct order for linking.
 >> 
 >> Upstream status: submitted
 >> https://github.com/Microsoft/cpprestsdk/pull/688
 >> 
 >> Signed-off-by: Adam Duskett <aduskett@gmail.com>
 >> ---
 >> Changes v1 -> v2:
 >> - Now using pkg-config instead of manually moving library search order
 >> (Thomas)

 > Your commit log was missing a reference to the autobuilder failure
 > being fixed, so I've added one and applied to master.

As it now uses pkg-config, libcpprestsdk should add host-pkgconf to
_DEPENDENCIES.

Care to send a patch?

-- 
Bye, Peter Korsgaard
