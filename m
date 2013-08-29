From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 29 Aug 2013 10:46:50 +0200
Subject: [Buildroot] MesaLib
In-Reply-To: <20130829102659.6240bcb9@skate>
References: <A3285828-B3A0-4875-98F8-96A2BF7DD889@deadfrog.net>
 <20130829102659.6240bcb9@skate>
Message-ID: <521F0A7A.5010906@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Ryan,

Thomas Petazzoni wrote:
> Dear Ryan Wilkins,
>
> On Wed, 28 Aug 2013 19:22:47 -0400, Ryan Wilkins wrote:
>
>> I'm using buildroot 2013.08-rc2 and ran across an error on compile where MesaLib-7.10.3 can't be found.  Looking at the sources.buildroot.net server, 7.10.1 exists but not 7.10.3.  Output is below.
>>
>> --2013-08-28 17:15:25--  http://sources.buildroot.net//MesaLib-7.10.3.tar.gz
>> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
>> Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
>> HTTP request sent, awaiting response... 404 Not Found
>> 2013-08-28 17:15:25 ERROR 404: Not Found.
>>
>> Should 7.10.3 be in the repository or is the buildroot source wrong?
> The sources.buildroot.net mirror is updated only when a Buildroot
> release is made. The last stable release is currently 2013.05, which
> was using MesaLib 7.10.1, which explains why it is available from our
> mirror.

Indeed not:

$ git show 2013.05:package/x11r7/mesa3d/mesa3d.mk | grep VERSION
MESA3D_VERSION = 7.10.3
MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.gz
MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
$

But the sources on ftp.freedesktop.org have been moved from pub/mesa/7.10.3/
topub/mesa/old_versions/7.x/7.10.3/, apparently around Aug 12th, 2013.
This is unfortunately a recurring bad habit.:(

Has anybody here ever asked the freedesktop guys to refrain from moving
files around?

> The bump to 7.10.3 was done by commit
> 53cea4462c67a6707bf8dad83fa928262e44fce9 in June 2013, i.e after the
> 2013.05 release. Since the 2013.08 release hasn't been made yet, I
> believe Peter has not updated the Buildroot mirror, and therefore it
> doesn't contain for the moment all the new versions of the tarballs
> that have been upgraded since 2013.05.

Apparently this was not done for 2013.05, or it didn't work for mesa3d.
Peter, any idea? Otherwise, can you force the download now to fix this?

Anyway, 7.10.3 that is a pretty old release (~2 years old), there are 
many more
recent ones. Ryan, you may try to bump version. Releases since 8.0 are 
in the
"standard" download directory at ftp.freedesktop.org.

Or, for a quick workaround, you may just change the URL in
package/x11r7/mesa3d/mesa3d.mk.

Luca
