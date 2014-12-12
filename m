From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Dec 2014 08:40:16 +0100
Subject: [Buildroot] [PATCH] triggerhappy: new package
In-Reply-To: <20141212000823.72d27f28@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 12 Dec 2014 00:08:23 +0100")
References: <1418079328-15550-1-git-send-email-peter@korsgaard.com>
 <20141212000823.72d27f28@free-electrons.com>
Message-ID: <87d27ps4db.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Mon,  8 Dec 2014 23:55:28 +0100, Peter Korsgaard wrote:
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/Config.in                    |  1 +
 >> package/triggerhappy/Config.in       | 10 +++++++++
 >> package/triggerhappy/S10triggerhappy | 40 ++++++++++++++++++++++++++++++++++++
 >> package/triggerhappy/triggerhappy.mk | 37 +++++++++++++++++++++++++++++++++
 >> 4 files changed, 88 insertions(+)
 >> create mode 100644 package/triggerhappy/Config.in
 >> create mode 100755 package/triggerhappy/S10triggerhappy
 >> create mode 100644 package/triggerhappy/triggerhappy.mk

 > Thanks, applied, with two small changes:

 >     [Thomas:
 >       - add BR2_USE_MMU dependency, since fork() is used

Ahh yes, true.

>       - rename do_start() and do_stop() to just start() and stop(), as we
 >         do in most init scripts in Buildroot.]

I believe I just copied the init script from the upmpdcli package, so we
do have a few init scripts using do_start/do_stop:

git grep -l do_s package/**/S*
package/rpi-userland/S94vcfiled
package/transmission/S92transmission
package/upmpdcli/S99upmpdcli

So I'll fix those up for consistency. Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
