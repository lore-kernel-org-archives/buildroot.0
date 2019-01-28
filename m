From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 18:15:02 +0100
Subject: [Buildroot] [PATCH] package/cargo: pass appropriate library
 path to the linker
In-Reply-To: <20181228132551.29819-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 28 Dec 2018 14:25:50 +0100")
References: <20181228132551.29819-1-thomas.petazzoni@bootlin.com>
Message-ID: <877eeoemax.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When linking the host cargo binary, the linker should be told to find
 > libraries in $(HOST_DIR)/lib, otherwise it will not work libraries
 > such as libhttp_parser. This was found with per-package directory
 > support, where the build failed with:

 >   = note: /usr/bin/ld: cannot find -lhttp_parser
 >           collect2: error: ld returned 1 exit status

 > In order to fix this, instead of passing -L$(HOST_DIR)/lib during the
 > build of Cargo, we make sure all flags in $(HOST_LDFLAGS) are passed.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
