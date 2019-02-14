From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Feb 2019 21:46:31 +0100
Subject: [Buildroot] [PATCH] package/efivar: needs host gcc >= 4.8
In-Reply-To: <20190213084003.30318-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 13 Feb 2019 09:40:02 +0100")
References: <20190213084003.30318-1-thomas.petazzoni@bootlin.com>
Message-ID: <878syihzdk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The efivar code compiled for the host machine uses
 > __builtin_bswap16(), which is only available starting from gcc 4.8:

 >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52624

 > So let's add a dependency on host gcc >= 4.8 to efivar and its unique
 > reverse dependency, efibootmgr.

 > Fixes:

 >   http://autobuild.buildroot.net/results/48ba906bb6f4dc0c8af43ec11be64f7168dd62fd/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
